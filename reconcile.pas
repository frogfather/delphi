unit reconcile;

interface

uses
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms,
  QDialogs, QStdCtrls, QGrids,Math, QExtCtrls, QDBGrids, QButtons,DateUtils,SqlTimSt,
  QComCtrls;

type
  TReconcileform = class(TForm)
    lreq: TLabel;
    eclclose: TEdit;
    ereq: TEdit;
    Label6: TLabel;
    ediff: TEdit;
    OpenDialog1: TOpenDialog;
    pcontrol: TPanel;
    pdata: TPanel;
    pledger: TPanel;
    pimported: TPanel;
    dbgledger: TDBGrid;
    dbgfile: TDBGrid;
    pledgername: TPanel;
    lledgername: TLabel;
    pfilename: TPanel;
    lfilename: TLabel;
    pledgerdata: TPanel;
    pfiledata: TPanel;
    Label1: TLabel;
    lbimport: TListBox;
    btnload: TBitBtn;
    btnanalyse: TButton;
    lblog: TListBox;
    btnreconcile: TBitBtn;
    pmanrec: TPanel;
    lmanmatch: TLabel;
    eledgsum: TEdit;
    lledgsum: TLabel;
    lfile: TLabel;
    efilesum: TEdit;
    sb1: TStatusBar;
    Splitter1: TSplitter;
    procedure FormShow(Sender: TObject);
    procedure ereqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ediffChange(Sender: TObject);
    procedure ediffExit(Sender: TObject);
    procedure loadfile(filename:String);
    Function  Blankline(textline:String):String;
    Function  formatfiledata:Boolean;
    Function  Linematch(target:Double):Integer;
    Function  multimatch(targetdate:TDatetime;target:Double;fromfile:Boolean):Integer;
    Function  revmultimatch(targetdate:TDatetime;target:Double;ledgrec:Integer):Integer;
    procedure btnloadfileClick(Sender: TObject);
    procedure dbgledgerDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ediffDblClick(Sender: TObject);
    procedure btnanalyseClick(Sender: TObject);
    procedure lbimportClick(Sender: TObject);
    procedure dbgfileDblClick(Sender: TObject);
    procedure dbgledgerDblClick(Sender: TObject);
    procedure lblogClick(Sender: TObject);
    procedure dbgfileDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnreconcileClick(Sender: TObject);
    procedure dbgfileCellClick(Column: TColumn);
    procedure dbgfileTitleClick(Column: TColumn);
    procedure dbgledgerCellClick(Column: TColumn);
  private
    { Private declarations }
    Function getdiff(input:String):Double;
    Function Loadreconcile(account:Integer):Boolean;
    Function Checkimporteddata:Boolean;
    Function Directmatch(Matchamt:Double;narrative:String):Boolean;
    Function Intelligentmatch(narstring:String;filedate:TDatetime;target:Double;pass:integer):Integer;
    Function Checkdiff:String;
    Function Reconciletofile:Integer;
    Function Getimagedir:String;
    Procedure setrecglyph(state:String);
    Function reconcile:Boolean;
    Procedure deletematchfile;
    Function extractdate(narrative,dateformat:String):TDatetime;
    Procedure Setrecflag;
  public
    { Public declarations }
  end;

var
  Reconcileform: TReconcileform;
  Initbbal,Initlbal,indbbal,indlbal:Double;
  Fromfile,Manualchange:Boolean; {has the ledger grid been altered by the user?}
  Autodiff:Double;
  Matchno:Integer;

implementation

uses ldata, Accledger, recsetup, patternmatch, autoledger;

{$R *.xfm}

Function TReconcileform.getdiff(input:String):Double;
Var
negate:Boolean;
BEGIN
IF length(input)>2 THEN
  BEGIN
  IF input[1]='D' THEN negate:=true ELSE negate:=false;
  delete(input,1,2);
    Try
    IF negate=true THEN
    result:=-1*(roundto(strtofloat(input),-2)) ELSE
    result:=roundto(strtofloat(input),-2);
    Except
    result:=0;
    End;
  END ELSE result:=0;
END;

