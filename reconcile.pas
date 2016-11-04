unit reconcile;

interface

uses
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms, 
  QDialogs, QStdCtrls, QGrids,Math;

type
  TReconcileform = class(TForm)
    Memo1: TMemo;
    ListBox1: TListBox;
    LIn: TListBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    EPend: TEdit;
    Edit4: TEdit;
    Edit1: TEdit;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    BReq: TEdit;
    Insol: TListBox;
    Eunchecked: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ediff: TEdit;
    btnrecfile: TButton;
    ledgergrid: TStringGrid;
    bankgrid: TStringGrid;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BReqChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ediffChange(Sender: TObject);
    procedure BReqExit(Sender: TObject);
    procedure ediffExit(Sender: TObject);
    procedure btnrecfileClick(Sender: TObject);
    procedure loadheadings(textline,separator,quotedstr:string;lineno:integer);
    Function  Blankline(textline:String):String;
    Function  checkfiledata:Boolean;
    Procedure loadsettings;
    Procedure Cleargrids;
    Function  matchrecords(recno:integer):Integer;
    Function  matchbanktomulti(recno:Integer):Boolean;
    Function  checkmultimatch(startrec,matchcol:Integer;target:Double):Boolean;
    procedure Button3Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure ledgergridDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Reconcileform: TReconcileform;
  SDeci:Char;
  GPointsetlast:Boolean;
  Expend,BBal,LBal,Actbal,indbbal,indlbal:Currency;
  Initbbal,Initlbal:Currency;
  Userfilter,Reconcilefilter,Usersql,reconcilesql:String;
  userselected:Integer;
  datecol,narcol,amtcol,balcol,datewindow,recwindow:integer;
  negiscr:boolean;
  matchlist,banklist:TStringlist;
  bankmatchcol:integer;



implementation

uses Accdatamodule, Accledger,Accmain, autorec;

{$R *.xfm}

Procedure TReconcileform.loadheadings(textline,separator,quotedstr:string;lineno:integer);
Var
sword:string;
seppos,qspos,colno:Integer;
BEGIN
{This divides the input string into individual headings}
colno:=0;
IF lineno>=reconcileform.bankgrid.rowcount THEN reconcileform.bankgrid.rowcount:=reconcileform.bankgrid.rowcount+1;
  REPEAT
  qspos:=pos(quotedstr,textline);
  seppos:=pos(separator,textline);
  IF qspos=1 THEN
    BEGIN
    {look for closing quoted string separator}
    delete(textline,1,1);
    qspos:=pos(quotedstr,textline);
    sword:=copy(textline,0,qspos-1);
    textline:=copy(textline,qspos+1,length(textline)-qspos);
    {delete leading separators to avoid blank fields}

    IF (length(textline)>0)AND(textline[1]=separator) THEN delete(textline,1,1);
    END ELSE
  IF seppos=0 THEN
    BEGIN
    sword:=textline;
    textline:='';
    END ELSE
    BEGIN
    sword:=copy(textline,0,seppos-1);
    IF seppos<length(textline)THEN
    textline:=copy(textline,seppos+1,length(textline)-seppos) ELSE textline:='';
    END;
  bankgrid.Cells[colno,lineno]:=sword;
  colno:=colno+1;
  IF colno>reconcileform.bankgrid.colcount THEN reconcileform.bankgrid.colcount:=reconcileform.bankgrid.colcount+1;
  UNTIL textline='';
END;

Function TReconcileform.checkfiledata:Boolean;
Var
bankdate,ledgerdate:Tdatetime;
datacol,linenumber:integer;
ledgerunchecked,fileunchecked:double;
Errors:Boolean;
BEGIN
{here we take a look at the imported data and see if the values conform to our settings}
{first check the dates}
datacol:=datecol;
linenumber:=1;
ledgerdate:=strtodate(reconcileform.ledgergrid.cells[1,1]);
Errors:=false;
Try
Bankdate:=strtodate(bankgrid.cells[datacol,linenumber]);
Except
bankdate:=date;
{we might try to find the actual date column here}
Errors:=true;
End;
datacol:=amtcol;
linenumber:=1;
Try
strtofloat(reconcileform.bankgrid.cells[datacol,linenumber]);
Except
Errors:=true;
End;
datacol:=balcol;
linenumber:=1;
Try
strtofloat(reconcileform.bankgrid.cells[datacol,linenumber]);
Except
{we might try to find the actual amount column here}
Errors:=true;
End;
{starting balance}
ledgerunchecked:=accdatamoduleform.cdsaccountclearedbalance.AsFloat;
Try
fileunchecked:=strtofloat(reconcileform.bankgrid.cells[balcol,1]);
Except
errors:=true;
End;

Try
fileunchecked:=fileunchecked-strtofloat(reconcileform.bankgrid.Cells[amtcol,1]);
Except
errors:=true;
End;

IF negiscr=true THEN
fileunchecked:=fileunchecked*-1;
ledgerunchecked:=roundto(ledgerunchecked,-2);
fileunchecked:=roundto(fileunchecked,-2);
IF ledgerdate-datewindow>bankdate THEN
  BEGIN
  Errors:=true;
  END ELSE
  BEGIN
  IF ledgerunchecked<>fileunchecked THEN
    BEGIN
    Errors:=true;
    listbox1.items.add('starting balance wrong');
    END;
  END;