Function TReconcileform.Loadreconcile(account:Integer):Boolean;
Var
i:integer;
BEGIN
IF (ldatamod.creconcile.Active=true)AND(ldatamod.creconcile.ChangeCount>0) THEN ldatamod.creconcile.CancelUpdates;
ldatamod.sreconcile.Close;
ldatamod.creconcile.Close;
ldatamod.sreconcile.CommandText:='SELECT * FROM reconcile where account = '''+inttostr(account)+'''';
ldatamod.creconcile.Open;
IF ldatamod.creconcile.IsEmpty=false THEN
  BEGIN
  lblog.Items.Add(inttostr(ldatamod.creconcile.RecordCount)+' unmatched bank records recovered.');
  sb1.Panels[3].Text:=inttostr(ldatamod.creconcile.RecordCount)+' unmatched bank records recovered.';
  For i:=1 TO ldatamod.creconcile.RecordCount do
    BEGIN
    ldatamod.creconcile.RecNo:=i;
    ldatamod.creconcile.Edit;
    ldatamod.creconcilematch.Value:=-1;
    ldatamod.creconcile.Post;
    END;
  Result:=true;
  END ELSE
  BEGIN
  Result:=false;
  lblog.Items.Add('No unmatched bank records.');
  sb1.Panels[3].Text:='No unmatched bank records.';
  END;
END;

Function TReconcileform.Checkimporteddata:Boolean;
Var
Filestartbalance:Double;
validfile,done:Boolean;
Lastrecdate:Tdatetime;
BEGIN
{Basic idea here is to see if the starting balance of the imported file}
{matches the cleared balance of the account}
{If there is a "last reconciled" date available on the account then we can delete records before that date}
{but we also may need to take into account uncleared items from last time}
{Items from last time will have a '-1' flag on match}
{Items from new file will have a 0 flag}
IF ldatamod.creconcile.IsEmpty=false THEN
  BEGIN
  validfile:=true;
  IF ldatamod.creconcile.Locate('match',0,[])=true THEN
    BEGIN
    {last reconciled date will be the date of the last record in the previous file}
    {we want to delete any records from the imported file that are this date or before}
      Try
      Lastrecdate:=ldatamod.caccountreconciled.Value;
        REPEAT
      	IF (ldatamod.creconcilematch.Value=0)AND(ldatamod.creconciledate.Value<lastrecdate) THEN
          BEGIN
          lblog.Items.Add('Deleting file record already processed '+ldatamod.creconcilenarrative.Value);
          ldatamod.creconcile.Delete;
          END ELSE IF ldatamod.creconcile.Eof=false THEN ldatamod.creconcile.Next;
        done:=(ldatamod.creconcile.Eof=true)OR(ldatamod.creconcile.IsEmpty=true)
        UNTIL done;
      IF (ldatamod.creconcile.Locate('match',0,[])=false)OR(ldatamod.creconcile.IsEmpty=true) THEN
        BEGIN
        lblog.Items.Add('No unprocessed records in imported file');
      	validfile:=false;
        END;
      Except
      {no last reconcile date}
      End;

    {is the first item within daterec days of the first ledger item?}
    IF (ldatamod.cledgrec.active=true)AND(ldatamod.cledgrec.IsEmpty=false)THEN
      BEGIN
      ldatamod.cledgrec.first;
      IF daysbetween(ldatamod.cledgrecdate.Value,ldatamod.creconciledate.Value)>ldatamod.cautoreconciledatewindow.Value THEN
        BEGIN
        lblog.items.add('date of first ledger item '+ldatamod.cledgrecdate.asstring);
        lblog.items.add('date of first reconcile item '+ldatamod.creconciledate.asstring);
      	validfile:=false;
        lblog.Items.Add('Imported file out of date - stop');
        END;
      END;

    IF validfile=true THEN
      BEGIN
      ldatamod.creconcile.Locate('match',0,[]);
      IF ldatamod.creconcile.RecNo<>1 THEN
        BEGIN
        {There are older items}
        Filestartbalance:=ldatamod.creconcilebalance.AsFloat-ldatamod.creconcileamount.AsFloat;
          REPEAT
          IF ldatamod.creconcile.bof=false THEN ldatamod.creconcile.Prior;
          Filestartbalance:=filestartbalance-ldatamod.creconcileamount.AsFloat;
          UNTIL ldatamod.creconcile.Bof=true;
        Filestartbalance:=roundto(filestartbalance,-2);
        IF indbbal <> Filestartbalance THEN
          BEGIN
          validfile:=false;
          lblog.Items.Add('Imported file starting balance does not match ledger cleared balance');
          END;
        END ELSE
        BEGIN
        {The starting balance of the file should match the ledger cleared balance}
        Filestartbalance:=ldatamod.creconcilebalance.AsFloat-ldatamod.creconcileamount.AsFloat;
        Filestartbalance:=roundto(filestartbalance,-2);
        IF indbbal <> Filestartbalance THEN
          BEGIN
          lblog.Items.Add('Imported file starting balance does not match ledger cleared balance');
          validfile:=false;
          END;
        END;
      END;
    END ELSE validfile:=false;
  END ELSE Validfile:=false;
Result:=validfile;
END;

Function TReconcileform.extractdate(narrative,dateformat:String):TDatetime;
Type
TNumbers = set of char;
Var
Numbers:TNumbers;
i,j,mreq,startseq:integer;
sformat,sday,smonth,syear,sexpected:String;
iyear,imonth,iday:Word;
endloop,done,patternfound:Boolean;
BEGIN
Numbers:=['0','1','2','3','4','5','6','7','8','9'];
IF (length(narrative)>0)AND(length(dateformat)>0) THEN
  BEGIN
  sexpected:='';
  sformat:=dateformat;
  {set up the expected number of characters}
  mreq:=0;
  i:=1;
    REPEAT
    IF i<=length(sformat)THEN
      BEGIN
      IF sformat[i]='m' THEN mreq:=mreq+1;
      END;
    i:=i+1;
    UNTIL i>length(sformat);

  i:=1;
    REPEAT
    IF i<=length(sformat)THEN
      BEGIN
      IF sformat[i]='d' THEN insert('n',sexpected,length(sexpected)+1) ELSE
      IF sformat[i]='m' THEN
        BEGIN
      	IF mreq=3 THEN insert('a',sexpected,length(sexpected)+1) ELSE
        insert('n',sexpected,length(sexpected)+1);
        END ELSE
      IF sformat[i]='y' THEN insert('n',sexpected,length(sexpected)+1)
      ELSE insert('s',sexpected,length(sexpected)+1);
      END;
    i:=i+1;
    UNTIL i>length(sformat);


  {first extract words or set required number of characters}

  IF mreq=3 THEN
    BEGIN
    IF pos('JAN',narrative)>0 THEN smonth:='1' ELSE
    IF pos('FEB',narrative)>0 THEN smonth:='2' ELSE
    IF pos('MAR',narrative)>0 THEN smonth:='3' ELSE
    IF pos('APR',narrative)>0 THEN smonth:='4' ELSE
    IF pos('MAY',narrative)>0 THEN smonth:='5' ELSE
    IF pos('JUN',narrative)>0 THEN smonth:='6' ELSE
    IF pos('JUL',narrative)>0 THEN smonth:='7' ELSE
    IF pos('AUG',narrative)>0 THEN smonth:='8' ELSE
    IF pos('SEP',narrative)>0 THEN smonth:='9' ELSE
    IF pos('OCT',narrative)>0 THEN smonth:='10' ELSE
    IF pos('NOV',narrative)>0 THEN smonth:='11' ELSE
    IF pos('DEC',narrative)>0 THEN smonth:='12';
    END;
  {now using the expected pattern try to find the date here}
  j:=0; {j is offset}
  patternfound:=false;
  startseq:=-1;
    REPEAT
    i:=1;
      REPEAT
      IF ((sexpected[i]='n')AND(narrative[i+j]in numbers))
      OR((sexpected[i]='a')AND(not(narrative[i+j]in numbers)))
      OR ((sexpected[i]='s')AND(narrative[i+j]='/'))THEN
        BEGIN
        IF startseq=-1 THEN startseq:=i+j;
        END ELSE startseq:=-1;
      IF i<=length(sexpected)THEN i:=i+1;
      endloop:=(i>length(sexpected))OR(startseq=-1);
      UNTIL endloop=true;
    IF startseq>-1 THEN patternfound:=true;
    IF patternfound=false THEN j:=j+1;
    done:=(j+length(sexpected)>length(narrative))OR(patternfound=true);
    UNTIL done;

  IF patternfound=true THEN
    BEGIN
    {we now have the start position of our sequence}
    i:=1;
      REPEAT
      IF i<=length(sformat)THEN
        BEGIN
      	IF sformat[i]='d' THEN insert(narrative[startseq+i-1],sday,length(sday)+1) ELSE
      	IF ((sformat[i]='m')AND(mreq<>3)) THEN insert(narrative[startseq+i-1],smonth,length(smonth)+1) ELSE
      	IF sformat[i]='y' THEN insert(narrative[startseq+i-1],syear,length(syear)+1);
        END;
      i:=i+1;
      UNTIL i>length(sformat);
    IF syear='' THEN
      BEGIN
      iyear:=yearof(date);
      IF strtoint(smonth)>monthof(date)THEN iyear:=iyear-1;
      syear:=inttostr(iyear);
      END;
    IF length(syear)=2 THEN syear:='20'+syear;
    try
    iyear:=strtoint(syear);
    imonth:=strtoint(smonth);
    iday:=strtoint(sday);
    result:=encodedate(iyear,imonth,iday);
    except
    result:=0;
    end;
    END ELSE result:=0;

  END ELSE result:=0;
END;

Function TReconcileform.Intelligentmatch(narstring:String;Filedate:TDatetime;target:Double;pass:integer):Integer;
Var
patternmatch:Integer;
done,mdone:Boolean;
filenarr,ledgnarr:String;
Datetomatch:TDatetime;
Texttomatch:String;
dateerr,bestdateerr,matchfound:Integer;
bestmatch,lastmatching:Integer;
Slmatching:TStringlist;
IBits:TBits;
i,j,z,offset:Integer;
IOver,Carry,finished:Boolean;
SItem:String;
matchdatefrom,matchdateto:TDatetime;
Fsum:Double;
BEGIN
slmatching:=TStringlist.Create;
matchfound:=0;
{pass 1 looks at one to one mappings, pass 2 looks at multiple mappings}
ldatamod.cpattern.Close;
ldatamod.spattern.close;
IF target<0 THEN ldatamod.spattern.commandtext:='SELECT * from pattern where active = true and ((ledgtype = 2)OR(ledgtype = 0))'
ELSE ldatamod.spattern.commandtext:='SELECT * from pattern where active = true and ((ledgtype = 1)OR(ledgtype = 0))';
ldatamod.cpattern.open;
IF ldatamod.cpattern.IsEmpty=false THEN
  BEGIN
  patternmatch:=0;
  ldatamod.cpattern.First;
    REPEAT
    IF pos(ldatamod.cpatternnarr.Value,narstring)>0 THEN patternmatch:=ldatamod.cpattern.RecNo;
    IF patternmatch=0 THEN ldatamod.cpattern.Next;
    Done:=(ldatamod.cpattern.eof=true)OR(patternmatch>0);
    UNTIL done;
  IF patternmatch>0 THEN
    BEGIN
    {options here - we may be matching one file entry to several ledger ones}
    {we may need to extract the date from narstring}
    texttomatch:=ldatamod.cpatternmatchnarr.value;
    IF texttomatch='<none>' THEN texttomatch:='';
    IF ldatamod.cpatterndatepos.Value=0 THEN
      BEGIN
      datetomatch:=incday(Filedate,ldatamod.cpatternoffsetby.Value);
      matchdatefrom:=incday(datetomatch,(-1*ldatamod.cautoreconcilerecwindow.Value));
      matchdateto:=incday(datetomatch,ldatamod.cautoreconcilerecwindow.Value);
      END ELSE
      BEGIN
      filenarr:=narstring;
      datetomatch:=extractdate(filenarr,ldatamod.cpatterndateformat.Value);
      IF datetomatch<>0 THEN datetomatch:=incday(datetomatch,ldatamod.cpatternoffsetby.Value);
      IF datetomatch=0 THEN
        BEGIN
      	datetomatch:=filedate;
        lblog.Items.Add('could not extract date from '+filenarr+' using file date instead');
      	matchdatefrom:=incday(datetomatch,(-1*ldatamod.cautoreconcilerecwindow.Value));
      	matchdateto:=incday(datetomatch,ldatamod.cautoreconcilerecwindow.Value);
        END ELSE
        BEGIN
      	matchdatefrom:=incday(datetomatch,(-1*ldatamod.cpatternmwindow.Value));
      	matchdateto:=incday(datetomatch,ldatamod.cpatternmwindow.Value);
        END;
      END;
    {we should now have a date to match }
    {if the mapping is to a single ledger entry then it's easy}
    IF ldatamod.cpatternledgtype.Value=0 THEN
    ldatamod.cledgrec.filter:='dramount>0 and date >= '''+formatdatetime(shortdateformat,matchdatefrom)+''' and date <= '''+formatdatetime(shortdateformat,matchdateto)+''' and checkreq = false' ELSE
    IF ldatamod.cpatternledgtype.Value=1 THEN
    ldatamod.cledgrec.filter:='cramount>0 and date >= '''+formatdatetime(shortdateformat,matchdatefrom)+''' and date <= '''+formatdatetime(shortdateformat,matchdateto)+''' and checkreq = false' ELSE
    IF ldatamod.cpatternledgtype.Value=2 THEN
    ldatamod.cledgrec.filter:='date >= '''+formatdatetime(shortdateformat,matchdatefrom)+''' and date <= '''+formatdatetime(shortdateformat,matchdateto)+''' and checkreq = false';

    ldatamod.cledgrec.filtered:=true;
    IF (pass=1)AND(ldatamod.cpatternmulti.Value=false) THEN
      BEGIN
      {because this is a one to one mapping the amount must match}
      IF ldatamod.cledgrec.IsEmpty=false THEN
        BEGIN
        bestmatch:=-1;
        bestdateerr:=-1;
        ldatamod.cledgrec.First;
          REPEAT
          ledgnarr:=ldatamod.cledgrecnarrative.value;
          fsum:=ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
          IF ((pos(texttomatch,ledgnarr)>0)OR(texttomatch=''))AND(roundto(FSum,-2) =roundto(Target,-2)) THEN
            BEGIN
            dateerr:=daysbetween(ldatamod.cledgrecdate.Value,datetomatch);
            IF dateerr<0 THEN dateerr:=dateerr*-1;
            IF (bestdateerr=-1)OR(dateerr<bestdateerr) THEN
              BEGIN
              bestmatch:=ldatamod.cledgrec.RecNo;
              bestdateerr:=dateerr;
              END;
            END;
          IF ldatamod.cledgrec.eof=false THEN ldatamod.cledgrec.Next;
          mdone:=(ldatamod.cledgrec.Eof=true)OR(bestdateerr=0);
          UNTIL mdone;
        IF bestmatch>-1 THEN
          BEGIN
          {edit the relevant ledger entry}
          ldatamod.cledgrec.RecNo:=bestmatch;
          ldatamod.cledgrec.Edit;
          ldatamod.cledgreccheckreq.Value:=true;
          ldatamod.cledgreccheckreqvis.Value:=inttostr(matchno);
          ldatamod.cledgrec.Post;
          Matchfound:=1;
          END ELSE
          BEGIN
          {need a flag to prevent later procedures attempting to match this item}

          {put a temporary entry in a table to indicate that a transfer is to be made between the bank and the specified account}
          IF ldatamod.cpatternmissing.Value>0 THEN
            BEGIN
            lblog.Items.Add('Adding entry for record '+inttostr(ldatamod.creconcile.RecNo)+' to recautoentry table');
            ldatamod.crecautoentry.Append;
            ldatamod.crecautoentrysrcaccount.value:=ldatamod.cledgeraccount.Value;
            IF ldatamod.caccountnames.locate('item',ldatamod.cledgeraccount.value,[])=true THEN
            ldatamod.crecautoentrysrcacname.Value:=ldatamod.caccountname.Value;
            ldatamod.crecautoentryrecno.Value:=ldatamod.creconcile.RecNo;
            ldatamod.crecautoentryamount.Value:=target;
            ldatamod.crecautoentryaccount.Value:=ldatamod.cpatternaccount2.Value;
            IF ldatamod.caccountnames.Locate('item',ldatamod.cpatternaccount2.Value,[])=true THEN
            ldatamod.crecautoentryacname.value:=ldatamod.caccountnamesname.value ELSE ldatamod.crecautoentryacname.Value:='?';
            {If the amount to match is positive then it's a payment from the bank}
            IF ldatamod.creconcileamount.AsFloat>0 THEN
              BEGIN
              ldatamod.crecautoentrydirection.Value:=1;
              ldatamod.crecautoentrydirname.Value:='to';
              END ELSE
              BEGIN
              ldatamod.crecautoentrydirection.Value:=0;
              ldatamod.crecautoentrydirname.Value:='from';
              END;
            ldatamod.crecautoentrynarrative.Value:=narstring+' (automatic entry)';
            IF ldatamod.cpatternmissing.Value=1 THEN
            ldatamod.crecautoentryauto.Value:=false ELSE
            IF ldatamod.cpatternmissing.Value=2 THEN
            ldatamod.crecautoentryauto.Value:=true;
            ldatamod.crecautoentrydate.Value:=filedate;
            ldatamod.crecautoentryactioned.Value:=false;
            ldatamod.crecautoentry.Post;
            END;
          Matchfound:=-7 {IM failed}
          END;
        END;
      END ELSE
    IF (pass=2)AND(ldatamod.cpatternmulti.Value=true) THEN
      BEGIN
      IF ldatamod.cledgrec.IsEmpty=false THEN
        BEGIN
        {should try and find the narrative before a brute force check}
        IF texttomatch<>'' THEN
          BEGIN
          Fsum:=0;
          lastmatching:=-1;
          ldatamod.cledgrec.First;
            REPEAT
            ledgnarr:=ldatamod.cledgrecnarrative.value;
            IF (pos(texttomatch,ledgnarr)>0)AND(ldatamod.cledgrecdate.Value=datetomatch)
            THEN fsum:=fsum+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
            IF roundto(FSum,-2) =roundto(Target,-2) THEN
              BEGIN
              matchfound:=1;
              lastmatching:=ldatamod.cledgrec.RecNo;
              END;
            IF (matchfound=0)AND(ldatamod.cledgrec.Eof=false) THEN ldatamod.cledgrec.Next;
            done:=(ldatamod.cledgrec.Eof=true)OR(matchfound=1);
            UNTIL done;
          IF matchfound=1 THEN
            BEGIN
            i:=1;
              REPEAT
              done:=(ldatamod.cledgrec.RecNo=lastmatching);
              ldatamod.cledgrec.RecNo:=i;
              ldatamod.cledgrec.Edit;
              ldatamod.cledgreccheckreq.Value:=true;
              ldatamod.cledgreccheckreqvis.Value:=inttostr(matchno);
              ldatamod.cledgrec.Post;
              UNTIL done;
            END;
          END;
        {Do a sequential match, first all cr then all dr}
        i:=1;
        lastmatching:=ldatamod.cledgrec.RecordCount;

        IF matchfound=0 THEN
          BEGIN
          Fsum:=0;
          ldatamod.cledgrec.First;
            REPEAT
            IF ldatamod.cledgreccheckreq.value=false THEN
            fsum:=fsum+ldatamod.cledgreccramount.AsFloat;
            IF roundto(FSum,-2) =roundto(Target,-2) THEN
              BEGIN
              matchfound:=1;
              lastmatching:=ldatamod.cledgrec.RecNo;
              END;
            IF (matchfound=0)AND(ldatamod.cledgrec.Eof=false) THEN ldatamod.cledgrec.Next;
            done:=(ldatamod.cledgrec.Eof=true)OR(matchfound=1);
            UNTIL done;
          IF matchfound=0 THEN
            BEGIN
            ldatamod.cledgrec.First;
              REPEAT
              IF ldatamod.cledgreccheckreq.value=false THEN
              fsum:=fsum-ldatamod.cledgreccramount.AsFloat;
              IF roundto(FSum,-2) =roundto(Target,-2) THEN
                BEGIN
                i:=ldatamod.cledgrec.RecNo;
                IF i<ldatamod.cledgrec.RecordCount THEN i:=i+1;
                matchfound:=1;
                lastmatching:=ldatamod.cledgrec.RecordCount;
                END;
              IF (matchfound=0)AND(ldatamod.cledgrec.Eof=false) THEN ldatamod.cledgrec.Next;
              done:=(ldatamod.cledgrec.Eof=true)OR(matchfound=1)
              UNTIL done;
            END;
          IF matchfound=1 THEN
            BEGIN
              REPEAT
              ldatamod.cledgrec.RecNo:=i;
              done:=(ldatamod.cledgrec.RecNo=lastmatching);
              IF roundto(ldatamod.cledgreccramount.AsFloat,-2)>0 THEN
                BEGIN
                slmatching.Add(ldatamod.cledgrecitem.AsString);
                IF roundto(ldatamod.cledgrecdramount.AsFloat,-2)>0 THEN
                lblog.Items.Add(ldatamod.cledgrecitem.AsString+' '+ldatamod.cledgrecnarrative.Value+' '+formatfloat('DR0.00',ldatamod.cledgrecdramount.AsFloat))ELSE
                lblog.Items.Add(ldatamod.cledgrecitem.AsString+' '+ldatamod.cledgrecnarrative.Value+' '+formatfloat('CR0.00',ldatamod.cledgreccramount.AsFloat));
                sb1.Panels[3].Text:=ldatamod.cledgrecitem.AsString;
                END;
              IF done=false THEN i:=i+1;
              UNTIL done;
            END;
          END;

        IF matchfound=0 THEN
          BEGIN
          Fsum:=0;
          ldatamod.cledgrec.First;
            REPEAT
            IF ldatamod.cledgreccheckreq.value=false THEN
            fsum:=fsum-ldatamod.cledgrecdramount.AsFloat;
            IF roundto(FSum,-2) =roundto(Target,-2) THEN
              BEGIN
              i:=1;
              matchfound:=1;
              lastmatching:=ldatamod.cledgrec.RecNo;
              END;
            IF (matchfound=0)AND(ldatamod.cledgrec.Eof=false) THEN ldatamod.cledgrec.Next;
            done:=(ldatamod.cledgrec.Eof=true)OR(matchfound=1);
            UNTIL done;
          IF matchfound=0 THEN
            BEGIN
            ldatamod.cledgrec.First;
              REPEAT
              IF ldatamod.cledgreccheckreq.value=false THEN
              fsum:=fsum+ldatamod.cledgrecdramount.AsFloat;
              IF roundto(FSum,-2) =roundto(Target,-2) THEN
                BEGIN
                i:=ldatamod.cledgrec.RecNo;
                IF i<ldatamod.cledgrec.RecordCount THEN i:=i+1;
                matchfound:=1;
                lastmatching:=ldatamod.cledgrec.RecordCount;
                END;
              IF (matchfound=0)AND(ldatamod.cledgrec.Eof=false) THEN ldatamod.cledgrec.Next;
              done:=(ldatamod.cledgrec.Eof=true)OR(matchfound=1)
              UNTIL done;
            END;
          IF matchfound=1 THEN
            BEGIN
              REPEAT
              ldatamod.cledgrec.RecNo:=i;
              done:=(ldatamod.cledgrec.RecNo=lastmatching);
              IF roundto(ldatamod.cledgrecdramount.AsFloat,-2)>0 THEN
                BEGIN
                slmatching.Add(ldatamod.cledgrecitem.AsString);
                IF roundto(ldatamod.cledgrecdramount.AsFloat,-2)>0 THEN
                lblog.Items.Add(ldatamod.cledgrecitem.AsString+' '+ldatamod.cledgrecnarrative.Value+' '+formatfloat('DR0.00',ldatamod.cledgrecdramount.AsFloat))ELSE
                lblog.Items.Add(ldatamod.cledgrecitem.AsString+' '+ldatamod.cledgrecnarrative.Value+' '+formatfloat('CR0.00',ldatamod.cledgreccramount.AsFloat));
                sb1.Panels[3].Text:=ldatamod.cledgrecitem.AsString;
                END;
              IF done=false THEN i:=i+1;
              UNTIL done;
            END;
          END;

        IF matchfound=0 THEN
          BEGIN
          offset:=0;
          IBits:=TBits.Create;
          IF ldatamod.cledgrec.Recordcount<11 THEN
          IBits.Size:=ldatamod.cledgrec.Recordcount ELSE IBits.Size:=10;
    	    REPEAT
            IF ldatamod.cledgrec.Recordcount>10 THEN
              BEGIN
              lblog.Items.Add('Intelligent match - pass '+inttostr(offset+1));
              sb1.Panels[3].Text:='Intelligent match - pass '+inttostr(offset+1);
              END ELSE
              BEGIN
              lblog.Items.Add('Intelligent match - single pass');
              sb1.Panels[3].Text:='Intelligent match - single pass';
              END;
            Iover:=false;
            {we'll set the initial state to be xxxxxx10 i.e. 2. Then we'll increment it to all 1s (max)}
            FOR j:=0 to Ibits.Size-1 DO
              BEGIN
              IBits[j]:=False;
              END;

            {find first solution only}
              BEGIN
                REPEAT
                IF IBits.Size>0 THEN
                  BEGIN
              	  j:=0;
      	  	  Carry:=False;
            	    REPEAT
                    IF j<Ibits.Size THEN
                      BEGIN
                      IF (j=0)OR(Carry=True) THEN
                        BEGIN
                        IF Ibits[j]=False THEN
                       	  BEGIN
                  	  Ibits[j]:=True;
                  	  Carry:=False;
                  	  END ELSE
                  	  BEGIN
                  	  Ibits[j]:=False;
                  	  Carry:=True;
                  	  END;
                        END;
                      END;
                    j:=j+1;
                    UNTIL j=Ibits.Size;
                  IF Carry=True THEN IOver:=True;
          	  END ELSE IOver:=True;
                Done:=IOver=True;
                {The block above sets up the bits - the actual sum goes here}
                {CDiff is the actual balance minus the stored balance}

                IF Done=False THEN
                  BEGIN
          	  SItem:='0.00';
          	  FSum:=StrToFloat(SItem);
          	  IF IBits.Size>0 THEN
            	    BEGIN
                    z:=0;
                      REPEAT
                      IF IBits[z]=True THEN
                        BEGIN
                        ldatamod.cledgrec.RecNo:=z+offset+1;
                        FSum:=FSum+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
                        END;
                      z:=z+1;
                      UNTIL z=IBits.Size;
                    END;

                   IF roundto(FSum,-2) =roundto(Target,-2) THEN
            	    BEGIN
                    lblog.Items.Add('Intelligent match: solution found');
                    sb1.Panels[3].Text:='Intelligent match: solution found';
                    IF IBits.Size>0 THEN
                      BEGIN
                      z:=0;
                        REPEAT
                        IF IBits[z]=True THEN
                          BEGIN
                          {can't just edit these items cos they'd disappear from the filter. Need a list to hold results}
                  	  ldatamod.cledgrec.RecNo:=z+offset+1;
                  	  slmatching.Add(ldatamod.cledgrecitem.AsString);
                          IF roundto(ldatamod.cledgrecdramount.AsFloat,-2)>0 THEN
                  	  lblog.Items.Add(ldatamod.cledgrecitem.AsString+' '+ldatamod.cledgrecnarrative.Value+' '+formatfloat('DR0.00',ldatamod.cledgrecdramount.AsFloat))ELSE
                  	  lblog.Items.Add(ldatamod.cledgrecitem.AsString+' '+ldatamod.cledgrecnarrative.Value+' '+formatfloat('CR0.00',ldatamod.cledgreccramount.AsFloat));
                          sb1.Panels[3].Text:=ldatamod.cledgrecitem.AsString;
                  	  END;
                        z:=z+1;
                        UNTIL z=IBits.Size;
                      END;
                    Done:=true;
                    END;
                  END;
                UNTIL Done=True;
              END;
            IF slmatching.Count=0 THEN offset:=offset+1;
            finished:=(offset>ldatamod.cledgrec.Recordcount-12)OR(slmatching.count>0);
            UNTIL finished=true;
          IBits.Free;
          END;

        {edit the ledger items if relevant}
        IF slmatching.count>0 THEN
          BEGIN
          FOR z:=0 to slmatching.Count-1 DO
            BEGIN
            IF ldatamod.cledgrec.Locate('item',strtoint(slmatching[z]),[])=true THEN
              BEGIN
              ldatamod.cledgrec.Edit;
              ldatamod.cledgreccheckreq.Value:=true;
              ldatamod.cledgreccheckreqvis.Value:=inttostr(matchno);
              ldatamod.cledgrec.Post;
              END;
            END;
          matchfound:=1;
          END ELSE matchfound:=-7; {IM failed}
        END;
      END;
    END ELSE matchfound:=0 {patternmatch = 0}
  END;
Result:=matchfound;
slmatching.Free;
ldatamod.cledgrec.Filtered:=false;
END;

Function TReconcileform.Directmatch(matchamt:Double;narrative:String):Boolean;
Var
Datediff,moddatediff,bestmatch,bestmatchvalue,modbestmatchvalue:Integer;
BEGIN
bestmatch:=-1;
bestmatchvalue:=-1;
modbestmatchvalue:=-1;
{This attempts to match a single bank file entry with a single ledger entry}
IF matchamt<0 THEN
ldatamod.cledgrec.Filter:='checkreq = false and dramount = '''+floattostr(matchamt*-1)+'''' ELSE
ldatamod.cledgrec.Filter:='checkreq = false and cramount = '''+floattostr(matchamt)+'''';
ldatamod.cledgrec.Filtered:=true;
IF ldatamod.cledgrec.RecordCount>0 THEN
  BEGIN
  IF ldatamod.cledgrec.RecordCount=1 THEN
    BEGIN
    Bestmatch:=ldatamod.cledgrecitem.Value;
    END ELSE
    BEGIN
    ldatamod.cledgrec.First;
      REPEAT
      Datediff:= daysbetween(ldatamod.creconciledate.Value,ldatamod.cledgrecdate.Value);
      IF datediff<0 THEN moddatediff:=datediff*-1 ELSE moddatediff:=datediff;
      IF moddatediff<=ldatamod.cautoreconcilerecwindow.Value THEN
        BEGIN
        {IF datediff is 0 then it's automatically the best match}
        {If there are positive and negative entries of the same value the positive one takes precedence}
        IF (moddatediff=0)OR(moddatediff<modbestmatchvalue)
        OR((moddatediff=modbestmatchvalue)AND(bestmatchvalue<0)AND(datediff>0)) THEN
          BEGIN
          bestmatch:=ldatamod.cledgrecitem.Value;
          bestmatchvalue:=datediff;
          IF bestmatchvalue<0 THEN modbestmatchvalue:=bestmatchvalue*-1 ELSE modbestmatchvalue:=bestmatchvalue;
          END;
        END;
      IF ldatamod.cledgrec.eof=false THEN ldatamod.cledgrec.Next;
      UNTIL ldatamod.cledgrec.eof=true;
    END;
  END;
ldatamod.cledgrec.Filtered:=false;
IF bestmatch>0 THEN
  BEGIN
  IF ldatamod.cledgrec.locate('item',bestmatch,[]) = true THEN
    BEGIN
    lblog.Items.Add('Bank entry '+inttostr(ldatamod.creconcile.RecNo)+' ('+ldatamod.creconcilenarrative.Value+': '+ldatamod.creconcileamount.AsString+') matched to ledger entry '+ldatamod.cledgrecnarrative.Value);
    sb1.Panels[3].Text:='Bank entry '+inttostr(ldatamod.creconcile.RecNo)+' ('+ldatamod.creconcilenarrative.Value+': '+ldatamod.creconcileamount.AsString+') matched to ledger entry '+ldatamod.cledgrecnarrative.Value;
    ldatamod.cledgrec.Edit;
    ldatamod.cledgreccheckreq.Value:=true;
    ldatamod.cledgreccheckreqvis.Value:=inttostr(matchno);
    ldatamod.cledgrec.Post;
    ldatamod.cledgrec.Locate('item',bestmatch,[]);
    Result:=true;
    END ELSE result:=false;
  END ELSE result:=false;

END;

Function  TReconcileform.Linematch(target:Double):Integer;
Var
linesum:Double;
i,itemcount:Integer;
Match,done:Boolean;
BEGIN
Match:=false;
Itemcount:=0;
ldatamod.cledgrec.Filter:='checkreq = false';
ldatamod.cledgrec.Filtered:=true;
IF ldatamod.cledgrec.Recordcount>0 THEN
  BEGIN
  lblog.Items.Add('linematch');
  sb1.Panels[3].Text:='linematch';
  Linesum:=0;
  ldatamod.cledgrec.First;
    REPEAT
    Linesum:=linesum+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
    Itemcount:=itemcount+1;
    IF roundto(linesum,-2)=roundto(target,-2) THEN match:=true;
    IF (match=false)AND(ldatamod.cledgrec.Eof=false) THEN ldatamod.cledgrec.Next;
    done:=(match=true)OR(ldatamod.cledgrec.eof=true);
    UNTIL done;
  END;

IF match=true THEN
  BEGIN
  lblog.Items.Add('linematch: solution found');
  sb1.Panels[3].Text:='linematch: solution found';
  ldatamod.cledgrec.first;
  i:=1;
    REPEAT
    IF i<= itemcount THEN
      BEGIN
      ldatamod.cledgrec.RecNo:=i;
      ldatamod.cledgrec.Edit;
      ldatamod.cledgreccheckreq.Value:=true;
      ldatamod.cledgrec.Post;
      lblog.Items.Add(ldatamod.cledgrecitem.AsString);
      END;
    i:=i+1;
    UNTIL i>itemcount;
  END;
ldatamod.cledgrec.Filtered:=false;
IF match=true THEN result:=itemcount ELSE result:=0;
END;


Function TReconcileform.multimatch(targetdate:TDatetime;target:Double;fromfile:Boolean):Integer;
Var
Slmatching:TStringlist;
IBits:TBits;
j,z,matchcount,offset:Integer;
IOver,Done,Carry,finished:Boolean;
startdate,enddate:TDatetime;
SItem,sstartdate,senddate:String;
Fsum:Double;
BEGIN
Matchcount:=-1;
startdate:=incday(targetdate,(-1*ldatamod.cautoreconcilerecwindow.Value));
enddate:=incday(targetdate,ldatamod.cautoreconcilerecwindow.Value);
sstartdate:=datetimetostr(startdate);
senddate:=datetimetostr(enddate);
IF fromfile=true THEN
ldatamod.cledgrec.Filter:='checkreq = false and ((date >= '''+sstartdate+''') and (date <= '''+senddate+'''))' ELSE
ldatamod.cledgrec.Filter:='checkreq = false';
ldatamod.cledgrec.Filtered:=true;
IF ldatamod.cledgrec.Recordcount>1 THEN
  BEGIN
  offset:=0;
  slmatching:=TStringlist.Create;
  IBits:=TBits.Create;
  IF ldatamod.cledgrec.Recordcount<11 THEN
  IBits.Size:=ldatamod.cledgrec.Recordcount ELSE IBits.Size:=10;
    REPEAT
    IF ldatamod.cledgrec.Recordcount>10 THEN
      BEGIN
      lblog.Items.Add('multimatch - pass '+inttostr(offset+1));
      sb1.Panels[3].text:='multimatch - pass '+inttostr(offset+1);
      END ELSE
      BEGIN
      lblog.Items.Add('multimatch - single pass');
      sb1.Panels[3].text:='multimatch - single pass';
      END;
    Iover:=false;
    {we'll set the initial state to be xxxxxx10 i.e. 2. Then we'll increment it to all 1s (max)}
    FOR j:=0 to Ibits.Size-1 DO
      BEGIN
      IBits[j]:=False;
      END;
   IF fromfile=true THEN IBits[1]:=true;

    {find first solution only}
      BEGIN
        REPEAT
        IF IBits.Size>0 THEN
          BEGIN
      	  j:=0;
      	  Carry:=False;
            REPEAT
            IF j<Ibits.Size THEN
              BEGIN
              IF (j=0)OR(Carry=True) THEN
                BEGIN
                IF Ibits[j]=False THEN
                  BEGIN
                  Ibits[j]:=True;
                  Carry:=False;
                  END ELSE
                  BEGIN
                  Ibits[j]:=False;
                  Carry:=True;
                  END;
                END;
              END;
            j:=j+1;
            UNTIL j=Ibits.Size;
          IF Carry=True THEN IOver:=True;
          END ELSE IOver:=True;
        Done:=IOver=True;
        {The block above sets up the bits - the actual sum goes here}
        {CDiff is the actual balance minus the stored balance}

        IF Done=False THEN
          BEGIN
          SItem:='0.00';
          FSum:=StrToFloat(SItem);
          IF IBits.Size>0 THEN
            BEGIN
            z:=0;
              REPEAT
              IF IBits[z]=True THEN
                BEGIN
                ldatamod.cledgrec.RecNo:=z+offset+1;
                FSum:=FSum+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
                END;
              z:=z+1;
              UNTIL z=IBits.Size;
            END;

          IF roundto(FSum,-2) =roundto(Target,-2) THEN
            BEGIN
            lblog.Items.Add('multimatch: solution found');
            IF IBits.Size>0 THEN
              BEGIN
              z:=0;
                REPEAT
                IF IBits[z]=True THEN
                  BEGIN
                  {can't just edit these items cos they'd disappear from the filter. Need a list to hold results}
                  ldatamod.cledgrec.RecNo:=z+offset+1;
                  slmatching.Add(ldatamod.cledgrecitem.AsString);
                  lblog.Items.Add(ldatamod.cledgrecitem.AsString);
                  END;
                z:=z+1;
                UNTIL z=IBits.Size;
              END;
            Done:=true;
            END;
          END;
        UNTIL Done=True;
      END;
    IF slmatching.Count=0 THEN offset:=offset+1;
    finished:=(offset>ldatamod.cledgrec.Recordcount-10)OR(slmatching.count>0);
    UNTIL finished=true;
  {edit the ledger items if relevant}
  IF slmatching.count>0 THEN
    BEGIN
    Matchcount:=slmatching.Count;
    FOR z:=0 to slmatching.Count-1 DO
      BEGIN
      IF ldatamod.cledgrec.Locate('item',strtoint(slmatching[z]),[])=true THEN
        BEGIN
        ldatamod.cledgrec.Edit;
        ldatamod.cledgreccheckreq.Value:=true;
        ldatamod.cledgreccheckreqvis.Value:=inttostr(matchno);
        ldatamod.cledgrec.Post;
        END;
      END;
    END;
  IBits.Free;
  slmatching.Free;
  END;
ldatamod.cledgrec.Filtered:=false;
Result:=matchcount;
END;

Function TReconcileform.revmultimatch(targetdate:TDatetime;target:Double;ledgrec:integer):Integer;
Var
Slmatching:TStringlist;
IBits:TBits;
j,z,matchcount,offset:Integer;
IOver,Done,Carry,finished:Boolean;
startdate,enddate:TDatetime;
SItem,sstartdate,senddate:String;
Fsum:Double;
BEGIN
Matchcount:=-1;
startdate:=incday(targetdate,(-1*ldatamod.cautoreconcilerecwindow.Value));
enddate:=incday(targetdate,ldatamod.cautoreconcilerecwindow.Value);
sstartdate:=datetimetostr(startdate);
senddate:=datetimetostr(enddate);
ldatamod.creconcile.Filter:='match =0 and (date >= '''+sstartdate+''') and (date <= '''+senddate+''')';
ldatamod.creconcile.Filtered:=true;
IF ldatamod.creconcile.Recordcount>1 THEN
  BEGIN
  offset:=0;
  slmatching:=TStringlist.Create;
  IBits:=TBits.Create;
  IF ldatamod.creconcile.Recordcount<11 THEN
  IBits.Size:=ldatamod.creconcile.Recordcount ELSE IBits.Size:=10;
    REPEAT
    IF ldatamod.creconcile.Recordcount>10 THEN lblog.Items.Add('reverse multimatch - pass '+inttostr(offset+1)) ELSE
    lblog.Items.Add('reverse multimatch - single pass');
    Iover:=false;
    {we'll set the initial state to be xxxxxx10 i.e. 2. Then we'll increment it to all 1s (max)}
    FOR j:=0 to Ibits.Size-1 DO
      BEGIN
      IBits[j]:=False;
      END;
    IBits[1]:=true;

    {find first solution only}
      BEGIN
        REPEAT
        IF IBits.Size>0 THEN
          BEGIN
      	  j:=0;
      	  Carry:=False;
            REPEAT
            IF j<Ibits.Size THEN
              BEGIN
              IF (j=0)OR(Carry=True) THEN
                BEGIN
                IF Ibits[j]=False THEN
                  BEGIN
                  Ibits[j]:=True;
                  Carry:=False;
                  END ELSE
                  BEGIN
                  Ibits[j]:=False;
                  Carry:=True;
                  END;
                END;
              END;
            j:=j+1;
            UNTIL j=Ibits.Size;
          IF Carry=True THEN IOver:=True;
          END ELSE IOver:=True;
        Done:=IOver=True;
        {The block above sets up the bits - the actual sum goes here}
        {CDiff is the actual balance minus the stored balance}

        IF Done=False THEN
          BEGIN
          SItem:='0.00';
          FSum:=StrToFloat(SItem);
          IF IBits.Size>0 THEN
            BEGIN
            z:=0;
              REPEAT
              IF IBits[z]=True THEN
                BEGIN
                ldatamod.creconcile.RecNo:=z+offset+1;
                FSum:=FSum+ldatamod.creconcileamount.AsFloat;
                END;
              z:=z+1;
              UNTIL z=IBits.Size;
            END;

          IF roundto(FSum,-2) =roundto(Target,-2) THEN
            BEGIN
            lblog.Items.Add('multimatch: solution found');
            IF IBits.Size>0 THEN
              BEGIN
              z:=0;
                REPEAT
                IF IBits[z]=True THEN
                  BEGIN
                  {can't just edit these items cos they'd disappear from the filter. Need a list to hold results}
                  ldatamod.creconcile.RecNo:=z+offset+1;
                  slmatching.Add(ldatamod.creconcileitem.AsString);
                  lblog.Items.Add(ldatamod.creconcileitem.AsString);
                  END;
                z:=z+1;
                UNTIL z=IBits.Size;
              END;
            Done:=true;
            END;
          END;
        UNTIL Done=True;
      END;
    IF slmatching.Count=0 THEN offset:=offset+1;
    finished:=(offset>ldatamod.creconcile.Recordcount-10)OR(slmatching.count>0);
    UNTIL finished=true;
  {edit the ledger items if relevant}
  IF slmatching.count>0 THEN
    BEGIN
    Matchcount:=slmatching.Count;
    FOR z:=0 to slmatching.Count-1 DO
      BEGIN
      IF ldatamod.creconcile.Locate('item',strtoint(slmatching[z]),[])=true THEN
        BEGIN
        ldatamod.creconcile.Edit;
        ldatamod.creconcilematch.Value:=(ledgrec);
        ldatamod.creconcilematchvis.Value:=inttostr(matchno)+' (R*)';
        ldatamod.creconcile.Post;
        IF ldatamod.crecautoentry.Locate('recno',ldatamod.creconcile.RecNo,[])=true THEN
          BEGIN
          lblog.Items.Add('Removing entry for record '+inttostr(ldatamod.creconcile.RecNo)+' from recautoentry table');
          ldatamod.crecautoentry.Delete;
          END;
        END;
      END;
    END;
  IBits.Free;
  slmatching.Free;
  END;
ldatamod.creconcile.Filtered:=false;
Result:=matchcount;
END;

Function TReconcileform.Checkdiff:String;
Var
diff:Double;
BEGIN
Diff:=0;
ldatamod.dledgrec.Enabled:=false;
ldatamod.cledgrec.Filter:='checkreq <> checked';
ldatamod.cledgrec.Filtered:=true;
IF ldatamod.cledgrec.IsEmpty=false THEN
  BEGIN
  ldatamod.cledgrec.first;
    REPEAT
    IF ldatamod.cledgreccheckreq.Value=false THEN diff:=diff+ldatamod.cledgrecdramount.AsFloat-ldatamod.cledgreccramount.AsFloat
    ELSE diff:=diff+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
    IF ldatamod.cledgrec.Eof=false THEN ldatamod.cledgrec.Next;
    UNTIL ldatamod.cledgrec.Eof=true;
  END;
diff:=roundto(diff,-2);
IF diff=0 THEN btnreconcile.Enabled:=false ELSE btnreconcile.Enabled:=true;
IF diff<=0  THEN Result:=formatfloat('DR0.00',diff) ELSE Result:=formatfloat('CR0.00',diff);
ldatamod.cledgrec.Filtered:=false;
ldatamod.dledgrec.Enabled:=true;
END;

Function TReconcileform.Reconciletofile:Integer;
Var
matched,i,stagecount,IMresult,multiresult:Integer;
BEGIN
ldatamod.dledgrec.Enabled:=false;
matched:=0;
IF ldatamod.creconcile.IsEmpty=false THEN
  BEGIN
  stagecount:=0;
    For i:=1 TO ldatamod.creconcile.RecordCount do
      BEGIN
      ldatamod.creconcile.RecNo:=i;
      IF ldatamod.creconcilematch.Value=0 THEN
        BEGIN
        IMresult:=Intelligentmatch(ldatamod.creconcilenarrative.Value,ldatamod.creconciledate.Value,ldatamod.creconcileamount.AsFloat,1);
        IF IMresult<>0 THEN
          BEGIN
          IF IMresult=1 THEN
            BEGIN
            stagecount:=stagecount+1;
            matched:=matched+1;
            lblog.Items.Add('[IM - level 1]: Bank entry '+inttostr(ldatamod.creconcile.RecNo)+' ('+ldatamod.creconcilenarrative.Value+': '+ldatamod.creconcileamount.AsString+') matched to ledger entry ');
            END;
          ldatamod.creconcile.Edit;
          IF IMresult=1 THEN
            BEGIN
            ldatamod.creconcilematch.Value:=matchno;
            ldatamod.creconcilematchvis.Value:=inttostr(matchno)+' (I)';
            matchno:=matchno+1;
            END ELSE
            BEGIN
            ldatamod.creconcilematch.Value:=IMresult;
            ldatamod.creconcilematchvis.Value:='FI';
            END;
          ldatamod.creconcile.Post;
          END;
        END;
      END;

  IF matched<ldatamod.creconcile.RecordCount THEN
    BEGIN
    For i:=1 TO ldatamod.creconcile.RecordCount do
      BEGIN
      ldatamod.creconcile.RecNo:=i;
      IF ldatamod.creconcilematch.Value=0 THEN
        BEGIN
        IMresult:=Intelligentmatch(ldatamod.creconcilenarrative.Value,ldatamod.creconciledate.Value,ldatamod.creconcileamount.AsFloat,2);
        IF IMresult <>0 THEN
          BEGIN
          IF IMresult=1 THEN
            BEGIN
            stagecount:=stagecount+1;
            matched:=matched+1;
            lblog.Items.Add('[IM - level 2]: Bank entry '+inttostr(ldatamod.creconcile.RecNo)+' ('+ldatamod.creconcilenarrative.Value+': '+ldatamod.creconcileamount.AsString+') matched to multiple ledger entries');
            END;
          ldatamod.creconcile.Edit;
          IF IMresult=1 THEN
            BEGIN
            ldatamod.creconcilematch.Value:=matchno;
            ldatamod.creconcilematchvis.Value:=inttostr(matchno)+' (I*)';
            matchno:=matchno+1;
            END ELSE
            BEGIN
            ldatamod.creconcilematch.Value:=IMresult;
            ldatamod.creconcilematchvis.Value:='FI*';
            END;
          ldatamod.creconcile.Post;
          END;
        END;
      END;
    END;

  lblog.Items.Add('Intelligent match reconciled '+inttostr(stagecount)+' of '+inttostr(ldatamod.creconcile.RecordCount)+' records');
  stagecount:=0;

  IF matched<ldatamod.creconcile.RecordCount THEN
    BEGIN
    For i:=1 TO ldatamod.creconcile.RecordCount do
      BEGIN
      ldatamod.creconcile.RecNo:=i;
      IF ldatamod.creconcilematch.Value=0 THEN
        BEGIN
        IF Directmatch(ldatamod.creconcileamount.AsFloat,ldatamod.creconcilenarrative.Value)=true THEN
          BEGIN
          stagecount:=stagecount+1;
          matched:=matched+1;
          ldatamod.creconcile.Edit;
          ldatamod.creconcilematch.Value:=matchno;
          ldatamod.creconcilematchvis.Value:=inttostr(matchno)+' (D)';
          ldatamod.creconcile.Post;
          matchno:=matchno+1;
          {check the item isn't in recautoentry and delete it if it is}
          IF ldatamod.crecautoentry.Locate('recno',i,[])=true THEN
            BEGIN
            lblog.Items.Add('Removing entry for record '+inttostr(i)+' from recautoentry table');
            ldatamod.crecautoentry.Delete;
            END;
          END;
        END;
      END;
    lblog.Items.Add('Direct match reconciled '+inttostr(stagecount)+' of '+inttostr(ldatamod.creconcile.RecordCount)+' records');
    END;


IF matched<ldatamod.creconcile.RecordCount THEN
    BEGIN
    lblog.Items.Add(inttostr(ldatamod.creconcile.RecordCount-matched)+' file entries not directly mapped. Trying multimatch');
    i:=1;
      REPEAT
      IF i< ldatamod.creconcile.RecordCount THEN
        BEGIN
        ldatamod.creconcile.RecNo:=i;
        IF ldatamod.creconcilematch.Value=0 THEN
          BEGIN
          {try to match unmatched file entries to multiple ledger ones}
          Multiresult:=multimatch(ldatamod.creconciledate.value,ldatamod.creconcileamount.AsFloat,true);
          IF multiresult>-1 THEN
            BEGIN
            matched:=matched+1;
            ldatamod.creconcile.Edit;
            ldatamod.creconcilematch.Value:=matchno;
            ldatamod.creconcilematchvis.Value:='M '+inttostr(matchno);
            ldatamod.creconcile.Post;
            matchno:=matchno+1;

            {check the item isn't in recautoentry and delete it if it is}
            IF ldatamod.crecautoentry.Locate('recno',i,[])=true THEN
              BEGIN
              lblog.Items.Add('Removing entry for record '+inttostr(i)+' from recautoentry table');
              ldatamod.crecautoentry.Delete;
              END;
            END;
          END;
        END;
      i:=i+1;
      UNTIL i=ldatamod.creconcile.RecordCount+1;
    END;

  IF matched<ldatamod.creconcile.RecordCount THEN
    BEGIN
    {we'll try to match multiple bank entries to single ledger ones}
    lblog.Items.Add(inttostr(ldatamod.creconcile.RecordCount-matched)+' file entries not mapped to single or multiple ledger entries. Trying reverse multimatch');
    i:=1;
      REPEAT
      IF i< ldatamod.cledgrec.RecordCount THEN
        BEGIN
        ldatamod.cledgrec.RecNo:=i;
        IF (ldatamod.cledgreccheckreq.Value=false)AND(ldatamod.cledgrecchecked.Value=false)THEN
          BEGIN
          {try to match unmatched ledger entries to multiple file ones}
          Multiresult:=revmultimatch(ldatamod.cledgrecdate.value,ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat,ldatamod.cledgrecitem.value);
          IF multiresult>-1 THEN
            BEGIN
            matched:=matched+multiresult;
            ldatamod.cledgrec.Edit;
            ldatamod.cledgreccheckreq.Value:=true;
            ldatamod.cledgreccheckreqvis.Value:='M '+inttostr(matchno);
            ldatamod.cledgrec.Post;
            matchno:=matchno+1;
            {because this may involve multiple file entries the deletion of recautoentry entries is done in the revmultimatch procedure instead of here}
            END;
          END;
        END;
      i:=i+1;
      UNTIL i=ldatamod.cledgrec.RecordCount+1;
    END;


  IF matched<ldatamod.creconcile.RecordCount THEN
    BEGIN
    lblog.Items.Add(inttostr(ldatamod.creconcile.RecordCount-matched)+' file entries could not be mapped to any ledger entries. Checking auto entry list');
    IF ldatamod.crecautoentry.IsEmpty=false THEN
      BEGIN
      {perform automatic ledger entry generation}
      ldatamod.crecautoentry.First;
        REPEAT
        IF ldatamod.crecautoentryauto.value = true THEN
          BEGIN
          {generate the ledger entry here and increment matched}
          lblog.Items.Add('Generating automatic ledger entry '+ldatamod.crecautoentrynarrative.Value+' amt: '+formatfloat('0.00',ldatamod.crecautoentryamount.Value));

          END;
        IF ldatamod.crecautoentry.eof=false THEN ldatamod.crecautoentry.Next;
        UNTIL ldatamod.crecautoentry.eof=true;
      END;
    END ELSE
    BEGIN
    lblog.Items.Add('All file entries were successfully mapped to ledger entries');
    END;
  END;
IF matched=0 THEN result:=-1 ELSE
IF matched=ldatamod.creconcile.RecordCount THEN result:=0 ELSE result:=1;
ldatamod.dledgrec.Enabled:=true;
ldatamod.cledgrec.recno:=1;
END;

Function TReconcileform.Getimagedir:String;
Var
userdir,mimdir:String;
BEGIN
Userdir:=ldatamod.getusersdir;
mimdir:=userdir+'.mim/hms/common/';
IF directoryexists(userdir+'.mim/hms/common/images/')=false THEN
  BEGIN
    Try
    mkdir(userdir+'.mim/hms/common/images/');
    Result:=userdir+'.mim/hms/common/images/';
    Except
    messagedlg('','image directory '+userdir+'.mim/hms/common/images/ not found',mterror,[mbOK],0);
    result:='none';
    End;
  END ELSE result:=userdir+'.mim/hms/common/images/';
END;

Procedure TReconcileform.setrecglyph(state:String);
Var
imagedir:String;
BEGIN
imagedir:=getimagedir;
IF imagedir<>'none' THEN
  BEGIN
  Try
  IF state='on' THEN btnreconcile.Glyph.LoadFromFile(imagedir+'led2on.bmp')
  ELSE btnreconcile.Glyph.LoadFromFile(imagedir+'led2off.bmp');
  Except
  lblog.Items.Add('Could not find '+imagedir);
  End;
  END;
END;

Function TReconcileform.reconcile:Boolean;
Var
i:integer;
ckbalance:Double;
firstchangeddate:Tdatetime;
BEGIN
firstchangeddate:=date;
IF ldatamod.getlock('process',stationname)=true THEN
  BEGIN
  {we have a lock, so no other program is going to bugger things up}
  {we want to start at the first unchecked item}
  {then go through the table marking items as checked where there is}
  {a check request flag}
  IF ldatamod.cledgrec.IsEmpty=false THEN
    BEGIN
      Try
      ldatamod.cledgrec.First;
      firstchangeddate:=ldatamod.cledgrecdate.Value;
      ckbalance:=ldatamod.cledgreccheckedbal.AsFloat;
      IF ldatamod.cledgrecchecked.Value=true THEN
      ckbalance:=ckbalance + ldatamod.cledgrecdramount.AsFloat - ldatamod.cledgreccramount.AsFloat;
      ckbalance:=roundto(ckbalance,-2);
      {that gives us the starting balance}
      i:=1;
        REPEAT
        IF i<=ldatamod.cledgrec.RecordCount THEN
          BEGIN
          ldatamod.cledgrec.RecNo:=i;
          {first we carry out the check request}
          ldatamod.cledgrec.Edit;
          ldatamod.cledgrecchecked.Value:=ldatamod.cledgreccheckreq.Value;
          IF ldatamod.cledgrecchecked.value=true THEN ckbalance:=ckbalance+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
          ckbalance:=roundto(ckbalance,-2);
          ldatamod.cledgreccheckedbal.AsFloat:=ckbalance;
          ldatamod.cledgrec.Post;
          END;
        i:=i+1;
        UNTIL i>ldatamod.cledgrec.RecordCount;
      IF ldatamod.cledgrec.changecount>0 THEN
        BEGIN
      	IF ldatamod.cledgrec.applyupdates(0)>0 THEN lblog.Items.Add('Error applying updates - one or more records may have been changed by another application');
        END;
      Result:=true;
      Except
      Result:=false;
      lblog.Items.Add('Reconcile procedure failed - possible database error');
      End;
    ldatamod.Updatemirror(ldatamod.caccountnamesname.Value,firstchangeddate,0);
    ldatamod.Updatemirror('account',date,0);
    END ELSE result:=false;
  ldatamod.clearlock('process',stationname);
  END ELSE result:=false;
END;

Procedure TReconcileform.Setrecflag;
Var
fdate:TDatetime;
BEGIN
IF ldatamod.creconcile.IsEmpty=false THEN
  BEGIN
  ldatamod.creconcile.Last;
  fdate:=ldatamod.creconciledate.Value;
  ldatamod.caccount.close;
  ldatamod.saccount.close;
  ldatamod.saccount.commandtext:='SELECT * FROM account where item = '''+ldatamod.cledgrecaccount.asstring+'''';
  ldatamod.caccount.open;
  IF ldatamod.caccount.isempty= false THEN
    BEGIN
    ldatamod.caccount.Edit;
    ldatamod.caccountreconciled.Value:=fdate;
    ldatamod.caccount.Post;
    IF ldatamod.caccount.ChangeCount>0 THEN
      BEGIN
      IF ldatamod.caccount.ApplyUpdates(0)>0 THEN lblog.Items.Add('Unable to set "last reconciled" date in account '+ldatamod.caccountname.Value) ELSE
      lblog.Items.Add('"last reconciled" date set to '+formatdatetime('dd/mm/yyyy',fdate));
      END;
    ldatamod.caccount.locate('item',ldatamod.cledgrecaccount.Value,[]);
    END;
  END;
END;

Procedure TReconcileform.deletematchfile;
BEGIN
{this deletes items that have a match number of >0, marks the remaining items as -1 and saves to file}
IF ldatamod.creconcile.IsEmpty=false THEN
  BEGIN
  ldatamod.creconcile.First;
    REPEAT
    IF ((ldatamod.creconcilematch.Value>0)OR(ldatamod.creconcilematch.Value=-6)) THEN ldatamod.creconcile.Delete ELSE
    IF ldatamod.creconcile.Eof=false THEN ldatamod.creconcile.Next;
    UNTIL ldatamod.creconcile.Eof=true;
  IF ldatamod.creconcile.ChangeCount>0 THEN ldatamod.creconcile.ApplyUpdates(0);
  END;
END;

Procedure TReconcileform.loadfile(filename:String);
var
inputfile:textfile;
lineoftext:string;
done:boolean;
BEGIN
done:=false;
lbimport.clear;
Assignfile(inputfile,opendialog1.FileName);
Reset(inputfile);
  REPEAT
  readln(inputfile,lineoftext);
  lineoftext:=blankline(lineoftext);
  IF lineoftext<>'' THEN lbimport.Items.Add(lineoftext);
  IF eof(inputfile)=true THEN done:=true;
  UNTIL  done;
closefile(inputfile);
lfilename.Caption:=filename;
END;

Function TReconcileform.formatfiledata:Boolean;
Type
TNumbers = set of char;
Var
Numbers:TNumbers;
seppos,quotstrpos,colno,lineno:integer;
intext,inword:String;
done,firstchar:Boolean;
BEGIN
Numbers:=[' ','1','2','3','4','5','6','7','8','9','0','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
IF ldatamod.creconcile.active=true THEN
  BEGIN
  IF ldatamod.creconcile.changecount>0 THEN ldatamod.creconcile.cancelupdates;
  END;
IF ldatamod.cautoreconcile.Active=false THEN
  BEGIN
  ldatamod.sautoreconcile.close;
  ldatamod.sautoreconcile.commandtext:='SELECT * FROM autoreconcile where account = '''+ldatamod.cledgeraccount.asstring+'''';
  ldatamod.cautoreconcile.Open;
  END;
{this table may contain old items that weren't cleared last time. Loadreconcile will reload these}
loadreconcile(ldatamod.cledgeraccount.Value);
{We'll load the new data into the table}
  Try
    lineno:=1;
    REPEAT
    IF lbimport.Items.Count>lineno THEN intext:=lbimport.Items[lineno];
    colno:=1;
    done:=false;
  IF intext<>'' THEN
    BEGIN
    ldatamod.creconcile.Append;
      REPEAT
      quotstrpos:=pos('"',intext);
      seppos:=pos(ldatamod.cautoreconcileseparator.Value,intext);
      IF seppos>0 THEN
        BEGIN
        IF (quotstrpos>0)AND(quotstrpos<seppos)THEN
          BEGIN
          {special case where the next item is a quoted string which may contain the separator}

          {find the first alphanumeric}
          firstchar:=false;
            REPEAT
            IF not(intext[1]in numbers) THEN delete(intext,1,1) ELSE firstchar:=true;
            UNTIL firstchar=true;

          {now look for the next instance of quotstr}
          quotstrpos:=pos('"',intext);
          IF quotstrpos>0 THEN
            BEGIN
            {find separator after quoted string marker}
            inword:=copy(intext,1,quotstrpos-1);
            delete(intext,1,quotstrpos);
            END;
          END ELSE
          BEGIN
          inword:=copy(intext,1,seppos-1);
          delete(intext,1,seppos);
          END;
        END ELSE
        BEGIN
        inword:=intext;
        intext:='';
        END;
      IF length(inword)>0 THEN
        BEGIN
        IF inword[1]=' ' THEN delete(inword,1,1);
        IF ldatamod.cautoreconciledatecol.Value=colno THEN ldatamod.creconciledate.Value:=strtodate(inword) ELSE
        IF ldatamod.cautoreconcilenarcol.Value=colno THEN ldatamod.creconcilenarrative.Value:=inword ELSE
        IF ldatamod.cautoreconcileamtcol.Value=colno THEN
          BEGIN
          IF ldatamod.cautoreconcilenegcr.Value=false THEN
          ldatamod.creconcileamount.AsFloat:=strtofloat(inword) ELSE
          ldatamod.creconcileamount.AsFloat:=(-1*(strtofloat(inword)));
          END ELSE
        IF ldatamod.cautoreconcilebalcol.Value=colno THEN
          BEGIN
          IF ldatamod.cautoreconcilenegcr.Value=false THEN
          ldatamod.creconcilebalance.asfloat:=strtofloat(inword) ELSE
          ldatamod.creconcilebalance.asfloat:=(-1*(strtofloat(inword)));
          END;
        END;
      colno:=colno+1;
      IF (length(intext)>0) AND (intext[1]=ldatamod.cautoreconcileseparator.Value)THEN delete(intext,1,1);
      IF length(intext)=0 THEN done:=true;
      UNTIL done;
    ldatamod.creconcileaccount.Value:=ldatamod.caccountitem.Value;
    ldatamod.creconcilematch.value:=0;
    ldatamod.creconcilematchvis.Value:='0';
    ldatamod.creconcile.Post;
    END;
    lineno:=lineno+1;
    UNTIL lineno>=lbimport.Items.Count;
  Result:=true;
  Except
  Result:=false;
  {something went wrong}
  End;

END;

Function Treconcileform.Blankline(textline:string):String;
Var
i:Integer;
Testtext:String;
BEGIN
{remove all the commas and separators. If nothing is left the line is blank}
Testtext:=textline;
IF length(testtext)>0 THEN
  BEGIN
  i:=1;
    REPEAT
    {this should really be an array of separators}
    IF (testtext[i]=',')OR(testtext[i]=' ') THEN delete(testtext,i,1) ELSE i:=i+1;
    UNTIL i>length(testtext);
  END;
IF testtext='' THEN result:=testtext ELSE result:=textline;
END;

procedure TReconcileform.FormShow(Sender: TObject);
Var
saccount:String;
checkfrom:String;
i:Integer;
begin
Matchno:=1;
ldatamod.dledgrec.Enabled:=false;
IF ldatamod.crecautoentry.Active=false THEN ldatamod.crecautoentry.CreateDataSet;
ldatamod.crecautoentry.EmptyDataSet;
ldatamod.crecautoentry.Active:=true;
lblog.clear;
{Start by loading the current ledger view}
lledgername.Caption:=ldatamod.caccountname.Value;
lfilename.Caption:='';
saccount:=ldatamod.cledgeraccount.AsString;

ldatamod.sledgrec.Active:=false;
ldatamod.cledgrec.Active:=false;
ldatamod.sledgrec.CommandText:='SELECT * FROM ledger WHERE Account = '''+saccount+''' and checked = false';
ldatamod.cledgrec.active:=true;

ldatamod.cledgrec.First;
checkfrom:=ldatamod.cledgrecdate.AsString;
{this gives us the date of the oldest unchecked item}
{now re-query}
ldatamod.sledgrec.Active:=false;
ldatamod.cledgrec.Active:=false;
ldatamod.sledgrec.CommandText:='SELECT * FROM ledger WHERE Account = '''+saccount+''' and date >= '''+checkfrom+'''';
ldatamod.cledgrec.active:=true;

{This is what the current balances are supposed to be. We'll check}
ldatamod.cledgrec.Last;
indlbal:=roundto(ldatamod.cledgrecbalance.AsFloat,-2); {indicated ledger balance at the end of the block to be checked}
indbbal:=roundto(ldatamod.cledgreccheckedbal.AsFloat,-2); {indicated checked balance at the end of the block to be checked}
IF ldatamod.cledgrec.RecordCount>0 THEN
  BEGIN
  ldatamod.cledgrec.first;
  {need to check that the ledger balance and checked balance are the same at the start}
  Initlbal:=ldatamod.cledgrecbalance.AsFloat+ldatamod.cledgrecdramount.AsFloat-ldatamod.cledgreccramount.AsFloat;
  IF ldatamod.cledgrecchecked.Value=true
  THEN Initbbal:=ldatamod.cledgreccheckedbal.AsFloat+ldatamod.cledgrecdramount.AsFloat-ldatamod.cledgreccramount.AsFloat
  ELSE Initbbal:=ldatamod.cledgreccheckedbal.AsFloat;
  Initbbal:=roundto(initbbal,-2);
  Initlbal:=roundto(initlbal,-2);
  IF initlbal=Initbbal THEN
    BEGIN
    {Set the checkrequest flag to match checked columns}
    i:=1;
      REPEAT
      IF i<=ldatamod.cledgrec.recordcount THEN ldatamod.cledgrec.recno:=i;
      ldatamod.cledgrec.edit;
      ldatamod.cledgreccheckreq.Value:=ldatamod.cledgrecchecked.value;
      IF ldatamod.cledgrecchecked.Value=true THEN ldatamod.cledgreccheckreqvis.Value:='0' ELSE ldatamod.cledgreccheckreqvis.Value:='?';
      ldatamod.cledgrec.post;
      IF i<=ldatamod.cledgrec.recordcount THEN i:=i+1;
      UNTIL i>ldatamod.cledgrec.recordcount;
    IF ldatamod.cledgreccheckedbal.AsFloat>0 THEN
    eclclose.Text:='CR'+formatfloat('0.00',ldatamod.cledgreccheckedbal.AsFloat)ELSE
    eclclose.Text:='DR'+formatfloat('0.00',ldatamod.cledgreccheckedbal.AsFloat * -1);
    ediff.Text:='DR0.00';
    ediff.Onexit(self);
    IF Loadreconcile(ldatamod.cledgeraccount.Value)=true THEN
      BEGIN
      {we'll need a trap here in case the user has manually checked the ledger items}
      {perhaps modify the stored records so that the balance column reflects what the balance would be}
      {if these items were checked...}

      {We can just do a reconcile to file as normal}
      ldatamod.saccountnames.Close;
      ldatamod.caccountnames.Close;
      ldatamod.saccountnames.Commandtext:='SELECT item,name, accountid from account';
      ldatamod.caccountnames.open;

      IF reconciletofile>=0 THEN
        BEGIN
        ediff.Text:=checkdiff;
        ediff.OnExit(self);
        autodiff:=getdiff(ediff.text);
        manualchange:=false;
        fromfile:=true;
        setrecglyph('on');
        efilesum.Text:='0';
        eledgsum.Text:='0';
        END ELSE setrecglyph('off');
      END;
    END ELSE
    BEGIN

    Messagedlg('','Checked balance before first unchecked item does not match actual balance. Please run account recalculation utiltity',mterror,[mbOK],0)
    END;
  END;
ldatamod.cledgrec.first;
ldatamod.dLedgrec.Enabled:=true;
Fromfile:=false; {has the balance been recalculated automatically from file?}
Manualchange:=false; {has a ledger item been manually altered?}
Autodiff:=0; {The automatically calculated difference between balance and cleared balance}
Homedir:=ldatamod.getusersdir;
setrecglyph('off');
end;

procedure TReconcileform.ereqChange(Sender: TObject);
type
 TNumbers = set of Char;
var
Numbers:TNumbers;
Test,sdeci:String;
cursorposition,i,point:integer;
pointset,deletethis,done,DR,singlechar,autocomplete,Gpointsetlast:Boolean;
sReqbal,sreqdiff:string;
Reqbal,reqdiff:double;
isnegative:Boolean;
  begin
  Gpointsetlast:=false;
  autocomplete:=false;
  singlechar:=false;
  sdeci:='.';
  DR:=False;
  point:=0;
  Numbers := ['1','2','3','4','5','6','7','8','9','0'];
  cursorposition:=eReq.SelStart;
  Test:=eReq.Text;
  IF Length(Test)>1 THEN
    BEGIN
    IF (Upcase(Test[1])='D')AND(Upcase(Test[2])='R')THEN DR:=True ELSE
    IF (Upcase(Test[1])='C')AND(Upcase(Test[2])='R')THEN DR:=False ELSE
    END;

  IF Length(test)>0 THEN
    BEGIN
    i:=1;
    pointset:=false;
    IF length(test)=1 THEN singlechar:=true;
      REPEAT
      IF (i=1)AND((Test[i]='-')OR(Upcase(Test[i])='D')) THEN DR:=True;
      IF (i=1)AND(Test[i]='-')THEN autocomplete:=true;
      IF test[i]=SDeci THEN
        BEGIN
        IF Pointset=False THEN
          BEGIN
          Pointset:=True;
          Point:=i;
          Deletethis:=False
          END ELSE Deletethis:=true;
        END ELSE
      IF ((test[i] in Numbers))THEN Deletethis:=False ELSE Deletethis:=True;
      IF Deletethis= True THEN
        BEGIN
        Delete(Test,i,1);
        Cursorposition:=cursorposition-1;
        END ELSE i:=i+1;
      Done:=(i=length(test)+1)OR(length(test)=0);
      UNTIL Done;
    IF length(test)>0 THEN {some numbers and dec}
      BEGIN
      IF pointset=True THEN
        BEGIN
        IF length(test)>point+2 THEN Delete(test,point+3,length(test)-(point+2)) ELSE
        IF length(test)=point   THEN Insert('00',test,point+1) ELSE
        IF length(test)=point+1 THEN Insert('0',test,point+2);
        END ELSE
      IF Gpointsetlast=True THEN
        BEGIN
        Delete(test,length(test)-1,2);
        END;
      IF (singlechar=false)OR(autocomplete=true) THEN
        BEGIN
        IF DR=true THEN Insert('DR',test,1)ELSE Insert('CR',test,1);
        END ELSE
        BEGIN
        IF DR=true THEN Insert('D',test,1)ELSE Insert('C',test,1);
        END;
      Cursorposition:=cursorposition+2;
      eReq.Text:=Test;
      eReq.SelStart:=cursorposition;
      END;
    END;

  ldatamod.cledgrec.Last;
  Sreqbal:=eReq.Text;
  IF length(sreqbal)>0 THEN
    BEGIN
    IF sreqbal[1]='D' THEN isnegative:=true ELSE isnegative:=false;
    IF length(Sreqbal)>2 THEN delete (sreqbal,1,2);
      Try
      Reqbal:=strtofloat(sreqbal);
      Except
      Reqbal:=0;
      End;
    IF isnegative=true THEN reqbal:=reqbal*-1;
    reqdiff:=reqbal-ldatamod.cledgreccheckedbal.AsFloat;
    IF reqdiff<=0 THEN sreqdiff:='DR'+formatfloat('0.00',reqdiff*-1) ELSE
    sreqdiff:='CR'+formatfloat('0.00',reqdiff);
    ediff.Text:=sreqdiff;
    END;
  IF ediff.text='DR0.00' THEN btnanalyse.Enabled:=false ELSE btnanalyse.Enabled:=true;
  end;

procedure TReconcileform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{if the reconcileform closes for whatever reason, we want to restore the}
{user sql and filters}
ldatamod.cledgrec.active:=false;
ldatamod.sledgrec.Active:=false;
IF ldatamod.cledger.ChangeCount=0 THEN ldatamod.cledger.Refresh;
end;

{Everything below here is from an older reconcile model which took a user entered value for what the cleared balance should be 
and generated a list of which items needed checked to achieve this}
procedure TReconcileform.ediffChange(Sender: TObject);
type
 TNumbers = set of Char;
var
 Numbers:TNumbers;
 Test,sdeci:String;
 cursorposition,i,point:integer;
 pointset,deletethis,done,DR,singlechar,autocomplete,Gpointsetlast:Boolean;
 begin
 autocomplete:=false;
 singlechar:=false;
 sdeci:='.';
 DR:=False;
 point:=0;
 Numbers := ['1','2','3','4','5','6','7','8','9','0'];
 cursorposition:=Ediff.SelStart;
 Test:=ediff.Text;
 gpointsetlast:=false;
 IF Length(Test)>1 THEN
   BEGIN
   IF (Upcase(Test[1])='D')AND(Upcase(Test[2])='R')THEN DR:=True ELSE
   IF (Upcase(Test[1])='C')AND(Upcase(Test[2])='R')THEN DR:=False ELSE
   END;

 IF Length(test)>0 THEN
   BEGIN
   i:=1;
   pointset:=false;
   IF length(test)=1 THEN singlechar:=true;
     REPEAT
     IF (i=1)AND((Test[i]='-')OR(Upcase(Test[i])='D')) THEN DR:=True;
     IF (i=1)AND(Test[i]='-')THEN autocomplete:=true;
     IF test[i]=SDeci THEN
       BEGIN
       IF Pointset=False THEN
         BEGIN
         Pointset:=True;
         Point:=i;
         Deletethis:=False
         END ELSE Deletethis:=true;
       END ELSE
     IF ((test[i] in Numbers))THEN Deletethis:=False ELSE Deletethis:=True;
     IF Deletethis= True THEN
       BEGIN
       Delete(Test,i,1);
       Cursorposition:=cursorposition-1;
       END ELSE i:=i+1;
     Done:=(i=length(test)+1)OR(length(test)=0);
     UNTIL Done;
   IF length(test)>0 THEN {some numbers and dec}
     BEGIN
     IF pointset=True THEN
       BEGIN
       IF length(test)>point+2 THEN Delete(test,point+3,length(test)-(point+2)) ELSE
       IF length(test)=point   THEN Insert('00',test,point+1) ELSE
       IF length(test)=point+1 THEN Insert('0',test,point+2);
       END ELSE
     IF Gpointsetlast=True THEN
       BEGIN
       Delete(test,length(test)-1,2);
       END;
     END;
   IF (singlechar=false)OR(autocomplete=true) THEN
     BEGIN
     IF DR=true THEN Insert('DR',test,1)ELSE Insert('CR',test,1);
     END ELSE
     BEGIN
     IF DR=true THEN Insert('D',test,1)ELSE Insert('C',test,1);
     END;
   Cursorposition:=cursorposition+2;
   Ediff.Text:=Test;
   Ediff.SelStart:=cursorposition;
   END;
IF ediff.text='DR0.00' THEN btnanalyse.Enabled:=false ELSE btnanalyse.Enabled:=true;
end;

procedure TReconcileform.ediffExit(Sender: TObject);
Var
sReqbal,sreqdiff:string;
Reqbal,reqdiff:double;
isnegative:Boolean;
currentrec:Integer;
begin
{when we leave this box, it works out the difference between the actual cleared balance }
{and the required cleared balance}
ldatamod.dledgrec.Enabled:=false;
currentrec:=ldatamod.cledgrec.RecNo;
ldatamod.cledgrec.Last;
Sreqdiff:=Ediff.Text;
IF length(sreqdiff)>0 THEN
  BEGIN
  IF sreqdiff[1]='D' THEN isnegative:=true ELSE isnegative:=false;
  IF length(Sreqdiff)>2 THEN delete (sreqdiff,1,2);
    Try
    Reqdiff:=strtofloat(sreqdiff);
    Except
    Reqdiff:=0;
    End;
  IF isnegative=true THEN reqdiff:=reqdiff*-1;
  reqbal:=ldatamod.cledgreccheckedbal.AsFloat+reqdiff;
  IF reqbal<0 THEN sreqbal:='DR'+formatfloat('0.00',reqbal*-1) ELSE
  sreqbal:='CR'+formatfloat('0.00',reqbal);
  ereq.Text:=sreqbal;
  END;
ldatamod.cledgrec.RecNo:=currentrec;
ldatamod.dledgrec.Enabled:=true;
end;

procedure TReconcileform.btnloadfileClick(Sender: TObject);
  begin
  IF opendialog1.Execute=true THEN
    BEGIN
    ldatamod.saccountnames.Close;
    ldatamod.caccountnames.Close;
    ldatamod.saccountnames.Commandtext:='SELECT item,name, accountid from account';
    ldatamod.caccountnames.open;
    ldatamod.sautoreconcile.close;
    ldatamod.cautoreconcile.close;
    ldatamod.sautoreconcile.CommandText:='SELECT * FROM autoreconcile where account = '+ldatamod.cledgeraccount.AsString;
    ldatamod.cautoreconcile.Open;
    IF ldatamod.cautoreconcile.IsEmpty=false THEN
      BEGIN
      Loadfile(opendialog1.FileName);
      formatfiledata;
      setcurrentdir(homedir);
      IF checkimporteddata = true THEN
        BEGIN
        IF reconciletofile>=0 THEN
          BEGIN
          ediff.Text:=checkdiff;
          ediff.OnExit(self);
          autodiff:=getdiff(ediff.text);
          manualchange:=false;
          fromfile:=true;
          setrecglyph('on');
          efilesum.Text:='0';
          eledgsum.Text:='0';
          END ELSE setrecglyph('off');
        END;
      END ELSE
    IF Messagedlg('','Before you can reconcile from file you need to supply some information about the imported file. Do you want to do that now?',mtInformation,[mbYes,mbNo],0)=mrYes THEN
      BEGIN
      Reconcileform.FormStyle:=fsNormal;
      fcolsetup:=Tfcolsetup.Create(nil);
      fcolsetup.FormStyle:=fsStayOnTop;
      fcolsetup.Loadaccounts(ldatamod.cledgeraccount.Value);
      fcolsetup.loadtestfile(opendialog1.FileName);
      fcolsetup.showmodal;
      fcolsetup.Free;
      Reconcileform.FormStyle:=fsStayontop;
      END;
    END;
  end;

procedure TReconcileform.dbgledgerDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
Fieldz,Thetext:string;
begin
IF (datacol=8)AND(ldatamod.cledgrec.IsEmpty=false) THEN
  BEGIN
  Fieldz:=dbgledger.Fields[8].Name;
  Delete(Fieldz,1,8);
    Try
    Thetext:=ldatamod.cledgrec.FieldValues[Fieldz];
    Except
    Thetext:='';
    End;
  IF ldatamod.cledgrecchecked.Value=ldatamod.cledgreccheckreq.Value THEN
  dbgledger.canvas.Brush.Color:=clBase ELSE
    BEGIN
    IF ldatamod.cledgrecchecked.Value=false THEN
    dbgledger.Canvas.Brush.color:=clLime ELSE dbgledger.Canvas.Brush.color:=clYellow;
    END;
  dbgledger.Canvas.FillRect(Rect);
  IF (thetext<>'0')AND(thetext<>'?')THEN
  dbgledger.Canvas.TextOut(rect.Left+2,rect.Top+2,Thetext);
  END;
end;



procedure TReconcileform.ediffDblClick(Sender: TObject);
begin
ediff.Text:='DR0.00';
ediff.Onexit(self);
end;

procedure TReconcileform.btnanalyseClick(Sender: TObject);
Var
j,z:Integer;
fdiff:Double;
begin
{here we try to find the figure in the diff box by checking and unchecking various items}
fdiff:=getdiff(ediff.Text);
ldatamod.dledgrec.Enabled:=false;
ldatamod.cledgrec.Filter:='checked = false';
ldatamod.cledgrec.Filtered:=true;
FOR j:=1 to ldatamod.cledgrec.recordcount do
  BEGIN
    ldatamod.cledgrec.RecNo:=j;
    ldatamod.cledgrec.Edit;
    ldatamod.cledgreccheckreq.Value:=false;
    ldatamod.cledgrec.Post;
    END;

z:=linematch(fdiff);
IF z=0 THEN
z:=multimatch(date,fdiff,false);
ediff.Text:=checkdiff;
autodiff:=getdiff(ediff.text);
Fromfile:=false;
manualchange:=false;
IF z>0 THEN setrecglyph('on')ELSE setrecglyph('off');
ldatamod.cledgrec.Filtered:=false;
ldatamod.dLedgrec.Enabled:=true;
end;

procedure TReconcileform.lbimportClick(Sender: TObject);
begin
lbimport.SendToBack;
end;

procedure TReconcileform.dbgfileDblClick(Sender: TObject);
begin
{show pattern match form}
IF (ldatamod.cautoreconcile.active=true)AND(ldatamod.cautoreconcile.isempty=false)THEN
  BEGIN
  fpatternmatch:=TFpatternmatch.Create(reconcileform);
  fpatternmatch.efilenar.Text:=ldatamod.creconcilenarrative.Value;
  fpatternmatch.Showmodal;
  fpatternmatch.Free;
  {maybe try matching if new data added}
  END;
end;

procedure TReconcileform.dbgledgerDblClick(Sender: TObject);
begin
lblog.bringtofront;
end;

procedure TReconcileform.lblogClick(Sender: TObject);
begin
lblog.sendtoback;
end;

procedure TReconcileform.dbgfileDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
Var
Fieldz,Thetext:string;
begin
IF (datacol=4)AND(ldatamod.creconcile.IsEmpty=false) THEN
  BEGIN
  Fieldz:=dbgfile.Fields[4].Name;
  Delete(Fieldz,1,10);
    Try
    Thetext:=ldatamod.creconcile.FieldValues[Fieldz];
    IF (thetext ='0')OR(thetext='-1') THEN dbgfile.canvas.Brush.Color:=clBase ELSE
    IF (thetext='FI')OR(thetext='FI*') THEN dbgfile.canvas.Brush.Color:=clRed ELSE
    dbgfile.canvas.Brush.Color:=clLime;
    dbgfile.Canvas.FillRect(Rect);
    IF (ldatamod.creconcilematchvis.Value<>'0')AND(ldatamod.creconcilematchvis.Value<>'-1') THEN
    dbgfile.Canvas.TextOut(rect.Left+2,rect.Top+2,Thetext);
    Except
    End;
  END;

end;

procedure TReconcileform.btnreconcileClick(Sender: TObject);
begin
{There are various ways we can end up here.}
{The user may have checked/unchecked some items manually}
{The user may have used the autocalc procedure by entering a required balance}
{The user may have reconciled from file}
IF fromfile=true THEN
  BEGIN
  {it's been reconciled from file. Check if the user has changed an item}
  {and if so whether the difference now is the same as the autocalculated one}
  IF (manualchange=true)AND(strtofloat(eledgsum.text)<>strtofloat(efilesum.text)) THEN
    BEGIN
    Messagedlg('','Sum of checked ledger entries no longer matches imported file.',mtError,[mbOK],0);
    END ELSE
    BEGIN
    IF reconcile = true THEN
      BEGIN
      setrecflag;
      deletematchfile;
      END ELSE
    messagedlg('','Reconciliation failed (1)',mterror,[mbOK],0);
    END;
  END ELSE
IF autodiff>0 THEN
  BEGIN
  IF (manualchange=true) THEN
    BEGIN
    Messagedlg('','Sum of checked ledger entries no longer matches automatic calculation.',mtError,[mbOK],0);
    END ELSE
    BEGIN
    IF reconcile = false THEN
    messagedlg('','Reconciliation failed (3)',mterror,[mbOK],0);
    END;
  END ELSE
  BEGIN
  {manually checked some entries}
  IF reconcile = true THEN deletematchfile ELSE
  messagedlg('','Reconciliation failed (4)',mterror,[mbOK],0);
  END;
accledgerform.eDatefromExit(self);
setrecglyph('off');
end;

procedure TReconcileform.dbgfileCellClick(Column: TColumn);
Var
manfilesum:Double;
begin
IF column.Index=4 THEN
  BEGIN
  IF (autodiff<>0)AND(pmanrec.Visible=false) THEN
    BEGIN
    pmanrec.Visible:=true;
    eledgsum.Text:='0';
    efilesum.text:='0';
    END;

  IF ldatamod.creconcile.IsEmpty=false THEN
    BEGIN
      Try
      manfilesum:=strtofloat(efilesum.Text);
      Except
      manfilesum:=0;
      End;
    IF (ldatamod.creconcilematch.Value<=0)AND((ldatamod.creconcilematch.Value=0)OR(ldatamod.creconcilematch.Value=-1)OR(ldatamod.creconcilematch.value=-7)) THEN
      BEGIN
      {mark it as matched}
      manfilesum:=manfilesum+roundto(ldatamod.creconcileamount.AsFloat,-2);
      ldatamod.creconcile.Edit;
      ldatamod.creconcilematch.Value:=-6;
      ldatamod.creconcilematchvis.Value:='M';
      ldatamod.creconcile.Post;
      END ELSE
      BEGIN
      {mark it as unmatched}
      manfilesum:=manfilesum-roundto(ldatamod.creconcileamount.AsFloat,-2);
      ldatamod.creconcile.Edit;
      ldatamod.creconcilematch.Value:=-1;
      ldatamod.creconcilematchvis.Value:='-1';
      ldatamod.creconcile.Post;
      END;
    efilesum.Text:=formatfloat('0.00',manfilesum);
    IF manfilesum<> strtofloat(eledgsum.Text) THEN setrecglyph('off')
    ELSE setrecglyph('on');
    END;
  END;
end;

procedure TReconcileform.dbgfileTitleClick(Column: TColumn);
begin
lbimport.BringToFront;
end;

procedure TReconcileform.dbgledgerCellClick(Column: TColumn);
Var
manledgsum:Double;
begin
IF column.Index=8 THEN
  BEGIN
  IF (autodiff<>0)AND(pmanrec.Visible=false) THEN
    BEGIN
    pmanrec.Visible:=true;
    eledgsum.Text:='0';
    efilesum.text:='0';
    END;
  IF ldatamod.creconcile.IsEmpty=false THEN
    BEGIN
      Try
      manledgsum:=strtofloat(eledgsum.Text);
      Except
      manledgsum:=0;
      End;

    IF ldatamod.cledgreccheckreq.Value=False THEN
      BEGIN
      manledgsum:=manledgsum+ldatamod.cledgreccramount.AsFloat-ldatamod.cledgrecdramount.AsFloat;
      END ELSE
      BEGIN
      manledgsum:=manledgsum-ldatamod.cledgreccramount.AsFloat+ldatamod.cledgrecdramount.AsFloat;
      END;
    eledgsum.Text:=formatfloat('0.00',manledgsum);
    IF roundto(manledgsum,-2)<>roundto(strtofloat(efilesum.text),-2) THEN setrecglyph('off')ELSE setrecglyph('on');
    END;
  ldatamod.cledgrec.Edit;
  IF ldatamod.cledgreccheckreq.Value=False
  THEN ldatamod.cledgreccheckreq.Value:=true ELSE ldatamod.cledgreccheckreq.Value:=False;
  IF ldatamod.cledgrecchecked.Value=ldatamod.cledgreccheckreq.Value THEN
    BEGIN
    IF ldatamod.cledgrecchecked.Value=true THEN ldatamod.cledgreccheckreqvis.Value:='0' ELSE ldatamod.cledgreccheckreqvis.Value:='?';
    END ELSE ldatamod.cledgreccheckreqvis.Value:='M';
  ldatamod.cledgrec.post;
  ediff.Text:=checkdiff;

  IF pmanrec.Visible=false THEN
    BEGIN
    IF getdiff(ediff.text)<>0 THEN setrecglyph('on') ELSE setrecglyph('off');
    END;
  manualchange:=true;
  END;
end;

end.