IF errors=true THEN
  BEGIN
  result:=false;
  Messagedlg('','There is a problem with the text file you''ve imported. See the system log below left for details',mtError,[mbOK],0);
  END ELSE result:=true;
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

Procedure TReconcileform.loadsettings;
BEGIN
{loads the settings from file}
{we want the date, the narrative and the value}
datecol:=strtoint(accdatamoduleform.Getsysteminfo('system','autorec','date','0'));
narcol:=strtoint(accdatamoduleform.Getsysteminfo('system','autorec','narr','2'));
amtcol:=strtoint(accdatamoduleform.Getsysteminfo('system','autorec','amount','3'));
balcol:=strtoint(accdatamoduleform.Getsysteminfo('system','autorec','bal','4'));
negiscr:=strtobool(accdatamoduleform.Getsysteminfo('system','autorec','negiscr','true'));
datewindow:=strtoint(accdatamoduleform.Getsysteminfo('system','autorec','datewindow','50'));
recwindow:=strtoint(accdatamoduleform.Getsysteminfo('system','autorec','recwindow','10'));
END;

Procedure TReconcileform.Cleargrids;
BEGIN
bankgrid.RowCount:=2;
bankgrid.ColCount:=3;
bankgrid.Cells[0,0]:='';
bankgrid.Cells[1,0]:='';
bankgrid.Cells[2,0]:='';
bankgrid.Cells[0,1]:='';
bankgrid.Cells[1,1]:='';
bankgrid.Cells[2,1]:='';
bankmatchcol:=0;

ledgergrid.RowCount:=2;
ledgergrid.ColCount:=7;
Ledgergrid.ColWidths[3]:=ledgergrid.Width-(ledgergrid.ColWidths[0]+ledgergrid.ColWidths[1]+ledgergrid.ColWidths[3]+ledgergrid.ColWidths[4]);
Ledgergrid.Cells[0,0]:='item';
Ledgergrid.Cells[1,0]:='date';
Ledgergrid.Cells[2,0]:='folio';
Ledgergrid.Cells[3,0]:='narrative';
Ledgergrid.Cells[4,0]:='dr';
Ledgergrid.Cells[5,0]:='cr';
Ledgergrid.Cells[6,0]:='match';

ledgergrid.Cells[0,1]:='';
ledgergrid.Cells[1,1]:='';
ledgergrid.Cells[2,1]:='';
ledgergrid.Cells[3,1]:='';
ledgergrid.Cells[4,1]:='';
ledgergrid.Cells[5,1]:='';
ledgergrid.Cells[6,1]:='';
Loadsettings;
END;


Function TReconcileform.matchrecords(recno:integer):Integer;
Var
bankamt,ledgamt:Double;
ledgdate,bankdate:TDatetime;
i:integer;
offset:Integer;
comparecol,matchitem:integer;
inwindow,match,done,finished:Boolean;
BEGIN
match:=false;
matchitem:=-1;
{this takes the selected record and tries to do a direct match with a single ledger entry}
{we'll start as close as possible to the bank record}
  Try
  bankamt:=strtofloat(reconcileform.bankgrid.Cells[amtcol,recno]);
  bankdate:=strtodate(reconcileform.bankgrid.Cells[datecol,recno]);
    IF bankamt<0 THEN
      BEGIN
      bankamt:=bankamt*-1;
      IF negiscr=true THEN comparecol:=5 ELSE comparecol:=4;
      END ELSE
      BEGIN
      IF negiscr=true THEN comparecol:=4 ELSE comparecol:=5;
      END;
  {now we have to match this to an existing single ledger entry}
  Offset:=0;
    REPEAT
      i:=1;
      REPEAT
      ledgamt:=strtofloat(reconcileform.ledgergrid.cells[comparecol,i]);
      ledgdate:=strtodate(reconcileform.ledgergrid.cells[1,i]);
      inwindow:=false;
      IF ledgamt>0 THEN
        BEGIN
        IF ((ledgdate-bankdate>=0)AND(ledgdate-bankdate<=offset))OR ((bankdate-ledgdate>=0)AND(bankdate-ledgdate<=offset))
        THEN inwindow:=true;
        END;

      IF inwindow=true THEN
        BEGIN
        IF ledgamt=bankamt THEN
          BEGIN
      	  match:=true;
      	  Matchitem:=i;
      	  reconcileform.ledgergrid.Cells[6,i]:=inttostr(recno);
          reconcileform.bankgrid.Cells[bankmatchcol,recno]:='MATCH -S';
          END;
        END;
      i:=i+1;
      done:=(i=reconcileform.ledgergrid.RowCount)OR(match=true);
      UNTIL done;
    IF offset<=recwindow THEN offset:=offset+1;
    Finished:=(match=true)OR(offset>recwindow);
    UNTIL Finished;
  Except
  Result:=-1;
  Listbox1.Items.Add('error in direct match conversion - recno '+inttostr(recno));
  exit;
  End;
IF match=false THEN result:=-1 ELSE result:=matchitem;
END;

Function  TReconcileform.matchbanktomulti(recno:Integer):Boolean;
Var
bankamt,ledgamt:Double;
ledgdate,bankdate:TDatetime;
i,firstmatch:integer;
comparecol:integer;
offset:integer;
match,done:Boolean;
BEGIN
{this maps a single bank record to multiple ledger records. Because it's called after the}
{single match procedure we can ignore ledger items that have an entry in column 5. Ha! clever eh?}
Matchlist:=TStringlist.Create;
{this takes the selected record and tries to do a direct match with a several ledger entries}
  Try
  bankamt:=strtofloat(reconcileform.bankgrid.Cells[amtcol,recno]);
  bankdate:=strtodate(reconcileform.bankgrid.Cells[datecol,recno]);
    IF bankamt<0 THEN
      BEGIN
      bankamt:=bankamt*-1;
      IF negiscr=true THEN comparecol:=5 ELSE comparecol:=4;
      END ELSE
      BEGIN
      IF negiscr=true THEN comparecol:=4 ELSE comparecol:=5;
      END;
  {now we have to match this to an multiple ledger entries}
  {Let's assemble a list of all ledger entries within the date window that haven't yet been matched}
  {we'll just record the line number - it's quicker}
  {First mark all items within the current window}
  offset:=0;
    REPEAT
    i:=1;
    firstmatch:=-1;
    matchlist.Clear;
    {we'll start by checking the date of the bank record}
    {and then move the ledger date back }
    {the ledger entries will generally be before the bank statement}
      REPEAT
      IF (i<=reconcileform.ledgergrid.RowCount)AND(reconcileform.ledgergrid.cells[6,i]='')THEN
      	BEGIN
      	{check the date}
      	ledgamt:=strtofloat(reconcileform.ledgergrid.cells[comparecol,i]);
      	ledgdate:=strtodate(reconcileform.ledgergrid.cells[1,i]);
        IF (ledgamt>0)AND(ledgamt<bankamt) THEN
          BEGIN
          IF (bankdate-ledgdate>=0)AND(bankdate-ledgdate=offset) THEN
            BEGIN
            IF firstmatch=-1 THEN firstmatch:=i;
            matchlist.Add(inttostr(i));
            END; {within window}
          END;
      	END; {not matched already}
      i:=i+1;
      UNTIL i=reconcileform.ledgergrid.RowCount;
    Match:=Checkmultimatch(firstmatch,comparecol,bankamt);
    IF match=true THEN reconcileform.bankgrid.Cells[bankmatchcol,recno]:='MATCH -M';

    IF offset<=recwindow THEN offset:=offset+1;
    Done:=(match=true)OR(offset>recwindow);
    UNTIL done;

    {if this doesn't work we'll allow 1 day leeway}
IF match=false THEN
  BEGIN
  offset:=0;
    REPEAT
    i:=1;
    firstmatch:=-1;
    matchlist.Clear;
    {we'll start by checking the date of the bank record}
    {and then move the ledger date back }
    {the ledger entries will generally be before the bank statement}
      REPEAT
      IF (i<=reconcileform.ledgergrid.RowCount)AND(reconcileform.ledgergrid.cells[6,i]='')THEN
      	BEGIN
      	{check the date}
      	ledgamt:=strtofloat(reconcileform.ledgergrid.cells[comparecol,i]);
      	ledgdate:=strtodate(reconcileform.ledgergrid.cells[1,i]);
        IF (ledgamt>0)AND(ledgamt<bankamt) THEN
          BEGIN
          IF (bankdate-ledgdate>=0)AND((bankdate-ledgdate=offset)OR(bankdate-ledgdate=offset+1)OR(bankdate-ledgdate=offset-1)) THEN
            BEGIN
            IF firstmatch=-1 THEN firstmatch:=i;
            matchlist.Add(inttostr(i));
            END; {within window}
          END;
      	END; {not matched already}
      i:=i+1;
      UNTIL i=reconcileform.ledgergrid.RowCount;
    Match:=Checkmultimatch(firstmatch,comparecol,bankamt);
    IF match=true THEN reconcileform.bankgrid.Cells[bankmatchcol,recno]:='MATCH -M';

    IF offset<=recwindow THEN offset:=offset+1;
    Done:=(match=true)OR(offset>recwindow);
    UNTIL done;
  END;
  Except
  Result:=false;
  Exit;
  End;
Matchlist.Free;
IF match=false THEN Result:=false ELSE result:=true;
END;

Function TReconcileform.checkmultimatch(startrec,matchcol:Integer;target:Double):Boolean;
Var
IBits:TBits;
j,z:Integer;
IOver,Done,Carry,Match:Boolean;
SItem:String;
Fsum:Double;
BEGIN
match:=false;
IF matchlist.Count>1 THEN
  BEGIN
  IBits:=TBits.Create;
  {We have a stringlist that holds the records that MAY match our bank}
  {record. We will set up Ibits to perform various combinations of these}
  IBits.Size:=Matchlist.Count;
  Iover:=false;
  {we'll set the initial state to be xxxxxx11 i.e. 2. Then we'll increment it to all 1s (max)}
  FOR j:=0 to Ibits.Size-1 DO
    BEGIN
    IBits[j]:=False;
    END;
  IBits[0]:=false;
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
            IF IBits[z]=True THEN FSum:=FSum+StrToFloat(reconcileform.ledgergrid.cells[matchcol,strtoint(matchlist[z])]);
            z:=z+1;
            UNTIL z=IBits.Size;
          END;

        IF roundto(FSum,-2) =roundto(Target,-2) THEN
          BEGIN
          IF IBits.Size>0 THEN
            BEGIN
            z:=0;
              REPEAT
              IF IBits[z]=True THEN reconcileform.ledgergrid.Cells[6,strtoint(matchlist[z])]:='M';
              z:=z+1;
              UNTIL z=IBits.Size;
            END;
          Match:=true;
          Done:=true;
          END;
        END;
      UNTIL Done=True;
    END;
  IBits.Free;
  END;
IF match=true THEN result:=true ELSE result:=false;
END;



procedure TReconcileform.FormShow(Sender: TObject);
Var
done:Boolean;
Sinc:String;
XCash,XBank:Currency;
saccount:String;
checkfrom:String;
Linenumber:Integer;
Dontcheck:Boolean; {becomes true if there is nothing to reconcile up to the selected entry}
begin
{set window size}
currentitem:=accdatamoduleform.cdsledger.RecNo;
reconcileform.Width:=(Listbox1.Width * 11) DIV 10;
reconcileform.Height:=Listbox1.Height * 3;
dontcheck:=false;
listbox1.clear;
cleargrids;
accdatamoduleform.dsLedger.Enabled:=false;
userselected:=accdatamoduleform.cdsledgeritem.Value; {the item the cursor is positioned on}
breq.Clear; {the actual balance which the user will enter}
Lin.Clear;
SDEci:='.';
{now find the various totals associated with this account}
IF accDatamoduleform.cdsAccount.active=False THEN accDatamoduleform.cdsAccount.active:=true;
IF accDatamoduleform.cdsLedger.active=False THEN accDatamoduleform.cdsLedger.active:=true;
{We want to filter out all the items from this account}
Userfilter:=accDatamoduleform.cdsLedger.Filter; {We change the filter and command text during this procedure}
Usersql:=accdatamoduleform.sqlLedger.CommandText; {so we save the current values here first}
saccount:=inttostr(Ledgaccount);
accDatamoduleform.cdsLedger.Filtered:=false;
{Then we recall all unchecked items}
reconcilesql:='SELECT * FROM ledger WHERE Account = '''+saccount+''' and balance <> checkedbal ORDER BY date';
accdatamoduleform.sqlLedger.Active:=false;
{this should find the first item where the cleared balance is different from the actual i.e. the first uncleared}
accdatamoduleform.sqlLedger.CommandText:=reconcilesql;
accdatamoduleform.cdsLedger.active:=true;
IF accdatamoduleform.cdsledger.ChangeCount=0 THEN accdatamoduleform.cdsledger.Refresh;
{now find the first item and requery - in case the balances match for other reasons later}
IF accdatamoduleform.cdsledger.isempty=false THEN
  BEGIN
  accdatamoduleform.cdsledger.First;
  checkfrom:=accdatamoduleform.cdsledgerdate.AsString;
  reconcilesql:='SELECT * FROM ledger WHERE Account = '''+saccount+''' and date >= '''+checkfrom+''' ORDER BY date';
  accdatamoduleform.sqlLedger.Active:=false;
  accdatamoduleform.sqlLedger.CommandText:=reconcilesql;
  accdatamoduleform.cdsLedger.active:=true;
  IF accdatamoduleform.cdsledger.ChangeCount=0 THEN accdatamoduleform.cdsledger.Refresh;
  Actbal:=0;
  {This is what the current balances are supposed to be. We'll check}
  IF accledgerform.reccursor.Checked=false THEN accdatamoduleform.cdsledger.Last ELSE
    BEGIN
    {if we can't locate the item the user clicked on, chances are it was above the first cleared.}
    IF accdatamoduleform.cdsledger.locate('item',userselected,[])=false THEN
      BEGIN
      messagedlg('','The balance is correct at the entry you have selected.',mterror,[mbOK],0);
      dontcheck:=true;
      reconcileform.Close;
      END;
    END;
  END ELSE
  BEGIN
  messagedlg('','The balance is correct at the entry you have selected.',mterror,[mbOK],0);
  dontcheck:=true;
  reconcileform.Close;
  END;

IF dontcheck=false THEN
  BEGIN
  indlbal:=accdatamoduleform.cdsledgerbalance.ascurrency; {indicated ledger balance at the end of the block to be checked}
  indbbal:=accdatamoduleform.cdsledgercheckedbal.AsCurrency; {indicated checked balance at the end of the block to be checked}
  IF accDatamoduleform.cdsledger.RecordCount>0 THEN
    BEGIN
    accDatamoduleform.cdsledger.first;
    Linenumber:=0;

    {let's find the initial balance. It should be zero, but check}
    Initlbal:=accDatamoduleform.cdsledgerbalance.AsCurrency+accDatamoduleform.cdsledgerdramount.AsCurrency-accDatamoduleform.cdsledgercramount.AsCurrency;
    IF accDatamoduleform.cdsledgerchecked.Value=true
    THEN Initbbal:=accDatamoduleform.cdsledgercheckedbal.AsCurrency+accDatamoduleform.cdsledgerdramount.AsCurrency-accDatamoduleform.cdsledgercramount.AsCurrency
    ELSE Initbbal:=accDatamoduleform.cdsledgercheckedbal.AsCurrency;
    {If the initial item is cleared, then the initial cleared balance must be the current cleared balance minus the initial item}
    Expend:=0; {we work out the pending items below}
    BBal:=initbbal;
    LBal:=Initlbal;
      REPEAT
      Lbal:=LBal-accDatamoduleform.cdsledgerdramount.AsCurrency+accDatamoduleform.cdsledgercramount.AsCurrency;
      {If the ledger item is checked, we change bbal, otherwise we alter expend}
      IF accDatamoduleform.cdsledgerchecked.Value=true
      THEN BBal:=BBal-accDatamoduleform.cdsledgerdramount.AsCurrency+accDatamoduleform.cdsledgercramount.AsCurrency ELSE
        BEGIN
      	Expend:=Expend-accDatamoduleform.cdsledgerdramount.AsCurrency+accDatamoduleform.cdsledgercramount.AsCurrency;
      	Linenumber:=linenumber+1;
      	IF linenumber>reconcileform.ledgergrid.rowcount THEN reconcileform.ledgergrid.rowcount:=reconcileform.ledgergrid.rowcount+1;
      	Ledgergrid.Cells[0,linenumber]:=accdatamoduleform.cdsledgeritem.AsString;
      	Ledgergrid.Cells[1,linenumber]:=formatdatetime(shortdateformat,accdatamoduleform.cdsledgerdate.value);
      	Ledgergrid.Cells[2,linenumber]:=accdatamoduleform.cdsledgerfolio.Value;
      	Ledgergrid.Cells[3,linenumber]:=accdatamoduleform.cdsledgernarrative.Value;
      	Ledgergrid.Cells[4,linenumber]:=formatfloat('0.00',accdatamoduleform.cdsledgerdramount.AsFloat);
      	Ledgergrid.Cells[5,linenumber]:=formatfloat('0.00',accdatamoduleform.cdsledgercramount.AsFloat);
      	END;
      IF accDatamoduleform.cdsledgerchecked.Value=false THEN
        BEGIN
        {we add unchecked items to Lin}
        {This is quite a good way to store the values since we only need one}
        {entry for each ledger entry rather than a cr and dr one}
        SInc:=Formatcurr('0.00',(accDatamoduleform.cdsledgercramount.AsCurrency-accDatamoduleform.cdsledgerdramount.AsCurrency));
        LIn.Items.Add(SInc);
        END;
      IF accDatamoduleform.cdsledger.eof=False THEN accDatamoduleform.cdsledger.Next;
      Done:=(accDatamoduleform.cdsledger.Eof=True) OR ((accledgerform.reccursor.checked=true)AND(accdatamoduleform.cdsledgeritem.value=userselected));
      UNTIL Done;
    {now take the balance from the last item and check it's right}
    XCash:=Accdatamoduleform.cdsledgerbalance.AsCurrency;
    XBank:=Accdatamoduleform.cdsledgercheckedbal.AsCurrency;
    IF XCash<0 THEN Edit1.Text:=Formatcurr('DR0.00',(XCash*-1)) ELSE Edit1.Text:=Formatcurr('CR0.00',XCash);
    IF XBank<0 THEN Edit4.Text:=Formatcurr('DR0.00',(XBank*-1)) ELSE Edit4.Text:=Formatcurr('CR0.00',XBank);
    LBal:=XCash;
    BBal:=XBank;
    Button1.Enabled:=False;
    IF Expend<0 THEN EPend.Text:=Formatcurr('DR0.00',(Expend*-1))ELSE EPend.Text:=Formatcurr('CR0.00',Expend);
  END;
END;
eunchecked.Text:=inttostr(Lin.Items.Count);{the number of unchecked items}
accdatamoduleform.dsLedger.Enabled:=true;
end;

procedure TReconcileform.Button1Click(Sender: TObject);
Var
j,z,uccount:Integer;
Carry:Boolean;
Solutions:Integer;
IBits:TBits;
IOver,Done,ItemChecked:Boolean;
CDiff,CSum:Currency;
SItem,SMatching:String;
SIMatch,SFirstmatch:String;
begin
{This is the big scary routine where we work out what items should be checked}
accdatamoduleform.dsLedger.Enabled:=false;
IBits:=TBits.Create;
IOver:=False;
CDiff:=Actbal-BBal; {The difference between the what I think the balance is and what the user thinks it is}
Button2.Enabled:=False;
IBits.Size:=LIn.Items.Count; {we set up Ibits with the same number of elements as there}
                             {are unchecked items}
Solutions:=0;
Listbox1.Clear;
Insol.Clear;

{First we see if the specified balance and actual balance are different}
IF Actbal=BBal THEN
  BEGIN
  Messagedlg('Balance is correct',mtInformation,[mbOK],0);{Doh!}
  Solutions:=1;
  END ELSE
{next we see if clearing all items will cause a balance}
IF (Actbal-Bbal = Expend)THEN
  BEGIN
  IBits.Size:=LIn.Items.Count;
  SIMatch:='';
  FOR j:=0 to Ibits.Size-1 DO
    BEGIN
    IBits[j]:=True;
    Insert('1',SIMatch,length(simatch)+1);
    END;
  Solutions:=1;
  END ELSE
{If there are too many uncleared items then abandon}
{This procedure works out all possible combinations of uncleared items}
{So there are n! possibilities where n is the uncleared count}
IF (LIn.Items.Count)>12 THEN
  BEGIN
  IF accledgerform.reccursor.Checked=False THEN
  Messagedlg('Too many unchecked items to reconcile. Select an item further up the list and check "reconcile to cursor"',mtInformation,[mbOK],0)ELSE
  Messagedlg('Too many unchecked items to reconcile. Try selecting an item further up the list.',mtInformation,[mbOK],0);
  END ELSE
{find all possible solutions}
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
      CSum:=StrToCurr(SItem);
      IF IBits.Size>0 THEN
        BEGIN
        z:=0;
          REPEAT
          IF IBits[z]=True THEN CSum:=(CSum+StrToCurr(LIn.Items[z]));
          z:=z+1;
          UNTIL z=IBits.Size;
        END;
      IF CSum=CDiff THEN
        BEGIN
        Solutions:=Solutions+1;
        SMatching:='';
        SIMatch:='';
        IF IBits.Size>0 THEN
          BEGIN
          z:=0;
            REPEAT
            IF IBits[z]=True THEN Insert('1',SImatch,length(SImatch)+1)
            ELSE Insert('0',SImatch,length(SImatch)+1);
            z:=z+1;
            UNTIL z=IBits.Size;
          END;
        IF solutions=1 THEN sfirstmatch:=simatch;
        END;
      END;
    UNTIL Done=True;
  END;

IF Solutions=0 THEN
  BEGIN
  Listbox1.Items.Add('Can''t reconcile');
  END ELSE
IF Solutions=1 THEN
  BEGIN
  IF Length(SIMatch)>0 THEN
    BEGIN
    Button2.Enabled:=True;
    Listbox1.Items.Add('Unique solution found');
    Listbox1.Items.Add('');
    Listbox1.Items.Add('To reconcile, do the following:');
    Listbox1.Items.Add('');
    z:=1;
    uccount:=0;
      REPEAT
      IF z<=Length(SIMatch)THEN
        BEGIN
        IF SIMatch[z]='1' THEN
          BEGIN
          IF Accdatamoduleform.cdsledger.Locate('Checked',false,[])=True THEN uccount:=1;
            REPEAT
            IF uccount<>z THEN
              BEGIN
                REPEAT
                Accdatamoduleform.cdsledger.next;
                Itemchecked:=(Accdatamoduleform.cdsledgerchecked.value=true);
                UNTIL Itemchecked=False;
              uccount:=uccount+1;
              END;
            UNTIL uccount=z;
          Listbox1.Items.Add('Mark item'+accdatamoduleform.cdsledgerfolio.Value +' as presented');
          Insol.Items.Add(Inttostr(accdatamoduleform.cdsledgeritem.Value));
          END;
        END;
      z:=z+1;
      UNTIL z=length(SIMatch)+1;
    Listbox1.Items.Add('Or click "reconcile" to do it automatically');
    END ELSE
  Listbox1.Items.Add('The balance is correct. No action necessary.');
  END ELSE
IF Solutions>1 THEN
  BEGIN
  Button2.Enabled:=True;
  Listbox1.Items.Add('Multiple solutions found');
  Listbox1.Items.Add('');
  Listbox1.Items.Add('First solution as follows:');
  Listbox1.Items.Add('');
  IF Length(SfirstMatch)>0 THEN
    BEGIN
    z:=1;
    uccount:=0;
      REPEAT
      IF z<=Length(SfirstMatch)THEN
        BEGIN
        IF SFirstmatch[z]='1' THEN
          BEGIN
          IF Accdatamoduleform.cdsledger.Locate('Checked',false,[])=True THEN uccount:=1;
            REPEAT
            IF uccount<>z THEN
              BEGIN
                REPEAT
                Accdatamoduleform.cdsledger.next;
                Itemchecked:=(Accdatamoduleform.cdsledgerchecked.value=true);
                UNTIL Itemchecked=False;
              uccount:=uccount+1;
              END;
            UNTIL uccount=z;
          Listbox1.Items.Add('Mark item'+accdatamoduleform.cdsledgerfolio.Value +' as presented');
          Insol.Items.Add(Inttostr(accdatamoduleform.cdsledgeritem.Value));
          END;
        END;
      z:=z+1;
      UNTIL z=length(SFirstmatch)+1;
    END;
  Listbox1.Items.Add('WARNING! THERE ARE OTHER SOLUTIONS!');
  Listbox1.Items.Add('Click "reconcile" to proceed');
  END; {solutions >1}
accdatamoduleform.dsLedger.Enabled:=true;
IBits.Free;
end;

procedure TReconcileform.BReqChange(Sender: TObject);
type
 TNumbers = set of Char;
var
 Numbers:TNumbers;
 Test:String;
 cursorposition,i,point:integer;
 pointset,deletethis,done,DR,singlechar,autocomplete:Boolean;
 begin
 autocomplete:=false;
 singlechar:=false;
 DR:=False;
 point:=0;
 Numbers := ['1','2','3','4','5','6','7','8','9','0'];
 cursorposition:=BReq.SelStart;
 Test:=BReq.Text;
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
       GPointsetlast:=True;
       END ELSE
     IF Gpointsetlast=True THEN
       BEGIN
       GPointsetlast:=False;
       Delete(test,length(test)-1,2);
       END;
     Button1.Enabled:=True;
     Actbal:=StrToCurr(Test);
     IF DR=true THEN Actbal:=actbal*-1;
     END ELSE
     BEGIN
     Button1.Enabled:=False;
     Actbal:=0;
     END;
   IF (singlechar=false)OR(autocomplete=true) THEN
     BEGIN
     IF DR=true THEN Insert('DR',test,1)ELSE Insert('CR',test,1);
     END ELSE
     BEGIN
     IF DR=true THEN Insert('D',test,1)ELSE Insert('C',test,1);
     END;
   Cursorposition:=cursorposition+2;
   BReq.Text:=Test;
   BReq.SelStart:=cursorposition;
   END;
 end;

procedure TReconcileform.Button2Click(Sender: TObject);
Var
i,chitem:integer;
begin
accledgerform.DBGrid1.Datasource:=nil;
IF Insol.Items.count>0 THEN
  BEGIN
  i:=0;
  firstchanged:=strtoint(insol.items[0]);
    REPEAT
    IF i<insol.Items.count THEN
      BEGIN
      {IF (firstchanged=0)OR(strtoint(insol.items[i])<firstchanged)
      THEN Firstchanged:=strtoint(insol.items[i]);}
      chitem:=changedlist.IndexOf(insol.items[i]);
      IF chitem=-1THEN
        BEGIN
        changedlist.Add(insol.Items[i]);
        END ELSE
        BEGIN
        changedlist.Delete(chitem);
        IF strtoint(insol.items[i])=firstchanged THEN
          BEGIN
          IF changedlist.Count>0 THEN firstchanged:=strtoint(changedlist[0]) ELSE
            BEGIN
            Firstchanged:=0;
            END;
          END;
        END;
      END;
    i:=i+1;
    UNTIL i=Insol.items.count;

  {now recalculate items from the first one}
  lockedby:=accdatamoduleform.getsysteminfo('system','settings','transferlock','');
  IF (lockedby=stationname)OR(lockedby='none') THEN
    BEGIN
    lockfree:=true;
    accdatamoduleform.Processchecked;
    END ELSE
  IF lockedby<>'none'THEN
    BEGIN
    lockfree:=false;
    accledgerform.Timer1.Enabled:=true;
    END;
  accledgerform.Fetchdata;
  END;
accledgerform.DBGrid1.Datasource:=accdatamoduleform.dsledger;
reconcileform.ModalResult:=mrOK;
end;

procedure TReconcileform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{if the reconcileform closes for whatever reason, we want to restore the}
{user sql and filters}
accdatamoduleform.cdsLedger.active:=false;
accdatamoduleform.sqlLedger.Active:=false;
{this should find the first item where the cleared balance is different from the actual i.e. the first uncleared}
accdatamoduleform.sqlLedger.CommandText:=usersql;
accdatamoduleform.cdsLedger.active:=true;
IF accdatamoduleform.cdsledger.ChangeCount=0 THEN accdatamoduleform.cdsledger.Refresh;
accdatamoduleform.cdsledger.filter:=userfilter;
accdatamoduleform.cdsledger.Filtered:=true;
accdatamoduleform.cdsledger.Locate('item',userselected,[]);
accledgerform.reccursor.checked:=false;
accdatamoduleform.cdsledger.RecNo:=currentitem;
IF autorecform.Visible=true THEN autorecform.Close;
end;

procedure TReconcileform.ediffChange(Sender: TObject);
type
 TNumbers = set of Char;
var
 Numbers:TNumbers;
 Test:String;
 actdiff:Currency;
 cursorposition,i,point:integer;
 pointset,deletethis,done,DR,singlechar,autocomplete:Boolean;
 begin
 autocomplete:=false;
 singlechar:=false;
 DR:=False;
 point:=0;
 Numbers := ['1','2','3','4','5','6','7','8','9','0'];
 cursorposition:=Ediff.SelStart;
 Test:=ediff.Text;
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
       GPointsetlast:=True;
       END ELSE
     IF Gpointsetlast=True THEN
       BEGIN
       GPointsetlast:=False;
       Delete(test,length(test)-1,2);
       END;
     Button1.Enabled:=True;
     Actdiff:=StrToCurr(Test);
     IF DR=true THEN Actdiff:=actdiff*-1;
     END ELSE
     BEGIN
     Button1.Enabled:=False;
     Actdiff:=0;
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
end;

procedure TReconcileform.BReqExit(Sender: TObject);
Var
sReqbal,sreqdiff:string;
Reqbal,reqdiff:double;
isnegative:Boolean;
begin
{when we leave this box, it works out the difference between the actual cleared balance }
{and the required cleared balance}
Sreqbal:=BReq.Text;
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
  reqdiff:=reqbal-bbal;
  IF reqdiff<0 THEN sreqdiff:='DR'+formatfloat('0.00',reqdiff*-1) ELSE
  sreqdiff:='CR'+formatfloat('0.00',reqdiff);
  ediff.Text:=sreqdiff;
  END;
end;


procedure TReconcileform.ediffExit(Sender: TObject);
Var
sReqbal,sreqdiff:string;
Reqbal,reqdiff:double;
isnegative:Boolean;
begin
{when we leave this box, it works out the difference between the actual cleared balance }
{and the required cleared balance}
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
  reqbal:=bbal+reqdiff;
  IF reqbal<0 THEN sreqbal:='DR'+formatfloat('0.00',reqbal*-1) ELSE
  sreqbal:='CR'+formatfloat('0.00',reqbal);
  breq.Text:=sreqbal;
  END;
end;

procedure TReconcileform.btnrecfileClick(Sender: TObject);
var
inputfile:textfile;
lineoftext:string;
done:boolean;
linenumber:integer;
matchrec,bankrec:integer;
i,j:Integer;
Reportstring:String;
begin
linenumber:=0;
IF opendialog1.Execute=true THEN
  BEGIN
  done:=false;
  Assignfile(inputfile,opendialog1.FileName);
  Reset(inputfile);
      REPEAT
      readln(inputfile,lineoftext);
      lineoftext:=blankline(lineoftext);
      IF lineoftext<>'' THEN
        BEGIN
      	loadheadings(lineoftext,',','"',linenumber);
      	linenumber:=linenumber+1;
        END;
      IF eof(inputfile)=true THEN done:=true;
      UNTIL  done;
{then load the rest of the data}
  closefile(inputfile);
  {now add an extra column for the match and keep a note of it}
  bankmatchcol:=reconcileform.bankgrid.ColCount;
  bankgrid.ColCount:=bankgrid.ColCount+1;
  Listbox1.Items.Add('Attempting text file import');
  IF checkfiledata =true THEN
    BEGIN
    Listbox1.Items.Add('file data OK');
    banklist:=TStringlist.Create;
    banklist.Clear;
    {we'll start with a direct match between bank entries and ledger entries}
    bankrec:=1;
      REPEAT
      matchrec:=Matchrecords(bankrec);
      IF matchrec=-1 THEN banklist.Add(inttostr(bankrec));
      bankrec:=bankrec+1;
      UNTIL bankrec=reconcileform.bankgrid.RowCount;
    {now we need to see if there are any ledger entries that couldn't be matched}
    Listbox1.Items.Add('direct match OK');
    IF banklist.count>0 THEN
      BEGIN
      {now we try to match the entries in banklist to multiple ledger entries}
      i:=0;
    	REPEAT
      	IF i<banklist.count THEN
      	  BEGIN
          IF matchbanktomulti(strtoint(banklist[i]))=true THEN
            BEGIN
            Reportstring:='File entry '+banklist[i]+' matches ledger folios ';
            {mark the ledger entries}
            j:=1;
              REPEAT
              IF reconcileform.ledgergrid.cells[6,j]='M' THEN
                BEGIN
              	insert(reconcileform.ledgergrid.Cells[2,j],reportstring,length(reportstring)+1);
            	reconcileform.ledgergrid.cells[6,j]:=banklist[i];
            	Insert(' ',reportstring,length(reportstring)+1);
            	END;
              IF j<reconcileform.ledgergrid.rowcount THEN j:=j+1;
              UNTIL j=reconcileform.ledgergrid.RowCount;
            {we also want to delete banklist[i]}
            Banklist.Delete(i);
            END ELSE i:=i+1;
          END;
    	UNTIL i=banklist.count;
      IF banklist.count>0 THEN reconcileform.ListBox1.Items.Add(Inttostr(banklist.count)+' items could not be matched ');
      END;
    IF banklist.count=0 THEN
      BEGIN
      j:=1;
        REPEAT
    	IF reconcileform.ledgergrid.Cells[6,j]<>'' THEN
      	  BEGIN
          Listbox1.Items.Add('Mark item'+reconcileform.ledgergrid.cells[0,j] +' as presented');
          Insol.Items.Add(reconcileform.ledgergrid.cells[0,j]);
          END;
        IF j<reconcileform.ledgergrid.RowCount THEN j:=j+1;
    	UNTIL j=reconcileform.ledgergrid.RowCount;
      Button2.Enabled:=true;
      END ELSE
      BEGIN
      {Version 1 does not allow reconciliation unless all items are matched}
      {as an interim step I will list all non matching items here}
      Listbox1.Items.Add('This version cannot reconcile unless all items match');
      Listbox1.Items.Add('The following items couldn''t be matched');
      i:=0;
        REPEAT
        IF i<banklist.count THEN
          BEGIN
          Listbox1.Items.Add('Item '+banklist[i]+' '+bankgrid.Cells[narcol,strtoint(banklist[i])]+' '+bankgrid.Cells[amtcol,strtoint(banklist[i])]+' couldn''t be matched');
          END;
        i:=i+1;
        UNTIL  i=banklist.count;
      END;
    banklist.Free;
    END ELSE   Listbox1.Items.Add('File integrity failed (checkfiledata=false)');
  END;
end;


procedure TReconcileform.Button3Click(Sender: TObject);
begin
reconcileform.Close;
end;

procedure TReconcileform.ListBox1DblClick(Sender: TObject);
begin
Listbox1.Visible:=false;
Ledgergrid.Visible:=true;
end;

procedure TReconcileform.ledgergridDblClick(Sender: TObject);
begin
Ledgergrid.visible:=false;
Listbox1.Visible:=true;
end;

end.
