unit accsales;

interface

uses
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms,
  QExtCtrls, QDialogs, QGrids, QDBGrids, QStdCtrls, QComCtrls,QPrinters,
  Qt,DB, Math,SqlTimSt,DBXpress,HelpIntfs;

type
  Taccsalesform = class(TForm)
    StatusBar2: TStatusBar;
    ColorDialog1: TColorDialog;
    cashdrawertimer: TTimer;
    datapanel: TPanel;
    fkeypanel: TPanel;
    btnF2: TButton;
    btnF3: TButton;
    btnF4: TButton;
    btnF5: TButton;
    btnF6: TButton;
    btnF7: TButton;
    infopanel: TPanel;   
    Btn9: TButton;
    Btn8: TButton;
    Btn7: TButton;
    Btn6: TButton;
    Btn5: TButton;
    Btn4: TButton;
    Btn3: TButton;
    Btn2: TButton;
    Btn1: TButton;
    Btn0: TButton;
    btnPoint: TButton;
    btnAsterisk: TButton;
    Panel1: TPanel;
    keypanel: TPanel;
    keyboardpanel: TPanel;
    btnA: TButton;
    btnB: TButton;
    btnC: TButton;
    btnD: TButton;
    btnE: TButton;
    btnF: TButton;
    btnG: TButton;
    btnH: TButton;
    btnI: TButton;
    btnJ: TButton;
    btnK: TButton;
    btnL: TButton;
    btnM: TButton;
    btnN: TButton;
    btnO: TButton;
    btnP: TButton;
    btnQ: TButton;
    btnR: TButton;
    btnS: TButton;
    btnT: TButton;
    btnU: TButton;
    btnV: TButton;
    btnW: TButton;
    btnY: TButton;
    btnX: TButton;
    btnZ: TButton;
    btnSpace: TButton;
    btnpick: TButton;
    quickkeypanel: TPanel;
    btnkeys: TButton;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    btnBack: TButton;
    BtnHome: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button46: TButton;
    Button47: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    Button51: TButton;
    Button52: TButton;
    Button53: TButton;
    Button54: TButton;
    Button55: TButton;
    Button56: TButton;
    Button57: TButton;
    Button58: TButton;
    Button59: TButton;
    Button60: TButton;
    windowpanel: TPanel;
    picklistpanel: TPanel;
    lbpicklist: TListBox;
    eselection: TEdit;
    salelistpanel: TPanel;
    DBGrid1: TDBGrid;
    esaledescr: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnF2Click(Sender: TObject);
    procedure btnAClick(Sender: TObject);
    procedure btnF7Click(Sender: TObject);
    procedure btnF3Click(Sender: TObject);
    procedure btnBClick(Sender: TObject);
    procedure btnCClick(Sender: TObject);
    procedure btnDClick(Sender: TObject);
    procedure btnEClick(Sender: TObject);
    procedure btnFClick(Sender: TObject);
    procedure btnGClick(Sender: TObject);
    procedure btnHClick(Sender: TObject);
    procedure btnIClick(Sender: TObject);
    procedure btnJClick(Sender: TObject);
    procedure btnSClick(Sender: TObject);
    procedure btnKClick(Sender: TObject);
    procedure btnLClick(Sender: TObject);
    procedure btnMClick(Sender: TObject);
    procedure btnNClick(Sender: TObject);
    procedure btnOClick(Sender: TObject);
    procedure btnPClick(Sender: TObject);
    procedure btnQClick(Sender: TObject);
    procedure btnRClick(Sender: TObject);
    procedure btnSpaceClick(Sender: TObject);
    procedure btnTClick(Sender: TObject);
    procedure btnUClick(Sender: TObject);
    procedure btnVClick(Sender: TObject);
    procedure btnWClick(Sender: TObject);
    procedure btnXClick(Sender: TObject);
    procedure btnYClick(Sender: TObject);
    procedure btnZClick(Sender: TObject);
    procedure lbpicklistClick(Sender: TObject);
    procedure eselectionChange(Sender: TObject);
    procedure Btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure btnF4Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Btn3Click(Sender: TObject);
    procedure Btn4Click(Sender: TObject);
    procedure Btn5Click(Sender: TObject);
    procedure Btn6Click(Sender: TObject);
    procedure Btn7Click(Sender: TObject);
    procedure Btn8Click(Sender: TObject);
    procedure Btn9Click(Sender: TObject);
    procedure Btn0Click(Sender: TObject);
    procedure btnF5Click(Sender: TObject);
    procedure btnPointClick(Sender: TObject);
    procedure btnF6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnpickClick(Sender: TObject);
    procedure btnkeysClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtnHomeClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure salelistpanelResize(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure quickkeypanelResize(Sender: TObject);
    procedure infopanelResize(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure Button36Click(Sender: TObject);
    procedure Button37Click(Sender: TObject);
    procedure Button38Click(Sender: TObject);
    procedure Button39Click(Sender: TObject);
    procedure Button40Click(Sender: TObject);
    procedure Button41Click(Sender: TObject);
    procedure Button42Click(Sender: TObject);
    procedure Button43Click(Sender: TObject);
    procedure Button44Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button48Click(Sender: TObject);
    procedure Button49Click(Sender: TObject);
    procedure Button50Click(Sender: TObject);
    procedure Button51Click(Sender: TObject);
    procedure Button52Click(Sender: TObject);
    procedure Button53Click(Sender: TObject);
    procedure Button54Click(Sender: TObject);
    procedure Button55Click(Sender: TObject);
    procedure Button56Click(Sender: TObject);
    procedure Button57Click(Sender: TObject);
    procedure Button58Click(Sender: TObject);
    procedure Button59Click(Sender: TObject);
    procedure Button60Click(Sender: TObject);
    procedure fkeypanelResize(Sender: TObject);
  private
  Procedure setF2(name:String;active:Boolean);
  Procedure setF3(name:String;active:Boolean);
  Procedure setF4(name:String;active:Boolean);
  Procedure setF5(name:String;active:Boolean);
  Procedure setF6(name:String;active:Boolean);
  Procedure setF7(name:String;active:Boolean);
  Procedure Getlocalinfo;
  Function Setlocalinfo:Boolean;
  Procedure loadstationsettings(stationname:string);
  Function loaddatabasesettings(databasename:string):Boolean;
  Function checkstationname(stationname:string):boolean;
  Procedure Additem(invitem,saleitem:integer;amount:double);
  Procedure Loadbuttons(level:Integer);
  Procedure Deletebutton(buttonno,levelno:integer);
  Procedure QKclicked(buttonno:integer);
  Procedure MakeLetters(Colour:TColor);
  Procedure Makenumbers(Colour:TColor);
  Procedure Calculatesum(addtax:Boolean);
  Procedure Setstate(state:String);
  Procedure Savebutton;
  Function Loadsale(saleid:string):Boolean;
  Procedure Opencashdrawer;
  Procedure Cashdraweralarm;
  Procedure Numberkey(knumber:string);
  Procedure reading(rtype:char);
  Function  Checksale(Saleno:string):String;
  Procedure Addtopend(narrative,folio:string;pendingac:integer;cr,dr:currency;method:string;cheque:string;accurrency,jname:string;invitem:integer;quantity:double;xorder:string;shift:integer;hold:boolean);
  Procedure Printout(draweronly:Boolean);
  Procedure Printcheck;
  Procedure Printreading(rtype:String);
  Function Processshift(shiftnumber:Integer):Boolean;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Transdesc :TTransactiondesc; {Describes the transaction}
  accsalesform: Taccsalesform;
  XState:String; {describes the state of the terminal}
  Theselection,amtstring:String;
  Selectedinv,Selectedsale:integer;
  selectedamt:Single;
  firstentry,stotalled:boolean;
  Totalexists,Spointsetlast:boolean;
  Sumnet,sumtax,sumgross,balance:Currency;
  cursorposition,xaccountno:integer;
  pMethod,pCheque,xaccountname:String;
  Nonbaseaccounts:integer;
  Generalcogs,Generalsales,Generalinv,Bankaccount,taxaccount:Integer;
  Cashpay:Currency;
  SChequeno,SCustomer:String[20];
  Cashsale:Boolean;
  noninvnet,noninvtax,noninvgross:Currency;
  noninvitemname:string;
  selectedtax,itemtaxname:String;
  UTaxstring:String;
  cashonly:Boolean;
  Localpendfile:string;
  currentsale:String;
  transname:string; {the name of the transaction}
  printername:String;
  dontprint:Boolean;
  transref:string; {a reference number - will be automatically generated}
  transstatus:string; {this is either the name of the station using the}
  {transaction, or it is saved or completed}

  LogfileOK,Logging:Boolean;
  sServername,sDatabase,sUsername,sPassword:String;
  oldServername,oldDatabase,oldUsername,oldPassword:String;
  Loglevel:integer;
  Logfile:Textfile;
  Homedir:string;
  Logdir:String;
  Backupdir:String;
  Stationname:string;
  stationnumber:Integer;
  Committime,shifttime:TSqltimestamp;
  Commitdate:TDatetime;
  {currency related items}
  Basecurrency:String[20];
  basecurrencystring:String[20];
  Currencychoice:String[20]; {what the user has picked}
  transcurrency:String[20]; {The currency the transaction is in}
  transcurrencystring:string[20];
  transdate:TDatetime;
  transtime:TSQLtimestamp;
  conversionrate:double;

  Cashbacklimit:Currency;
  CJcounter,JCounter:Integer;
  SJCounter,SRJCounter,Shiftcounter,salecounter:Integer;
  connectrequest,successful:Boolean;
  Currentshift:Integer;
  Inshift:Boolean;
  Defaultsalestax,Defaultpurchasetax,sdatestyle:String;
  Defaultbank,Defaultcash:Integer;
  shownet:Boolean;
  Backupfile:string;
  Localfile:Boolean;
  Adminpass:String;
  Booksclosed,Booksclosing:Boolean;
  Bookscloseddate,Booksclosingdate:TDatetime;
  Olddate:TDatetime; {used to swap log file at day change}
  Mintimebetweenshifts:Integer;
  sHelpfile:string; {at this stage we'll use homedir + /help}
  Showbalances,needpassword,onlyadmin:Boolean;
  Cashbackstring,switchstring,chequestring,discountstring:string;
  Selbutton:integer; {the current button}
  prevbutton:integer; {the button clicked to get to this level}
  prevlevel:integer;
  currlevel:integer;
  nextlevel:integer; {the next level (-1 if it's a product)}
  invitem:integer; {selected inv item (-1 if next level)}
  saleitem:integer; {selected sale item (-1 if next level)}
  buttoncap:string; {the caption of this button (and name of next level)}
  selcolour,buttoncolour,textcolour:Tcolor;
  levelname,nlevelname:string;
  salecheckerrors:integer;
  holdsales,isadmin:Boolean;
  buttonhspace,buttonvspace:Integer;
  newuser:String;
  newuserfull:string;
  newuserpass:string;
  newuseradmin,newuserpassreq:Boolean;
implementation

uses Accdatamodule, pgeLicense, LibcExec, measure;

{$R *.xfm}


Function Taccsalesform.Checksale(saleno:string):String;
Var
transtot:double;
invitem,saleitem:integer;
invac,cogsac,saleac,sysac:integer;
errors:boolean;
BEGIN
{do this with filters}
With accdatamoduleform do
  BEGIN
  cdssaletot.filter:='saleno = '''+saleno+'''';
  cdssaletot.filtered:=true;
  IF cdssaletot.IsEmpty=false THEN
    BEGIN
    cdssaletot.First;
    transtot:=0;
    errors:=false;
      REPEAT
      invitem:=cdssaletotinvitem.Value;
      saleitem:=cdssaletotsaleitem.Value;
      IF invitem>0 THEN
        BEGIN
        sqlinventory.Close;
        sqlinventory.CommandText:='SELECT * FROM inventory where item = '''+inttostr(invitem)+'''';
        sqlinventory.Active:=true;
        sqlsales.Close;
        sqlsales.CommandText:='SELECT * FROM sales where invitem = '''+inttostr(invitem)+''' and sitem = '''+inttostr(saleitem)+'''';
        sqlsales.Active:=true;
        IF sqlinventory.IsEmpty=false THEN
          BEGIN
          sqlinventory.First;
          invac:=sqlinventoryinventoryac.Value;
          saleac:=sqlinventorysalesac.Value;
          cogsac:=sqlinventorycostac.value;
          accdatamoduleform.sqlaccount.Close;
          accdatamoduleform.cdsaccount.Close;
          accdatamoduleform.sqlaccount.CommandText:='SELECT * FROM account where (item = '+inttostr(invac)+') or (item = '+inttostr(saleac)+') or (item = '+inttostr(cogsac)+')';
          accdatamoduleform.cdsaccount.open;

          IF (invac>0)AND(cdsaccount.Locate('item',invac,[])=false) THEN
            BEGIN
            cdssaletot.Last;
            conn.ExecuteDirect('UPDATE salelist set status = ''-7'' WHERE saleno = '''+saleno+'''');
            errors:=true;
            Result:='INVENTORY ACCOUNT INVALID';
            END;
          IF (saleac>0)AND(cdsaccount.Locate('item',saleac,[])=false) THEN
            BEGIN
            cdssaletot.Last;
            conn.ExecuteDirect('UPDATE salelist set status = ''-7'' WHERE saleno = '''+saleno+'''');
            IF errors=false THEN Result:='SALE ACCOUNT INVALID' ELSE result:='MULTIPLE ERRORS - INVALID ACCOUNTS';
            errors:=true;
            END;
          IF (cogsac>0)AND(cdsaccount.Locate('item',cogsac,[])=false) THEN
            BEGIN
            cdssaletot.Last;
            conn.ExecuteDirect('UPDATE salelist set status = ''-7'' WHERE saleno = '''+saleno+'''');
            IF errors=false THEN Result:='COGS ACCOUNT INVALID' ELSE result:='MULTIPLE ERRORS - INVALID ACCOUNTS';
            errors:=true;
            END;
          IF errors=false THEN transtot:=transtot+roundto(cdssaletottotalnetprice.AsFloat,-2);
          END;
        END ELSE
      IF (invitem = 0)AND(saleitem=0) THEN
        BEGIN
        {non inventoried}
        {we may check for the default sales account here}
        IF errors=false THEN transtot:=transtot+roundto(cdssaletottotalnetprice.AsFloat,-2);
        END ELSE
      IF (invitem = -2) AND (saleitem >0) THEN
        BEGIN
        {tax or payment}
        sysac:=saleitem;
        accdatamoduleform.sqlaccount.Close;
        accdatamoduleform.cdsaccount.Close;
        accdatamoduleform.sqlaccount.CommandText:='SELECT * FROM account where item = '+inttostr(sysac);
        accdatamoduleform.cdsaccount.open;
        IF cdsaccount.isempty=false THEN
          BEGIN
          getsysteminfo(sdatabase,'sales','dest','');
          IF sqlsysdata.Locate('value',inttostr(saleitem),[])=true THEN
            BEGIN
            {it's a payment}
            IF cdssaletotitemname.value='Change' THEN
            transtot:=transtot+roundto(cdssaletottotalgrossprice.AsFloat,-2) ELSE
            transtot:=transtot-roundto(cdssaletottotalgrossprice.AsFloat,-2);
            END ELSE
            BEGIN
            getsysteminfo(sdatabase,'sales','tax','');
            IF sqlsysdata.Locate('value',inttostr(saleitem),[])=true THEN
              BEGIN
              transtot:=transtot+roundto(cdssaletottotalgrossprice.AsFloat,-2);
              END ELSE
              BEGIN
              cdssaletot.Last;
              conn.ExecuteDirect('UPDATE salelist set status = ''-7'' WHERE saleno = '''+saleno+'''');
              IF errors=false THEN Result:='PAYMENT OR TAX ACCOUNT TYPE INVALID' ELSE result:='MULTIPLE ERRORS - INVALID ACCOUNTS';
              errors:=true;
              END;
            END;
          END ELSE
          BEGIN
          cdssaletot.Last;
          conn.ExecuteDirect('UPDATE salelist set status = ''-7'' WHERE saleno = '''+saleno+'''');
          IF errors=false THEN Result:='PAYMENT OR TAX ACCOUNT INVALID' ELSE result:='MULTIPLE ERRORS - INVALID ACCOUNTS';
          errors:=true;
          END;
        END;
      IF cdssaletot.eof=false THEN cdssaletot.Next;
      UNTIL cdssaletot.eof;
    transtot:=roundto(transtot,-5);
    IF transtot=0 THEN result:='PASS' ELSE
      BEGIN
      cdssaletot.Last;
      conn.ExecuteDirect('UPDATE salelist set status = ''-7'' WHERE saleno = '''+saleno+'''');
      IF errors=false THEN Result:='TRANSACTION TOTAL NOT ZERO' ELSE result:='MULTIPLE ERRORS - TRANSACTION NOT ZERO';
      END;
    END;
  END;
END;




Procedure TAccsalesform.Printout(draweronly:Boolean);
Var
xpos,ypos:integer;
Titlestring:string;
subtitlestring:string;
vatref:string;
font1,font2:Integer;
pages,partpages:word;
page,line:Integer;
pagefinished,docfinished:Boolean;
begin
IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  BEGIN
  pagefinished:=false;
  docfinished:=false;
  vatref:=accdatamoduleform.Getsysteminfo(sdatabase,'receipt','vatref','847 4646 89');
  Printer.Orientation:=poPortrait;
  Printer.Title:='Receipt print';
  Titlestring:='THE SPREAD EAGLE HOTEL';
  subtitlestring:='20 High St, Jedburgh, TD8 6AG';
  font1:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'receipt','font1','16'));
  font2:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'receipt','font2','12'));
  divmod(accdatamoduleform.cdssalelist.RecordCount,16,pages,partpages);
  IF partpages>0 THEN pages:=pages+1;
  Page:=1;
  accdatamoduleform.cdssalelist.first;
  REPEAT
  IF page<pages+1 THEN
    BEGIN
    Printer.BeginDoc;
    With Printer.Canvas do
      BEGIN
      xpos:=0;
      ypos:=25;
      Font.Size:=font1;
      Font.Style:=[fsBold];
      IF page=1 THEN
        BEGIN
        textout(xpos,ypos,titlestring);
        ypos:=ypos+textheight('Blah');
        Font.Size:=font2;
        textout(xpos,ypos,subtitlestring);
        ypos:=ypos+textheight('Blah');
        subtitlestring:='01835 862 870';
        textout(xpos,ypos,subtitlestring);
        ypos:=ypos+textheight('Blah');
        moveto(0,ypos);
        lineto(printer.PageWidth,ypos);
        END;
      line:=1;
      Font.Size:=font1;
        REPEAT
        textout(0,ypos,Formatfloat('0.##',accdatamoduleform.cdssalelistsalecount.asfloat)+' '+accdatamoduleform.cdssalelistitemname.Value);
        xpos:=printer.PageWidth-(printer.Margins.cx+textwidth(formatcurr(basecurrencystring+'0.00',accdatamoduleform.cdssalelisttotalgrossprice.AsFloat)));
        textout(xpos,ypos,formatcurr(basecurrencystring+'0.00',accdatamoduleform.cdssalelisttotalgrossprice.AsFloat));
        ypos:=ypos+textheight('Blah');
        IF accdatamoduleform.cdssalelist.eof=false THEN accdatamoduleform.cdssalelist.next;
        line:=line+1;
        pagefinished:=(line=17)OR(accdatamoduleform.cdssalelist.eof=true);
        UNTIL pagefinished;
      page:=page+1;
      IF page=pages+1 THEN
        BEGIN
        xpos:=0;
        font.Size:=font2;
        textout(xpos,ypos,'Sale number '+accdatamoduleform.cdssalelistsaleno.Value);
        ypos:=ypos+textheight('Blah');
        textout(xpos,ypos,'Printed '+accdatamoduleform.cdssalelistdate.AsString+' at '+accdatamoduleform.cdssalelisttime.AsString);
        ypos:=ypos+textheight('Blah');
        textout(xpos,ypos,'VAT Registration Number '+vatref);
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        textout(xpos,ypos,' - ');
        END;
      END;
    Printer.EndDoc;
    docfinished:=accdatamoduleform.cdssalelist.eof=true;
    END;
  UNTIL docfinished;
  END;
end;

Procedure TAccsalesform.Printcheck;
Var
xpos,ypos:integer;
Titlestring:string;
subtitlestring:string;
vatref:string;
font1,font2:Integer;
begin
IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  BEGIN
  vatref:=accdatamoduleform.Getsysteminfo(sdatabase,'receipt','vatref','847 4646 89');
  Printer.Orientation:=poPortrait;
  Printer.Title:='Receipt print';
  Titlestring:=accdatamoduleform.cdssalelistsalename.Value;
  subtitlestring:=formatdatetime('hh:mm:ss',now);
  font1:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'receipt','font1','16'));
  font2:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'receipt','font2','12'));
  Printer.BeginDoc;
  With Printer.Canvas do
    BEGIN
    Font.Size:=font1;
    Font.Style:=[fsBold];
    xpos:=0;
    ypos:=0;
    textout(xpos,ypos,titlestring);
    ypos:=ypos+textheight('Blah');

    Font.Size:=font2;
    textout(xpos,ypos,subtitlestring);
    ypos:=ypos+textheight('Blah');
    subtitlestring:='01835 862 870';
    textout(xpos,ypos,subtitlestring);
    ypos:=ypos+textheight('Blah');
    moveto(0,ypos);
    lineto(printer.PageWidth,ypos);

    Font.Size:=font1;
    ypos:=ypos+textheight('Blah');
    {only want food items}
    accdatamoduleform.cdssalelist.first;
      REPEAT
      textout(0,ypos,accdatamoduleform.cdssalelistitemname.Value);
      xpos:=printer.PageWidth-(printer.Margins.cx+textwidth(formatfloat('0.##',accdatamoduleform.cdssalelistsalecount.asfloat)));
      textout(xpos,ypos,formatfloat('0.##',accdatamoduleform.cdssalelistsalecount.asfloat));
      ypos:=ypos+textheight('Blah');
      IF accdatamoduleform.cdssalelist.eof=false THEN accdatamoduleform.cdssalelist.next;
      UNTIL accdatamoduleform.cdssalelist.eof=true;
    xpos:=0;
    font.Size:=font2;
    textout(xpos,ypos,'Sale number '+accdatamoduleform.cdssalelistsaleno.Value);
    END;
  Printer.EndDoc;
  END;
end;


Procedure TAccsalesform.Printreading(Rtype:String);
Var
i,xpos,ypos:integer;
Titlestring:string;
font1,font2:Integer;
begin
IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  BEGIN
  Printer.Orientation:=poPortrait;
  Printer.Title:='Report print';
  Titlestring:=Rtype+' report';
  font1:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'receipt','font1','16'));
  font2:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'receipt','font2','12'));
  Printer.BeginDoc;
  With Printer.Canvas do
    BEGIN
    Font.Size:=font1;
    Font.Style:=[fsBold];
    xpos:=0;
    ypos:=25;
    textout(xpos,ypos,titlestring);
    ypos:=ypos+textheight('Blah');
    Font.Size:=font2;
    ypos:=ypos+textheight('Blah');
    moveto(0,ypos);
    lineto(printer.PageWidth,ypos);

    Font.Size:=font1;
    ypos:=ypos+textheight('Blah');
    IF lbpicklist.Items.count>0 THEN
      BEGIN
      i:=0;
        REPEAT
        textout(0,ypos,lbpicklist.Items[i]);
        ypos:=ypos+textheight('Blah');
        IF i<lbpicklist.Items.count THEN i:=i+1;
        UNTIL i=lbpicklist.Items.count;
      END;
    END;
  Printer.EndDoc;
  END;
END;

Procedure Taccsalesform.Addtopend(narrative,folio:string;pendingac:integer;cr,dr:currency;method:string;cheque:string;accurrency,jname:string;invitem:integer;quantity:double;xorder:string;shift:integer;hold:boolean);
Var
localdr,Localcr:currency;
Localquantity:double;
newrecord:Boolean;
BEGIN
dr:=roundto(dr,-2);
cr:=roundto(cr,-2);
newrecord:=false;
accdatamoduleform.cdspending.Filter:='account = '''+inttostr(pendingac)+''' and invitem = '''+inttostr(invitem)+'''';
accdatamoduleform.cdspending.Filtered:=true;
IF accdatamoduleform.cdspending.IsEmpty=true THEN
  BEGIN
  newrecord:=true;
  accdatamoduleform.cdspending.filtered:=false;
  END;
IF newrecord=false THEN
  BEGIN
  IF accdatamoduleform.cdspending.locate('account',pendingac,[])=true THEN
    BEGIN
    Accdatamoduleform.Writelog('','','Updating existing localpending item with account '+inttostr(pendingac)+' cr '+formatcurr('0.00',cr)+' dr '+formatcurr('0.00',dr));
    localdr:=accdatamoduleform.cdspendingdr.AsCurrency;
    localcr:=accdatamoduleform.cdspendingcr.AsCurrency;
    localquantity:=accdatamoduleform.cdspendingquantity.AsFloat;
    localcr:=localcr+cr;
    localdr:=localdr+dr;
    localquantity:=localquantity+quantity;
    IF localcr=localdr THEN
      BEGIN
      localcr:=0;
      localdr:=0;
      END ELSE
    IF localcr>localdr THEN
      BEGIN
      localcr:=localcr-localdr;
      localdr:=0;
      END ELSE
    IF localcr<localdr THEN
      BEGIN
      localdr:=localdr-localcr;
      localcr:=0;
      END;
    accdatamoduleform.cdspending.Edit;
    accdatamoduleform.cdspendingnarrative.Value:=narrative;
    accdatamoduleform.cdspendingdr.AsCurrency:=localdr;
    accdatamoduleform.cdspendingcr.AsCurrency:=localcr;
    accdatamoduleform.cdspendingquantity.AsFloat:=localquantity;
    accdatamoduleform.cdspending.Post;
    END ELSE
    BEGIN
    Accdatamoduleform.Writelog('','','Localpending account '+inttostr(pendingac)+' not found - stop');
    Messagedlg('','internal error - local account not found - STOP',mterror,[mbOK],0);
    Exit;
    END;
  END ELSE
  BEGIN
  Accdatamoduleform.Writelog('','','Adding new localpending item with account '+inttostr(pendingac)+' cr '+formatcurr('0.00',cr)+' dr '+formatcurr('0.00',dr)+' narrative '+narrative+' method '+method+' cheque '+cheque);
  accdatamoduleform.cdspending.Append;
  accdatamoduleform.cdspendingfolio.Value:=Folio;
  accdatamoduleform.cdspendingdate.Value:=transdate;
  accdatamoduleform.cdspendingtime.Value:=transtime;
  accdatamoduleform.cdspendingnarrative.Value:=narrative;
  IF (dr<0)AND(cr=0)THEN
    BEGIN
    accdatamoduleform.cdspendingdr.AsCurrency:=0;
    accdatamoduleform.cdspendingcr.AsCurrency:=(-1*dr);
    END ELSE
  IF (cr<0)AND(dr=0)THEN
    BEGIN
    accdatamoduleform.cdspendingdr.AsCurrency:=(-1*cr);
    accdatamoduleform.cdspendingcr.AsCurrency:=0;
    END ELSE
    BEGIN
    accdatamoduleform.cdspendingdr.AsCurrency:=dr;
    accdatamoduleform.cdspendingcr.AsCurrency:=cr;
    END;
  accdatamoduleform.cdspendingaccount.Value:=pendingac;
  accdatamoduleform.cdspendingoperator.Value:=susername;
  accdatamoduleform.cdspendingjname.Value:=jname;
  accdatamoduleform.cdspendingcurrency.Value:=accurrency;
  accdatamoduleform.cdspendingrate.asfloat:=1;
  accdatamoduleform.cdspendingmethod.Value:=uppercase(method);
  accdatamoduleform.cdspendingstation.Value:=stationname;
  accdatamoduleform.cdspendingcheque.Value:=cheque;
  accdatamoduleform.cdspendingshift.Value:=currentshift;
  accdatamoduleform.cdspendinginvitem.Value:=invitem;
  accdatamoduleform.cdspendingquantity.AsFloat:=quantity;
  accdatamoduleform.cdspendingxorder.Value:=xorder;
  accdatamoduleform.cdspendinghold.Value:=hold;
  accdatamoduleform.cdspending.Post;
  END;
accdatamoduleform.cdspending.filtered:=false;
END;

Function Taccsalesform.Processshift(shiftnumber:Integer):Boolean;
Var
itemnet,thisnet,totalnet:Double;
thistax,totaltax:Double;
thispay,totalpay:Double;
cjfolio,jfolio:String;
transtime:TSqltimestamp;
transdate:TDatetime;
salesac:Integer;
BEGIN
{we have a list of items in salelist}
{for each item there may be an inventory entry in which case we can find the taxes associated with the item}
{we also know the total paid}
totaltax:=0;
totalpay:=0;
transtime:=datetimetosqltimestamp(now);
transdate:=date;
{open pendnew with a statement that guarantees it'll be empty}
accdatamoduleform.cpendnew.close;
accdatamoduleform.spendnew.close;
accdatamoduleform.spendnew.CommandText:='SELECT * FROM pending where xitem = 0';
accdatamoduleform.cpendnew.Open;

{now find the tax and payments}
accdatamoduleform.sqlsalelist.close;
accdatamoduleform.cdssalelist.Close;
accdatamoduleform.sqlsalelist.commandtext:='SELECT * FROM salelist where (shift = '''+inttostr(shiftnumber)+''') AND (status = ''A'')';
accdatamoduleform.cdssalelist.Open;
accdatamoduleform.cdssalelist.Filter:='invitem = ''-2''';
accdatamoduleform.cdssalelist.Filtered:=true;

IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  BEGIN
  cjfolio:=accdatamoduleform.cdsnewGetNewFolio('CJ');
  jfolio:=accdatamoduleform.cdsnewGetNewFolio('J');
  accdatamoduleform.cdssalelist.first;
    REPEAT
    {First we work out payments and change and taxes}
    accdatamoduleform.sqlaccount.Close;
    accdatamoduleform.cdsaccount.Close;
    accdatamoduleform.sqlaccount.CommandText:='SELECT * FROM account where item = '+accdatamoduleform.cdssalelistsaleitem.AsString;
    accdatamoduleform.cdsaccount.Open;
    IF accdatamoduleform.cdsaccount.IsEmpty=false THEN
      BEGIN
      IF (accdatamoduleform.cdsaccountaccountid.AsFloat > 22060000 )AND(accdatamoduleform.cdsaccountaccountid.asfloat<22070000)THEN
        BEGIN
        {tax}
        totaltax:=totaltax+accdatamoduleform.bround(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat);
        {this is the total of all taxes}
        IF accdatamoduleform.cpendnew.Locate('account',accdatamoduleform.cdssalelistsaleitem.Value,[])=false THEN
          BEGIN
          thistax:=roundto(accdatamoduleform.cdssalelisttotalgrossprice.asfloat,-2);
          accdatamoduleform.cpendnew.Append;
          END ELSE
          BEGIN
          thistax:=roundto(accdatamoduleform.cpendnewcr.AsFloat+accdatamoduleform.cdssalelisttotalgrossprice.asfloat,-2);
          accdatamoduleform.cpendnew.Edit;
          END;
        accdatamoduleform.cpendnewfolio.Value:=cjfolio;
        accdatamoduleform.cpendnewdate.Value:=transdate;
        accdatamoduleform.cpendnewtime.Value:=transtime;
        accdatamoduleform.cpendnewnarrative.Value:=stationname+' SHIFT '+inttostr(shiftnumber);
        accdatamoduleform.cpendnewdr.AsFloat:=0;
        accdatamoduleform.cpendnewcr.AsFloat:=thistax;
        accdatamoduleform.cpendnewaccount.Value:=accdatamoduleform.cdsaccountitem.Value;
        accdatamoduleform.cpendnewoperator.Value:=accdatamoduleform.cdssalelistoperator.Value;
        accdatamoduleform.cpendnewjname.Value:='CASH BOOK';
        accdatamoduleform.cpendnewcurrency.Value:='GBP';
        accdatamoduleform.cpendnewrate.AsFloat:=1;
        accdatamoduleform.cpendnewmethod.Value:='';
        accdatamoduleform.cpendnewstation.Value:=accdatamoduleform.cdssaleliststation.value;
        accdatamoduleform.cpendnewcheque.value:='';
        accdatamoduleform.cpendnewinvitem.Value:=-2;
        accdatamoduleform.cpendnewquantity.AsFloat:=1;
        accdatamoduleform.cpendnewxorder.Value:='B';
        accdatamoduleform.cpendnewshift.Value:=accdatamoduleform.cdssalelistshift.Value;
        accdatamoduleform.cpendnewhold.Value:=false;
        accdatamoduleform.cpendnewref.Value:=accdatamoduleform.cdssalelistsaleref.Value;
        accdatamoduleform.cpendnewtransaction.value:='0';
        accdatamoduleform.cpendnewcostcentre.Value:='0';
        accdatamoduleform.cpendnewpitype.Value:=0;
        accdatamoduleform.cpendnewtrigger.Value:='-1';
        accdatamoduleform.cpendnewstatus.Value:=0;
        accdatamoduleform.cpendnewtarget.AsFloat:=0;
        accdatamoduleform.cpendnewpaydate.Value:=accdatamoduleform.cdssalelistdate.value;
        accdatamoduleform.cpendnewpaid.Value:=true;
        accdatamoduleform.cpendnew.Post;
        END ELSE
      IF (accdatamoduleform.cdsaccountaccountid.asfloat>21010000)AND(accdatamoduleform.cdsaccountaccountid.asfloat<21030000)THEN
        BEGIN
        {bank or cash}
        {add this payment to the relevant account}
        {at the moment we will have to identify the word 'Change' and subtract that.}
        {this abomination will be sorted eventually by making the totalgrossprice negative for change}
        IF roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)<0 THEN
        totalpay:=totalpay+roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2) ELSE
        IF (accdatamoduleform.cdssalelistitemname.value = 'Change')AND(roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)>0)THEN
        totalpay:=totalpay-roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2) ELSE
        totalpay:=totalpay+roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2);

        IF accdatamoduleform.cpendnew.Locate('account',accdatamoduleform.cdssalelistsaleitem.Value,[])=false THEN
          BEGIN
          IF roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)<0 THEN
          thispay:=roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)ELSE
          IF (accdatamoduleform.cdssalelistitemname.value='Change')AND(roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)>0)THEN
          thispay:=-1*(roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)) ELSE
          thispay:=roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2);
          accdatamoduleform.cpendnew.Append;
          END ELSE
          BEGIN
          IF roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)<0 THEN
          thispay:=roundto(accdatamoduleform.cpendnewdr.AsFloat,-2)+roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)ELSE
          IF (accdatamoduleform.cdssalelistitemname.Value='Change')AND(roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)>0)THEN
          thispay:=roundto(accdatamoduleform.cpendnewdr.AsFloat,-2)-(roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2)) ELSE
          thispay:=roundto(accdatamoduleform.cpendnewdr.AsFloat,-2)+(roundto(accdatamoduleform.cdssalelisttotalgrossprice.AsFloat,-2));
          accdatamoduleform.cpendnew.Edit;
          END;
        accdatamoduleform.cpendnewfolio.Value:=cjfolio;
        accdatamoduleform.cpendnewdate.Value:=transdate;
        accdatamoduleform.cpendnewtime.Value:=transtime;
        accdatamoduleform.cpendnewnarrative.Value:=stationname+' SHIFT '+inttostr(shiftnumber);
        accdatamoduleform.cpendnewdr.AsFloat:=thispay;
        accdatamoduleform.cpendnewcr.AsFloat:=0;
        accdatamoduleform.cpendnewaccount.Value:=accdatamoduleform.cdsaccountitem.Value;
        accdatamoduleform.cpendnewoperator.Value:=accdatamoduleform.cdssalelistoperator.Value;
        accdatamoduleform.cpendnewjname.Value:='CASH BOOK';
        accdatamoduleform.cpendnewcurrency.Value:='GBP';
        accdatamoduleform.cpendnewrate.AsFloat:=1;
        accdatamoduleform.cpendnewmethod.Value:='';
        accdatamoduleform.cpendnewstation.Value:=accdatamoduleform.cdssaleliststation.value;
        accdatamoduleform.cpendnewcheque.value:='';
        accdatamoduleform.cpendnewinvitem.Value:=-2;
        accdatamoduleform.cpendnewquantity.AsFloat:=1;
        accdatamoduleform.cpendnewxorder.Value:='B';
        accdatamoduleform.cpendnewshift.Value:=accdatamoduleform.cdssalelistshift.Value;
        accdatamoduleform.cpendnewhold.Value:=false;
        accdatamoduleform.cpendnewref.Value:=accdatamoduleform.cdssalelistsaleref.Value;
        accdatamoduleform.cpendnewtransaction.value:='0';
        accdatamoduleform.cpendnewcostcentre.Value:='0';
        accdatamoduleform.cpendnewpitype.Value:=0;
        accdatamoduleform.cpendnewtrigger.Value:='-1';
        accdatamoduleform.cpendnewstatus.Value:=0;
        accdatamoduleform.cpendnewtarget.AsFloat:=0;
        accdatamoduleform.cpendnewpaydate.Value:=accdatamoduleform.cdssalelistdate.value;
        accdatamoduleform.cpendnewpaid.Value:=true;
        accdatamoduleform.cpendnew.Post;
        END;
      END;
    IF accdatamoduleform.cdssalelist.eof=false THEN accdatamoduleform.cdssalelist.next;
    UNTIL accdatamoduleform.cdssalelist.eof=true;
  END;

totalnet:=totalpay-totaltax;
accdatamoduleform.Writelog('totalnet '+formatfloat('0.00',totalnet),'totalnet '+formatfloat('0.00',totalnet),'totalnet '+formatfloat('0.00',totalnet));
accdatamoduleform.Writelog('totalpay '+formatfloat('0.00',totalpay),'totalpay '+formatfloat('0.00',totalpay),'totalnet '+formatfloat('0.00',totalpay));
accdatamoduleform.Writelog('totaltax '+formatfloat('0.00',totaltax),'totaltax '+formatfloat('0.00',totaltax),'totaltax '+formatfloat('0.00',totaltax));

{now refilter to get sale items}
accdatamoduleform.cdssalelist.Filter:='invitem <> ''-2''';
accdatamoduleform.cdssalelist.Filtered:=true;
IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  BEGIN
  accdatamoduleform.cdssalelist.first;
    REPEAT
    {here we have items that have a totalnet price and up to three accounts }
    {if there is a sale account then we use that as the account for the net amount}
    {then if there is an inventory and cogs account we transfer the value over}
    accdatamoduleform.cdsinventory.Close;
    accdatamoduleform.sqlinventory.close;
    accdatamoduleform.sqlinventory.CommandText:='SELECT * FROM inventory where item = '+accdatamoduleform.cdssalelistinvitem.AsString;
    accdatamoduleform.cdsinventory.Open;
    IF accdatamoduleform.cdsinventory.IsEmpty=false THEN salesac:=accdatamoduleform.cdsinventorysalesac.Value ELSE
      BEGIN
      {get the default account}
        Try
      	salesac:=accdatamoduleform.gettpsetting('default account');
        Except
        salesac:=-1;
        End;
      END;
    IF salesac<>-1 THEN
      BEGIN
      IF accdatamoduleform.isvalidaccount(salesac)=true THEN
        BEGIN
        itemnet:=accdatamoduleform.bround(accdatamoduleform.cdssalelisttotalnetprice.AsFloat);
        IF (accdatamoduleform.cdssalelist.RecNo=accdatamoduleform.cdssalelist.RecordCount)AND(itemnet<>totalnet) THEN
        Itemnet:=totalnet;
        accdatamoduleform.Writelog('recno '+inttostr(accdatamoduleform.cdssalelist.recno)+' itemnet '+formatfloat('0.00',itemnet)+'  totalnet '+formatfloat('0.00',totalnet),'recno '+inttostr(accdatamoduleform.cdssalelist.recno)+' itemnet '+formatfloat('0.00',itemnet)+'  totalnet '+formatfloat('0.00',totalnet),'recno '+inttostr(accdatamoduleform.cdssalelist.recno)+' itemnet '+formatfloat('0.00',itemnet)+'  totalnet '+formatfloat('0.00',totalnet));
        IF accdatamoduleform.cpendnew.Locate('account',salesac,[])=false THEN
          BEGIN
          thisnet:=itemnet;
          accdatamoduleform.cpendnew.Append;
          END ELSE
          BEGIN
          thisnet:=roundto(accdatamoduleform.cpendnewcr.AsFloat,-2)+itemnet;
          accdatamoduleform.cpendnew.Edit;
          END;
        accdatamoduleform.cpendnewfolio.Value:=cjfolio;
        accdatamoduleform.cpendnewdate.Value:=transdate;
        accdatamoduleform.cpendnewtime.Value:=transtime;
        accdatamoduleform.cpendnewnarrative.Value:=stationname+' SHIFT '+inttostr(shiftnumber);
        accdatamoduleform.cpendnewdr.AsFloat:=0;
        accdatamoduleform.cpendnewcr.AsFloat:=thisnet;
        accdatamoduleform.cpendnewcr.AsFloat:=thisnet;
        accdatamoduleform.cpendnewaccount.Value:=salesac;
        accdatamoduleform.cpendnewoperator.Value:=accdatamoduleform.cdssalelistoperator.Value;
        accdatamoduleform.cpendnewjname.Value:='CASH BOOK';
        accdatamoduleform.cpendnewcurrency.Value:='GBP';
        accdatamoduleform.cpendnewrate.AsFloat:=1;
        accdatamoduleform.cpendnewmethod.Value:='';
        accdatamoduleform.cpendnewstation.Value:=accdatamoduleform.cdssaleliststation.value;
        accdatamoduleform.cpendnewcheque.value:='';
        accdatamoduleform.cpendnewinvitem.Value:=accdatamoduleform.cdssalelistinvitem.Value;
        accdatamoduleform.cpendnewquantity.AsFloat:=-1*accdatamoduleform.cdssalelistinvquantity.AsFloat;
        accdatamoduleform.cpendnewxorder.Value:='B';
        accdatamoduleform.cpendnewshift.Value:=accdatamoduleform.cdssalelistshift.Value;
        accdatamoduleform.cpendnewhold.Value:=false;
        accdatamoduleform.cpendnewref.Value:=accdatamoduleform.cdssalelistsaleref.Value;
        accdatamoduleform.cpendnewtransaction.value:='0';
        accdatamoduleform.cpendnewcostcentre.Value:='0';
        accdatamoduleform.cpendnewpitype.Value:=0;
        accdatamoduleform.cpendnewtrigger.Value:='-1';
        accdatamoduleform.cpendnewstatus.Value:=0;
        accdatamoduleform.cpendnewtarget.AsFloat:=0;
        accdatamoduleform.cpendnewpaydate.Value:=accdatamoduleform.cdssalelistdate.value;
        accdatamoduleform.cpendnewpaid.Value:=true;
        accdatamoduleform.cpendnew.Post;
        totalnet:=totalnet-itemnet;
        END;
      IF (accdatamoduleform.isvalidaccount(accdatamoduleform.cdsinventoryinventoryac.Value))AND(accdatamoduleform.isvalidaccount(accdatamoduleform.cdsinventorycostac.Value))
      AND(roundto(accdatamoduleform.cdsinventorynumberinstock.AsFloat,-2)<>0)THEN
        BEGIN
        {cogs transfer}
        accdatamoduleform.cpendnew.Append;
        accdatamoduleform.cpendnewfolio.Value:=jfolio;
        accdatamoduleform.cpendnewdate.Value:=transdate;
        accdatamoduleform.cpendnewtime.Value:=transtime;
        accdatamoduleform.cpendnewnarrative.Value:=accdatamoduleform.cdssalelistsalequantity.AsString+' '+accdatamoduleform.cdssalelistmeasure.Value+' '+accdatamoduleform.cdssalelistitemname.Value;
        accdatamoduleform.cpendnewdr.AsFloat:=0;
        accdatamoduleform.cpendnewcr.AsFloat:=roundto((accdatamoduleform.cdssalelistinvquantity.AsFloat*accdatamoduleform.cdsinventorytotalstockvalue.AsFloat)/accdatamoduleform.cdsinventorynumberinstock.AsFloat,-2);
        accdatamoduleform.cpendnewaccount.Value:=accdatamoduleform.cdsinventoryinventoryac.Value;
        accdatamoduleform.cpendnewoperator.Value:=accdatamoduleform.cdssalelistoperator.Value;
        accdatamoduleform.cpendnewjname.Value:='GENERAL';
        accdatamoduleform.cpendnewcurrency.Value:='GBP';
        accdatamoduleform.cpendnewrate.AsFloat:=1;
        accdatamoduleform.cpendnewmethod.Value:='';
        accdatamoduleform.cpendnewstation.Value:=accdatamoduleform.cdssaleliststation.value;
        accdatamoduleform.cpendnewcheque.value:='';
        accdatamoduleform.cpendnewinvitem.Value:=accdatamoduleform.cdssalelistinvitem.Value;
        accdatamoduleform.cpendnewquantity.AsFloat:=accdatamoduleform.cdssalelistinvquantity.AsFloat;
        accdatamoduleform.cpendnewxorder.Value:='B';
        accdatamoduleform.cpendnewshift.Value:=accdatamoduleform.cdssalelistshift.Value;
        accdatamoduleform.cpendnewhold.Value:=false;
        accdatamoduleform.cpendnewref.Value:=accdatamoduleform.cdssalelistsaleref.Value;
        accdatamoduleform.cpendnewtransaction.value:='0';
        accdatamoduleform.cpendnewcostcentre.Value:='0';
        accdatamoduleform.cpendnewpitype.Value:=0;
        accdatamoduleform.cpendnewtrigger.Value:='-1';
        accdatamoduleform.cpendnewstatus.Value:=0;
        accdatamoduleform.cpendnewtarget.AsFloat:=0;
        accdatamoduleform.cpendnewpaydate.Value:=accdatamoduleform.cdssalelistdate.value;
        accdatamoduleform.cpendnewpaid.Value:=true;
        accdatamoduleform.cpendnew.Post;

        accdatamoduleform.cpendnew.Append;
        accdatamoduleform.cpendnewfolio.Value:=jfolio;
        accdatamoduleform.cpendnewdate.Value:=transdate;
        accdatamoduleform.cpendnewtime.Value:=transtime;
        accdatamoduleform.cpendnewnarrative.Value:=accdatamoduleform.cdssalelistsalequantity.AsString+' '+accdatamoduleform.cdssalelistmeasure.Value+' '+accdatamoduleform.cdssalelistitemname.Value;
        accdatamoduleform.cpendnewdr.AsFloat:=roundto((accdatamoduleform.cdssalelistinvquantity.AsFloat*accdatamoduleform.cdsinventorytotalstockvalue.AsFloat)/accdatamoduleform.cdsinventorynumberinstock.AsFloat,-2);
        accdatamoduleform.cpendnewcr.AsFloat:=0;
        accdatamoduleform.cpendnewaccount.Value:=accdatamoduleform.cdsinventorycostac.Value;
        accdatamoduleform.cpendnewoperator.Value:=accdatamoduleform.cdssalelistoperator.Value;
        accdatamoduleform.cpendnewjname.Value:='GENERAL';
        accdatamoduleform.cpendnewcurrency.Value:='GBP';
        accdatamoduleform.cpendnewrate.AsFloat:=1;
        accdatamoduleform.cpendnewmethod.Value:='';
        accdatamoduleform.cpendnewstation.Value:=accdatamoduleform.cdssaleliststation.value;
        accdatamoduleform.cpendnewcheque.value:='';
        accdatamoduleform.cpendnewinvitem.Value:=accdatamoduleform.cdssalelistinvitem.Value;
        accdatamoduleform.cpendnewquantity.AsFloat:=accdatamoduleform.cdssalelistinvquantity.AsFloat;
        accdatamoduleform.cpendnewxorder.Value:='B';
        accdatamoduleform.cpendnewshift.Value:=accdatamoduleform.cdssalelistshift.Value;
        accdatamoduleform.cpendnewhold.Value:=false;
        accdatamoduleform.cpendnewref.Value:=accdatamoduleform.cdssalelistsaleref.Value;
        accdatamoduleform.cpendnewtransaction.value:='0';
        accdatamoduleform.cpendnewcostcentre.Value:='0';
        accdatamoduleform.cpendnewpitype.Value:=0;
        accdatamoduleform.cpendnewtrigger.Value:='-1';
        accdatamoduleform.cpendnewstatus.Value:=0;
        accdatamoduleform.cpendnewtarget.AsFloat:=0;
        accdatamoduleform.cpendnewpaydate.Value:=accdatamoduleform.cdssalelistdate.value;
        accdatamoduleform.cpendnewpaid.Value:=true;
        accdatamoduleform.cpendnew.Post;
        END;
      END;

    IF accdatamoduleform.cdssalelist.eof=false THEN accdatamoduleform.cdssalelist.next;
    UNTIL accdatamoduleform.cdssalelist.eof=true;
  END;
IF totalnet=0 THEN
  BEGIN
  {commit the sale}
  IF accdatamoduleform.cpendnew.ChangeCount>0 THEN
    BEGIN
    accdatamoduleform.cpendnew.ApplyUpdates(0);
    accdatamoduleform.conn.ExecuteDirect('Update salelist set status = ''C'' where (shift = '''+inttostr(shiftnumber)+''') AND (status = ''A'')');
    Result:=true;
    END ELSE Result:=true;

  END ELSE
  BEGIN
  {error}
  accdatamoduleform.cpendnew.CancelUpdates;
  Result:=false;
  END;
END;



Procedure Taccsalesform.reading(rtype:char);
Var
totitemcount,itemcount:integer;
itemtotal,cashtotal:Double;
BEGIN
IF accdatamoduleform.cdsreport.Active=False THEN accdatamoduleform.cdsreport.CreateDataSet;
accdatamoduleform.cdsreport.EmptyDataSet;
accdatamoduleform.cdsreport.Active:=true;
cashtotal:=0;
totitemcount:=0;
{This totals the cash sales and if rtype is Z writes the pending items}
Accdatamoduleform.sqlsaletot.Close;
Accdatamoduleform.cdssaletot.Close;
{Items with status A are the ones we're interested in}
Accdatamoduleform.sqlsaletot.commandtext:='SELECT * FROM salelist where shift = '''+inttostr(currentshift)+''' and status = ''A''';
Accdatamoduleform.cdssaletot.Active:=true;
Accdatamoduleform.cdssaletot.refresh;
IF accdatamoduleform.cdssaletot.isempty=false THEN
  BEGIN
  accdatamoduleform.cdsReport.IndexName:='invindex';
  accdatamoduleform.cdssaletot.First;
    REPEAT
      with AccDatamoduleform.cdsReport do
      begin
      SetKey;
      FieldByName('itemtype').AsInteger:=accdatamoduleform.cdssaletotinvitem.Value;
      FieldByName('product').AsInteger :=accdatamoduleform.cdssaletotsaleitem.Value;
      GotoKey;
      IF gotokey=true THEN
        BEGIN
        Itemtotal:=accdatamoduleform.cdsreporttotal.Value;
        IF (accdatamoduleform.cdssaletotinvitem.Value=-2)AND(accdatamoduleform.cdssaletotitemname.Value='Change') THEN
        Itemtotal:=Itemtotal-accdatamoduleform.cdssaletottotalgrossprice.AsFloat ELSE
        Itemtotal:=Itemtotal+accdatamoduleform.cdssaletottotalgrossprice.AsFloat;
        IF accdatamoduleform.cdssaletotinvitem.Value>-2 THEN
          BEGIN
          itemcount:=accdatamoduleform.cdsreportcount.Value;
          itemcount:=itemcount+accdatamoduleform.cdssaletotsalecount.asinteger;
          totitemcount:=totitemcount+itemcount;
          END ELSE Itemcount:=0;
        accdatamoduleform.cdsreport.Edit;
        accdatamoduleform.cdsreportcount.Value:=Itemcount;
        accdatamoduleform.cdsreporttotal.Value:=Itemtotal;
        accdatamoduleform.cdsreport.Post;
        END ELSE
        BEGIN
        IF accdatamoduleform.cdssaletotinvitem.Value>-2 THEN
          BEGIN
          itemcount:=accdatamoduleform.cdssaletotsalecount.asinteger;
          totitemcount:=totitemcount+itemcount;
          END ELSE itemcount:=0;
        accdatamoduleform.cdsreport.Append;
        accdatamoduleform.cdsreportitemtype.Value:=accdatamoduleform.cdssaletotinvitem.Value;
        accdatamoduleform.cdsreportproduct.Value:=accdatamoduleform.cdssaletotsaleitem.Value;
        accdatamoduleform.cdsreportprodlabel.Value:=Accdatamoduleform.cdssaletotitemname.Value;
        accdatamoduleform.cdsreportcount.Value:=Itemcount;
        IF (accdatamoduleform.cdssaletotinvitem.Value=-2)AND(accdatamoduleform.cdssaletotitemname.Value='Change') THEN
        Itemtotal:= -1*accdatamoduleform.cdssaletottotalgrossprice.AsFloat ELSE
        Itemtotal:= accdatamoduleform.cdssaletottotalgrossprice.AsFloat;
        accdatamoduleform.cdsreporttotal.Value:=Itemtotal;
        accdatamoduleform.cdsreport.Post;
        END;
      end;

    IF accdatamoduleform.cdssaletot.Eof=false THEN accdatamoduleform.cdssaletot.Next;
    UNTIL accdatamoduleform.cdssaletot.Eof=true;
  accdatamoduleform.cdsreport.IndexName:='prodlabel';
  lbpicklist.Clear;
  IF accdatamoduleform.cdsreport.IsEmpty=false THEN
    BEGIN
    lbpicklist.Items.add(rtype+' report - shift '+inttostr(currentshift)+' '+formatdatetime('dd mm yyyy',date));
    lbpicklist.Items.add('');
    accdatamoduleform.cdsreport.First;
      REPEAT
      IF accdatamoduleform.cdsreportitemtype.Value<>-2 THEN
        BEGIN
        lbpicklist.Items.add(Accdatamoduleform.cdsreportprodlabel.Value);
        lbpicklist.Items.add('Count: '+Accdatamoduleform.cdsreportcount.AsString);
        lbpicklist.Items.add('Value: '+formatfloat(basecurrencystring+'0.00',Accdatamoduleform.cdsreporttotal.asfloat));
        lbpicklist.Items.add(' ');
        END ELSE
        BEGIN
        IF accdatamoduleform.cdsreportproduct.Value=0 THEN
        cashtotal:=accdatamoduleform.cdsreporttotal.AsFloat;
        END;
      IF accdatamoduleform.cdsreport.eof=false THEN accdatamoduleform.cdsreport.Next;
      UNTIL accdatamoduleform.cdsreport.eof=true;


    lbpicklist.Items.add('-------------------------------------------');
    lbpicklist.Items.add('Total items sold: '+inttostr(totitemcount));
    lbpicklist.Items.add('Shift total: '+formatfloat('0.00',Cashtotal));
    accdatamoduleform.cdsreport.Filter:='itemtype = -2 and product > -2';
    accdatamoduleform.cdsreport.Filtered:=true;
    IF accdatamoduleform.cdsreport.IsEmpty=false THEN
      BEGIN
      lbpicklist.Items.add('Sales analysis:');
      accdatamoduleform.cdsreport.First;
        REPEAT
        lbpicklist.Items.add(accdatamoduleform.cdsreportprodlabel.Value+': '+formatfloat('0.00',accdatamoduleform.cdsreporttotal.Value));
        IF accdatamoduleform.cdsreport.eof=false THEN accdatamoduleform.cdsreport.Next;
        UNTIL accdatamoduleform.cdsreport.eof=true;
      END;
    accdatamoduleform.cdsreport.Filtered:=false;
    lbpicklist.Items.add('End of report');
    END; {report is empty}
  END; {saletot is empty}
IF rtype='Z' THEN
  BEGIN
  {we can use the sale process feature from PiP to process the entire shift}
  processshift(currentshift);
  accdatamoduleform.Endshift;
  END;
END;

Procedure Taccsalesform.Getlocalinfo;
  BEGIN
  Setcurrentdir(backupdir);
  Accdatamoduleform.cdslocaldata.FileName:=backupdir+'xposlocal';
  Accdatamoduleform.Writelog('','','Local data file '+Accdatamoduleform.cdslocaldata.FileName);
    Try
    IF accdatamoduleform.cdslocaldata.active=false THEN accdatamoduleform.cdslocaldata.CreateDataSet;
    IF Fileexists(accdatamoduleform.cdslocaldata.filename)THEN
      BEGIN
      accdatamoduleform.cdslocaldata.loadfromfile();
      Accdatamoduleform.Writelog('','','Local data file found');
      localfile:=true;
      END;
    accdatamoduleform.cdslocaldata.Active:=true;
    IF accdatamoduleform.cdslocaldata.Locate('parameter','station name',[])=true THEN
      BEGIN
      stationname:=accdatamoduleform.cdslocaldatavalue.Value;
      Accdatamoduleform.Writelog('','','Station name is '+stationname);
      END ELSE
      BEGIN
      Stationname:='none';
      Accdatamoduleform.Writelog('','','No station name found');
      END;
    Except
    Stationname:='none';
    Accdatamoduleform.Writelog('','','Local details not found');
    End;
  END;

Function Taccsalesform.Setlocalinfo:Boolean; {For local people}
  BEGIN
    Try
    Accdatamoduleform.cdslocaldata.SaveToFile();
    result:=true;
    Except
    result:=false;
    End;
  END;

Procedure Taccsalesform.Numberkey(knumber:string);
Var
i: Integer;
selfrom,selto:Integer;
BEGIN
IF (xstate='insale')OR(xstate='inedit')OR(xstate='inentry')OR(xstate='incashback')
OR(xstate='inaccountbyroom')OR(xstate='inaccountbynumber')OR(xstate='noninvcost') THEN
  BEGIN
  {This has two functions. If there's anything in the salelist}
  {it may be money. If not, it's a quantity}
  {We will probably change this to insist on a multiplier button}
  {If some of the input line is highlighted we need to delete it first}
  Selfrom:=eselection.SelStart;
  selto:=eselection.CursorPos;
  IF selfrom<>selto THEN
    BEGIN
    {delete the selected portion}

    END;
  IF Firstentry=true THEN amtstring:=knumber ELSE
  insert(knumber,amtstring,length(amtstring)+1);
  {we need to take out the point and then re-insert it at the correct place}
  i:=1;
    REPEAT
    IF amtstring[i]='.'THEN delete(amtstring,i,1)ELSE i:=i+1;
    UNTIL i>length(amtstring);
  {make the string long enough}
  IF length(amtstring)<3 THEN
    BEGIN
      REPEAT
      Insert('0',amtstring,1);
      UNTIL length(amtstring)=3;
    END;
  {re-insert the point}
  Insert('.',amtstring,length(amtstring)-1);
  selectedamt:=strtofloat(amtstring);
  Firstentry:=false;
  IF (xstate='insale')OR(xstate='inedit') THEN
    BEGIN
    IF selectedsale<>-1 THEN
    esaledescr.Text:=formatfloat('0.00',selectedamt)+' '+accdatamoduleform.cdsSalesdescription.Value ELSE
    esaledescr.Text:=formatfloat('0.00',selectedamt);
    SetF2('Cash Tend',True);
    SetF7('Back',True);
    END ELSE
  IF(xstate='inentry')OR(xstate='incashback')OR(xstate='inaccountbyroom')OR(xstate='inaccountbynumber') THEN
    BEGIN
    eselection.Text:=pmethod+': '+formatfloat(currencystring+'0.00',selectedamt);
    SetF3('Enter',True);
    END ELSE
  IF(xstate='noninvcost')THEN
    BEGIN
    SetF3('Price',True);
    eselection.Text:=formatfloat(currencystring+'0.00',selectedamt);
    END;
  END ELSE
  eselection.SetFocus;
  {eselection.SelStart:=length(eselection.Text);
  eselection.CursorPos:=eselection.SelStart;}
END;

Procedure Taccsalesform.Savebutton;
  BEGIN
  IF currlevel=0 THEN levelname:='BASE';
  IF nextlevel<>-1 THEN
    BEGIN
    invitem:=-1;
    saleitem:=-1;
    END;
  Accdatamoduleform.cdspicklist.Filter:='level = '''+inttostr(currlevel)+'''';
  accdatamoduleform.cdspicklist.Filtered:=true;
  IF accdatamoduleform.cdspicklist.Locate('button',selbutton,[])=true THEN
    BEGIN
    accdatamoduleform.cdspicklist.Edit;
    accdatamoduleform.cdspicklistlevel.Value:=currlevel;
    accdatamoduleform.cdspicklistplevel.Value:=prevlevel;
    accdatamoduleform.cdspicklistbutton.value:=selbutton;
    accdatamoduleform.cdspicklistpbutton.Value:=prevbutton;
    accdatamoduleform.cdspicklistnlevel.value:=nextlevel;
    accdatamoduleform.cdspicklistinvitem.value:=invitem;
    accdatamoduleform.cdspicklistsaleitem.Value:=saleitem;
    accdatamoduleform.cdspicklistbuttoncolour.Value:=Colortostring(buttoncolour);
    accdatamoduleform.cdspicklisttextcolour.Value:=Colortostring(textcolour);
    accdatamoduleform.cdspicklistlevelname.Value:=levelname;
    accdatamoduleform.cdspicklistnlevelname.Value:=nlevelname;
    accdatamoduleform.cdspicklisttext.Value:=buttoncap;
    accdatamoduleform.cdspickliststation.Value:=stationname;
    accdatamoduleform.cdspicklist.post;
    END ELSE
    BEGIN
    {we'll need to take off the filter to get a new number}
    accdatamoduleform.cdspicklist.Filtered:=false;
    accdatamoduleform.cdspicklist.Append;
    accdatamoduleform.cdspicklistlevel.Value:=currlevel;
    accdatamoduleform.cdspicklistplevel.Value:=prevlevel;
    accdatamoduleform.cdspicklistbutton.value:=selbutton;
    accdatamoduleform.cdspicklistpbutton.Value:=prevbutton;
    accdatamoduleform.cdspicklistnlevel.value:=nextlevel;
    accdatamoduleform.cdspicklistinvitem.value:=invitem;
    accdatamoduleform.cdspicklistsaleitem.Value:=saleitem;
    accdatamoduleform.cdspicklistbuttoncolour.Value:=Colortostring(buttoncolour);
    accdatamoduleform.cdspicklisttextcolour.Value:=Colortostring(textcolour);
    IF currlevel=0 THEN levelname:='BASE';
    accdatamoduleform.cdspicklistlevelname.Value:=levelname;
    accdatamoduleform.cdspicklistnlevelname.Value:=nlevelname;
    accdatamoduleform.cdspicklisttext.Value:=buttoncap;
    accdatamoduleform.cdspickliststation.Value:=stationname;
    accdatamoduleform.cdspicklist.post;
    accdatamoduleform.cdspicklist.Filtered:=true;
    END;
  {we should also take a look and the level pointed to by nextlevel and check that the}
  {nextlevelname is correct}
  IF nextlevel<>-1 THEN
    BEGIN
    accdatamoduleform.cdspicklist.Filter:='level = '+inttostr(nextlevel);
    accdatamoduleform.cdspicklist.Filtered:=true;
    IF accdatamoduleform.cdspicklist.IsEmpty=false THEN
      BEGIN
        Try
        accdatamoduleform.conn.ExecuteDirect('UPDATE picklist set levelname = '''+nlevelname+''' WHERE level = '+inttostr(nextlevel));
        Except
        Messagedlg('','Och! bother',mtError,[mbOk],0);
        End;
      END;
    END;
  Try
  IF accdatamoduleform.cdspicklist.ChangeCount>0 THEN accdatamoduleform.cdspicklist.applyupdates(0);
  Except
  End;

  END;


Procedure Taccsalesform.loadstationsettings(stationname:string);
Begin
sdatabase:=Accdatamoduleform.conn.Params.Values['database'];
susername:=accdatamoduleform.conn.Params.Values['User_name'];
shownet:=strtobool(Accdatamoduleform.Getsysteminfo(stationname,'settings','shownet','false'));
showbalances:=strtobool(Accdatamoduleform.Getsysteminfo(stationname,'settings','showbalances','false'));
Currentshift:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,stationname,'shiftnumber','0'));
accdatamoduleform.sqlpicklist.Close;
accdatamoduleform.sqlpicklist.CommandText:='SELECT * FROM picklist where station = '''+stationname+'''';
dontprint:=strtobool(accdatamoduleform.Getsysteminfo(stationname,'printing','print','true'));
End;

Function Taccsalesform.loaddatabasesettings(databasename:string):Boolean;
Var
done:Boolean;
Begin
  Try
  IF currentshift<>0 THEN
    BEGIN
    inshift:=true;
    {load held salelist items - shift is this shift and status <> -2 or C or I}
    accdatamoduleform.sqlsaletot.Close;
    accdatamoduleform.sqlsaletot.CommandText:='SELECT * FROM salelist where shift = '''+inttostr(currentshift)+'''and (status <> ''-2'') AND (status <> ''C'') AND (status <> ''I'')';
    accdatamoduleform.writelog('in shift','in shift','in shift');
    END ELSE Inshift:=False;
  accdatamoduleform.loadsysteminfo(sdatabase,'settings','','');
  IF accdatamoduleform.cdssysdata.Locate('parameter','logging',[])=true THEN
  logging:=strtobool(Accdatamoduleform.cdssysdatavalue.Value) ELSE logging:=true;
  IF accdatamoduleform.cdssysdata.Locate('parameter','loglevel',[])=true THEN
  loglevel:=strtoint(Accdatamoduleform.cdssysdatavalue.Value) ELSE loglevel:=2;
  IF accdatamoduleform.cdssysdata.Locate('parameter','short date format',[])=true THEN
  shortdateformat:=(Accdatamoduleform.cdssysdatavalue.Value) ELSE shortdateformat:='dd/mm/yyyy';
  IF accdatamoduleform.cdssysdata.Locate('parameter','base currency',[])=true THEN
  Basecurrency:=(Accdatamoduleform.cdssysdatavalue.Value) ELSE basecurrency:='GBP';
  IF accdatamoduleform.cdssysdata.Locate('parameter','base currency string',[])=true THEN
  Basecurrencystring:=(Accdatamoduleform.cdssysdatavalue.Value) ELSE basecurrencystring:='Â£';
  currencystring:=basecurrencystring; {used for display purposes}
  transcurrency:=basecurrency;
  sdatestyle:= 'ISO,European';
  IF accdatamoduleform.cdssysdata.Locate('parameter','default sales tax',[])=true THEN
  defaultsalestax:=Accdatamoduleform.cdssysdatavalue.Value ELSE defaultsalestax:= '1';
  IF accdatamoduleform.cdssysdata.Locate('parameter','cashbacklimit',[])=true THEN
  cashbacklimit:=Strtofloat(Accdatamoduleform.cdssysdatavalue.value) ELSE Cashbacklimit:=50;
  IF accdatamoduleform.cdssysdata.Locate('parameter','cashbackstring',[])=true THEN
  Cashbackstring:=Accdatamoduleform.cdssysdatavalue.value ELSE cashbackstring:='CASHBACK';
  IF accdatamoduleform.cdssysdata.Locate('parameter','switchstring',[])=true THEN
  switchstring:=Accdatamoduleform.cdssysdatavalue.value ELSE switchstring:='MAESTRO';
  IF accdatamoduleform.cdssysdata.Locate('parameter','chequestring',[])=true THEN
  chequestring:=Accdatamoduleform.cdssysdatavalue.value ELSE chequestring:='CHEQUE';
  IF accdatamoduleform.cdssysdata.Locate('parameter','discountstring',[])=true THEN
  discountstring:=Accdatamoduleform.cdssysdatavalue.value ELSE discountstring:='DISCOUNT';
  IF accdatamoduleform.cdssysdata.Locate('parameter','needpassword',[])=true THEN
  needpassword:=strtobool(Accdatamoduleform.cdssysdatavalue.value) ELSE needpassword:=false;
  IF accdatamoduleform.cdssysdata.Locate('parameter','inventory account',[])=true THEN
  generalinv:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE generalinv:=-1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','sales account',[])=true THEN
  generalsales:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE generalsales:=-1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','cogs account',[])=true THEN
  generalcogs:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE generalcogs:=-1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','defaultbank',[])=true THEN
  Defaultbank:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE Defaultbank:=-1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','defaultcash',[])=true THEN
  Defaultcash:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE Defaultcash:=-1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','sale bank account',[])=true THEN
  bankaccount:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE bankaccount:=-1;

  booksclosing:=false;
  booksclosed:=false;

  {set the width and height}
  accsalesform.WindowState:=wsMaximized;
  {We start by setting the Fkeys}
  lbpicklist.multiselect:=false;
  quickkeypanel.Visible:=true;
  loadbuttons(-1);
  prevlevel:=-1;
  btnBack.Visible:=false;

  IF accdatamoduleform.cdslocaltax.active=False THEN accdatamoduleform.cdslocaltax.CreateDataSet;
  IF accdatamoduleform.cdstaxes.Active=false THEN accdatamoduleform.cdstaxes.Active:=true;
  IF accdatamoduleform.cdsinventory.Active=false THEN accdatamoduleform.cdsinventory.Active:=true;
  IF accdatamoduleform.cdssales.Active=false THEN accdatamoduleform.cdssales.Active:=true;
  {check accounts}

  {We will check to see if there is any non base cash account. If there}
  {is, we will allow transactions in other currencies - eg Euros}

  accdatamoduleform.sqlaccount.close;
  accdatamoduleform.cdsaccount.close;
  accdatamoduleform.sqlaccount.CommandText:='SELECT * FROM account where class = ''PRIVATE''';
  accdatamoduleform.cdsaccount.Active:=true;

  Accdatamoduleform.cdstaxes.Active:=true;
  IF Accdatamoduleform.cdstaxes.isempty=false THEN
    BEGIN
    Accdatamoduleform.cdstaxes.First;
      REPEAT
      IF accdatamoduleform.cdstaxesrate.AsCurrency<>0 THEN
        BEGIN
        IF accdatamoduleform.cdsaccount.Locate('item',accdatamoduleform.cdstaxesaccount.Value,[])=False THEN
          BEGIN
          accdatamoduleform.Newaccount('PRIVATE','TAX','CURRENT LIABILITIES',uppercase(accdatamoduleform.cdstaxesdescription.Value),Basecurrency,true,true,'<',0);
          END;
        END;
      IF Accdatamoduleform.cdstaxes.eof=false THEN Accdatamoduleform.cdstaxes.next;
      UNTIL Accdatamoduleform.cdstaxes.eof=true;
    END;

  cashonly:=false;
  IF bankaccount=0 THEN
    BEGIN
    Messagedlg('','Only cash and account sales allowed. To permit card and cheque sales you will have to specify a default bank account.',mtInformation,[mbOK],0);
    Cashonly:=true;
    END;
  accdatamoduleform.cdsaccount.Filtered:=false;

  IF generalinv=-1 THEN
    BEGIN
    {If there is only one inventory account, use it}
    accdatamoduleform.cdsaccount.Filter:='Type = ''INVENTORY'' and currency = '''+basecurrency+'''';
    accdatamoduleform.cdsaccount.Filtered:=true;
    IF accdatamoduleform.cdsaccount.recordcount>0 THEN
      BEGIN
      accdatamoduleform.cdsaccount.first;
        REPEAT
        IF Messagedlg('','OK to use '+accdatamoduleform.cdsaccountname.Value+' as default inventory account?',mtConfirmation,[mbYes,MbNo],0)=mrYes THEN
          BEGIN
          accdatamoduleform.Setsysteminfo(sdatabase,'settings','inventory account',accdatamoduleform.cdsaccountitem.asstring);
          generalinv:=accdatamoduleform.cdsaccountitem.Value;
          END;
        IF accdatamoduleform.cdsaccount.eof=false THEN accdatamoduleform.cdsaccount.Next;
        done:=(generalinv<>0)OR(accdatamoduleform.cdsaccount.eof=true);
        UNTIL done;
      END;
    END;

  IF generalsales=-1 THEN
    BEGIN
    {If there is only one inventory account, use it}
    accdatamoduleform.cdsaccount.Filter:='Type = ''SALES'' and currency = '''+basecurrency+'''';
    accdatamoduleform.cdsaccount.Filtered:=true;
    IF accdatamoduleform.cdsaccount.recordcount>0 THEN
      BEGIN
      accdatamoduleform.cdsaccount.first;
        REPEAT
        IF Messagedlg('','OK to use '+accdatamoduleform.cdsaccountname.Value+' as default sales account?',mtConfirmation,[mbYes,MbNo],0)=mrYes THEN
          BEGIN
          accdatamoduleform.Setsysteminfo(sdatabase,'settings','sales account',accdatamoduleform.cdsaccountitem.asstring);
          generalsales:=accdatamoduleform.cdsaccountitem.Value;
          END;
        IF accdatamoduleform.cdsaccount.eof=false THEN accdatamoduleform.cdsaccount.Next;
        done:=(generalsales<>0)OR(accdatamoduleform.cdsaccount.eof=true);
        UNTIL done;
      END;
    END;

  IF generalcogs=-1 THEN
    BEGIN
    {If there is only one inventory account, use it}
    accdatamoduleform.cdsaccount.Filter:='Type = ''COGS'' and currency = '''+basecurrency+'''';
    accdatamoduleform.cdsaccount.Filtered:=true;
    IF accdatamoduleform.cdsaccount.recordcount>0 THEN
      BEGIN
      accdatamoduleform.cdsaccount.first;
        REPEAT
        IF Messagedlg('','OK to use '+accdatamoduleform.cdsaccountname.Value+' as default cost of goods account?',mtConfirmation,[mbYes,MbNo],0)=mrYes THEN
          BEGIN
          accdatamoduleform.Setsysteminfo(sdatabase,'settings','cogs account',accdatamoduleform.cdsaccountitem.asstring);
          generalcogs:=accdatamoduleform.cdsaccountitem.Value;
          END;
        IF accdatamoduleform.cdsaccount.eof=false THEN accdatamoduleform.cdsaccount.Next;
        done:=(generalcogs<>0)OR(accdatamoduleform.cdsaccount.eof=true);
        UNTIL done;
      END;
    END;

  accdatamoduleform.cdsaccount.Filtered:=False;
  Transcurrency:=basecurrency;
  Transcurrencystring:=basecurrencystring;
  conversionrate:=1;
  UTaxstring:=Defaultsalestax;
  scustomer:='-';
  schequeno:='-';
  {set the counters}
  accdatamoduleform.loadsysteminfo(sdatabase,'counters','','');

  IF accdatamoduleform.cdssysdata.Locate('parameter','cjcounter',[])=true THEN
  cjcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE cjcounter:=1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','jcounter',[])=true THEN
  jcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE jcounter:=1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','sjcounter',[])=true THEN
  sjcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE sjcounter:=1;
  {IF accdatamoduleform.cdssysdata.Locate('parameter','srjcounter',[])=true THEN
  srjcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE srjcounter:=1;}
  srjcounter:=1;
  {IF accdatamoduleform.cdssysdata.Locate('parameter','pjcounter',[])=true THEN
  pjcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE pjcounter:=1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','prjcounter',[])=true THEN
  prjcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE prjcounter:=1;}
  IF accdatamoduleform.cdssysdata.Locate('parameter','shiftcounter',[])=true THEN
  shiftcounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE shiftcounter:=1;
  IF accdatamoduleform.cdssysdata.Locate('parameter','salecounter',[])=true THEN
  salecounter:=strtoint(accdatamoduleform.cdssysdatavalue.value) ELSE salecounter:=1;

  Result:=true;
  Except
  Statusbar2.SimpleText:='Error setting database - try again';
  Result:=false;
  End;
End;

Function Taccsalesform.checkstationname(stationname:string):boolean;
Var
Continue:Boolean;
Allocated:String;
  BEGIN
  Continue:=true;
  IF stationname='none' THEN
    BEGIN
    {Try to get a free station name}
      Try
      Accdatamoduleform.sqlsysdata.Active:=false;
      Accdatamoduleform.sqlsysdata.commandtext:='SELECT * FROM sysinfo WHERE section = ''allocated'' and value = ''false''';
      IF Accdatamoduleform.cdssysdata.Active=False THEN Accdatamoduleform.cdssysdata.Active:=true;
      IF accdatamoduleform.cdssysdata.ChangeCount>0 THEN Accdatamoduleform.cdssysdata.CancelUpdates;
      accdatamoduleform.cdssysdata.refresh;
      Accdatamoduleform.cdssysdata.Filtered:=False;
      IF Accdatamoduleform.cdssysdata.IsEmpty=false THEN
      stationname:=accdatamoduleform.cdssysdataparameter.Value ELSE
        BEGIN
        continue:=false;
        Messagedlg('','No free stations. Contact administrator.',mtError,[mbOK],0);
        Accdatamoduleform.Writelog('','','Could not register station');
        END;
      Except
      Messagedlg('','Problem reading table of station names. Contact administrator.',mtError,[mbOK],0);
      Accdatamoduleform.Writelog('','','Could not open stations database');
      End;

    IF continue=true THEN
      BEGIN
      {get the station number}
        Try
        IF accdatamoduleform.Getsysteminfo('system','stationnumbers',stationname,'')<>''
        THEN
        stationnumber:=strtoint(accdatamoduleform.Getsysteminfo('system','stationnumbers',stationname,'')) ELSE
          BEGIN
          continue:=false;
          Messagedlg('','No free station numbers. Contact administrator.',mtError,[mbOK],0);
          Accdatamoduleform.Writelog('','','Could not set station number');
          END;
        Except
        Messagedlg('','Problem reading table of station numbers. Contact administrator.',mtError,[mbOK],0);
        Accdatamoduleform.Writelog('','','Could not open stations database');
        End;
      END;

    IF continue=true THEN
      BEGIN
      IF accdatamoduleform.cdslocaldata.Active=False THEN
        BEGIN
        IF fileexists(accdatamoduleform.cdslocaldata.FileName)=true THEN
          BEGIN
            Try
            accdatamoduleform.cdslocaldata.Active:=true;
            Except
            deletefile(accdatamoduleform.cdslocaldata.FileName);
            accdatamoduleform.cdslocaldata.CreateDataSet;
            Accdatamoduleform.cdslocaldata.Append;
            Accdatamoduleform.cdslocaldataparameter.Value:='station name';
            Accdatamoduleform.cdslocaldatavalue.Value:=stationname;
            Accdatamoduleform.cdslocaldata.post;
            Accdatamoduleform.cdslocaldata.SaveToFile();
            End;
          END ELSE
          BEGIN
          accdatamoduleform.cdslocaldata.CreateDataSet;
          Accdatamoduleform.cdslocaldata.Append;
          Accdatamoduleform.cdslocaldataparameter.Value:='station name';
          Accdatamoduleform.cdslocaldatavalue.Value:=stationname;
          Accdatamoduleform.cdslocaldata.post;
          Accdatamoduleform.cdslocaldata.SaveToFile();
          END;
        END ELSE {active already}
        BEGIN
        Accdatamoduleform.cdslocaldata.Append;
        Accdatamoduleform.cdslocaldataparameter.Value:='station name';
        Accdatamoduleform.cdslocaldatavalue.Value:=stationname;
        Accdatamoduleform.cdslocaldata.post;
        Accdatamoduleform.cdslocaldata.SaveToFile();
        END;
      END;

    IF continue = true THEN
      BEGIN
      {Now mark this station as taken}
        Try

        Allocated:=accdatamoduleform.Getsysteminfo('system','allocated',stationname,'');
        IF allocated<>'' THEN
          BEGIN
          IF allocated='false' THEN
            BEGIN
            IF accdatamoduleform.Setsysteminfo('system','allocated',stationname,'true')=true THEN
              BEGIN
              {All's well}
              Messagedlg('','This terminal has been registered. ID:'+ inttostr(stationnumber)+' Name: '+stationname,mtInformation,[mbOK],0);
              END ELSE
              BEGIN
              {Someone else has changed the record before we got to it or the database has fallen over}
              Messagedlg('','It wasn''t possible to register the station. Possibly another station registered at the same time.',mtError,[mbOK],0);
              END;
            END ELSE
            BEGIN
            {The station has been registered already}
            Messagedlg('','Failed to register terminal. Another station may have registered this name. Log out and try again.',mtError,[mbOK],0);
            END;
          END ELSE
          BEGIN
          {The station doesn't exist - something odd here!}
          Messagedlg('','No information on the allocation state of this terminal',mtError,[mbOK],0);
          END;
        Except
        Continue:=false;
        Messagedlg('','Failed to register terminal due to a database error',mtError,[mbOK],0);
        End;
      END;
    END ELSE
    BEGIN
    {stationname is not none}
    {We check if the station exists}
    accdatamoduleform.Loadsysteminfo('system','stations','name',stationname);
    IF accdatamoduleform.cdssysdata.isempty=false THEN
      BEGIN
        Try
        stationnumber:=strtoint(accdatamoduleform.Getsysteminfo('system','stationnumbers',stationname,''));
        Except
        {There's no station number associated with this station}
        continue:=false;
        Messagedlg('','Could not locate the number of this station. Run admin program to check system settings.',mtError,[mbOK],0);
        End;
      END;

    IF continue=true THEN
      BEGIN
      {check that our station is marked as taken}
        Try
        Allocated:=accdatamoduleform.Getsysteminfo('system','allocated',stationname,'');
        IF Allocated<>'' THEN
          BEGIN
          {Allocation state known - shouldn't be a problem since we located it above, but you never know...}
          IF Allocated='false' THEN
            BEGIN
            IF accdatamoduleform.Setsysteminfo('system','allocated',stationname,'true')=true THEN
              BEGIN
              {All's well}
              Messagedlg('','This terminal has been re-registered. ID:'+ inttostr(stationnumber)+' Name: '+stationname,mtInformation,[mbOK],0);
              END ELSE
              BEGIN
              {Someone else has changed the record before we got to it or the database has fallen over}
              Messagedlg('','It wasn''t possible to re-register the station. Possibly another station registered at the same time.',mtError,[mbOK],0);
              END;
            END ELSE
            BEGIN
            {The station has been registered already - that's fine}
            END;
          END ELSE
          BEGIN
          {The station doesn't exist - something odd here!}
          Messagedlg('','Failed to register terminal. Can''t tell if it is allocated or not. Run admin to check system settings.',mtError,[mbOK],0);
          END;
        Except
        Continue:=false;
        Messagedlg('','Failed to register terminal due to a database error',mtError,[mbOK],0);
        End;
      END;
    END;{stationname is not 'none'}
  Result:=continue;
  END;


Function Taccsalesform.Loadsale(saleid:string):Boolean;
  BEGIN
  Try
  {the selected sale has its status set to the number of this station}
  {providing its status is still 0}
  {If another station has picked up the sale in the interval between us}
  {clicking on the item and clicking "enter" then we will not be able to}
  {recall the sale}
  accdatamoduleform.conn.ExecuteDirect('UPDATE salelist set status = '''+inttostr(stationnumber)+''' where (saleno = '''+saleid+''')AND(status = ''0'')');
  accdatamoduleform.conn.ExecuteDirect('UPDATE salelist set shift = '''+inttostr(currentshift)+''' where (saleno = '''+saleid+''')AND(status = '+inttostr(stationnumber)+')');
  accdatamoduleform.sqlsalelist.Close;
  accdatamoduleform.cdssalelist.Close;
  accdatamoduleform.sqlsalelist.commandtext:='SELECT * FROM salelist where (saleno = '''+saleid+''')AND(status = '''+inttostr(stationnumber)+''')';
  accdatamoduleform.cdssalelist.Active:=true;
  accdatamoduleform.cdssalelist.indexName:='saleorder';
  IF accdatamoduleform.cdssalelist.IsEmpty=true THEN
    BEGIN
    committime:=datetimetosqltimestamp(now);
    commitdate:=date;
    transref:=currentsale;
    transname:='Sale no: '+currentsale;
    END ELSE
    BEGIN
    committime:=accdatamoduleform.cdssalelisttime.AsSQLTimeStamp;
    commitdate:=accdatamoduleform.cdssalelistdate.Value;
    transref:=accdatamoduleform.cdssalelistsaleref.Value;
    transname:=accdatamoduleform.cdssalelistsalename.Value;
    END;

  transstatus:=inttostr(stationnumber);
  accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale',currentsale);
  result:=true;
  Except
  result:=false;
  End;
  END;

Procedure Taccsalesform.Additem(invitem,saleitem:integer;amount:double);
Var
itemnet,itemgross,itemvat,totnet,totgross,totvat:Double;
taxrate,equiv,invunitspersaleitem:double;
invmeasure,sellmeasure,invgroup:String;
oldamount:double;
keyfound:boolean;
tshift:integer;
tstation:String;
tuser,ttransref,ttransname:String;
  BEGIN
  IF (invitem<>-1)AND(saleitem<>-1)THEN
    BEGIN
    IF accdatamoduleform.cdsinventory.Locate('item',invitem,[])=True THEN
      BEGIN
      IF accdatamoduleform.cdsSales.Locate('sitem',saleitem,[])= True THEN
        BEGIN
        itemnet:=accdatamoduleform.cdsSalesperpriceunit.AsFloat;
        itemtaxname:=accdatamoduleform.cdsinventoryvatonsale.Value;
        taxrate:=accdatamoduleform.Gettaxrate(itemtaxname);
        invmeasure:=accdatamoduleform.cdsinventorymeasure.Value;
        invgroup:=accdatamoduleform.cdsinventoryinventorygroup.Value;
        sellmeasure:=accdatamoduleform.cdsSalessoldby.Value;
        invunitspersaleitem:=accdatamoduleform.cdssalesequivalent.AsFloat*accdatamoduleform.cdssalespricedby.AsFloat;
        IF invmeasure<>sellmeasure THEN
          BEGIN
          equiv:=accdatamoduleform.getequivalent(sellmeasure,invmeasure);
          IF equiv=-1 THEN
            BEGIN
            IF Tfmeasure.Execute(sellmeasure)<>'nil' THEN equiv:=accdatamoduleform.getequivalent(sellmeasure,invmeasure) ELSE equiv:=-1;
            END;
          END ELSE equiv:=1;
        IF equiv=-1 THEN
          BEGIN
          messagedlg('','Cannot add this item. No translation between '+sellmeasure+' and '+invmeasure+' available',mterror,[mbOK],0);
          exit;
          END;
        IF Xstate='insale' THEN
          BEGIN
          with AccDatamoduleform.cdssalelist do
            begin
            IF (accdatamoduleform.cdssalelist.IsEmpty=false)AND(accdatamoduleform.cdssalelistshift.Value<>currentshift) THEN
              BEGIN
              tshift:=accdatamoduleform.cdssalelistshift.Value;
              tstation:=accdatamoduleform.cdssaleliststation.Value;
              tuser:=accdatamoduleform.cdssalelistoperator.Value;
              ttransref:=accdatamoduleform.cdssalelistsaleref.Value;
              ttransname:=accdatamoduleform.cdssalelistsalename.Value;
              END ELSE
              BEGIN
              tshift:=currentshift;
              tstation:=stationname;
              tuser:=susername;
              ttransref:=transref;
              ttransname:=transname;
              END;
            IndexName:='itemorder';
            SetKey;
            FieldByName('invitem').asinteger :=invitem;
            FieldByName('saleitem').asinteger :=saleitem;
            keyfound:=GotoKey;
            IndexName:='saleorder';
            IF keyfound=true THEN
              BEGIN
              {edit the current item}
              Accdatamoduleform.cdssalelist.Edit;
              END ELSE
              BEGIN
              {it's non inv - put it just above the total}
              IF Accdatamoduleform.cdssalelist.locate('invitem',-2,[])=true THEN
                BEGIN
                Accdatamoduleform.cdssalelist.Insert;
                END ELSE
                BEGIN
                Accdatamoduleform.cdssalelist.last;
                Accdatamoduleform.cdssalelist.Append;
                END;
              END;
            end;
          END ELSE Accdatamoduleform.cdssalelist.Edit;

        accdatamoduleform.cdssalelistinvitem.Value:=invitem;
        accdatamoduleform.cdssalelistsaleitem.Value:=saleitem;
        Accdatamoduleform.cdssalelistmeasure.Value:=accdatamoduleform.cdsSalessoldby.Value;
        IF xstate='insale' THEN
        oldamount:=Accdatamoduleform.cdssalelistsalecount.asfloat ELSE oldamount:=0;
        amount:=amount+oldamount;
        itemvat:=roundto(itemnet*taxrate,-3); {this is the total rate of all taxes if more than one}
        itemgross:=roundto(itemnet+itemvat,-3);

        totnet:=itemnet*amount;
        totvat:=roundto(totnet*taxrate,-3);
        totgross:=roundto(totnet+totvat,-2);
        totnet:=roundto(totgross-totvat,-3);

        Accdatamoduleform.cdssalelistsalecount.asfloat:=amount;
        {the salequantity is the salecount multiplied by the amount in each sale}
        Accdatamoduleform.cdssalelistsalequantity.AsFloat:=amount*accdatamoduleform.cdssalespricedby.asfloat;
        Accdatamoduleform.cdssalelistpricegrosseach.asfloat:=itemgross;
        Accdatamoduleform.cdssalelistpriceneteach.asfloat:=itemnet;

        Accdatamoduleform.cdssalelisttotalnetprice.asfloat:=totnet;
        Accdatamoduleform.cdssalelisttotalgrossprice.asfloat:=totgross;
        Accdatamoduleform.cdssalelistbuyer.Value:='-';
        accdatamoduleform.cdssalelistsrcacc.Value:=-1; {not known at present}
        Accdatamoduleform.cdssalelistsaleref.Value:=ttransref;
        Accdatamoduleform.cdssalelistsalename.Value:=ttransname;
        Accdatamoduleform.cdssalelistitemname.Value:=accdatamoduleform.cdsSalesdescription.Value;
        Accdatamoduleform.cdssalelisttotaltax.asfloat:=totvat;
        Accdatamoduleform.cdssalelisttaxstring.Value:=itemtaxname;
        Accdatamoduleform.cdssalelistcurrency.Value:=transcurrency;
        Accdatamoduleform.cdssalelistequiv.AsFloat:=conversionrate;
        {the inventoried quantity should be the absolute value sold expressed in inventory units}
        Accdatamoduleform.cdssalelistinvquantity.AsFloat:=amount*invunitspersaleitem;
        Accdatamoduleform.cdssalelistoperator.Value:=tuser;
        Accdatamoduleform.cdssaleliststation.Value:=tstation;
        Accdatamoduleform.cdssalelistcheque.Value:='-';
        accdatamoduleform.cdssalelistlorder.Value:='A';
        Accdatamoduleform.cdssalelistshift.Value:=tshift;
        Accdatamoduleform.cdssalelistinventorygroup.Value:=invgroup;
        Accdatamoduleform.cdssalelist.Post;
        Calculatesum(false);
        setstate('insale');
        END;
      END;
    END ELSE
  IF Cashsale=true THEN
    BEGIN
    Calculatesum(false);
    setstate('insale');
    END;
  END;


Procedure Taccsalesform.Loadbuttons(level:Integer);
Var
i:Integer;
Buttonname,buttonnumber:String;
Buttonno:Integer;
BEGIN
IF Quickkeypanel.visible=true THEN
  BEGIN
  IF Accdatamoduleform.cdspicklist.Active=false THEN Accdatamoduleform.cdspicklist.Active:=true;
  IF Accdatamoduleform.cdspicklist.changecount=0 THEN Accdatamoduleform.cdspicklist.Refresh;
  currlevel:=level;
  {prevlevel is the current level BEFORE we refilter}
  IF currlevel=0 THEN prevlevel:=-1 ELSE
  prevlevel:=accdatamoduleform.cdspicklistlevel.Value;

  IF prevlevel=-1 THEN btnBack.Visible:=false ELSE btnBack.Visible:=true;
  IF currlevel=0 THEN btnHome.visible:=false ELSE btnHome.visible:=true;
  Accdatamoduleform.cdspicklist.Filter:='level = '''+inttostr(currlevel)+'''';
  Accdatamoduleform.cdspicklist.Filtered:=true;
  IF accdatamoduleform.cdspicklist.IsEmpty=false THEN
  Statusbar2.SimpleText:='QK level '+inttostr(currlevel)+' '+accdatamoduleform.cdspicklistlevelname.Value
  ELSE Statusbar2.SimpleText:='Level '+inttostr(currlevel)+' contains no active buttons';

  {recursive procedure to replace the monstrosity below}
  FOR i:=0 TO quickkeypanel.ControlCount-1 do
    BEGIN
    IF quickkeypanel.Controls[i] is TButton THEN
      BEGIN
      With quickkeypanel.Controls[i] as TButton do
        BEGIN
      	{get the name}
      	Buttonname:=Name;
      	Buttonnumber:=Buttonname;
      	IF (length(buttonnumber)>6)AND(Buttonnumber[1]='B')AND(Buttonnumber[2]='u')  THEN
          BEGIN
      	  delete(buttonnumber,1,6);
            Try
            Buttonno:=strtoint(buttonnumber);
            IF accdatamoduleform.cdspicklist.Locate('button',buttonno,[])=true THEN
              BEGIN
              Visible:=true;
              Caption:=accdatamoduleform.cdspicklisttext.Value;
              Font.Color:=stringtocolor(accdatamoduleform.cdspicklisttextcolour.asstring);
              Color:=stringtocolor(accdatamoduleform.cdspicklistbuttoncolour.asstring);
              END ELSE
              BEGIN
              IF (xstate<>'inqkset')AND(xstate<>'inqklevelsel')
              AND(xstate<>'inqkprodsel')AND(xstate<>'inqkcaption')
              AND(xstate<>'inqkcolsel') THEN
              Visible:=false ELSE
                BEGIN
                Visible:=true;
                Caption:='Not Set';
                Font.Color:=clBlack;
        	Color:=clButton;
              	END;
              END;
            Except
            {aaarrgghhh}
            End;
          END; {a numbered button}
        END; {with quickkeypanel.controls[i] do}
      END; {for i:= 0 to ...}
    END;
  END;
END;


Procedure Taccsalesform.setF2(name:String;active:Boolean);
BEGIN
btnF2.Caption:=name;
IF active=true THEN
  BEGIN
  BtnF2.Enabled:=true;
  BtnF2.font.color:=clLime;
  END ELSE
  BEGIN
  BtnF2.Enabled:=false;
  BtnF2.font.color:=clGray;
  END;
END;

Procedure Taccsalesform.setF3(name:String;active:Boolean);
BEGIN
btnF3.Caption:=name;
IF active=true THEN
  BEGIN
  BtnF3.Enabled:=true;
  BtnF3.font.color:=clLime;
  END ELSE
  BEGIN
  BtnF3.Enabled:=false;
  BtnF3.font.color:=clGray;
  END;
END;

Procedure Taccsalesform.setF4(name:String;active:Boolean);
BEGIN
btnF4.Caption:=name;
IF active=true THEN
  BEGIN
  BtnF4.Enabled:=true;
  BtnF4.font.color:=clLime;
  END ELSE
  BEGIN
  BtnF4.Enabled:=false;
  BtnF4.font.color:=clGray;
  END;
END;

Procedure Taccsalesform.setF5(name:String;active:Boolean);
BEGIN
btnF5.Caption:=name;
IF active=true THEN
  BEGIN
  BtnF5.Enabled:=true;
  BtnF5.font.color:=clLime;
  END ELSE
  BEGIN
  BtnF5.Enabled:=false;
  BtnF5.font.color:=clGray;
  END;
END;
Procedure Taccsalesform.setF6(name:String;active:Boolean);
BEGIN
btnF6.Caption:=name;
IF active=true THEN
  BEGIN
  BtnF6.Enabled:=true;
  BtnF6.font.color:=clLime;
  END ELSE
  BEGIN
  BtnF6.Enabled:=false;
  BtnF6.font.color:=clGray;
  END;
END;

Procedure Taccsalesform.setF7(name:String;active:Boolean);
BEGIN
btnF7.Caption:=name;
IF active=true THEN
  BEGIN
  BtnF7.Enabled:=true;
  BtnF7.font.color:=clLime;
  END ELSE
  BEGIN
  BtnF7.Enabled:=false;
  BtnF7.font.color:=clGray;
  END;
END;


Procedure Taccsalesform.MakeLetters(Colour:TColor);
Var
fontsize,i:integer;
BEGIN
fontsize:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'settings','kbfontsize','12'));
FOR i:=0 TO keyboardpanel.ControlCount-1 do
  BEGIN
  IF keyboardpanel.Controls[i] is TButton THEN
  With Keyboardpanel.Controls[i] as TButton do
    BEGIN
    font.Color:=colour;
    font.Size:=fontsize;
    END;
  END;
END;

Procedure Taccsalesform.Makenumbers(colour:TColor);
Var
i:integer;
BEGIN
FOR i:=0 TO infopanel.ControlCount-1 do
  BEGIN
  IF infopanel.Controls[i] is TButton THEN
  With infopanel.Controls[i] as TButton do
    BEGIN
    font.Color:=colour;
    END;
  END;
END;


Procedure Taccsalesform.Calculatesum(addtax:Boolean);
type
 TNumbers = set of Char;
var
Numbers:TNumbers;
i,itax,iInvitem:Integer;
Thistaxrate,itemquantity:Double;
Thisnet,Thistax,Thisgross:Double; {The total values for this item}
itemgross,itemnet,itemtax:Double; {The unit values for this item}
sumitemtax:Double; {The sum of all taxes for this item per unit}
totalitemtax:Double;
stax,sTaxstring:String;
Done,nontaxfound:Boolean;
BEGIN
accdatamoduleform.dssalelist.Enabled:=false;
Numbers:=['0','1','2','3','4','5','6','7','8','9'];
{what we do here is recalculate sumnet, sumtax and sumgross}
{then subtract payments already made}
IF accdatamoduleform.cdssalelist.RecordCount>0 THEN
  BEGIN
  Sumnet:=0;
  Sumtax:=0;
  Sumgross:=0;
  balance:=0;
  cashpay:=0;
  {see if "total" exists}
  IF accdatamoduleform.cdssalelist.Locate('itemname','Total',[])=True THEN totalexists:=True ELSE Totalexists:=False;
  {cash back is only allowed with Switch}
  IF (accdatamoduleform.cdssalelist.Locate('itemname',cashbackstring,[])=True)
  AND (pMethod<>'MAESTRO') THEN
    BEGIN
    accdatamoduleform.cdssalelist.Delete;
    eselection.Text:=formatcurr('0.00',sumgross);
    END;
  {we'll also zero all the entries in the local taxes table}
  IF accdatamoduleform.cdslocaltax.isempty=false THEN
    BEGIN
    accdatamoduleform.cdslocaltax.first;
      REPEAT
      accdatamoduleform.cdslocaltax.edit;
      accdatamoduleform.cdslocaltaxamount.value:=0;
      accdatamoduleform.cdslocaltax.post;
      IF accdatamoduleform.cdslocaltax.eof=false THEN accdatamoduleform.cdslocaltax.next;
      UNTIL accdatamoduleform.cdslocaltax.eof=true;
    END;

  {This sums all items which are not totals or tax descriptions}
  accdatamoduleform.cdssalelist.first;
    REPEAT
    sumitemtax:=0;
    iInvitem:=accdatamoduleform.cdssalelistinvitem.Value;
    IF (iInvitem<>-2) THEN
      BEGIN
      {items with an inventory code of -2 are not included in the sum}
      Itemnet:=accdatamoduleform.cdssalelistpriceneteach.AsFloat;
      Itemquantity:=accdatamoduleform.cdssalelistsalecount.AsFloat;
      Thisgross:=accdatamoduleform.cdssalelisttotalgrossprice.AsFloat; {this is the actual selling price of the item}
      Thisnet:=accdatamoduleform.cdssalelisttotalnetprice.AsFloat;

      Sumnet:=Sumnet+Thisnet; {a running total of the net value of our sale}
      {we also want to update the localtaxes table which we cleared above}
      sTaxstring:=accdatamoduleform.cdssalelisttaxstring.Value;
      {now process the taxes}
      {First take out spaces}
      IF length(staxstring)>0 THEN
        BEGIN
        i:=1;
          REPEAT
          IF i<=length(staxstring) THEN
            BEGIN
            IF staxstring[i]=' 'THEN Delete(staxstring,i,1) ELSE i:=i+1;
            END;
          UNTIL i>length(staxstring);
        END;
      IF length(staxstring)>0 THEN
        BEGIN
        stax:=''; {a string}
        {extract the taxes from it. Take each tax in turn and multiply thisnet by it}
        i:=1;
          REPEAT
          IF (i<=length(staxstring))THEN
            BEGIN
            {taxstring is a list of numbers separated by commas. We extract anything that is a number}
            IF staxstring[i]in numbers THEN
              BEGIN
              Insert(staxstring[i],stax,length(stax)+1);
              END;
            IF (not(staxstring[i]in numbers))OR((i=length(staxstring))AND(stax<>''))THEN
              BEGIN
              itax:=strtoint(stax);
              thistaxrate:=accdatamoduleform.Gettaxrate(stax);
              stax:='';
              itemtax:=thistaxrate*itemnet;
              thistax:=(roundto(itemtax*itemquantity,-2));
              sumitemtax:=sumitemtax+thistax; {total tax per unit for this item}
              IF thistax>0 THEN
                BEGIN
                IF accdatamoduleform.cdslocaltax.locate('item',itax,[])=true THEN
                  BEGIN
                  {Edit the amount}
                  {need a field for the total net amount too}
                  totalitemtax:=accdatamoduleform.cdslocaltaxamount.value;
                  totalitemtax:=totalitemtax+thistax;
                  accdatamoduleform.cdslocaltax.Edit;
                  accdatamoduleform.cdslocaltaxamount.value:=totalitemtax;
                  accdatamoduleform.cdslocaltax.Post;
                  END ELSE
                  BEGIN
                  accdatamoduleform.cdslocaltax.Append;
                  accdatamoduleform.cdslocaltaxitem.Value:=accdatamoduleform.cdstaxesitem.Value;
                  accdatamoduleform.cdslocaltaxdescription.Value:=accdatamoduleform.cdstaxesdescription.Value;
                  accdatamoduleform.cdslocaltaxrate.AsFloat:=accdatamoduleform.cdstaxesrate.AsFloat;
                  accdatamoduleform.cdslocaltaxamount.ascurrency:=thistax;
                  accdatamoduleform.cdslocaltax.Post;
                  END;{Not found in local taxes}
                END;
              END;{a valid tax is found}
            END;{i is <length(taxstring}
          i:=i+1;
          UNTIL i>length(staxstring);
        END;{length(taxstring)>0}
      {we know thisnet and sumvat, now generate the total amount}
      sumtax:=sumtax+sumitemtax;
      sumgross:=sumgross+thisgross; {thisgross was rounded to 2dp before being posted}
      END;{Invitem <> - 2}
    IF accdatamoduleform.cdssalelist.Eof=False THEN accdatamoduleform.cdssalelist.Next;
    UNTIL accdatamoduleform.cdssalelist.Eof=True;

  {Now we sort out the payment items}
  {First we want to find where the total goes}
  IF sumgross>0 THEN
    BEGIN
    Balance:=sumgross;
    IF Totalexists=true THEN
      BEGIN
      Accdatamoduleform.cdssalelist.Locate('itemname','Total',[]);
      Accdatamoduleform.cdssalelist.Edit;
      END ELSE
      BEGIN
      {Shownet is a global variable which determines whether we show net values or gross ones}
      {If shownet is true, the order is: sale items, taxes, total, paid, change}
      {If not, the order is sale items, total, paid, change, taxes}
      IF shownet=false THEN
        BEGIN
        {find the first item with invcode -2}
        IF accdatamoduleform.cdssalelist.Locate('invitem',-2,[])=True THEN
        Accdatamoduleform.cdssalelist.Insert ELSE Accdatamoduleform.cdssalelist.Append;
        END ELSE
        BEGIN
        IF accdatamoduleform.cdssalelist.locate('invitem',-2,[])=True THEN
          BEGIN
          {find the first item with invcode -2 that isn't a tax}
          nontaxfound:=false;
            REPEAT
            IF accdatamoduleform.cdslocaltax.locate('description',accdatamoduleform.cdssalelistitemname.Value,[loCaseinsensitive])=True THEN
            accdatamoduleform.cdssalelist.next ELSE nontaxfound:=true;
            done:=(nontaxfound=true)OR(accdatamoduleform.cdssalelist.eof=true);
            UNTIL Done=true;
          IF accdatamoduleform.cdssalelist.eof=false THEN Accdatamoduleform.cdssalelist.Insert ELSE Accdatamoduleform.cdssalelist.append;
          END ELSE
          BEGIN
          Accdatamoduleform.cdssalelist.append;
          END;
        END;
      END;
    Accdatamoduleform.cdssalelistinvitem.Value:=-2;
    Accdatamoduleform.cdssalelistsaleitem.Value:=0;
    Accdatamoduleform.cdssalelistmeasure.Value:='-';
    Accdatamoduleform.cdssalelistsalecount.AsFloat:=0;
    Accdatamoduleform.cdssalelistpriceneteach.AsFloat:=0;
    Accdatamoduleform.cdssalelistpricegrosseach.AsFloat:=0;
    Accdatamoduleform.cdssaleliststatus.Value:=transstatus;
    Accdatamoduleform.cdssalelistbuyer.Value:='-';
    Accdatamoduleform.cdssalelistdate.Value:=commitdate;
    Accdatamoduleform.cdssalelisttime.Value:=committime;
    Accdatamoduleform.cdssalelistsrcacc.Value:=0;
    Accdatamoduleform.cdssalelistsaleref.Value:=transref;
    Accdatamoduleform.cdssalelistsalename.Value:=transname;
    Accdatamoduleform.cdssalelistitemname.Value:='Total';
    Accdatamoduleform.cdssalelisttotalnetprice.ascurrency:=sumnet;
    Accdatamoduleform.cdssalelisttotaltax.ascurrency:=sumitemtax;
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=sumgross;
    Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
    Accdatamoduleform.cdssalelistcurrency.Value:=transcurrency;
    Accdatamoduleform.cdssalelistequiv.AsFloat:=conversionrate;
    IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
    Accdatamoduleform.cdssalelist.Post;
    Totalexists:=True;
    END ELSE
    BEGIN
    {delete the current sale}
    Accdatamoduleform.conn.ExecuteDirect('Delete from salelist where (saleno = '''+currentsale+''')AND (status = '''+inttostr(stationnumber)+''')');
    Loadsale(currentsale);
    Totalexists:=false;
    END;

  {at the end of this we have the net and gross totals}
  {Items with invitem = -2 will be total, change, tax and any sums paid}
  {Any tax items will have net and gross = 0  and tax = relevant amounts}
  {now we have the totals, let's see what has been paid}
  {Start by locating the first item with invcode -2}
  IF accdatamoduleform.cdssalelist.Locate('invitem',-2,[])=True THEN
    BEGIN
    IF accdatamoduleform.cdssalelist.RecNo<=accdatamoduleform.cdssalelist.RecordCount THEN
      BEGIN
        REPEAT
        IF (accdatamoduleform.cdssalelistinvitem.Value=-2)AND(accdatamoduleform.cdssalelistitemname.value<>'Total')AND(accdatamoduleform.cdssalelistitemname.value<>'Change')
	  AND (accdatamoduleform.cdslocaltax.locate('description',accdatamoduleform.cdssalelistitemname.value,[loCaseInsensitive])=False) THEN
          BEGIN
          balance:=balance-accdatamoduleform.cdssalelisttotalgrossprice.ascurrency;
          cashpay:=cashpay+accdatamoduleform.cdssalelisttotalgrossprice.AsCurrency;
          END;
        IF accdatamoduleform.cdssalelist.eof=false THEN accdatamoduleform.cdssalelist.next;
        UNTIL accdatamoduleform.cdssalelist.eof=true;
      END;
    END;
  {now we have the outstanding balance}
  IF (pMethod='CASH') THEN
    BEGIN
    IF Balance<0 THEN
      BEGIN
      IF accdatamoduleform.cdssalelist.Locate('Itemname','Change',[])=False THEN
      {we add another entry with the change}
      Accdatamoduleform.cdssalelist.Append
      ELSE Accdatamoduleform.cdssalelist.Edit;
      accdatamoduleform.cdssalelistinvitem.Value:=-2;
      accdatamoduleform.cdssalelistsaleitem.Value:=xaccountno;
      Accdatamoduleform.cdssaleliststatus.Value:=transstatus;
      Accdatamoduleform.cdssalelistbuyer.Value:='-';
      Accdatamoduleform.cdssalelistdate.Value:=commitdate;
      Accdatamoduleform.cdssalelisttime.Value:=committime;
      Accdatamoduleform.cdssalelistsrcacc.Value:=0;
      Accdatamoduleform.cdssalelistsaleref.Value:=transref;
      Accdatamoduleform.cdssalelistsalename.Value:=transname;
      Accdatamoduleform.cdssalelistitemname.Value:='Change';
      Accdatamoduleform.cdssalelisttotalgrossprice.Ascurrency:=(Balance*-1);
      Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
      Accdatamoduleform.cdssalelistcurrency.Value:=transcurrency;
      Accdatamoduleform.cdssalelistequiv.AsFloat:=conversionrate;
      IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
      Accdatamoduleform.cdssalelist.Post;
      END ELSE
      BEGIN
	 {If the balance is positive, we take out the change if it exists}
	 IF accdatamoduleform.cdssalelist.Locate('Itemname','Change',[])=True THEN
	 accdatamoduleform.cdssalelist.delete;
	 END;
    END;

  {Finally, we stick in any positive tax entries and take out any negative ones}
  IF addtax=true THEN
    BEGIN
      IF accdatamoduleform.cdslocaltax.isempty=false THEN
      BEGIN
      accdatamoduleform.cdslocaltax.first;
      accdatamoduleform.cdstaxes.Locate('item',accdatamoduleform.cdslocaltaxitem.Value,[]);
        REPEAT
        IF accdatamoduleform.cdssalelist.locate('itemname',accdatamoduleform.cdslocaltaxdescription.Value,[])=true THEN
          BEGIN
          {If we find the tax item there, we either edit it or, if there is no amount associated with this tax, we delete it}
          IF accdatamoduleform.cdslocaltaxamount.value=0 THEN accdatamoduleform.cdssalelist.delete ELSE
            BEGIN
            accdatamoduleform.cdssalelist.edit;
            accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=accdatamoduleform.cdslocaltaxamount.value;
            accdatamoduleform.cdssalelist.Post;
            END;
          END ELSE
        IF accdatamoduleform.cdslocaltaxamount.Value<>0 THEN
          BEGIN
          IF shownet=false THEN
            BEGIN
            {The tax items go last}
            accdatamoduleform.cdssalelist.last;
            accdatamoduleform.cdssalelist.append;
            END ELSE
            BEGIN
            {The tax items go first after the sale items}
            IF accdatamoduleform.cdssalelist.locate('invitem',-2,[])=true
            THEN accdatamoduleform.cdssalelist.insert ELSE
              BEGIN
              accdatamoduleform.cdssalelist.last;
              accdatamoduleform.cdssalelist.append;
              END;
            END;
          accdatamoduleform.cdssalelistinvitem.Value:=-2;
          accdatamoduleform.cdssalelistsaleitem.Value:=accdatamoduleform.cdstaxesaccount.Value;
      	  Accdatamoduleform.cdssaleliststatus.Value:=transstatus;
    	  Accdatamoduleform.cdssalelistbuyer.Value:='-';
    	  Accdatamoduleform.cdssalelistdate.Value:=commitdate;
          Accdatamoduleform.cdssalelisttime.Value:=committime;
          Accdatamoduleform.cdssalelistsrcacc.Value:=0;
    	  Accdatamoduleform.cdssalelistsaleref.Value:=transref;
    	  Accdatamoduleform.cdssalelistsalename.Value:=transname;
    	  Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
          accdatamoduleform.cdssalelistitemname.Value:=accdatamoduleform.cdslocaltaxdescription.value;
          accdatamoduleform.cdssalelisttotalgrossprice.Ascurrency:=accdatamoduleform.cdslocaltaxamount.AsCurrency;
          Accdatamoduleform.cdssalelistcurrency.Value:=transcurrency;
          Accdatamoduleform.cdssalelistequiv.AsFloat:=conversionrate;
      	  IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
          accdatamoduleform.cdssalelist.post;
          END;
        IF accdatamoduleform.cdslocaltax.eof=false THEN accdatamoduleform.cdslocaltax.next;
        UNTIL accdatamoduleform.cdslocaltax.eof=true;
      END;
    END;
  IF balance>=0 THEN esaledescr.Text:='Balance due '+Formatcurr(currencystring+'0.00',balance) ELSE
  IF balance<0 THEN esaledescr.Text:='Change due '+Formatcurr(currencystring+'0.00',(balance*-1));
  END;
accdatamoduleform.dssalelist.Enabled:=true;
END;

Procedure Taccsalesform.Setstate(state:String);
  BEGIN
  lbpicklist.MultiSelect:=false;
  lbpicklist.Sorted:=true;
  eselection.Clear;
  eselection.EchoMode:=emNormal;
  eselection.CharCase:=ecuppercase;
  btnF2.default:=false;
  IF state='catatonic' THEN
    BEGIN
    Statusbar2.SimpleText:='There is a problem. Please contact your system administrator';
    SetF2('-',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('-',False);
    xstate:='catatonic';
    eselection.readonly:=true;
    END ELSE
  IF state='active' THEN
    BEGIN
    Statusbar2.SimpleText:='Click "Sale" to start a new sale or "Recall" to pick up a stored one';
    xstate:='active';
    {for testing}
    Try
    accdatamoduleform.sqlallSales.close;
    accdatamoduleform.sqlallSales.commandtext:='SELECT * FROM sales WHERE (active = true)';
    accdatamoduleform.cdsallsales.Active:=true;
    Except
    Messagedlg('','Cannot load product list - database may be unavailable.',mterror,[mbOK],0);
    End;
    IF isadmin=true THEN
    SetF2('Special',True) ELSE SetF2('Special',False);
    SetF3('Sale',True);
    SetF4('Refund',True);
    SetF5('-',False);
    IF accdatamoduleform.cdssalelist.Active=false THEN
    accdatamoduleform.cdssalelist.Active:=true;
    accdatamoduleform.cdssalelist.EmptyDataSet;

    {recall is available if there are stored sales}
    {We open the pensalelist dataset and clear it}
    SetF7('Logout',True);
    makeLetters(clGray);
    makenumbers(clGray);
    quickkeypanel.Visible:=false;
    btnHome.Click;
    eselection.readonly:=false;
    {esaledescr.Clear;}
    lbpicklist.Clear;
    SetF6('Recall',True);

    {IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
    Loadsale(accdatamoduleform.cdssalelistsaleno.Value);}
    END ELSE
  IF state='inrecall' THEN
    BEGIN
    Statusbar2.SimpleText:='Select a stored sale to recall';
    xstate:='inrecall';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    eselection.readonly:=false;
    eselection.clear;
    END ELSE
  IF state='insale' THEN
    BEGIN
    Statusbar2.SimpleText:='Sale number '+currentsale;
    xstate:='insale';
    makeletters(clLime);
    makenumbers(clLime);
    quickkeypanel.Visible:=true;
    selbutton:=0;
    Loadbuttons(0);
    eselection.Clear;
    esaledescr.Clear;
    selectedinv:=-1;
    selectedsale:=-1;
    selectedamt:=1;
    amtstring:='1';
    Firstentry:=true;
    SetF2('Cash Tend',False);
    SetF3('Receipt',True);
    SetF4('Add',False);
    IF accdatamoduleform.cdssalelist.RecordCount>0 THEN
      BEGIN
      SetF5('Payment',True);
      SetF6('Suspend',True);
      END ELSE
      BEGIN
      SetF5('Payment',False);
      SetF6('Suspend',False);
      END;
    SetF7('Cancel',True);
    END ELSE
  IF state='inprint' THEN
    BEGIN
    xstate:='inprint';
    SetF2('-',False);
    SetF3('Receipt',True);
    SetF4('Check',True);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END;
  IF state='idle' THEN
    BEGIN
    accdatamoduleform.cdssalelist.Active:=false;
    Statusbar2.SimpleText:='POS build 18-09-2012 16:22 Press "Login" to start';
    xstate:='idle';
    {If we've reached the "idle" state then the server and}
    {admin password must be correct. We save these locally}
    lbpicklist.Clear;
    SetF2('Login',True);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('-',False);
    eselection.readonly:=true;
    eselection.EchoMode:=emNormal;
    END ELSE
  IF state='getdatabase' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the database you want to connect to';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Close',True);
    xstate:='getdatabase';
    eselection.readonly:=false;
    eselection.EchoMode:=emNormal;
    eselection.Text:='database:';
    eselection.SetFocus;
    eselection.SelStart:=9;
    END ELSE
  IF state='inlogin' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter your login name and press Enter';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Cancel',True);
    xstate:='inlogin';
    eselection.Text:='Login:';
    eselection.readonly:=false;
    eselection.EchoMode:=emNormal;
    eselection.SetFocus;
    eselection.SelStart:=6;
    btnF2.Default:=true;
    END ELSE
  IF state='inpassword' THEN
    BEGIN
    eselection.charcase:=ecnormal;
    Statusbar2.SimpleText:='Enter your password';
    SetF2('Enter',True);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Cancel',False);
    xstate:='inpassword';
    eselection.SetFocus;
    eselection.EchoMode:=emPassword;
    btnF2.Default:=true;
    END ELSE
  IF state='intransname' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter a name for this transaction or press enter to accept the default name';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    xstate:='intransname';
    btnF2.Default:=true;
    END ELSE
  IF state='newshift' THEN
    BEGIN
    Statusbar2.SimpleText:='Click new shift to start - you can enter a name for the shift if you want';
    xstate:='newshift';
    SetF2('-',False);
    SetF3('Clear',True);
    SetF4('New shift',True);
    SetF5('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Logout',True);
    eselection.readonly:=false;
    END ELSE
  IF state='acceptshift' THEN
    BEGIN
    Statusbar2.SimpleText:='Click to accept the new shift name';
    xstate:='acceptshift';
    SetF2('-',False);
    SetF3('Clear',True);
    SetF4('Accept',True);
    SetF5('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Logout',True);
    eselection.readonly:=false;
    END ELSE
  IF state='control' THEN
    BEGIN
    Statusbar2.SimpleText:='This is the control menu. You can do sales readings and change various settings here';
    xstate:='control';
    Accdatamoduleform.sqlsaletot.Close;
    Accdatamoduleform.cdssaletot.Close;
    accdatamoduleform.sqlsaletot.CommandText:='SELECT * FROM salelist where shift = '''+inttostr(currentshift)+'''';
    Accdatamoduleform.cdssaletot.Open;
    accdatamoduleform.cdssaletot.Filter:='Status = ''A''';
    accdatamoduleform.cdssaletot.Filtered:=true;
    IF accdatamoduleform.cdssaletot.RecordCount>0 THEN
    SetF2('Readings',True) ELSE
    SetF2('Readings',False);
    SetF3('Setup',True);
    accdatamoduleform.cdssaletot.Filter:='(Status = ''A''OR status = ''-2'' or status = ''R'') ';
    IF accdatamoduleform.cdssaletot.Recordcount>0 THEN
    SetF4('Sales',True) ELSE
    SetF4('Sales',True); {temp for testing!}
    SetF5('Exit',True);
    SetF6('QK setup',True);
    SetF7('Back',True);
    eselection.readonly:=false;
    quickkeypanel.Visible:=false;
    loadbuttons(0);
    END ELSE
  IF state='clone' THEN
    BEGIN
    xstate:='clone';
    Statusbar2.SimpleText:='Select terminal to copy quickkeys from';
    SetF2('',False);
    SetF3('Clone',False);
    SetF4('',False);
    SetF5('',False);
    SetF6('',False);
    SetF7('Back',True);
      BEGIN
      accdatamoduleform.sstationlist.close;
      accdatamoduleform.sstationlist.Open;
      lbpicklist.Clear;
      IF accdatamoduleform.sstationlist.IsEmpty=false THEN
        BEGIN
        accdatamoduleform.sstationlist.First;
          REPEAT
          IF accdatamoduleform.sstationliststation.Value<>stationname THEN lbpicklist.Items.Add(accdatamoduleform.sstationliststation.Value);
          IF accdatamoduleform.sstationlist.Eof=false THEN accdatamoduleform.sstationlist.Next;
          UNTIL accdatamoduleform.sstationlist.Eof=true;
        SetF3('Clone',True);
        END;
      END;
    END ELSE
  IF state='saleadmin' THEN
    BEGIN
    {allow admin user to view/reallocate sales}
    {need to prevent any additions to completed sales}
    {we'll allow viewing of sales with A flag (cash totals), -2 (card/cash sales), R(charged to rooms)}
    xstate:='saleadmin';
    SetF2('Group cash',True);
    SetF3('Individual',True);
    SetF4('On Rooms',True);
    SetF5('',True);
    SetF6('',True);
    SetF7('Back',True);
    eselection.readonly:=true;
    END ELSE
  IF state='inreadings' THEN
    BEGIN
    lbPicklist.Sorted:=false;
    Statusbar2.SimpleText:='Z reading will end this shift. X reading gives total so far';
    xstate:='inreadings';
    SetF2('X',True);
    SetF3('Z',True);
    SetF4('Print',False);
    SetF5('Set Printer',True);
    SetF6('-',False);
    SetF7('Back',True);
    eselection.readonly:=true;
    END ELSE
  IF state='getserver' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the address of the server';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Close',True);
    xstate:='getserver';
    eselection.readonly:=false;
    eselection.EchoMode:=emNormal;
    eselection.Text:='server:';
    eselection.SetFocus;
    eselection.SelStart:=7;
    btnF2.Default:=true;
    END ELSE
  IF state='getpassword' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the admin password';
    eselection.CharCase:=ecnormal;
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Close',True);
    xstate:='getpassword';
    eselection.EchoMode:=emPassword;
    eselection.readonly:=false;
    eselection.SetFocus;
    btnF2.Default:=true;
    END ELSE
  IF state='setup' THEN
    BEGIN
    Statusbar2.SimpleText:='Setup menu: Select the item you want to change';
    lbpicklist.Clear;
    xstate:='setup';
    SetF2('Clone Terminal',True);
    SetF3('Set Database',True);
    SetF4('Set Server',True);
    SetF5('Printing',True);
    SetF6('Security',True);
    SetF7('Back',True);
    END ELSE
  IF state='insecurity' THEN
    BEGIN
    Statusbar2.SimpleText:='You can alter security settings here';
    xstate:='insecurity';
    SetF2('Users',True);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inusers' THEN
    BEGIN
    Statusbar2.SimpleText:='Click on a user to change the settings or click add to add a new user';
    xstate:='inusers';
    {list the users in the list box}
    {we'll use postgresql's list rather than ours}
    lbpicklist.Clear;
    eselection.clear;
    Accdatamoduleform.sqlusers.Active:=true;
    IF accdatamoduleform.sqlusers.IsEmpty=false THEN
      BEGIN
      Accdatamoduleform.sqlusers.First;
        REPEAT
        IF Accdatamoduleform.sqlusersusename.Value<>'postgres' THEN lbpicklist.items.Add(Accdatamoduleform.sqlusersusename.Value);
        IF Accdatamoduleform.sqlusers.eof=false THEN Accdatamoduleform.sqlusers.next;
        UNTIL Accdatamoduleform.sqlusers.eof=true;
      END;
    Accdatamoduleform.sqlusers.Active:=false;
    SetF2('Add',True);
    SetF3('Delete',False);
    SetF4('Password',False);
    SetF5('Settings',False);
    SetF6('Details',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuseradd' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the new user''s login name';
    eselection.clear;
    xstate:='inuseradd';
    {This is arranged like a wizard}
    SetF2('Name',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuseradd2' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the new user''s full name';
    eselection.clear;
    xstate:='inuseradd2';
    SetF2('Full name',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuseradd3' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the new user''s password';
    eselection.clear;
    xstate:='inuseradd3';
    eselection.CharCase:=ecnormal;
    eselection.EchoMode:=emPassword;
    SetF2('Password',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuseradd4' THEN
    BEGIN
    Statusbar2.SimpleText:='Is the new user allowed to be administrator? Default = no';
    eselection.clear;
    xstate:='inuseradd4';
    SetF2('Admin',True);
    SetF3('Not Admin',True);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuseradd5' THEN
    BEGIN
    Statusbar2.SimpleText:='Here''s what you have entered. Click confirm or go back to make changes';
    eselection.clear;
    lbpicklist.Clear;
    lbpicklist.Sorted:=false;
    lbpicklist.Items.Add('User: '+newuser);
    lbpicklist.Items.Add('Full name: '+newuserfull);
    lbpicklist.Items.Add('Password: '+'*********');
    IF accdatamoduleform.Getsysteminfo(sdatabase,'settings','needpass','false')='false' THEN
    newuserpassreq:=false ELSE newuserpassreq:=true;
    IF newuserpassreq=false THEN
    lbpicklist.Items.Add('Password not required') ELSE
    lbpicklist.Items.Add('Password required');
    IF newuseradmin=true THEN
    lbpicklist.Items.Add('Admin: true') ELSE
    lbpicklist.Items.Add('Admin: false');
    lbpicklist.Items.Add('Click Enter to accept');
    lbpicklist.Items.Add('or back to change');
    xstate:='inuseradd5';
    SetF2('Confirm',True);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    btnF2.Default:=true;
    END ELSE
  IF state='inuserdelete' THEN
    BEGIN
    Statusbar2.SimpleText:='Warning this will delete the selected user';
    xstate:='inuserdelete';
    SetF2('Confirm',True);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    btnF2.Default:=true;
    END ELSE
  IF state='inuserpass' THEN
    BEGIN
    Statusbar2.SimpleText:='Change the user''s password settings here';
    eselection.EchoMode:=emPassword;
    eselection.CharCase:=ecnormal;
    xstate:='inuserpass';
    SetF2('Enter',False);
    IF accdatamoduleform.Getsysteminfo('system','needpass',newuser,'false')='false' THEN
    SetF3('Need passwd',True) ELSE
    SetF3('No passwd',True);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inusersetting' THEN
    BEGIN
    Statusbar2.SimpleText:='Here you can set whether the user is active or administrator';
    xstate:='inusersetting';
    IF accdatamoduleform.Getsysteminfo('system','usersactive',newuser,'false')='false' THEN
    SetF2('Active',True) ELSE
    SetF2('Inactive',True);
    IF accdatamoduleform.Getsysteminfo('system','administrator',newuser,'false')='false' THEN
    SetF3('Admin',True) ELSE
    SetF3('No Admin',True);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuserdetails' THEN
    BEGIN
    Statusbar2.SimpleText:='You can change the user''s details here';
    xstate:='inuserdetails';
    SetF2('Full name',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inuserfullname' THEN
    BEGIN
    END ELSE
  IF state='insetprinter' THEN
    BEGIN
    Statusbar2.SimpleText:='You can turn printing on and off here';
    {we need to load all printers}
    lbpicklist.Items:=Printer.Printers;
    xstate:='insetprinter';
    SetF2('-',False);
    SetF3('-',False);
    SetF4('-',False);
    IF dontprint=true THEN
    SetF5('Print ON',True) ELSE
    SetF5('Print OFF',True);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inqkset' THEN
    BEGIN
    Statusbar2.SimpleText:='Select a quick key to program or edit';
    xstate:='inqkset';
    SetF2('Set caption',False);
    SetF3('Set level',False);
    SetF4('Set product',False);
    SetF5('Set colours',False);
    SetF6('Next level',False);
    quickkeypanel.Visible:=true;
    loadbuttons(currlevel);
    eselection.Clear;
    lbpicklist.clear;
    SetF7('Back',True);
    END ELSE
  IF state='inqklevelsel' THEN
    BEGIN
    IF nlevelname='Not Set' THEN
      BEGIN
      IF invitem<>-1 THEN
        BEGIN
        accdatamoduleform.cdsinventory.Locate('item',invitem,[]);
        Accdatamoduleform.cdssales.Locate('sitem',saleitem,[]);
        Statusbar2.SimpleText:='Button '+inttostr(selbutton)+' linked to product '+accdatamoduleform.cdssalesdescription.Value;
        END ELSE
      Statusbar2.SimpleText:='Button '+inttostr(selbutton)+' not linked to a level or product';
      END ELSE
    Statusbar2.SimpleText:='Button '+inttostr(selbutton)+' currently linked to '+nlevelname;
    xstate:='inqklevelsel';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    quickkeypanel.Visible:=false;
    {we also want to show all possible levels here except the}
    {current one}
    lbpicklist.Clear;
    accdatamoduleform.cdspicklist.Filtered:=false;
    IF accdatamoduleform.cdspicklist.IsEmpty=false THEN
      BEGIN
      accdatamoduleform.cdspicklist.First;
        REPEAT
        IF (lbpicklist.Items.IndexOf(accdatamoduleform.cdspicklistlevelname.Value)=-1)
        AND (accdatamoduleform.cdspicklistlevelname.Value<>'BASE')
        AND (accdatamoduleform.cdspicklistlevel.Value<>currlevel)
        THEN lbpicklist.Items.Add(accdatamoduleform.cdspicklistlevelname.Value);

        IF (lbpicklist.Items.IndexOf(accdatamoduleform.cdspicklistnlevelname.Value)=-1)
        AND (accdatamoduleform.cdspicklistnlevelname.Value<>'BASE')
        AND (accdatamoduleform.cdspicklistnlevelname.value<>'Not Set')
        AND (accdatamoduleform.cdspicklistnlevel.Value<>currlevel)
        THEN lbpicklist.Items.Add(accdatamoduleform.cdspicklistnlevelname.Value);

        IF accdatamoduleform.cdspicklist.eof=false THEN accdatamoduleform.cdspicklist.Next;
        UNTIL accdatamoduleform.cdspicklist.eof=true;
      IF (lbpicklist.Items.IndexOf('Not Set')=-1) THEN
      lbpicklist.Items.Insert(0,'Not Set');
      END;
    {we'll also add the possibility of a new item}
    IF (buttoncap<>'Not Set')
    AND (lbpicklist.Items.IndexOf(buttoncap)=-1) THEN
    lbpicklist.Items.Insert(0,buttoncap) ELSE
    lbpicklist.Items.Insert(0,'New level');
    END ELSE
  IF state='inqkprodsel' THEN
    BEGIN
    accdatamoduleform.cdsinventory.Locate('item',invitem,[]);
    IF accdatamoduleform.cdssales.Locate('sitem',saleitem,[])=true THEN
    Statusbar2.SimpleText:='Choose a product for this quick key. Currently: '+accdatamoduleform.cdssalesdescription.Value ELSE
    Statusbar2.SimpleText:='Choose a product for this quick key. Currently not set';
    xstate:='inqkprodsel';
    SetF2('Enter',False);
    SetF3('Reset',True);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    makeletters(clLime);
    eselection.Clear;
    esaledescr.Clear;
    quickkeypanel.Visible:=false;
    END ELSE
  IF state='inqkcaption' THEN
    BEGIN
    Statusbar2.SimpleText:='Choose a caption for the quick key (takes product name if not set)';
    xstate:='inqkcaption';
    SetF2('Enter',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    quickkeypanel.Visible:=false;
    eselection.readonly:=false;
    eselection.EchoMode:=emNormal;
    eselection.Text:='Caption:';
    eselection.SetFocus;
    eselection.SelStart:=9;
    END ELSE
  IF state='inqkcolsel' THEN
    BEGIN
    Statusbar2.SimpleText:='Pick a colour then choose "button" or "text"';
    xstate:='inqkcolsel';
    SetF2('-',False);
    SetF3('Button',True);
    SetF4('Text',True);
    SetF5('Reset',True);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='indiscount' THEN
    BEGIN
    Statusbar2.SimpleText:='Please enter the discount';
    xstate:='indiscount';
    Firstentry:=true;
    SetF2('Undo',False);
    SetF3('Amount',False);
    SetF4('Percentage',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    makeletters(clGray);
    makenumbers(clLime);
    eselection.Clear;
    END ELSE
  IF state='noninvcost' THEN
    BEGIN
    Statusbar2.SimpleText:='This item is not inventoried. Please enter the price';
    xstate:='noninvcost';
    Firstentry:=true;
    SetF2('Undo',False);
    SetF3('Net',False);
    SetF4('Gross',False);
    SetF5('Tax',True);
    SetF6('-',False);
    SetF7('Back',True);
    makeletters(clGray);
    makenumbers(clLime);
    eselection.Clear;
    END ELSE
  IF state='addnoninv' THEN
    BEGIN
    Statusbar2.SimpleText:='Press Enter to add this non-inventoried item';
    xstate:='addnoninv';
    SetF2('Undo',False);
    SetF3('Enter',True);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    makeletters(clGray);
    makenumbers(clGray);
    eselection.Clear;
    END ELSE
  IF state='intaxsel'THEN
    BEGIN
    Statusbar2.SimpleText:='Set the sales tax';
    lbpicklist.MultiSelect:=true;
    lbpicklist.sorted:=false;
    xstate:='intaxsel';
    SetF2('Undo',False);
    SetF3('Select',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    makeletters(clGray);
    makenumbers(clLime);
    eselection.Clear;
    END ELSE
  IF state='inedit' THEN
    BEGIN
    Statusbar2.SimpleText:='Select a new product or quantity and press enter';
    xstate:='inedit';
    IF Firstentry=True THEN SetF2('Undo',False) ELSE SetF2('Undo',True);
    SetF3('Clear',True);
    SetF4('Edit',True);
    SetF5('Remove',True);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inpayment' THEN
    BEGIN
    Statusbar2.SimpleText:='Select the payment method';
    xstate:='inpayment';
    eselection.Clear;
    Makenumbers(clGray);
    {show the payment options}
    SetF2('Cash',True);
    SetF3('Account',True);
    SetF4('Card',True);
    SetF5('Room',True);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='infinishng' THEN
    BEGIN
    Statusbar2.SimpleText:='Click "group" to show a simplified bill';
    {This is finish with no grouping of products}
    xstate:='infinishng';
    SetF2('-',False);
    SetF3('-',False);
    SetF4('Group',True);
    SetF5('Print',True);
    SetF6('Done',True);
    SetF7('Back',True);
    END ELSE
  IF state='infinishg' THEN
    BEGIN
    Statusbar2.SimpleText:='Click "itemise" to show a detailed bill';
    {This is finish with grouping of products}
    xstate:='infinishg';
    SetF2('-',False);
    SetF3('-',False);
    SetF4('Itemise',True);
    SetF5('Print',True);
    SetF6('Done',True);
    SetF7('Back',True);
    END ELSE
  IF state='inentry' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter the amount tendered';
    makenumbers(clLime);
    spointsetlast:=false;
    eselection.clear;
    SetF2('Undo',False);
    IF eselection.text<>'' THEN
    SetF3('Enter',True)ELSE
    SetF3('Enter',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    xstate:='inentry';
    END ELSE
  IF state='incard' THEN
    BEGIN
    Statusbar2.SimpleText:='Select the card type';
    xstate:='incard';
    {show the payment options in the picklist - this should go in the card menu}
    lbpicklist.Clear;
    accdatamoduleform.Getsysteminfo(sdatabase,'pos','payoptions','');
    IF accdatamoduleform.sqlsysdata.IsEmpty=false THEN
      BEGIN
      accdatamoduleform.sqlsysdata.first;
        REPEAT
        lbpicklist.Items.Add(accdatamoduleform.sqlsysdatavalue.Value);
        IF accdatamoduleform.sqlsysdata.eof=false THEN accdatamoduleform.sqlsysdata.next;
        UNTIL accdatamoduleform.sqlsysdata.eof=true;
      END;
    spointsetlast:=false;
    eselection.clear;
    SetF2('Visa',True);
    SetF3('M''Card',True);
    SetF4('Visa Debit',True);
    SetF5('Other',True);
    SetF6('Maestro',True);
    SetF7('Back',True);
    END ELSE
  IF state='incard2' THEN
    BEGIN
    Statusbar2.SimpleText:='Select the card type';
    xstate:='incard';
    spointsetlast:=false;
    eselection.clear;
    SetF2('???',True);
    SetF3('???',False);
    SetF4('???',False);
    SetF5('???',False);
    SetF6('???',False);
    SetF7('Back',True);
    END ELSE
  IF state='inmaestro' THEN
    BEGIN
    Statusbar2.SimpleText:='Ask if cashback is required - MAY NOT BE IMPLEMENTED';
    xstate:='inmaestro';
    {show the payment options}
    SetF2('Undo',False);
    SetF3('Enter',True);
    SetF4('Cashback',True);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    makenumbers(clLime);
    spointsetlast:=false;
    eselection.text:=Formatcurr('0.00',sumgross);
    END ELSE
  IF state='incashback' THEN
    BEGIN
    Statusbar2.SimpleText:='Enter cashback amount';
    xstate:='incashback';
    makenumbers(clLime);
    spointsetlast:=false;
    SetF2('Undo',False);
    SetF3('Enter',True);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    eselection.clear;
    END ELSE
  IF state='inroomsel' THEN
    BEGIN
    Statusbar2.SimpleText:='Select room';
    xstate:='inroomsel';
    {show the payment options}
    SetF2('Undo',False);
    SetF3('Split',False);
    SetF4('Enter',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    {also, show any active rooms - this should go in at the payment stage}
    accdatamoduleform.sqlbooking.Active:=false;
    accdatamoduleform.sqlbooking.CommandText:='SELECT * FROM booking where status = ''Active'' and charge = ''true''';
    accdatamoduleform.cdsbooking.Active:=true;
    accdatamoduleform.cdsbooking.Refresh;
    IF accdatamoduleform.cdsbooking.isempty=false THEN
      BEGIN
      lbpicklist.Clear;
      accdatamoduleform.cdsbooking.first;
        REPEAT
        lbpicklist.Items.Add('Room '+accdatamoduleform.cdsbookingroomno.AsString);
        IF accdatamoduleform.cdsbooking.Eof=false THEN accdatamoduleform.cdsbooking.Next;
        UNTIL accdatamoduleform.cdsbooking.eof=true;
      END;
    END ELSE
  IF state='inaccountsel' THEN
    BEGIN
    Statusbar2.SimpleText:='Select account';
    xstate:='inaccountsel';
    {show the accounts options}
    SetF2('Undo',False);
    SetF3('-',False);
    SetF4('Enter',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    {also, show any active accounts - this should go in at the payment stage}
    accdatamoduleform.Getsysteminfo(sdatabase,'pos','dest','');
    IF accdatamoduleform.sqlsysdata.isempty=false THEN
      BEGIN
      lbpicklist.Clear;
      accdatamoduleform.sqlsysdata.first;
        REPEAT
        lbpicklist.Items.Add(accdatamoduleform.sqlsysdatavalue.AsString);
        IF accdatamoduleform.sqlsysdata.Eof=false THEN accdatamoduleform.sqlsysdata.Next;
        UNTIL accdatamoduleform.sqlsysdata.eof=true;
      END;
    END ELSE
  IF state='insplit' THEN
    BEGIN
    Statusbar2.SimpleText:='Split payment';
    xstate:='insplit';
    makenumbers(clGray);
    SetF2('Undo',False);
    SetF3('-',False);
    SetF4('Enter',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    eselection.clear;
    END ELSE
  IF state='insysedit' THEN
    BEGIN
    Statusbar2.SimpleText:='I can''t remember why this feature is here';
    xstate:='insysedit';
    SetF2('-',False);
    SetF3('-',False);
    SetF4('-',False);
    SetF5('Remove',True);
    SetF6('-',False);
    SetF7('Back',True);
    END ELSE
  IF state='inselectcurrency' THEN
    BEGIN
    Statusbar2.SimpleText:='Select the currency for this sale';
    xstate:='inselectcurrency';
    SetF2('Undo',False);
    SetF3('Enter',False);
    SetF4('-',False);
    SetF5('-',False);
    SetF6('-',False);
    SetF7('Back',True);
    END;
  END;


procedure Taccsalesform.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Case Key of
Key_F2 : btnF2.click;
Key_F3 : btnF3.click;
Key_F4 : btnF4.click;
Key_F5 : btnF5.click;
Key_F6 : btnF6.click;
Key_F7 : btnF7.click;
Key_0   : btn0.Click;
Key_1   : btn1.Click;
Key_2   : btn2.Click;
Key_3   : btn3.Click;
Key_4   : btn4.Click;
Key_5   : btn5.Click;
Key_6   : btn6.Click;
Key_7   : btn7.Click;
Key_8   : btn8.Click;
Key_9   : btn9.Click;
end;

IF (key=Key_Return)OR(key=Key_Enter) THEN
  BEGIN
  btnF4.Click;
  END;

end;


procedure Taccsalesform.FormShow(Sender: TObject);
begin
localfile:=false;
homedir:=getcurrentdir; {This is where the application is}
logdir:=homedir+'/logs/';
accdatamoduleform.Setlogfile;
shelpfile:=homedir+'/help/';
backupdir:=homedir+'/backup/'; {This will change once we know the database}
backupfile:=backupdir+'/sysdata';
Application.HelpFile:=shelpfile;
IF directoryexists(homedir+'/notes')=False THEN mkdir(homedir+'/notes');
IF directoryexists(homedir+'/backup')=False THEN mkdir(homedir+'/backup');
Getlocalinfo;
Loglevel:=3;
Logging:=true;
Olddate:=Date;
  Try
  {Try to retrieve data from the system table}
  Accdatamoduleform.getsysteminfo(stationname,'settings','database name','');
  buttonhspace:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'pos','hspace','3'));
  buttonvspace:=strtoint(accdatamoduleform.Getsysteminfo(sdatabase,'pos','vspace','3'));
  Cashsale:=True; {settable later from file}
  IF checkstationname(stationname)=False THEN setstate('catatonic') ELSE
    BEGIN
    Loadstationsettings(stationname);
    accdatamoduleform.setsysteminfo(stationname,'settings','database name',sdatabase);
    IF Loaddatabasesettings(sdatabase)=true THEN setstate('active');
    END;
  Except
  {something's wrong}
  Messagedlg('','I could not locate the system data table in this database. Please run the setup program',mtError,[mbOK],0);
  Application.Terminate;
  End;
end;

procedure Taccsalesform.btnF2Click(Sender: TObject);
Var
i:integer;
sLogin:string;
Oldbal:Currency;
begin
IF xstate='idle' THEN
  BEGIN
  {login}
  setstate('inlogin');
  accsalesform.KeyPreview:=false;
  makeletters(clLime);
  END ELSE
IF xstate='inlogin' THEN
  BEGIN
  {accept login}
  {see if the user exists}
  sLogin:=lowercase(eselection.Text);
  delete(slogin,1,6);
  IF accdatamoduleform.Loadsysteminfo('system','users','name',lowercase(slogin))=true THEN
    BEGIN
    susername:=slogin;
    IF accdatamoduleform.Getsysteminfo('system','usersactive',susername,'')='true' THEN
      BEGIN
      IF accdatamoduleform.Getsysteminfo('system','administrator',susername,'')='true' THEN isadmin:=true ELSE isadmin:=false;
      IF accdatamoduleform.Getsysteminfo('system','needpass',susername,'false')='true' THEN needpassword:=true ELSE
        BEGIN
        spassword:=accdatamoduleform.Getsysteminfo('system','password',susername,'');
        IF spassword='' THEN needpassword:=true ELSE needpassword:=false;
        END;

      IF needpassword=true THEN setstate('inpassword')ELSE
    	BEGIN
        loaddatabasesettings(sdatabase);
        Statusbar2.SimpleText:='Settings loaded - please wait.';

        IF Inshift=True THEN
          BEGIN
          {see if a sale is stored with the status = this station}
          {If there is, then load it and setstate active}
          accdatamoduleform.sqlsalelist.Close;
          accdatamoduleform.sqlsalelist.commandtext:='SELECT * FROM salelist where status = '''+inttostr(stationnumber)+'''';
          accdatamoduleform.sqlsalelist.Active:=true;
          IF accdatamoduleform.sqlsalelist.IsEmpty=false THEN
            BEGIN
            currentsale:=accdatamoduleform.sqlsalelistsaleno.Value;
            IF loadsale(currentsale)= true THEN
            Setstate('insale')ELSE Setstate('active');
            END ELSE
          Setstate('active');
          END ELSE
          BEGIN
          Setstate('newshift');
          END;
        END;
      eselection.Text:='';
      accsalesform.KeyPreview:=true;
      END ELSE eselection.Text:='Login:'
    END;
  END ELSE
IF xstate='inpassword' THEN
  BEGIN
  {we need to check the password}
  {we can do this by connecting using the username and password supplied}
  spassword:=eselection.text;
  Try
  Loaddatabasesettings(sdatabase);
  Statusbar2.SimpleText:='Settings loaded - please wait.';
  accdatamoduleform.Setsysteminfo('system','password',susername,eselection.text);
  IF Inshift=True THEN
    BEGIN
    Setstate('active');
    END ELSE
    BEGIN
    Setstate('newshift');
    END;

  Except
  Setstate('inpassword');
  End;
  END ELSE
IF xstate='inrecall' THEN
  BEGIN
  {we recall the selected sale}
  Currentsale:=accdatamoduleform.sqlsalelistsaleno.Value;
  IF Loadsale(currentsale)=true THEN
    BEGIN
    setstate('insale');
    committime:=accdatamoduleform.cdssalelisttime.AsSQLTimeStamp;
    transstatus:=inttostr(stationnumber);
    transref:=currentsale;
    transname:=accdatamoduleform.cdssalelistsalename.Value;
    accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale',currentsale);
    END ELSE
    BEGIN
    setstate('active');
    END;
  lbpicklist.clear;
  END ELSE
IF xstate='intransname' THEN
  BEGIN
  {we save the sale and set its status to 0}
  {Put in a trap to avoid giving two sales the same name}
    Try
    IF accdatamoduleform.cdssalelist.ChangeCount>0 THEN accdatamoduleform.cdssalelist.ApplyUpdates(0);
    {this should be a transaction block}
    accdatamoduleform.conn.ExecuteDirect('Update salelist set salename = '''+transname+''' where saleno = '''+currentsale+'''');
    accdatamoduleform.conn.ExecuteDirect('Update salelist set status = ''0'' where saleno = '''+currentsale+'''');
    accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale','0');
    accdatamoduleform.setsysteminfo(sdatabase,stationname,'salenumber','0');
    Setstate('active');
    Except
    {some general error procedure here}
    End;
  END ELSE
IF (xstate='inedit')OR(xstate='inentry')
OR (xstate='inaccountbyname')OR(xstate='inaccountbyroom')OR(xstate='inaccountbynumber') THEN
  BEGIN
  {undo last item}
  IF Firstentry = false THEN
    BEGIN
    IF length(amtstring)>=1 THEN Delete(amtstring,length(amtstring),1);
    IF length(amtstring)<=1 THEN
      BEGIN
      IF amtstring='' THEN amtstring:='1';
      Firstentry:=true;
      END;
    selectedamt:=strtoint(amtstring);
    IF accdatamoduleform.cdsinventory.Locate('item',selectedinv,[])=True THEN
      BEGIN
      accdatamoduleform.cdsSales.Locate('sitem',selectedsale,[]);
      esaledescr.Text:=Formatfloat('0',selectedamt)+' '+accdatamoduleform.cdsSalesdescription.Value;
      END ELSE
      BEGIN
      esaledescr.Text:='';
      END;
    END ELSE
    BEGIN
    setF2('-',false);
    END;
  eselection.SetFocus;
  cursorposition:=0;
  END ELSE
IF (xstate='inpayment')THEN
  BEGIN
  {Cash sale}
  pmethod:='CASH';
  IF defaultcash>-1 THEN
  xaccountno:=defaultcash ELSE
    BEGIN
    Messagedlg('','Error- can''t find cash account for this currency.',mterror,[mbOK],0);
    END;
  IF balance>0 THEN
  setstate('inentry') ELSE
  setstate('infinishng');
  eselection.SetFocus;
  cursorposition:=0;
  END ELSE
IF xstate='insale' THEN
  BEGIN
  {This is a direct cash sale and we should process immediately if}
  {there is enough cash tendered}
  {add this to the list}
  PMethod:='CASH';
  IF defaultcash>-1 THEN
  xaccountno:=defaultcash ELSE
    BEGIN
    Messagedlg('','Error- can''t find cash account for this currency.',mterror,[mbOK],0);
    END;
    Try
    Cashpay:=strtocurr(esaledescr.Text);
    Except
    esaledescr.Text:='';
    Cashpay:=0;
    End;
  IF accdatamoduleform.cdssalelist.Locate('itemname',Pmethod,[])=True THEN
    BEGIN
    {If the item is already there we add the amount to the existing balance}
    Oldbal:=Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency;
    oldbal:=oldbal+cashpay;
    accdatamoduleform.cdssalelist.Edit;
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=oldbal;
    Accdatamoduleform.cdssalelist.post;
    END ELSE
    BEGIN
    Accdatamoduleform.cdssalelist.Append;
    accdatamoduleform.cdssalelistinvitem.Value:=-2;
    accdatamoduleform.cdssalelistsaleitem.Value:=xaccountno;
    Accdatamoduleform.cdssalelistitemname.Value:=Pmethod;
    Accdatamoduleform.cdssalelistsrcacc.Value:=defaultcash;
    {For cash payments, if the balance is less than 0, we deduct it from the payment}
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=Cashpay;
    Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
    Accdatamoduleform.cdssalelistsaleref.Value:=currentsale;
    Accdatamoduleform.cdssalelistsalename.Value:='Sale no '+currentsale;
    Accdatamoduleform.cdssalelistroomno.Value:=-1;
    Accdatamoduleform.cdssalelistbookingref.Value:='NONE';
    IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
    Accdatamoduleform.cdssalelist.Post;
    END;
  {we have to call calculate sum again to update the remaining balance}
  eselection.Clear;
  Calculatesum(false);

  {If there's enough money, we process the list. If not, we return}
  {to insale and wait}
  IF balance<=0 THEN
    BEGIN
    calculatesum(true);
    esaledescr.Text:='Change due '+Formatcurr('£0.00',(balance*-1));
    {we also need to add a "change" entry to the salelist}
    IF balance<0 THEN
      BEGIN
      IF accdatamoduleform.cdssalelist.Locate('itemname','Change',[])=True THEN
        BEGIN
        {If the item is already there we add the amount to the existing balance}
        accdatamoduleform.cdssalelist.Edit;
        Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=balance*-1;
        Accdatamoduleform.cdssalelist.post;
        END ELSE
        BEGIN
        Accdatamoduleform.cdssalelist.Append;
        accdatamoduleform.cdssalelistinvitem.Value:=-2;
        accdatamoduleform.cdssalelistsaleitem.Value:=-1;
        Accdatamoduleform.cdssalelistitemname.Value:='Change';
        Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=Cashpay;
        Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
        Accdatamoduleform.cdssalelistsaleref.Value:=currentsale;
        Accdatamoduleform.cdssalelistroomno.Value:=-1;
        Accdatamoduleform.cdssalelistbookingref.Value:='NONE';
        Accdatamoduleform.cdssalelist.Post;
        END;
      END;
    accdatamoduleform.dssalelist.Enabled:=false;
      Try
      IF accdatamoduleform.cdssalelist.ChangeCount>0 THEN
        BEGIN
        IF accdatamoduleform.cdssalelist.ApplyUpdates(0)>0 THEN
        accdatamoduleform.cdssalelist.SaveToFile(backupdir+'sale'+currentsale);
        accdatamoduleform.conn.Executedirect('Update salelist set saleref = '''+currentsale+''' where saleno = '''+currentsale+'''');
        accdatamoduleform.conn.Executedirect('Update salelist set srcacc = '''+inttostr(xaccountno)+''' where saleno = '''+currentsale+'''');
        {This will change to 'A' indicating the active salelist for this shift}
        accdatamoduleform.conn.Executedirect('Update salelist set status = ''A'' where saleno = '''+currentsale+'''');
        {accdatamoduleform.conn.Executedirect('Update salelist set status = ''-2'' where saleno = '''+currentsale+'''');}
        Printout(true);
        END;
      Except
      accdatamoduleform.cdssalelist.SaveToFile(backupdir+'sale'+currentsale);
      End;
    {we set the salenumber to zero only if it is actually}
    {this sale. If this sale is recalled or to an expense account, we leave it}
    IF (accdatamoduleform.Getsysteminfo(sdatabase,stationname,'salenumber','')=currentsale)
    THEN accdatamoduleform.setsysteminfo(sdatabase,stationname,'salenumber','0');
    accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale','0');
    lbpicklist.Clear;
    eselection.clear;
    amtstring:='';
    setstate('active');
    accdatamoduleform.dssalelist.Enabled:=true;
    END;
  END ELSE
IF (xstate='incard')THEN
  BEGIN
  pmethod:='VISA';
  xaccountno:=bankaccount;
  setstate('inentry');
  eselection.text:=Formatcurr('0.00',balance);
  eselection.SetFocus;
  END ELSE
IF xstate='active' THEN
  BEGIN
  {control}
  setstate('control');
  END ELSE
IF xstate='setup' THEN
  BEGIN
  {clone}
  setstate('clone');
  END ELSE
IF xstate='control' THEN
  BEGIN
  {end shift}
  setstate('inreadings');
  END ELSE
IF xstate='insetprinter' THEN
  BEGIN
  Setstate('setup');
  END ELSE
IF xstate='insecurity' THEN
  BEGIN
  setstate('inusers');
  END ELSE
IF xstate='inusers' THEN
  BEGIN
  setstate('inuseradd');
  {add new user}
  END ELSE
IF xstate='inuseradd' THEN
  BEGIN
  {check that the name doesn't exist already}
  Accdatamoduleform.sqlusers.active:=true;
  IF accdatamoduleform.sqlusers.Locate('usename',eselection.text,[loCaseInsensitive])=false THEN
    BEGIN
    newuser:=eselection.text;
    setstate('inuseradd2');
    {enter the user's name}
    END ELSE
    BEGIN
    Messagedlg('','name exists',mtError,[mbOK],0);
    eselection.clear;
    END;
  END ELSE
IF xstate='inuseradd2' THEN
  BEGIN
  newuserfull:=eselection.Text;
  setstate('inuseradd3');
  {enter the user's full name}
  END ELSE
IF xstate='inuseradd3' THEN
  BEGIN
  newuserpass:=eselection.text;
  setstate('inuseradd4');
  {new user's password}
  END ELSE
IF xstate='inuseradd4' THEN
  BEGIN
  newuseradmin:=true;
  setstate('inuseradd5');
  {is the user administrator}
  END ELSE
IF xstate='inuseradd5' THEN
  BEGIN
  {here we create the new user}
  newuser:=lowercase(newuser);
  newuserfull:=lowercase(newuserfull);
  IF length(newuserfull)>0 THEN
    BEGIN
    i:=1;
      REPEAT
      IF (i<=length(newuserfull))AND((i=1)OR((i>1)AND(newuserfull[i-1]=' ')))THEN
      newuserfull[i]:=upcase(newuserfull[i]);
      i:=i+1;
      UNTIL i>length(newuserfull);
    END;
    Try
    accdatamoduleform.adminconn.ExecuteDirect('Create user '+newuser+' with password '''+newuserpass+'''');
    accdatamoduleform.adminconn.ExecuteDirect('Alter group standard add user '+newuser);
    IF newuseradmin=true THEN
      BEGIN
      accdatamoduleform.adminconn.ExecuteDirect('Alter group manager add user'+newuser);
      Accdatamoduleform.setsysteminfo('system','administrator',newuser,'true');
      END ELSE
      BEGIN
      Accdatamoduleform.setsysteminfo('system','administrator',newuser,'false');
      END;
    Except
    {didnae work}
    End;
  Accdatamoduleform.addsysteminfo('system','users','name',newuser);
  Accdatamoduleform.setsysteminfo('system','fullname',newuser,newuserfull);
  Accdatamoduleform.setsysteminfo('system','usersactive',newuser,'true');
  Accdatamoduleform.setsysteminfo('system','password',newuser,newuserpass);
  Accdatamoduleform.setsysteminfo('system','needpass',newuser,'false');
  setstate('inusers');
  END ELSE
IF xstate='inuserdelete' THEN
  BEGIN
  {we delete the user from pg_users and also from our system table}
  accdatamoduleform.adminconn.ExecuteDirect('drop user '+newuser);
  accdatamoduleform.adminconn.ExecuteDirect('delete from sysinfo where value = '''+newuser+'''');
  accdatamoduleform.adminconn.ExecuteDirect('delete from sysinfo where parameter = '''+newuser+'''');
  accdatamoduleform.adminconn.ExecuteDirect('delete from sysinfo where section = '''+newuser+'''');
  accdatamoduleform.adminconn.ExecuteDirect('delete from sysinfo where owned = '''+newuser+'''');
  Setstate('inusers');
  END ELSE
IF xstate='inusersetting' THEN
  BEGIN
  {set active if inactive and vv}
  IF accdatamoduleform.Getsysteminfo('system','usersactive',newuser,'false')='false' THEN
  accdatamoduleform.setsysteminfo('system','usersactive',newuser,'true') ELSE
  accdatamoduleform.setsysteminfo('system','usersactive',newuser,'false');
  setstate('inusers');
  END ELSE
IF xstate='inuserpass' THEN
  BEGIN
  newuserpass:=eselection.text;
  accdatamoduleform.adminconn.ExecuteDirect('alter user '+newuser+' with password '''+newuserpass+'''' );
  Accdatamoduleform.setsysteminfo('system','password',newuser,newuserpass);
  setstate('inusers');
  END ELSE
IF xstate='inreadings' THEN
  BEGIN
  {x reading}
  reading('x');
  {setstate('control');}
  {totals all the cash sales}
  END ELSE
IF xstate='inqkset' THEN
  BEGIN
  setstate('inqkcaption');
  END ELSE
IF xstate='inqklevelsel' THEN
  BEGIN
  {set the next level for this button}
  {first we want to find the record that relates to this button}
  {we need the current level and the current button}
  {we know currlevel and we know button no}

  Accdatamoduleform.cdspicklist.Filtered:=false;
  With accdatamoduleform.cdspicklist do
    Begin
    Indexname:='levelindex';
    setkey;
    fieldbyname('level').AsInteger:=currlevel;
    fieldbyname('button').AsInteger:=selbutton;
    gotokey;
    IF gotokey=true THEN
      BEGIN
      {we've found this button}
      {Change the nlevel to this level}
      IF nlevelname='Not Set' THEN
        BEGIN
        {we set the nlevel to -1 and the nlevelname to 'Not Set'}
        nextlevel:=-1;
        nlevelname:='Not Set';
        END ELSE
        BEGIN
        nextlevel:=-1; {this will change if we find an existing record}
        {we need to find out what the next level is}
        IF accdatamoduleform.cdspicklist.Locate('levelname',nlevelname,[])=true THEN
          BEGIN
          nextlevel:=accdatamoduleform.cdspicklistlevel.Value;
          buttoncap:=nlevelname;
          END ELSE
        IF accdatamoduleform.cdspicklist.Locate('nlevelname',nlevelname,[])=true THEN
          BEGIN
          nextlevel:=accdatamoduleform.cdspicklistnlevel.Value;
          buttoncap:=nlevelname;
          END ELSE
        IF (nextlevel=-1)AND(nlevelname<>'Not Set') THEN
          BEGIN
          {nlevelname is not 'Not Set' but we can't find an existing level with that name}
          {find a new level number and give the button that name}
          accdatamoduleform.cdspicklist.IndexName:='levelindex';
          accdatamoduleform.cdspicklist.Last;
          nextlevel:=accdatamoduleform.cdspicklistlevel.Value;
          accdatamoduleform.cdspicklist.IndexName:='nlevelindex';
          accdatamoduleform.cdspicklist.Last;
          IF accdatamoduleform.cdspicklistnlevel.Value>nextlevel THEN
          nextlevel:=accdatamoduleform.cdspicklistnlevel.Value;
          nextlevel:=nextlevel+1;
          IF buttoncap<>'Not Set' THEN
          nlevelname:=buttoncap ELSE nlevelname:='LEVEL '+inttostr(nextlevel);
          END;
        END; {nlevelname not 'Not Set'}
      END; {Gotokey}
    End; {with picklist do}
  IF (nextlevel<>-1)OR(nlevelname<>'Not Set')THEN savebutton ELSE
    BEGIN
    {we could simply delete this button}
    Deletebutton(selbutton,currlevel);
    END;
  loadbuttons(currlevel);
  setstate('inqkset');
  END ELSE
IF xstate='inqkprodsel' THEN
  BEGIN
  {we just save the details and return to inqkset}
  savebutton;
  setstate('inqkset');
  END ELSE
IF xstate='inqkcaption' THEN
  BEGIN
  Savebutton;
  setstate('inqkset');
  loadbuttons(currlevel);
  END;
end;

procedure Taccsalesform.btnAClick(Sender: TObject);
begin
IF btnA.font.color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('A',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  eselection.OnChange(sender);
  END;
end;

procedure Taccsalesform.btnF7Click(Sender: TObject);
begin
lbpicklist.clear;
IF xstate='saleadmin' THEN
  BEGIN
  setstate('control');
  END ELSE
IF xstate='control' THEN
  BEGIN
  setstate('active');
  END ELSE
IF xstate='getserver' THEN
  BEGIN
  Setstate('setup');
  END ELSE
IF xstate='setup' THEN
  BEGIN
  setstate('control');
  END ELSE
IF xstate='clone' THEN
  BEGIN
  setstate('setup');
  END ELSE
IF xstate='insecurity' THEN
  BEGIN
  setstate('setup');
  END ELSE
IF xstate='inusers' THEN
  BEGIN
  setstate('insecurity');
  END ELSE
IF (xstate='inuseradd')OR(xstate='inuserpass')OR(xstate='inusersetting')OR(xstate='inuserdetails') THEN
  BEGIN
  setstate('inusers');
  END ELSE
IF xstate='inuseradd2' THEN
  BEGIN
  setstate('inuseradd');
  END ELSE
IF xstate='inuseradd3' THEN
  BEGIN
  setstate('inuseradd2');
  END ELSE
IF xstate='inuseradd4' THEN
  BEGIN
  setstate('inuseradd3');
  END ELSE
IF xstate='inuseradd5' THEN
  BEGIN
  setstate('inuseradd4');
  END ELSE
IF xstate='getpassword' THEN
  BEGIN
  Application.Terminate;
  END ELSE
IF xstate='inlogin' THEN
  BEGIN
  setstate('idle');
  END ELSE
IF xstate='inpassword' THEN
  BEGIN
  setstate('idle');
  END ELSE
IF xstate='intransname' THEN
  BEGIN
  setstate('insale');
  END ELSE
IF xstate='inprint' THEN
  BEGIN
  setstate('insale');
  END ELSE
IF xstate='insetprinter' THEN
  BEGIN
  setstate('setup');
  END ELSE
IF xstate='inreadings' THEN
  BEGIN
  {we need to check if a z reading has been done. If it has, we go to newshift}
  IF accdatamoduleform.getsysteminfo(sdatabase,stationname,'shiftnumber','')='0' THEN
    BEGIN
    accdatamoduleform.Startshift;
    inshift:=true;
    setstate('active');
    statusbar2.SimpleText:='Shift number '+inttostr(currentshift)+' started';
    END ELSE
  setstate('control');
  END ELSE
IF xstate='inqkset' THEN
  BEGIN
  setstate('control');
  END ELSE
IF xstate='inqklevelsel' THEN
  BEGIN
  setstate('inqkset');
  lbpicklist.Clear;
  END ELSE
IF xstate='inqkprodsel' THEN
  BEGIN
  setstate('inqkset');
  lbpicklist.Clear;
  END ELSE
IF xstate='inqkcaption' THEN
  BEGIN
  setstate('inqkset');
  eselection.Clear;
  END ELSE
IF xstate='inqkcolsel' THEN
  BEGIN
  setstate('inqkset');
  END ELSE
IF xstate='newshift' THEN
  BEGIN
  setstate('idle');
  END ELSE
IF xstate='acceptshift' THEN
  BEGIN
  setstate('idle');
  END ELSE
IF xstate='inrecall' THEN
  BEGIN
  setstate('active');
  END ELSE
IF xstate='active' THEN
  BEGIN
  setstate('idle');
  END ELSE
IF (xstate='inedit') THEN
  BEGIN
  {we return to insale}
  setstate('insale');
  END ELSE
IF xstate='insale' THEN
  BEGIN
  {If there's a number in esaledescr we clear it and set F7 to 'Cancel'}
  IF esaledescr.Text<>'' THEN
    BEGIN
    esaledescr.Clear;
    amtstring:='';
    SetF7('Cancel',True);
    END ELSE
  IF messagedlg('','Cancel this sale?',mtconfirmation,[mbYes,mbNo],0)=mrYes THEN
    BEGIN
    {we cancel the sale}
    accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale','0');
    esaledescr.Clear;
    eselection.Clear;
    amtstring:='';
    {we also want to remove the current sale even if it has been suspended}
    accdatamoduleform.conn.ExecuteDirect('DELETE FROM salelist WHERE (saleno = '''+currentsale+''')AND(status = '''+inttostr(stationnumber)+''')');
    accdatamoduleform.cdssalelist.EmptyDataSet;
    setstate('active');
    END;
  END ELSE
IF xstate='indiscount' THEN
  BEGIN
  setstate('insale');
  END ELSE
IF xstate='insysedit' THEN
  BEGIN
  setstate('insale');
  END ELSE
IF xstate='noninvcost' THEN
  BEGIN
  setstate('insale');
  END ELSE
IF xstate='intaxsel' THEN
  BEGIN
  setstate('noninvcost');
  END ELSE
IF xstate='addnoninv' THEN
  BEGIN
  setstate('noninvcost');
  END ELSE
IF xstate='inpayment' THEN
  BEGIN
  {we return to insale}
  setstate('insale');
  END ELSE
IF xstate='inentry' THEN
  BEGIN
  {Where we return to depends on pMethod}
  IF (pMethod='CASH')OR(pMethod='CHEQUE') THEN
    BEGIN
    setstate('inpayment');
    END ELSE
  IF (pMethod='VISA')OR(pMethod='MASTERCARD')OR(pMethod='AMERICAN EXPRESS') THEN
    BEGIN
    setstate('incard');
    END ELSE
  IF pMethod='MAESTRO' THEN
    BEGIN
    setstate('inmaestro');
    END ELSE
  IF pMethod='ACCOUNT' THEN
    BEGIN
    {Take out any instances of "Account"}
    Setstate('inroomsel');
    END;
  END ELSE
IF xstate='incard' THEN
  BEGIN
  {we return to inpayment}
  setstate('inpayment')
  END ELSE
IF xstate='incard2' THEN
  BEGIN
  {we return to incard}
  setstate('incard');
  END ELSE
IF xstate='inroomsel' THEN
  BEGIN
  {we return to inpayment}
  setstate('inpayment');
  END ELSE
IF xstate='inaccountsel' THEN
  BEGIN
  {we return to inpayment}
  setstate('inpayment');
  END ELSE
IF xstate='insplit' THEN
  BEGIN
  setstate('inroomsel');
  transname:='Sale no: '+currentsale;
  END ELSE
IF xstate='inaccountbyname' THEN
  BEGIN
  {we return to inpayment}
  eselection.clear;
  setstate('inroomsel');
  END ELSE
IF xstate='inaccountbyroom' THEN
  BEGIN
  {we return to inroomsel}
  eselection.clear;
  setstate('inroomsel');
  END ELSE
IF xstate='inaccountbynumber' THEN
  BEGIN
  {we return to inroomsel}
  eselection.clear;
  setstate('inroomsel');
  END ELSE
IF xstate='inmaestro' THEN
  BEGIN
  {we return to incard}
  setstate('incard');
  END ELSE
IF xstate='incashback' THEN
  BEGIN
  {we return to inmaestro}
  setstate('inmaestro');
  END ELSE
IF xstate='inselectcurrency' THEN
  BEGIN
  {we return to insale}
  setstate('insale');
  END ELSE
IF (xstate='insale')THEN
  BEGIN
  END ELSE
IF xstate='infinishng' THEN
  BEGIN
  setstate('inpayment');
  END;
end;

procedure Taccsalesform.btnF3Click(Sender: TObject);
type
 TNumbers = set of Char;
var
Numbers:TNumbers;
Oldbal:Currency;
Taxrate,thistaxrate,totaltaxrate:double;
i,itax:integer;
coststring:string;
sitemtaxstring,stax:String;
clonename:String;
continue,done:Boolean;
begin
continue:=false;
Numbers:=['0','1','2','3','4','5','6','7','8','9'];
IF xstate='active' THEN
  BEGIN
  currentsale:=accdatamoduleform.Getsalenumber; {this is the number without the station number prepended}
  Statusbar2.SimpleText:='Enter the name of the item, or use hotkeys';
  loadsale(currentsale);
  noninvitemname:='none';
  noninvnet:=0;
  noninvtax:=0;
  noninvgross:=0;
  IF accdatamoduleform.cdstaxes.active=false THEN accdatamoduleform.cdstaxes.active:=true;
  IF accdatamoduleform.cdstaxes.locate('item',defaultsalestax,[])=true THEN
  itemtaxname:=accdatamoduleform.cdstaxesdescription.Value ELSE
  itemtaxname:='';
  setstate('insale');
  committime:=Datetimetosqltimestamp(now);
  Totalexists:=false;
  lbpicklist.Clear;
  eselection.clear;
  selectedtax:=defaultsalestax;
  END ELSE
IF xstate='control' THEN
  BEGIN
  setstate('setup');
  END ELSE
IF xstate='setup' THEN
  BEGIN
  setstate('getdatabase');
  END ELSE
IF xstate='clone' THEN
  BEGIN
  {is there anything stored as this item at the moment?} {confirm}
  accdatamoduleform.sqlpicklist.Close;
  accdatamoduleform.cdspicklist.Close;
  accdatamoduleform.sqlpicklist.commandtext:='SELECT * FROM picklist where station = '''+stationname+'''';
  accdatamoduleform.cdspicklist.Open;
  IF accdatamoduleform.cdspicklist.IsEmpty=false THEN
    BEGIN
    IF messagedlg('','Erase existing quickkey setup?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN continue:=true;
    END ELSE continue:=true;
  IF continue=true THEN
    BEGIN
    {need to rescan picklist}
    i:=0;
    clonename:='';
      REPEAT
      IF lbpicklist.Selected[i]=true THEN clonename:=lbpicklist.Items[i];
      IF clonename='' THEN i:=i+1;
      done:=(i=lbpicklist.Items.Count)OR(clonename<>'');
      UNTIL done;
    IF clonename<>'' THEN
      BEGIN
      IF accdatamoduleform.cdspicklist.IsEmpty=false THEN
        BEGIN
          REPEAT
          accdatamoduleform.cdspicklist.Delete;
          UNTIL accdatamoduleform.cdspicklist.IsEmpty=true;
        END;
      accdatamoduleform.sclonepicklist.Close;
      accdatamoduleform.sclonepicklist.CommandText:='SELECT * FROM picklist where station = '''+clonename+'''';
      accdatamoduleform.sclonepicklist.Open;
      IF accdatamoduleform.sclonepicklist.IsEmpty=false THEN
        BEGIN
        messagedlg('','Quick key records found '+inttostr(accdatamoduleform.sclonepicklist.recordcount),mtInformation,[mbOK],0);
        accdatamoduleform.sclonepicklist.First;
          REPEAT
          accdatamoduleform.cdspicklist.Append;
          accdatamoduleform.cdspicklistlevel.Value:=accdatamoduleform.sclonepicklistlevel.Value;
          accdatamoduleform.cdspicklistplevel.Value:=accdatamoduleform.sclonepicklistplevel.Value;
          accdatamoduleform.cdspicklistbutton.Value:=accdatamoduleform.sclonepicklistbutton.Value;
          accdatamoduleform.cdspicklistpbutton.Value:=accdatamoduleform.sclonepicklistpbutton.Value;
          accdatamoduleform.cdspicklistnlevel.Value:=accdatamoduleform.sclonepicklistnlevel.Value;
          accdatamoduleform.cdspicklistinvitem.Value:=accdatamoduleform.sclonepicklistinvitem.Value;
          accdatamoduleform.cdspicklistsaleitem.Value:=accdatamoduleform.sclonepicklistsaleitem.Value;
          accdatamoduleform.cdspicklistbuttoncolour.Value:=accdatamoduleform.sclonepicklistbuttoncolour.Value;
          accdatamoduleform.cdspicklisttextcolour.Value:=accdatamoduleform.sclonepicklisttextcolour.Value;
          accdatamoduleform.cdspicklistbuttonno.Value:=accdatamoduleform.sclonepicklistbuttonno.Value;
          accdatamoduleform.cdspicklistlevelname.Value:=accdatamoduleform.sclonepicklistlevelname.Value;
          accdatamoduleform.cdspicklistnlevelname.Value:=accdatamoduleform.sclonepicklistnlevelname.Value;
          accdatamoduleform.cdspicklisttext.Value:=accdatamoduleform.sclonepicklisttext.Value;
          accdatamoduleform.cdspickliststation.Value:=stationname;
          accdatamoduleform.cdspicklist.post;
          IF accdatamoduleform.sclonepicklist.Eof=false THEN accdatamoduleform.sclonepicklist.next;
          UNTIL accdatamoduleform.sclonepicklist.Eof=true;
        END ELSE messagedlg('','No quick keys to copy',mtInformation,[mbOK],0);
      IF accdatamoduleform.cdspicklist.ChangeCount>0 THEN
        BEGIN
        IF messagedlg('','Save changes?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN accdatamoduleform.cdspicklist.ApplyUpdates(0)
        ELSE accdatamoduleform.cdspicklist.CancelUpdates;
        END;
      loadstationsettings(stationname);
      END ELSE messagedlg('','Well that didn''t work',mtError,[mbOK],0);
    END;
  {clone the table}

  setstate('setup');
  END ELSE
IF xstate='inusers' THEN
  BEGIN
  {delete the user}
  setstate('inuserdelete');
  END ELSE
IF xstate='inuseradd4' THEN
  BEGIN
  newuseradmin:=false;
  setstate('inuseradd5');
  {is the user administrator}
  END ELSE
IF xstate='inusersettings' THEN
  BEGIN
  {set admin if not and vv}
  IF accdatamoduleform.Getsysteminfo('system','administrator',newuser,'false')='false' THEN
  accdatamoduleform.setsysteminfo('system','administrator',newuser,'true') ELSE
  accdatamoduleform.setsysteminfo('system','administrator',newuser,'false');
  setstate('inusers');
  END ELSE
IF xstate='inuserpass' THEN
  BEGIN
  IF accdatamoduleform.Getsysteminfo('system','needpass',newuser,'false')='false' THEN
  accdatamoduleform.setsysteminfo('system','needpass',newuser,'true') ELSE
  accdatamoduleform.setsysteminfo('system','needpass',newuser,'false');
  setstate('inuser');
  END ELSE
IF xstate='inreadings' THEN
  BEGIN
  {Z reading}
  reading('Z');
  {then start new shift}
  END ELSE
IF xstate='insale' THEN
  BEGIN
  IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  setstate('inprint');
  {Printout(false);}
  {setstate('inselectcurrency');
  lbpicklist.Clear;
  IF Accdatamoduleform.cdsaccount.Active=False THEN Accdatamoduleform.cdsaccount.Active:=True;
  IF Accdatamoduleform.cdsaccount.Changecount=0 THEN Accdatamoduleform.cdsaccount.Refresh;
  IF Accdatamoduleform.cdsaccount.IsEmpty=False THEN
    BEGIN
    Accdatamoduleform.cdsaccount.Filtered:=false;
    Accdatamoduleform.cdsaccount.First;
      REPEAT
      IF lbpicklist.Items.IndexOf(accdatamoduleform.cdsaccountcurrency.value)=-1 THEN
      lbpicklist.Items.Add(accdatamoduleform.cdsaccountcurrency.value);
      IF Accdatamoduleform.cdsaccount.EOF=False THEN Accdatamoduleform.cdsaccount.Next;
      UNTIL Accdatamoduleform.cdsaccount.EOF=True;
    END;
  Accdatamoduleform.cdsaccount.Filtered:=False;}
  END ELSE
IF xstate='inprint' THEN
  BEGIN
  Printout(false);
  setstate('insale');
  END ELSE
IF xstate='noninvcost' THEN
  BEGIN
  {We should accept the amount}
  {and then go to "addnoninv"}
  noninvnet:=strtocurr(eselection.text);
  {we have to calculate the total tax}
  totaltaxrate:=0;
  sitemtaxstring:=itemtaxname;
  IF length(sitemtaxstring)>0 THEN
    BEGIN
    i:=1;
      REPEAT
      IF i<=length(sitemtaxstring) THEN
        BEGIN
        IF sitemtaxstring[i]=' 'THEN Delete(sitemtaxstring,i,1) ELSE i:=i+1;
        END;
      UNTIL i>length(sitemtaxstring);
    END;
  IF length(sitemtaxstring)>0 THEN
    BEGIN
    stax:=''; {a string}
    {extract the taxes from it. That way, find the total tax rate}
    i:=1;
      REPEAT
      IF (i<=length(sitemtaxstring))THEN
        BEGIN
        {taxstring is a list of numbers separated by commas. We extract anything that is a number}
        IF sitemtaxstring[i]in numbers THEN
          BEGIN
          Insert(sitemtaxstring[i],stax,length(stax)+1);
          END;
        IF (not(sitemtaxstring[i]in numbers))OR((i=length(sitemtaxstring))AND(stax<>''))THEN
          BEGIN
          itax:=strtoint(stax); {an integer}
          stax:='';
          IF accdatamoduleform.cdstaxes.locate('item',itax,[])=true THEN
            BEGIN
            thistaxrate:=accdatamoduleform.cdstaxesrate.AsFloat;
            totaltaxrate:=totaltaxrate+thistaxrate;
            END ELSE {not found in taxes}
            BEGIN
            Messagedlg('','''Could not find tax''',mterror,[mbok],0);
            END;
          END;{a valid tax is found}
        END;{i is <length(taxstring}
      i:=i+1;
      UNTIL i>length(sitemtaxstring);
    END;{length(taxstring)>0}
  {we now have the total tax rate}
  Taxrate:=Totaltaxrate;
  Taxrate:=Taxrate/100;
  noninvgross:=noninvnet*(1+taxrate);
  noninvtax:=noninvgross-noninvnet;
  esaledescr.text:=noninvitemname+' @ '+formatfloat('0.00',noninvnet);
  setstate('addnoninv');
  END ELSE
IF xstate='intaxsel' THEN
  BEGIN
  {we want to set itemtaxname to the taxes selected}
  itemtaxname:='';
  IF length(selectedtax)>0 THEN
    BEGIN
    stax:=''; {a string}
    {extract the taxes from it. That way, find the total tax rate}
    i:=1;
      REPEAT
      IF (i<=length(selectedtax))THEN
        BEGIN
        {taxstring is a list of numbers separated by commas. We extract anything that is a number}
        IF selectedtax[i]in numbers THEN
          BEGIN
          Insert(selectedtax[i],stax,length(stax)+1);
          END;
        IF (not(selectedtax[i]in numbers))OR((i=length(selectedtax))AND(stax<>''))THEN
          BEGIN
          itax:=strtoint(stax); {an integer}
          stax:='';
          IF accdatamoduleform.cdstaxes.locate('item',itax,[])=true THEN
            BEGIN
            IF length(itemtaxname)>0 THEN Insert(',',itemtaxname,length(itemtaxname)+1);
            Insert(accdatamoduleform.cdstaxesdescription.Value,itemtaxname,length(itemtaxname)+1);
            END ELSE {not found in taxes}
            BEGIN
            Messagedlg('','''Could not find tax''',mterror,[mbok],0);
            END;
          END;{a valid tax is found}
        END;{i is <length(taxstring}
      i:=i+1;
      UNTIL i>length(selectedtax);
    END ELSE itemtaxname:='None';
  Statusbar2.SimpleText:='Sales taxes selected for this sale: '+itemtaxname;

  setstate('noninvcost');
  Makenumbers(clLime);
  Makeletters(clGray);
  lbpicklist.Clear;
  eselection.Clear;
  END ELSE
IF (xstate='addnoninv')OR(xstate='editnoninv') THEN
  BEGIN
  IF Xstate='addnoninv' THEN
    BEGIN
    IF Totalexists=True THEN
      BEGIN
      {we put the non inv item just before the total if shownet=false}
      {and just before the taxes if shownet=true}
      accdatamoduleform.cdssalelist.Locate('invitem',-2,[]);
      Accdatamoduleform.cdssalelist.Insert;
      END ELSE Accdatamoduleform.cdssalelist.Append;
    END ELSE Accdatamoduleform.cdssalelist.Edit;
  accdatamoduleform.cdssalelistinvitem.Value:=0;
  accdatamoduleform.cdssalelistsaleitem.Value:=0;
  accdatamoduleform.cdssalelistdate.Value:=date;
  Accdatamoduleform.cdssalelistitemname.Value:=noninvitemname;
  Accdatamoduleform.cdssalelistmeasure.Value:='noninv';
  Accdatamoduleform.cdssalelistsalecount.asfloat:=1;
  Accdatamoduleform.cdssalelistpriceneteach.asfloat:=noninvnet;
  Accdatamoduleform.cdssalelisttotalnetprice.asfloat:=roundto(noninvnet,-2);
  Accdatamoduleform.cdssalelisttaxperunit.asfloat:=roundto(noninvtax,-3);
  Accdatamoduleform.cdssalelisttotaltax.asfloat:=roundto(noninvtax,-2);
  Accdatamoduleform.cdssalelistpricegrosseach.asfloat:=noninvgross;
  Accdatamoduleform.cdssalelisttotalgrossprice.asfloat:=noninvgross;
  Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
  Accdatamoduleform.cdssalelistsaleref.Value:=currentsale;
  Accdatamoduleform.cdssalelistsalename.Value:='Sale no '+currentsale;
  Accdatamoduleform.cdssalelisttaxstring.Value:=selectedtax;
  accdatamoduleform.cdssalelistcurrency.Value:=transcurrency;
  Accdatamoduleform.cdssalelistequiv.AsFloat:=conversionrate;
  IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
  Accdatamoduleform.cdssalelist.Post;
  Calculatesum(false);
  setstate('insale');
  END ELSE
IF xstate='newshift' THEN
  BEGIN
  eselection.Clear;
  eselection.SetFocus;
  SetF2('Undo',False);
  END ELSE
IF xstate='acceptshift' THEN
  BEGIN
  eselection.Clear;
  eselection.SetFocus;
  SetF2('Undo',False);
  END ELSE
IF xstate='inqkset' THEN
  BEGIN
  setstate('inqklevelsel');
  END ELSE
IF xstate='inqkprodsel' THEN
  BEGIN
  {clear this button}
  END ELSE
IF xstate='inqkcolsel' THEN
  BEGIN
  {button colour}
  {edit this button}
  buttoncolour:=selcolour;
  savebutton;
  loadbuttons(currlevel);
  setstate('inqkset');
  END ELSE
IF xstate='inedit' THEN
  BEGIN
  eselection.Clear;
  eselection.SetFocus;
  esaledescr.Clear;
  selectedinv:=-1;
  selectedsale:=-1;
  amtstring:='1';
  selectedamt:=1;
  Firstentry:=true;
  SetF2('Undo',False);
  END ELSE
IF xstate='inpayment' THEN
  BEGIN
  {cheque payment}
  IF balance>0 THEN
    BEGIN
    setstate('inaccountsel');
    pmethod:='ACCOUNT';
    {select the account from the picklist}
    eselection.text:=Formatcurr('0.00',balance);
    END ELSE setstate('infinishng');
  END ELSE
IF xstate='inentry' THEN
  BEGIN
  {add this to the list}
  Cashpay:=strtocurr(amtstring);
  IF accdatamoduleform.cdssalelist.Locate('itemname',Pmethod,[])=True THEN
    BEGIN
    {If the item is already there we add the amount to the existing balance}
    {strip any non numericals out of eselection.text}
    Oldbal:=Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency;
    oldbal:=oldbal+cashpay;
    accdatamoduleform.cdssalelist.Edit;
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=oldbal;
    Accdatamoduleform.cdssalelist.post;
    END ELSE
    BEGIN
    Accdatamoduleform.cdssalelist.Append;
    accdatamoduleform.cdssalelistinvitem.Value:=-2;
    accdatamoduleform.cdssalelistsaleitem.Value:=xaccountno;
    IF PMethod='ACCOUNT' THEN
    Accdatamoduleform.cdssalelistitemname.Value:=xAccountname+' ('+inttostr(xaccountno)+')' ELSE
    Accdatamoduleform.cdssalelistitemname.Value:=Pmethod;
    {For cash payments, if the balance is less than 0, we deduct it from the payment}
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=Cashpay;
    Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
    Accdatamoduleform.cdssalelistsaleref.value:=currentsale;
    Accdatamoduleform.cdssalelistsrcacc.Value:=xaccountno;
    IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
    Accdatamoduleform.cdssalelist.Post;
    END;
  {we have to call calculate sum again to update the remaining balance}
  Calculatesum(false);
  IF balance>0 THEN
  setstate('inpayment') ELSE
  setstate('infinishng');
  END ELSE
IF (xstate='incard')THEN
  BEGIN
  pmethod:='MASTERCARD';
  xaccountno:=bankaccount;
  setstate('inentry');
  eselection.text:=Formatcurr('0.00',balance);
  END ELSE
IF xstate='inroomsel' THEN
  BEGIN
  {split}
  setstate('insplit');
  {load any existing sales with this room and booking no and status = 'I'}
  Accdatamoduleform.sqlsalecheck.Close;
  Accdatamoduleform.sqlsalecheck.CommandText:='SELECT * FROM salelist where status = ''I'' and roomno = '''+accdatamoduleform.cdsbookingroomno.AsString+''' and bookingref = '''+accdatamoduleform.cdsbookingbookingno.Value+'''';
  Accdatamoduleform.sqlsalecheck.Active:=true;
  IF accdatamoduleform.sqlsalecheck.IsEmpty=false THEN
    BEGIN
    lbpicklist.Clear;
    accdatamoduleform.sqlsalecheck.First;
      REPEAT
      IF lbpicklist.Items.IndexOf(accdatamoduleform.sqlsalechecksalename.Value)=-1 THEN
      lbpicklist.Items.Add(accdatamoduleform.sqlsalechecksalename.Value);
      IF accdatamoduleform.sqlsalecheck.eof=false THEN accdatamoduleform.sqlsalecheck.next;
      UNTIL accdatamoduleform.sqlsalecheck.eof=true;
    END;
  END ELSE
IF xstate='inaccountsel' THEN
  BEGIN
  {to inentry}
  setstate('inentry');
  eselection.text:=Formatcurr('0.00',sumgross);
  END ELSE
IF xstate='inselectcurrency' THEN
  BEGIN
  {to active}
  setstate('insale');
  END ELSE
IF xstate='inmaestro' THEN
  BEGIN
  {we call calculate sum in case non switch payment is being made}
  {to a sale that includes cashback. }
  Calculatesum(false);
  {add this to the list}
  IF accdatamoduleform.cdssalelist.Locate('itemname',Pmethod,[])=True THEN
    BEGIN
    {If the item is already there we add the amount to the existing balance}
    Cashpay:=strtocurr(eselection.Text);
    Oldbal:=Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency;
    oldbal:=oldbal+cashpay;
    accdatamoduleform.cdssalelist.Edit;
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=oldbal;
    Accdatamoduleform.cdssalelist.post;
    END ELSE
    BEGIN
    Accdatamoduleform.cdssalelist.Append;
    accdatamoduleform.cdssalelistinvitem.Value:=-2;
    accdatamoduleform.cdssalelistsaleitem.Value:=xaccountno;
    IF PMethod='ACCOUNT' THEN
    Accdatamoduleform.cdssalelistitemname.Value:=xAccountname+' ('+inttostr(xaccountno)+')' ELSE
    Accdatamoduleform.cdssalelistitemname.Value:=Pmethod;
    Cashpay:=strtocurr(eselection.Text);
    {For cash payments, if the balance is less than 0, we deduct it from the payment}
    Accdatamoduleform.cdssalelisttotalgrossprice.ascurrency:=Cashpay;
    Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
    IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
    Accdatamoduleform.cdssalelist.Post;
    END;
  {we have to call calculate sum again to update the remaining balance}
  Calculatesum(false);
  {now we return to inpayment}
  IF balance>0 THEN
  setstate('inpayment') ELSE
  setstate('infinishng');
  END ELSE
IF xstate='incashback' THEN
  BEGIN
  {we want to add the amount of cash back if it's > 0 and show an error if it's greater than the limit}
  IF strtocurr(eselection.Text)<=cashbacklimit THEN
    BEGIN
    {Add the cashback at the end of the sale, but before the total}
    Accdatamoduleform.cdssalelist.Last;
    Accdatamoduleform.cdssalelist.Insert;
    accdatamoduleform.cdssalelistinvitem.Value:=0;
    {we want this to credit the cash account}
    accdatamoduleform.cdssalelistsaleitem.Value:=0;
    Accdatamoduleform.cdssalelistitemname.Value:=cashbackstring;
    Accdatamoduleform.cdssalelistpriceneteach.ascurrency:=strtocurr(eselection.Text);
    Accdatamoduleform.cdssalelisttotalnetprice.AsCurrency:=strtocurr(eselection.Text);
    Accdatamoduleform.cdssalelistsalecount.asfloat:=1;
    Accdatamoduleform.cdssalelistsaleno.Value:=currentsale;
    IF accdatamoduleform.cdssalelistinvitem.value<0 THEN accdatamoduleform.cdssalelistlorder.value:='Z' ELSE accdatamoduleform.cdssalelistlorder.Value:='A';
    Accdatamoduleform.cdssalelist.Post;
    calculatesum(false);
    {now return to inentry}
    setstate('inentry');
    eselection.text:=Formatcurr('0.00',sumgross);
    END ELSE
    BEGIN
    Messagedlg('','Cash back limit is '+currtostr(cashbacklimit),mterror,[mbOK],0);
    eselection.Clear;
    END;
  END;

eselection.SetFocus;
end;

procedure Taccsalesform.btnBClick(Sender: TObject);
begin
IF btnB.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('B',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnCClick(Sender: TObject);
begin
IF btnC.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('C',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnDClick(Sender: TObject);
begin
IF btnD.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('D',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnEClick(Sender: TObject);
begin
IF btnE.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('E',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnFClick(Sender: TObject);
begin
IF btnF.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('F',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnGClick(Sender: TObject);
begin
IF btnG.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('G',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnHClick(Sender: TObject);
begin
IF btnH.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('H',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnIClick(Sender: TObject);
begin
IF btnI.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('I',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnJClick(Sender: TObject);
begin
IF btnJ.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('J',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnSClick(Sender: TObject);
begin
IF btnS.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('S',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnKClick(Sender: TObject);
begin
IF btnK.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('K',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnLClick(Sender: TObject);
begin
IF btnL.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('L',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnMClick(Sender: TObject);
begin
IF btnM.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('M',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnNClick(Sender: TObject);
begin
IF btnN.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('N',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnOClick(Sender: TObject);
begin
IF btnO.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('O',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnPClick(Sender: TObject);
begin
IF btnP.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('P',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnQClick(Sender: TObject);
begin
IF btnQ.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('Q',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnRClick(Sender: TObject);
begin
IF btnR.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('R',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnSpaceClick(Sender: TObject);
begin
IF btnSpace.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert(' ',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnTClick(Sender: TObject);
begin
IF btnT.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('T',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnUClick(Sender: TObject);
begin
IF btnU.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('U',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnVClick(Sender: TObject);
begin
IF btnV.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('V',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnWClick(Sender: TObject);
begin
IF btnW.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('W',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnXClick(Sender: TObject);
begin
IF btnX.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('X',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnYClick(Sender: TObject);
begin
IF btnY.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('Y',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.btnZClick(Sender: TObject);
begin
IF btnZ.Font.Color=clLime THEN
  BEGIN
  Theselection:=eselection.Text;
  IF eselection.SelLength>0 THEN
    BEGIN
    delete(theselection,eselection.SelStart+1,eselection.sellength);
    END;
  insert('Z',theselection,length(theselection)+1);
  eselection.Text:=theselection;
  eselection.SetFocus;
  eselection.SelStart:=length(theselection);
  eselection.CursorPos:=eselection.SelStart;
  END;
end;

procedure Taccsalesform.lbpicklistClick(Sender: TObject);
Var
i,selectedindex:integer;
selecteditem:string;
done,notax:boolean;
begin
IF lbpicklist.Items.Count>0 THEN
  BEGIN
  selectedindex:=-1;
  i:=0;
    REPEAT
    IF (i<lbpicklist.items.count)AND(lbpicklist.selected[i]=true) THEN
      BEGIN
      selectedindex:=i;
      selecteditem:=lbpicklist.Items[i];
      END;
    i:=i+1;
    done:=(i=lbpicklist.items.count)OR(selectedindex>-1);
    UNTIL done;
  IF (xstate='insale')OR(xstate='inedit')OR(xstate='inqkprodsel') THEN
    BEGIN
    firstentry:=true;
    selectedinv:=-1;
    selectedsale:=-1;
    IF selectedindex>-1 THEN
      BEGIN
      IF accdatamoduleform.cdsallsales.Locate('description',selecteditem,[loCaseInsensitive])=True THEN
        BEGIN
        IF xstate='inqkprodsel' THEN
          BEGIN
          saleitem:=accdatamoduleform.cdsallsalessitem.Value;
          invitem:=accdatamoduleform.cdsallsalesinvitem.value;
          nextlevel:=-1;
          nlevelname:='Not Set';
          buttoncap:=accdatamoduleform.cdsallsalesdescription.Value;
          SetF2('Enter',true);
          END ELSE
          BEGIN
          {we have chosen this item so it becomes the current one}
          selectedsale:=accdatamoduleform.cdsallsalessitem.Value;
          selectedinv:=accdatamoduleform.cdsallsalesinvitem.value;
          additem(selectedinv,selectedsale,selectedamt);
          END;
        END ELSE
      IF selecteditem=discountstring THEN
        BEGIN
        IF (accdatamoduleform.cdssalelist.IsEmpty=false)AND(xstate='insale')
        THEN setstate('indiscount') ELSE
          BEGIN
          lbpicklist.Clear;
          END;
        END ELSE
      IF xstate<>'inqkprodsel' THEN
        BEGIN
        IF accdatamoduleform.cdsinventory.Locate('item',selectedinv,[])=True THEN
          BEGIN
          accdatamoduleform.cdsSales.Locate('sitem',selectedsale,[]);
          esaledescr.Text:=Formatfloat('0',selectedamt)+' '+accdatamoduleform.cdsSalesdescription.Value;
          IF xstate='insale' THEN SetF4('Add',True) ELSE
          IF xstate='inedit' THEN SetF4('Edit',True);
          Statusbar2.SimpleText:='Click ''Add'' to enter this item, or use the number keys to change the number of items.';
          END ELSE
          BEGIN
          IF Cashsale=true THEN
            BEGIN
            IF eselection.text<>'' THEN
              BEGIN
              noninvitemname:=eselection.Text;
              esaledescr.Text:=eselection.Text;
              setstate('noninvcost');
              Statusbar2.SimpleText:='This item isn''t inventoried. Please enter the price.';
              END;
            END ELSE
            BEGIN
            esaledescr.Text:='';
            IF xstate='insale' THEN SetF4('Add',False) ELSE
            IF xstate='inedit' THEN SetF4('Edit',False);
            END;
          END;
        END;
      END;
    eselection.Setfocus;
    eselection.SelStart:=length(eselection.Text);
    eselection.CursorPos:=eselection.SelStart;
    END ELSE
  IF xstate='inqklevelsel' THEN
    BEGIN
    {see what, if anything we've selected}
    IF selectedindex>-1 THEN
      BEGIN
      {this is the level we'll use}
      nlevelname:=lbpicklist.items[selectedindex];
      SetF2('Enter',True);
      END ELSE SetF2('Enter',False);
    END ELSE
  IF xstate='insetprinter' THEN
    BEGIN
    printername:=selecteditem;
    SetF2('Enter',True);
    END ELSE
  IF xstate='inroomsel' THEN
    BEGIN
    {see if the selected room can be split}
    {if so, make split active otherwise make split and enter active}
    transname:=selecteditem;
    delete(selecteditem,1,5);
    {select all sales that have this booking number}
    accdatamoduleform.cdsbooking.Refresh;
    IF accdatamoduleform.cdsbooking.locate('roomno',selecteditem,[loCaseInsensitive])=true THEN
      BEGIN
      IF accdatamoduleform.cdsbookingsplit.Value=true THEN SetF3('Split',True) ELSE SetF3('Split',False);
      SetF4('Enter',True);
      END;
    END ELSE
  IF xstate='clone' THEN
    BEGIN
    IF selectedindex>-1 THEN setF3('Clone',True) ELSE setF3('Clone',False); 
    END ELSE
  IF xstate='inaccountsel' THEN
    BEGIN
    accdatamoduleform.sqlaccount.Close;
    accdatamoduleform.cdsaccount.Close;
    accdatamoduleform.sqlaccount.CommandText:='SELECT * FROM account where name = '+selecteditem;
    accdatamoduleform.cdsaccount.open;
    IF accdatamoduleform.cdsaccount.locate('name',selecteditem,[locaseinsensitive])=true THEN SetF4('Enter',True) ELSE SetF4('Enter',False);
    END ELSE
  IF xstate='insplit' THEN
    BEGIN
    IF selectedindex<>-1 THEN setF4('Enter',true) ELSE setF4('Enter',false);
    Transname:=selecteditem;
    END ELSE
  IF xstate='inaccountsel' THEN
    BEGIN
    pmethod:='ACCOUNT';
    IF selectedindex>-1 THEN
      BEGIN
      {this is the account we'll use}
      accdatamoduleform.sqlaccount.Close;
      accdatamoduleform.cdsaccount.Close;
      accdatamoduleform.sqlaccount.CommandText:='SELECT * FROM account where name = '+selecteditem;
      accdatamoduleform.cdsaccount.open;

      IF accdatamoduleform.cdsaccount.isempty=false THEN
        BEGIN
      	xaccountno:=accdatamoduleform.cdsaccountitem.Value;
      	xaccountname:=selecteditem;
      	scustomer:=xaccountname;
        SetF3('Enter',True);
        END ELSE SetF3('Enter',False);
      END ELSE SetF3('Enter',False);
    END ELSE
  IF xstate='inselectcurrency' THEN
    BEGIN
    IF selectedindex>-1 THEN
      BEGIN
      SetF3('Enter',True);
      Currencychoice:=selecteditem;
      END ELSE SetF3('Enter',False);
    END ELSE
  IF xstate='intaxsel' THEN
    BEGIN
    selecteditem:='';
    i:=0;
    notax:=false;
      REPEAT
      IF (i<lbpicklist.items.count)AND(lbpicklist.selected[i]=true) THEN
        BEGIN
        IF accdatamoduleform.cdstaxes.Locate('description',lbpicklist.Items[i],[loCaseInsensitive])=true THEN
          BEGIN
          IF length(selecteditem)>0 THEN Insert(',',selecteditem,length(selecteditem)+1);
          Insert(accdatamoduleform.cdstaxesitem.asstring,selecteditem,length(selecteditem)+1);
          END ELSE
          BEGIN
          IF lbpicklist.Items[i]='<None>' THEN notax:=true ELSE
          Messagedlg('','Cannot find selected tax '+lbpicklist.Items[i],mterror,[mbOK],0);
          END;
        END;
      i:=i+1;
      UNTIL i=lbpicklist.items.count;
    IF notax=true THEN selecteditem:='';
    IF lbpicklist.SelCount>0 THEN
      BEGIN
      SetF3('Enter',True);
      selectedtax:=selecteditem;
      END ELSE SetF3('Enter',False);
    END ELSE
  IF xstate='inrecall' THEN
    BEGIN
    IF accdatamoduleform.sqlsalelist.IsEmpty=false THEN
      BEGIN
      transname:='';
      IF accdatamoduleform.sqlsalelist.Locate('salename',selecteditem,[])=true THEN
        BEGIN
        transname:=accdatamoduleform.sqlsalelistsalename.Value;
        SetF2('Enter',True);
        END ELSE
        BEGIN
        SetF2('Enter',False);
        END;
      END;
    END ELSE
  IF xstate='inusers' THEN
    BEGIN
    {If we've clicked on a valid item then the next level allows us to}
    {change some of the parameters of this user}
    {We also need to check if the user is listed in our system table}
    Accdatamoduleform.Loadsysteminfo('system','users','name',selecteditem);
    IF accdatamoduleform.cdssysdata.IsEmpty=true THEN
    accdatamoduleform.addsysteminfo('system','users','name',selecteditem);
    newuser:=selecteditem;
    accdatamoduleform.sqlusers.Active:=true;
    IF accdatamoduleform.sqlusers.Locate('usename',selecteditem,[loCaseInsensitive])=true THEN
      BEGIN
      SetF2('Add',True); {New user}
      IF accdatamoduleform.Getsysteminfo('system','usersactive',selecteditem,'false')='false' THEN
      SetF3('Delete',True) ELSE
      SetF3('Delete',False);
      SetF4('Password',True); {require password or set password}
      SetF5('Settings',True); {active,admin}
      SetF6('Details',True);  {Full name}
      SetF7('Back',True);
      END;
    END;
  END;
end;

procedure Taccsalesform.eselectionChange(Sender: TObject);

type
 TNumbers = set of Char;
var
Numbers:TNumbers;
point,i:integer;
Teststring:String;
xposition,numletters:integer;
deletethis,done,pointset:Boolean;
endwild:boolean;
searchstring:string;
intpart:string;
begin
Numbers:=['1','2','3','4','5','6','7','8','9','0'];
Teststring:=eselection.Text;
cursorposition:=eselection.CursorPos;
IF xstate='inlogin' THEN
  BEGIN
  IF length(teststring)<=6 THEN
    BEGIN
    eselection.Text:='Login:';
    SetF2('Enter',False);
    END ELSE
    BEGIN
    SetF2('Enter',True);
    END;
  END ELSE
IF xstate='getserver' THEN
  BEGIN
  IF length(teststring)<=7 THEN
    BEGIN
    eselection.Text:='Server:';
    SetF2('Enter',False);
    END ELSE
    BEGIN
    SetF2('Enter',True);
    END;
  END ELSE
IF xstate='getdatabase' THEN
  BEGIN
  IF length(teststring)<=9 THEN
    BEGIN
    eselection.Text:='database:';
    SetF2('Enter',False);
    END ELSE
    BEGIN
    SetF2('Enter',True);
    END;
  END ELSE
IF xstate='getpassword' THEN
  BEGIN
  IF length(teststring)<=1 THEN
    BEGIN
    SetF2('Enter',False);
    END ELSE
    BEGIN
    SetF2('Enter',True);
    END;
  END ELSE
IF xstate='intransname' THEN
  BEGIN
  IF length(teststring)<=5 THEN
    BEGIN
    eselection.Text:='Name:';
    SetF2('Enter',False);
    END ELSE
    BEGIN
    SetF2('Enter',True);
    transname:=eselection.Text;
    delete(transname,1,5);
    END;
  END ELSE
IF xstate='inpassword' THEN
  BEGIN
  IF length(teststring)<1 THEN
    SetF2('Enter',False) ELSE SetF2('Enter',True);
  END ELSE
IF xstate='inuseradd' THEN
  BEGIN
  IF length(teststring)<1 THEN
  SetF2('Name',False)ELSE SetF2('Name',True);
  END ELSE
IF xstate='inuseradd2' THEN
  BEGIN
  IF length(teststring)<1 THEN
  SetF2('Full name',False)ELSE SetF2('Full name',True);
  END ELSE
IF xstate='inuseradd3' THEN
  BEGIN
  IF length(teststring)<1 THEN
  SetF2('Password',False)ELSE SetF2('Password',True);
  END ELSE
IF xstate='inuserpass' THEN
  BEGIN
  IF length(teststring)<1 THEN
  SetF2('Enter',False)ELSE SetF2('Enter',True);
  END ELSE
IF (xstate='insale')OR(xstate='inedit')OR(xstate='inqkprodsel')THEN
  BEGIN
  IF Length(Teststring)>0 THEN
    BEGIN
    IF (teststring[length(teststring)]in numbers)OR
    (teststring[length(teststring)]='.') THEN
      BEGIN
      amtstring:=teststring;
      {take out unwanted points}
      i:=Length(amtstring);
      pointset:=false;
      intpart:='';
        REPEAT
        deletethis:=false;
        IF i>0 THEN
          BEGIN
          insert(amtstring[i],intpart,1);
          IF amtstring[i]='.' THEN
            BEGIN
            IF pointset=true THEN deletethis:=true ELSE pointset:=true;
            intpart:='';
            END;
          IF deletethis=true THEN delete(amtstring,i,1);
          i:=i-1;
          END;
        UNTIL i=0;
      IF intpart<>'' THEN
      selectedamt:=strtofloat(intpart)ELSE selectedamt:=0;
      teststring:=amtstring;
      IF selectedsale<>-1 THEN
      esaledescr.Text:=formatfloat('0',selectedamt)+' '+accdatamoduleform.cdsSalesdescription.Value ELSE
      esaledescr.Text:=formatfloat('0',selectedamt);
      eselection.Text:=amtstring;
      Firstentry:=false;
      END;
    Filterstring:=Teststring;

    Accdatamoduleform.cdsAccount.Active:=True;
    Accdatamoduleform.cdsaccount.Filtered:=False;
    Accdatamoduleform.cdsaccount.Filter:=Accountfilter;
    Accdatamoduleform.cdsaccount.Filtered:=true;

    eselection.Text:=teststring;
    eselection.SelStart:=cursorposition;
    eselection.cursorpos:=cursorposition;
    IF xstate='insale' THEN SetF2('Cash Tend',True);
    END ELSE
    BEGIN
    amtstring:='0';
    esaledescr.Clear;
    IF xstate='insale' THEN SetF2('Cash Tend',False);
    IF xstate='insale' THEN SetF4('Add',False) ELSE
    IF xstate='inedit' THEN SetF4('Edit',False);
    END;
  {now, we want to select things from stocklist which have the same letters as our selection}
  {if there is an asterisk we want to show everything}
  IF length(teststring)>0 THEN
    BEGIN

    {If there's an asterisk we replace it with a % and stick an asterisk at the end}
    endwild:=false;
    searchstring:='';
    numletters:=0;
    xposition:=1;
      REPEAT
      IF xposition<= length(teststring) THEN
        BEGIN
        IF (teststring[xposition]='*')OR(teststring[xposition]='%')OR(teststring[xposition]='?')THEN
          BEGIN
          Insert('%',searchstring,length(searchstring)+1);
          IF xposition=length(teststring) THEN endwild:=true;
          END ELSE
          BEGIN
          Insert(teststring[xposition],searchstring,length(searchstring)+1);
          numletters:=numletters+1;
          END;
        END;
      xposition:=xposition+1;
      UNTIL xposition>length(teststring);
    IF (endwild=false)THEN insert('%',searchstring,length(searchstring)+1);
    IF accdatamoduleform.cdsallsales.active=false THEN accdatamoduleform.cdsallsales.active:=true;
    IF numletters>0 THEN
      BEGIN
      accdatamoduleform.cdsallsales.Active:=true;
      accdatamoduleform.cdsallsales.Filter:='description LIKE '''+searchstring+'''';
      accdatamoduleform.cdsallsales.Filtered:=true;
      {accdatamoduleform.sqlallSales.close;
      accdatamoduleform.sqlallSales.commandtext:='SELECT * FROM sales WHERE (active = true) and (description LIKE '''+searchstring+''')';
      accdatamoduleform.cdsallSales.active:=true;
      accdatamoduleform.cdsallSales.refresh;}
      END ELSE       accdatamoduleform.cdsallsales.Active:=false;{ ELSE accdatamoduleform.cdsallsales.emptydataset;}

    lbpicklist.clear;
    {now put the selected items into the picklist}
    IF accdatamoduleform.cdsallsales.IsEmpty = False THEN
      BEGIN
      accdatamoduleform.cdsallsales.First;
        REPEAT
        lbpicklist.Items.Add(accdatamoduleform.cdsallsalesdescription.Value);
        IF accdatamoduleform.cdsallsales.Eof=false THEN accdatamoduleform.cdsallsales.Next;
        UNTIL accdatamoduleform.cdsallsales.Eof=true;
      END;
    {end experimental}
    IF (Cashsale=true)AND(lbpicklist.Items.Count=0) THEN lbpicklist.items.Add(eselection.Text);
    END ELSE lbpicklist.Clear; {length teststring >0}
  END ELSE
IF (xstate='inaccountbyname')OR(xstate='inaccountbyroom')OR(xstate='inaccountbynumber')THEN
  BEGIN
  IF Length(Teststring)>0 THEN
    BEGIN
    IF length(Teststring)>=1 THEN Teststring[1]:=upcase(Teststring[1]);
    {If this item isn't in the history list we add it and move our counter to that position}

    eselection.Text:=teststring;
    eselection.cursorpos:=cursorposition;
    END ELSE
    BEGIN
    esaledescr.Clear;
    END;

  IF length(teststring)>0 THEN
    BEGIN
    {If there's an asterisk we replace it with a % and stick an asterisk at the end}
    endwild:=false;
    searchstring:='';
    numletters:=0;
    xposition:=1;
      REPEAT
      IF xposition<= length(teststring) THEN
        BEGIN
        IF (teststring[xposition]='*')OR(teststring[xposition]='%')OR(teststring[xposition]='?')THEN
          BEGIN
          Insert('%',searchstring,length(searchstring)+1);
          IF xposition=length(teststring) THEN endwild:=true;
          END ELSE
          BEGIN
          Insert(teststring[xposition],searchstring,length(searchstring)+1);
          numletters:=numletters+1;
          END;
        END;
      xposition:=xposition+1;
      UNTIL xposition>length(teststring);
    IF (endwild=false)THEN insert('%',searchstring,length(searchstring)+1);
    IF numletters>0 THEN
      BEGIN
      accdatamoduleform.sqlallSales.close;
      accdatamoduleform.sqlallSales.commandtext:='SELECT * FROM sales WHERE (active = true) and (description LIKE '''+searchstring+''')';
      accdatamoduleform.cdsallSales.active:=true;
      IF accdatamoduleform.cdsallSales.changecount>0 THEN accdatamoduleform.cdsallSales.CancelUpdates;
      accdatamoduleform.cdsallSales.Refresh;
      END ELSE accdatamoduleform.cdsallSales.active:=false;

    lbpicklist.clear;
    {now put the selected items into the picklist}
    IF accdatamoduleform.cdsallsales.IsEmpty = False THEN
      BEGIN
      accdatamoduleform.cdsallsales.First;
        REPEAT
        lbpicklist.Items.Add(accdatamoduleform.cdsallsalesdescription.Value);
        IF accdatamoduleform.cdsallsales.Eof=false THEN accdatamoduleform.cdsallsales.Next;
        UNTIL accdatamoduleform.cdsallsales.Eof=true;
      END;
    IF (Cashsale=true)AND(lbpicklist.Items.Count=0) THEN lbpicklist.items.Add(eselection.Text);
    END ELSE lbpicklist.Clear; {length teststring >0}
  END ELSE
IF (xstate='inselectcurrency')OR(xstate='intaxsel') THEN
  BEGIN
  IF Length(Teststring)>0 THEN
    BEGIN
    IF length(Teststring)>=1 THEN Teststring[1]:=upcase(Teststring[1]);
    eselection.Text:=teststring;
    END ELSE
    BEGIN
    esaledescr.Clear;
    END;
  {now, we want to select things from stocklist which have the same letters as our selection}
  IF length(teststring)>0 THEN
    BEGIN
    {If there's an asterisk we replace it with a % and stick an asterisk at the end}
    endwild:=false;
    searchstring:='';
    numletters:=0;
    xposition:=1;
      REPEAT
      IF xposition<= length(teststring) THEN
        BEGIN
        IF (teststring[xposition]='*')OR(teststring[xposition]='%')OR(teststring[xposition]='?')THEN
          BEGIN
          Insert('%',searchstring,length(searchstring)+1);
          IF xposition=length(teststring) THEN endwild:=true;
          END ELSE
          BEGIN
          Insert(teststring[xposition],searchstring,length(searchstring)+1);
          numletters:=numletters+1;
          END;
        END;
      xposition:=xposition+1;
      UNTIL xposition>length(teststring);
    IF (endwild=false)THEN insert('%',searchstring,length(searchstring)+1);
    IF numletters>0 THEN
      BEGIN
      accdatamoduleform.sqlallSales.close;
      accdatamoduleform.sqlallSales.commandtext:='SELECT * FROM sales WHERE (active = true) and (description LIKE '''+searchstring+''')';
      accdatamoduleform.cdsallSales.active:=true;
      IF accdatamoduleform.cdsallSales.changecount>0 THEN accdatamoduleform.cdsallSales.CancelUpdates;
      accdatamoduleform.cdsallSales.Refresh;
      END ELSE accdatamoduleform.cdsallSales.active:=false;

    lbpicklist.clear;
    {now put the selected items into the picklist}
    IF accdatamoduleform.cdsallsales.IsEmpty = False THEN
      BEGIN
      accdatamoduleform.cdsallsales.First;
        REPEAT
        lbpicklist.Items.Add(accdatamoduleform.cdsallsalesdescription.Value);
        IF accdatamoduleform.cdsallsales.Eof=false THEN accdatamoduleform.cdsallsales.Next;
        UNTIL accdatamoduleform.cdsallsales.Eof=true;
      END;
    IF (Cashsale=true)AND(lbpicklist.Items.Count=0) THEN lbpicklist.items.Add(eselection.Text);
    END ELSE lbpicklist.Clear; {length teststring >0}
  END ELSE
IF xstate='inqkcaption' THEN
  BEGIN
  IF length(teststring)<=8 THEN
    BEGIN
    eselection.Text:='Caption:';
    SetF2('Enter',False);
    END ELSE
    BEGIN
    buttoncap:=teststring;
    delete(buttoncap,1,8);
    IF length(buttoncap)>0 THEN
    SetF2('Enter',True) ELSE SetF2('Enter',False);
    END;
  END ELSE
IF xstate='insplit' THEN
  BEGIN
  IF eselection.Text<>'' THEN setF4('Enter',true) ELSE setF4('Enter',false);
  transname:=eselection.Text;
  END ELSE
IF (xstate='inentry')OR(xstate='incashback')OR(xstate='noninvcost')OR(xstate='indiscount')THEN
  BEGIN
  amtstring:=teststring;
  {this input has to be a valid amount of money}
  IF Length(amtstring)>0 THEN
    BEGIN
    {we want to exclude anything that isn't a number or point or a currency descriptor}
    point:=0;
    Numbers := ['1','2','3','4','5','6','7','8','9','0'];
    IF Length(amtstring)>0 THEN
      BEGIN
      i:=1;
      pointset:=false;
        REPEAT
        IF amtstring[i]='.' THEN
          BEGIN
          IF Pointset=False THEN
            BEGIN
            Pointset:=True;
            Point:=i;
            Deletethis:=False
            END ELSE Deletethis:=true;
          END ELSE
        IF (amtstring[i] in Numbers)THEN Deletethis:=False ELSE Deletethis:=True;
        IF Deletethis= True THEN
          BEGIN
          Delete(amtstring,i,1);
          Cursorposition:=cursorposition-1;
          END ELSE i:=i+1;
        Done:=(i=length(amtstring)+1)OR(length(amtstring)=0);
        UNTIL Done;
      IF length(amtstring)>0 THEN {some numbers and dec}
        BEGIN
        IF pointset=True THEN
          BEGIN
          IF length(amtstring)>point+2 THEN Delete(amtstring,point+3,length(teststring)-(point+2));
          SPointsetlast:=True;
          END ELSE
        IF Spointsetlast=True THEN
          BEGIN
          SPointsetlast:=False;
          Delete(amtstring,length(amtstring)-1,2);
          END;
        END;
      IF xstate='inentry' THEN
      eselection.text:=pmethod+' '+currencystring+amtstring ELSE
      eselection.Text:=amtstring;
      eselection.selstart:=length(eselection.text);
      eselection.Cursorpos:=eselection.selstart;
      IF (xstate='inentry')OR(xstate='incashback')THEN
        BEGIN
        IF eselection.text<>'' THEN
        SetF3('Enter',True) ELSE SetF3('Enter',False);
        END ELSE
      IF xstate='noninvcost' THEN
        BEGIN
        IF eselection.text<>'' THEN
          BEGIN
          SetF3('Net',True);
          SetF4('Gross',True);
          END ELSE
          BEGIN
          SetF3('Net',False);
          SetF4('Gross',False);
          END;
        END ELSE
      IF xstate='indiscount' THEN
        BEGIN
        {if the amount is >= 100 then percentage is not appropriate}
        {if the amount is > the balance then amount is not appropriate}
        IF eselection.text<>'' THEN
          BEGIN
          IF strtofloat(eselection.text)>100 THEN SetF4('Percentage',False) ELSE SetF4('Percentage',True);
          IF strtofloat(eselection.text)>balance THEN SetF3('Amount',False) ELSE SetF3('Amount',True);
          END;
        END;
      END;
    END;
  END;
end;

procedure Taccsalesform.Btn1Click(Sender: TObject);
begin
Numberkey('1');
end;

procedure Taccsalesform.Btn2Click(Sender: TObject);
begin
numberkey('2');
end;

procedure Taccsalesform.btnF4Click(Sender: TObject);
type
 TNumbers = set of Char;
var
Numbers:TNumbers;
i,itax,xshift:Integer;
stax,sitemtaxstring:string;
taxrate,thistaxrate,totaltaxrate:double;
begin
Numbers:=['0','1','2','3','4','5','6','7','8','9'];
IF btnF4.font.color=clLime THEN
BEGIN
IF xstate='newshift' THEN
  BEGIN
  {we start a new shift with the next shift number}
  accdatamoduleform.Startshift;
  inshift:=true;
  setstate('active');
  statusbar2.SimpleText:='Shift number '+inttostr(currentshift)+' started';
  END ELSE
IF xstate='inqkset' THEN
  BEGIN
  setstate('inqkprodsel');

  END ELSE
IF xstate='inqkcolsel' THEN
  BEGIN
  {text colour}
  textcolour:=selcolour;
  savebutton;
  loadbuttons(currlevel);
  setstate('inqkset');
  END ELSE
IF xstate='control' THEN
  BEGIN
  setstate('saleadmin');
  END ELSE
IF Xstate='setup' THEN
  BEGIN
  setstate('getserver');
  END ELSE
IF xstate='inusers' THEN
  BEGIN
  setstate('inuserpass');
  END ELSE
IF xstate='acceptshift' THEN
  BEGIN
  {we read the value of eselection. If it's a valid number we accept it}
    Try
    xshift:=strtoint(eselection.Text);
    IF xshift>= shiftcounter THEN
      BEGIN
      Currentshift:=xshift;
      shiftcounter:=xshift;
      accdatamoduleform.Writelog('','','Shift started - Manually numbered as '+inttostr(currentshift));
      Inshift:=True;
      setstate('active');
      END ELSE Messagedlg('','Shift number must be '+inttostr(shiftcounter)+' or higher',mterror,[mBOK],0);
    Except
    {Not a valid input}
    Messagedlg('','Shift number must be a number. It should be '+inttostr(shiftcounter)+' or higher',mterror,[mBOK],0);
    End;
  END ELSE
IF xstate='active' THEN
  BEGIN
  {refund}
  END ELSE
IF (xstate='insale')OR(xstate='inedit') THEN
  BEGIN
  {add the current item}
  additem(selectedinv,selectedsale,selectedamt);
  END ELSE
IF xstate='inprint' THEN
  BEGIN
  printcheck;
  setstate('insale');
  END ELSE
IF xstate='noninvcost' THEN
  BEGIN
  {We should accept the amount}
  {and then go back to "addnoninv"}
  noninvgross:=strtocurr(eselection.text);
  accdatamoduleform.cdstaxes.Active:=true;
  {we need to work out the tax}
  {we have to calculate the total tax}
  totaltaxrate:=0;
  sitemtaxstring:=selectedtax;

  IF length(sitemtaxstring)>0 THEN
    BEGIN
    i:=1;
      REPEAT
      IF i<=length(sitemtaxstring) THEN
        BEGIN
        IF sitemtaxstring[i]=' 'THEN Delete(sitemtaxstring,i,1) ELSE i:=i+1;
        END;
      UNTIL i>length(sitemtaxstring);
    END;
  IF length(sitemtaxstring)>0 THEN
    BEGIN
    stax:=''; {a string}
    {extract the taxes from it. That way, find the total tax rate}
    i:=1;
      REPEAT
      IF (i<=length(sitemtaxstring))THEN
        BEGIN
        {taxstring is a list of numbers separated by commas. We extract anything that is a number}
        IF sitemtaxstring[i]in numbers THEN
          BEGIN
          Insert(sitemtaxstring[i],stax,length(stax)+1);
          END;
        IF (not(sitemtaxstring[i]in numbers))OR((i=length(sitemtaxstring))AND(stax<>''))THEN
          BEGIN
          itax:=strtoint(stax); {an integer}
          stax:='';
          IF accdatamoduleform.cdstaxes.locate('item',itax,[])=true THEN
            BEGIN
            thistaxrate:=accdatamoduleform.cdstaxesrate.AsFloat;
            totaltaxrate:=totaltaxrate+thistaxrate;
            END ELSE {not found in taxes}
            BEGIN
            Messagedlg('','''Could not find tax''',mterror,[mbok],0);
            END;
          END;{a valid tax is found}
        END;{i is <length(taxstring}
      i:=i+1;
      UNTIL i>length(sitemtaxstring);
    END;{length(taxstring)>0}
  {we now have the total tax rate}
  Taxrate:=Totaltaxrate;
  taxrate:=taxrate/100;
  noninvnet:=noninvgross/(1+taxrate);
  noninvtax:=taxrate*noninvnet;
  esaledescr.text:=noninvitemname+' @ '+formatfloat('0.00',noninvgross);
  setstate('addnoninv');
  END ELSE
IF xstate='inpayment' THEN
  BEGIN
  IF Balance>0 THEN
  setstate('incard') ELSE
  setstate('infinishng');
  END ELSE
IF (xstate='incard')THEN
  BEGIN
  pmethod:='VISA DEBIT';
  xaccountno:=bankaccount;
  setstate('inentry');
  eselection.text:=Formatcurr('0.00',balance);
  END ELSE
IF (xstate='inmaestro')THEN
  BEGIN
  setstate('incashback');
  END ELSE
IF (xstate='inroomsel')THEN
  BEGIN
  {charge the sale to this room}
  {We want to change this so that it has a 'done' section like all other payments}
  calculatesum(true);
  IF accdatamoduleform.cdssalelist.ChangeCount>0 THEN accdatamoduleform.cdssalelist.ApplyUpdates(0);
  accdatamoduleform.conn.ExecuteDirect('Update salelist set salename = '''+transname+''' where saleno = '''+currentsale+'''');
  accdatamoduleform.conn.ExecuteDirect('Update salelist set roomno = '''+accdatamoduleform.cdsbookingroomno.AsString+''' where saleno = '''+currentsale+'''');
  accdatamoduleform.conn.ExecuteDirect('Update salelist set bookingref = '''+accdatamoduleform.cdsbookingbookingno.Value+''' where saleno = '''+currentsale+'''');
  accdatamoduleform.conn.ExecuteDirect('Update salelist set status = ''R'' where saleno = '''+currentsale+'''');
  accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale','0');
  accdatamoduleform.setsysteminfo(sdatabase,stationname,'salenumber','0');
  Setstate('active');
  END ELSE
IF (xstate='insplit')THEN
  BEGIN
  {charge the sale to this guest}
  IF accdatamoduleform.cdssalelist.ChangeCount>0 THEN accdatamoduleform.cdssalelist.ApplyUpdates(0);
  accdatamoduleform.conn.ExecuteDirect('Update salelist set salename = '''+transname+''' where saleno = '''+currentsale+'''');
  accdatamoduleform.conn.ExecuteDirect('Update salelist set roomno = '''+accdatamoduleform.cdsbookingroomno.AsString+''' where saleno = '''+currentsale+'''');
  accdatamoduleform.conn.ExecuteDirect('Update salelist set bookingref = '''+accdatamoduleform.cdsbookingbookingno.Value+''' where saleno = '''+currentsale+'''');
  accdatamoduleform.conn.ExecuteDirect('Update salelist set status = ''I'' where saleno = '''+currentsale+'''');
  accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale','0');
  accdatamoduleform.setsysteminfo(sdatabase,stationname,'salenumber','0');
  Setstate('active');
  END ELSE
IF xstate='infinishng' THEN
  BEGIN
  {group the list by inventory group}
  END ELSE
IF xstate='infinishg' THEN
  BEGIN
  {show the full list}
  END;
eselection.SetFocus;
END;
end;

procedure Taccsalesform.DBGrid1CellClick(Column: TColumn);
begin
IF ((xstate='insale')OR(xstate='inedit'))
AND(accdatamoduleform.cdssalelist.IsEmpty=false)
AND(Accdatamoduleform.cdssalelistinvitem.Value<>-2) THEN
  BEGIN
  setstate('inedit');
  {load the selection window}
  selectedinv:=accdatamoduleform.cdssalelistinvitem.Value;
  selectedsale:=accdatamoduleform.cdssalelistsaleitem.Value;
  selectedamt:=accdatamoduleform.cdssalelistsalecount.AsFloat;
  amtstring:=Formatfloat('0',selectedamt);
  firstentry:=true;
  IF accdatamoduleform.cdsinventory.Locate('item',selectedinv,[]) = True THEN
    BEGIN
    IF accdatamoduleform.cdsSales.Locate('sitem',selectedsale,[])=True THEN
      BEGIN
      eselection.Text:=accdatamoduleform.cdsSalesdescription.Value;
      IF lbpicklist.Items.count=1 THEN
        BEGIN
        lbpicklist.Selected[0];
        esaledescr.Text:=formatfloat('0',selectedamt)+' '+accdatamoduleform.cdsSalesdescription.Value;        END;
      END ELSE accdatamoduleform.Writelog('','','sale item wasn''t found '+inttostr(selectedsale));
    END ELSE accdatamoduleform.Writelog('','','inventory item wasn''t found '+inttostr(selectedinv));
  eselection.SetFocus;
  END ELSE
IF (accdatamoduleform.cdssalelist.IsEmpty=false) AND(Accdatamoduleform.cdssalelistinvitem.Value=-2) THEN
  BEGIN
  {Delete payment items or the total}
  Setstate('insysedit');
  END;
end;

procedure Taccsalesform.Btn3Click(Sender: TObject);
begin
numberkey('3');
end;

procedure Taccsalesform.Btn4Click(Sender: TObject);
begin
numberkey('4');
end;

procedure Taccsalesform.Btn5Click(Sender: TObject);
begin
numberkey('5');
end;

procedure Taccsalesform.Btn6Click(Sender: TObject);
begin
numberkey('6');
end;

procedure Taccsalesform.Btn7Click(Sender: TObject);
begin
numberkey('7');
end;

procedure Taccsalesform.Btn8Click(Sender: TObject);
begin
numberkey('8');
end;

procedure Taccsalesform.Btn9Click(Sender: TObject);
begin
numberkey('9');
end;

procedure Taccsalesform.Btn0Click(Sender: TObject);
begin
numberkey('0');
end;

procedure Taccsalesform.btnF5Click(Sender: TObject);
begin
IF xstate='active'THEN
  BEGIN
  END ELSE
IF xstate='control'THEN
  BEGIN
  accsalesform.Close;
  END ELSE
IF xstate='setup' THEN
  BEGIN
  setstate('insetprinter');
  END ELSE
IF xstate='inusers' THEN
  BEGIN
  setstate('inusersetting');
  END ELSE
IF xstate='insetprinter' THEN
  BEGIN
  IF dontprint=false THEN dontprint:=true ELSE
  dontprint:=false;
  accdatamoduleform.setsysteminfo(stationname,'printing','print',booltostr(dontprint));
  setstate('setup');
  END ELSE
IF xstate='noninvcost'THEN
  BEGIN
  setstate('intaxsel');
  {we want to display all possible tax rates}
  IF accdatamoduleform.cdstaxes.Active=False THEN accdatamoduleform.cdstaxes.Active:=true;
  IF accdatamoduleform.cdstaxes.changecount=0 THEN accdatamoduleform.cdstaxes.Refresh;
  lbpicklist.Clear;
  lbpicklist.items.add('<None>');
  IF accdatamoduleform.cdstaxes.IsEmpty=False THEN
    BEGIN
    accdatamoduleform.cdstaxes.First;
      REPEAT
      IF lbpicklist.Items.IndexOf(accdatamoduleform.cdstaxesdescription.value)=-1 THEN
      lbpicklist.Items.Add(accdatamoduleform.cdstaxesdescription.value);
      IF Accdatamoduleform.cdstaxes.EOF=False THEN Accdatamoduleform.cdstaxes.Next;
      UNTIL Accdatamoduleform.cdstaxes.EOF=True;
    Makeletters(clLime);
    Makenumbers(clGray);
    END;
  END ELSE
IF xstate='inedit'THEN
  BEGIN
  Accdatamoduleform.cdssalelist.Delete;
  Calculatesum(false);
  setstate('insale');
  END ELSE
IF xstate='inqkset' THEN
  BEGIN
  IF colordialog1.Execute=true THEN
    BEGIN
    selcolour:=colordialog1.Color;
    setstate('inqkcolsel');
    END;
  END ELSE
IF xstate='inqkcolsel' THEN
  BEGIN
  textcolour:=clBlack;
  buttoncolour:=clButton;
  savebutton;
  loadbuttons(currlevel);
  setstate('inqkset');
  END ELSE
IF xstate='insale'THEN
  BEGIN
  Calculatesum(false);
  setstate('inpayment');
  END ELSE
IF xstate='inpayment' THEN
  BEGIN
  {Charge to room}
  IF balance>0 THEN
  setstate('inroomsel') ELSE
  setstate('infinishng');
  END ELSE
IF xstate='inreadings' THEN
  BEGIN
  {set printer}
  setstate('insetprinter');
  END;
IF xstate='insysedit' THEN
  BEGIN
  Accdatamoduleform.cdssalelist.Delete;
  Calculatesum(false);
  IF balance>0 THEN
  setstate('inpayment') ELSE
  setstate('infinishng');
  pMethod:='';
  END;
eselection.SetFocus;
end;

procedure Taccsalesform.btnPointClick(Sender: TObject);

begin
if (xstate='insale')OR(xstate='inedit')
OR(xstate='inentry')OR(xstate='noninvcost')THEN numberkey('00');
end;

procedure Taccsalesform.btnF6Click(Sender: TObject);

begin
IF (xstate='incard')THEN
  BEGIN
  pmethod:='MAESTRO';
  xaccountno:=bankaccount;
  setstate('inmaestro');
  eselection.text:=Formatcurr('0.00',sumgross);
  END ELSE
IF (xstate='control')THEN
  BEGIN
  selbutton:=0;
  currlevel:=0;
  prevlevel:=-1;
  nextlevel:=-1;
  prevbutton:=-1;
  buttoncap:='Not Set';
  buttoncolour:=clButton;
  textcolour:=clBlack;
  setstate('inqkset');
  END ELSE
IF xstate='setup' THEN
  BEGIN
  {security settings}
  {This will initially allow us to require a password to login}
  {but can be expanded to allow all security settings, i.e. adding and deleting users}
  setstate('insecurity'); {just my little joke:P}
  END ELSE
IF xstate='inusers' THEN
  BEGIN
  setstate('inuserdetails');
  END ELSE
IF xstate='inqkset' THEN
  BEGIN
  {move on to the next level}
  IF nextlevel>-1 THEN
    BEGIN
    prevlevel:=currlevel;
    prevbutton:=selbutton;
    currlevel:=nextlevel;
    levelname:=nlevelname;
    loadbuttons(currlevel);
    END ELSE
    BEGIN
    {see if a product is defined}
    IF invitem = -1 THEN messagedlg('','This button does not select a level or product. Use buttons at right to set a new level or product.',mtInformation,[mbOK],0) ELSE
      BEGIN
      IF accdatamoduleform.cdsinventory.Locate('item',invitem,[])=true THEN
        BEGIN
        IF accdatamoduleform.cdssales.Locate('sitem',saleitem,[])=true THEN
          BEGIN
          messagedlg('','Button selects '+accdatamoduleform.cdssalesdescription.Value+'. Use buttons at right to change the product.',mtInformation,[mbOK],0);
          END ELSE messagedlg('','Button selects a non-existent sale item. Use buttons at right to amend.',mtInformation,[mbOK],0);
        END ELSE messagedlg('','Button selects a non-existent product. Use buttons at right to amend',mtInformation,[mbOK],0);
      END;
    END;
  END;
IF (xstate='active')THEN
  BEGIN
  setstate('inrecall');
  {we already recalled suspended sales when checking if there were any}
  lbpicklist.Clear;
  IF accdatamoduleform.cdssalelist.Active=false THEN
  accdatamoduleform.cdssalelist.Active:=true;
  accdatamoduleform.cdssalelist.EmptyDataSet;
  accdatamoduleform.sqlsalelist.Close;
  accdatamoduleform.sqlsalelist.commandtext:='SELECT * FROM salelist WHERE status = ''0''';
  accdatamoduleform.sqlsalelist.active:=true;
  IF accdatamoduleform.sqlsalelist.IsEmpty=false THEN
    BEGIN
    accdatamoduleform.sqlsalelist.First;
      REPEAT
      IF lbpicklist.Items.IndexOf(accdatamoduleform.sqlsalelistsalename.Value)=-1
      THEN lbpicklist.Items.Add(accdatamoduleform.sqlsalelistsalename.Value);
      IF accdatamoduleform.sqlsalelist.eof=false THEN accdatamoduleform.sqlsalelist.next;
      UNTIL accdatamoduleform.sqlsalelist.eof=true;
    END ELSE
    BEGIN
    Setstate('active');
    Statusbar2.SimpleText:='No suspended sales available. Click name to log in';
    END;

  END ELSE
IF xstate='insale' THEN
  BEGIN
  {suspend this sale}
  {What we do here is allow the user to enter a name for the sale and then}
  {save it to salelist}
  {If the sale has already been saved just save it without renaming step}

  setstate('intransname');
  eselection.Text:='Name: '+transname;
  eselection.SetFocus;
  eselection.SelStart:=5;
  END ELSE
IF (xstate='infinishng')OR(xstate='infinishg')THEN
  BEGIN
  {save the items to salelist}
  {set the command text to select only this sale first}
  accdatamoduleform.dssalelist.Enabled:=false;
  Calculatesum(true); {setting the addtax variable to true causes the tax entries to be added}
  Try
  IF accdatamoduleform.cdssalelist.ChangeCount>0 THEN
    BEGIN
    IF accdatamoduleform.cdssalelist.ApplyUpdates(0)>0 THEN
    accdatamoduleform.cdssalelist.SaveToFile(backupdir+'sale'+currentsale);
    accdatamoduleform.conn.Executedirect('Update salelist set status = ''-2'' where saleno = '''+currentsale+'''');
    END;
  Except
  accdatamoduleform.cdssalelist.SaveToFile(backupdir+'sale'+currentsale);
  End;
  {we set the salenumber to zero only if it is actually}
  {this sale. If this sale is recalled or to an expense account, we leave it}
  IF (accdatamoduleform.Getsysteminfo(sdatabase,stationname,'salenumber','')=currentsale)
  THEN accdatamoduleform.setsysteminfo(sdatabase,stationname,'salenumber','0');
  accdatamoduleform.setsysteminfo(sdatabase,stationname,'currentsale','0');

  lbpicklist.Clear;
  eselection.clear;
  esaledescr.clear;
  setstate('active');
  accdatamoduleform.dssalelist.Enabled:=true;
  END;
end;

procedure Taccsalesform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
{we should check if there is a current sale}
IF accdatamoduleform.cdssalelist.IsEmpty=false THEN
  BEGIN
    Try
    IF accdatamoduleform.cdssalelist.ChangeCount>0 THEN accdatamoduleform.cdssalelist.ApplyUpdates(0);
    {this should be a transaction block}
    accdatamoduleform.conn.ExecuteDirect('Update salelist set salename = ''suspended '+stationname+''' where saleno = '''+currentsale+'''');
    Except
    {some general error procedure here}
    End;
  END;
end;

procedure Taccsalesform.btnpickClick(Sender: TObject);
begin
quickkeypanel.Visible:=true;
loadbuttons(0);
end;

procedure Taccsalesform.btnkeysClick(Sender: TObject);
begin
quickkeypanel.Visible:=false;
end;

Procedure Taccsalesform.QKclicked(buttonno:integer);
BEGIN
{we search for the level and button no and find out what to do}
IF (xstate='inqkset')OR(xstate='inqklevelsel')OR(xstate='inqkprodsel')
OR(xstate='inqkcaption')OR(xstate='inqkcolsel') THEN
  BEGIN
  IF xstate<>'inqkset'THEN setstate('inqkset');
  {setting up the quick keys. We don't move to the next level, but}
  {take note of what it should be}
  SetF2('Set caption',True);
  SetF3('Set level',True);
  SetF4('Set product',True);
  SetF5('Set colours',True);
  SetF6('Next level',True);
  With accdatamoduleform.cdspicklist do
    Begin
    Indexname:='levelindex';
    setkey;
    fieldbyname('level').AsInteger:=currlevel;
    fieldbyname('button').AsInteger:=buttonno;
    gotokey;
    IF gotokey=true THEN
      BEGIN
      currlevel:=accdatamoduleform.cdspicklistlevel.Value;
      prevlevel:=accdatamoduleform.cdspicklistplevel.Value;
      {selbutton is known}
      prevbutton:=accdatamoduleform.cdspicklistpbutton.Value;
      nextlevel:=accdatamoduleform.cdspicklistnlevel.Value;
      invitem:=accdatamoduleform.cdspicklistinvitem.Value;
      saleitem:=accdatamoduleform.cdspicklistsaleitem.Value;
      buttoncolour:=stringtocolor(accdatamoduleform.cdspicklistbuttoncolour.Value);
      textcolour:=stringtocolor(accdatamoduleform.cdspicklisttextcolour.Value);
      buttoncap:=accdatamoduleform.cdspicklisttext.Value;
      levelname:=accdatamoduleform.cdspicklistlevelname.value;
      nlevelname:=accdatamoduleform.cdspicklistnlevelname.Value;
      END ELSE
      BEGIN
      {there is no entry for this button}
      {but we already know the level number and the previous level}
      {selbutton is also known}
      invitem:=-1;
      saleitem:=-1;
      buttoncolour:=clButton;
      textcolour:=clBlack;
      buttoncap:='Not Set';
      nextlevel:=-1;
      nlevelname:=buttoncap;
      END;
    End;

  END ELSE
  BEGIN
  {normal operation}
  IF (xstate='insale')OR(xstate='inedit')THEN
    BEGIN
    IF accdatamoduleform.cdspicklist.Locate('button',buttonno,[])=true THEN
      BEGIN
      IF accdatamoduleform.cdspicklistnlevel.value<>-1 THEN
      Loadbuttons(accdatamoduleform.cdspicklistnlevel.value)ELSE
        BEGIN
        IF accdatamoduleform.cdspicklistinvitem.value<>-1 THEN
          BEGIN
          additem(accdatamoduleform.cdspicklistinvitem.Value,accdatamoduleform.cdspicklistsaleitem.Value,1);
          IF strtobool(accdatamoduleform.Getsysteminfo(stationname,'settings','qkautohome','false'))=true THEN loadbuttons(0);
          END ELSE Statusbar2.SimpleText:='No action specified for this button';
        END;
      END;
    END;
  END;
END;


Procedure Taccsalesform.Deletebutton(buttonno,levelno:integer);
  BEGIN
  With accdatamoduleform.cdspicklist do
    Begin
    Indexname:='levelindex';
    setkey;
    fieldbyname('level').AsInteger:=currlevel;
    fieldbyname('button').AsInteger:=buttonno;
    gotokey;
    IF gotokey=true THEN
      BEGIN
      accdatamoduleform.cdspicklist.Delete;
      IF accdatamoduleform.cdspicklist.changecount>0 THEN accdatamoduleform.cdspicklist.applyupdates(0);
      END;
    End;
  END;

procedure Taccsalesform.Button1Click(Sender: TObject);
begin
selbutton:=1;
Qkclicked(selbutton);
end;

procedure Taccsalesform.BtnHomeClick(Sender: TObject);
begin
selbutton:=0;
Loadbuttons(0);
IF xstate='inqkset' THEN setstate('inqkset');
end;

procedure Taccsalesform.btnBackClick(Sender: TObject);
begin
{we need to find the previous level}
{what button led to this level}
{or to be exact, which button has a next level of this level?}
accdatamoduleform.cdspicklist.Filtered:=false;
IF accdatamoduleform.cdspicklist.Locate('nlevel',currlevel,[])=true THEN
  BEGIN
  prevlevel:=accdatamoduleform.cdspicklistlevel.Value;
  prevbutton:=accdatamoduleform.cdspicklistbutton.Value;
  END;
Loadbuttons(prevlevel);
end;

procedure Taccsalesform.Button2Click(Sender: TObject);
begin
selbutton:=2;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button3Click(Sender: TObject);
begin
selbutton:=3;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button4Click(Sender: TObject);
begin
selbutton:=4;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button5Click(Sender: TObject);
begin
selbutton:=5;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button6Click(Sender: TObject);
begin
selbutton:=6;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button7Click(Sender: TObject);
begin
selbutton:=7;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button8Click(Sender: TObject);
begin
selbutton:=8;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button9Click(Sender: TObject);
begin
selbutton:=9;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button10Click(Sender: TObject);
begin
selbutton:=10;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button11Click(Sender: TObject);
begin
selbutton:=11;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button12Click(Sender: TObject);
begin
selbutton:=12;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button13Click(Sender: TObject);
begin
selbutton:=13;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button14Click(Sender: TObject);
begin
selbutton:=14;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button15Click(Sender: TObject);
begin
selbutton:=15;
Qkclicked(selbutton);
end;

Procedure Taccsalesform.Opencashdrawer;
  BEGIN
  END;

Procedure Taccsalesform.Cashdraweralarm;
  BEGIN
  END;


procedure Taccsalesform.FormResize(Sender: TObject);
begin
picklistpanel.Left:=1;
picklistpanel.Width:=windowpanel.Width div 2;
lbpicklist.Left:=2;
lbpicklist.width:=picklistpanel.width-4;
salelistpanel.Left:=picklistpanel.Left+picklistpanel.width;
salelistpanel.Width:=windowpanel.Width DIV 2;
dbgrid1.Columns[1].Width:=((dbgrid1.Width*9) DIV 10)-(dbgrid1.Columns[0].width+dbgrid1.Columns[2].width);
esaledescr.Left:=dbgrid1.left;
esaledescr.Width:=dbgrid1.Width;
eselection.Left:=lbpicklist.Left;
eselection.width:=lbpicklist.Width;
quickkeypanel.Height:=accsalesform.Height-(statusbar2.Height+picklistpanel.Height+statusbar2.Height);
quickkeypanel.Top:=picklistpanel.Top+picklistpanel.Height;
quickkeypanel.width:=accsalesform.Width-infopanel.Width;
end;

procedure Taccsalesform.salelistpanelResize(Sender: TObject);
begin
Dbgrid1.Columns[1].Width:=dbgrid1.Width-(dbgrid1.Columns[0].width+dbgrid1.Columns[1].width);
end;

procedure Taccsalesform.Button16Click(Sender: TObject);
begin
selbutton:=16;
Qkclicked(selbutton);
end;

procedure Taccsalesform.quickkeypanelResize(Sender: TObject);
Var
buttonwidth:integer;
buttonheight:integer;
i:Integer;
Buttonname:String;
Buttonno: Integer;
buttoncol,buttonrow:Word;
begin
quickkeypanel.Width:=accsalesform.Width-infopanel.Width;
keyboardpanel.Width:=quickkeypanel.Width;
buttonwidth:=((quickkeypanel.Width-22)div 10)-buttonhspace;
buttonheight:=((quickkeypanel.height-14) div 7)-buttonvspace;
For i:=0 to quickkeypanel.ControlCount - 1 do
  BEGIN
  IF quickkeypanel.Controls[i] is TButton THEN
  with quickkeypanel.Controls[i] as TButton do
    BEGIN
    Buttonname:=quickkeypanel.Controls[i].Name;
    IF (Buttonname[1]='B')AND(Buttonname[2]='u')AND(Buttonname[3]='t')THEN
      BEGIN
      Delete(Buttonname,1,6);
        Try
        Buttonno:=strtoint(buttonname)-1;
        divmod(buttonno,6,buttoncol,buttonrow);
        quickkeypanel.Controls[i].Top:=((buttonheight+buttonvspace)*buttonrow)+buttonvspace;
        quickkeypanel.Controls[i].Height:=buttonheight;
        quickkeypanel.Controls[i].Left:=((buttonwidth+buttonhspace)*buttoncol)+buttonhspace;
        quickkeypanel.Controls[i].Width:=buttonwidth;
        Except
        End;
      END;
    END;
  END;

btnhome.Left:=buttonhspace;
btnhome.Width:=buttonwidth;
btnhome.Height:=buttonheight;
btnhome.Top:=(6 * buttonheight)+(7*buttonvspace);

btnback.Left:=(2*buttonhspace)+buttonwidth;
btnback.Width:=buttonwidth;
btnback.Height:=buttonheight;
btnback.Top:=btnhome.top;

btnkeys.Left:=(3*buttonhspace)+(2*buttonwidth);
btnkeys.Width:=buttonwidth;
btnkeys.Height:=buttonheight;
btnkeys.Top:=btnhome.top;

btnpick.Left:=btnkeys.Left;
btnpick.Width:=buttonwidth;
btnpick.Top:=btnkeys.Top;
btnpick.Height:=buttonheight;
end;

procedure Taccsalesform.infopanelResize(Sender: TObject);
Var
buttonwidth,buttonhspace:integer;
buttonheight,buttonvspace:integer;
begin
buttonhspace:=5;
buttonvspace:=5;
buttonwidth:=(infopanel.Width-(4*buttonhspace))div 4;
buttonheight:=(infopanel.height-(5*buttonvspace)) div 4;
btn1.Left:=buttonhspace;
btn1.Top:=buttonvspace;
btn1.Height:=buttonheight;
btn1.Width:=buttonwidth;
btn2.Left:=btn1.Left+buttonwidth+buttonhspace;
btn2.Width:=buttonwidth;
btn2.Top:=buttonvspace;
btn2.Height:=buttonheight;
btn3.Left:=btn2.Left+buttonwidth+buttonhspace;
btn3.Width:=buttonwidth;
btn3.Top:=buttonvspace;
btn3.Height:=buttonheight;
btn4.Left:=btn1.Left;
btn4.Width:=buttonwidth;
btn4.Top:=btn1.Top+buttonheight+buttonvspace;
btn4.Height:=buttonheight;
btn5.Left:=btn2.Left;
btn5.Width:=buttonwidth;
btn5.Top:=btn2.Top+buttonheight+buttonvspace;
btn5.Height:=buttonheight;
btn6.Left:=btn3.Left;
btn6.Width:=buttonwidth;
btn6.Top:=btn3.Top+buttonheight+buttonvspace;
btn6.Height:=buttonheight;
btn7.Left:=btn1.Left;
btn7.Width:=buttonwidth;
btn7.Top:=btn4.Top+buttonheight+buttonvspace;
btn7.Height:=buttonheight;
btn8.Left:=btn2.Left;
btn8.Width:=buttonwidth;
btn8.Top:=btn5.Top+buttonheight+buttonvspace;
btn8.Height:=buttonheight;
btn9.Left:=btn3.Left;
btn9.Width:=buttonwidth;
btn9.Top:=btn6.Top+buttonheight+buttonvspace;
btn9.Height:=buttonheight;
btnasterisk.Left:=btn1.Left;
btnasterisk.Width:=buttonwidth;
btnasterisk.Top:=btn7.Top+buttonheight+buttonvspace;
btnasterisk.Height:=buttonheight;
btn0.Left:=btn8.Left;
btn0.Width:=buttonwidth;
btn0.Top:=btn8.Top+buttonheight+buttonvspace;
btn0.Height:=buttonheight;
btnpoint.Left:=btn3.Left;
btnpoint.Width:=buttonwidth;
btnpoint.Top:=btn9.Top+buttonheight+buttonvspace;
btnpoint.Height:=buttonheight;
end;

procedure Taccsalesform.Button17Click(Sender: TObject);
begin
selbutton:=17;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button18Click(Sender: TObject);
begin
selbutton:=18;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button19Click(Sender: TObject);
begin
selbutton:=19;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button20Click(Sender: TObject);
begin
selbutton:=20;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button21Click(Sender: TObject);
begin
selbutton:=21;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button22Click(Sender: TObject);
begin
selbutton:=22;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button23Click(Sender: TObject);
begin
selbutton:=23;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button24Click(Sender: TObject);
begin
selbutton:=24;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button25Click(Sender: TObject);
begin
selbutton:=25;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button26Click(Sender: TObject);
begin
selbutton:=26;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button27Click(Sender: TObject);
begin
selbutton:=27;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button28Click(Sender: TObject);
begin
selbutton:=28;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button29Click(Sender: TObject);
begin
selbutton:=29;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button30Click(Sender: TObject);
begin
selbutton:=30;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button31Click(Sender: TObject);
begin
selbutton:=31;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button32Click(Sender: TObject);
begin
selbutton:=32;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button33Click(Sender: TObject);
begin
selbutton:=33;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button34Click(Sender: TObject);
begin
selbutton:=34;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button35Click(Sender: TObject);
begin
selbutton:=35;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button36Click(Sender: TObject);
begin
selbutton:=36;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button37Click(Sender: TObject);
begin
selbutton:=37;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button38Click(Sender: TObject);
begin
selbutton:=38;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button39Click(Sender: TObject);
begin
selbutton:=39;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button40Click(Sender: TObject);
begin
selbutton:=40;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button41Click(Sender: TObject);
begin
selbutton:=41;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button42Click(Sender: TObject);
begin
selbutton:=42;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button43Click(Sender: TObject);
begin
selbutton:=43;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button44Click(Sender: TObject);
begin
selbutton:=44;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button45Click(Sender: TObject);
begin
selbutton:=45;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button46Click(Sender: TObject);
begin
selbutton:=46;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button47Click(Sender: TObject);
begin
selbutton:=47;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button48Click(Sender: TObject);
begin
selbutton:=48;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button49Click(Sender: TObject);
begin
selbutton:=49;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button50Click(Sender: TObject);
begin
selbutton:=50;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button51Click(Sender: TObject);
begin
selbutton:=51;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button52Click(Sender: TObject);
begin
selbutton:=52;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button53Click(Sender: TObject);
begin
selbutton:=53;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button54Click(Sender: TObject);
begin
selbutton:=54;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button55Click(Sender: TObject);
begin
selbutton:=55;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button56Click(Sender: TObject);
begin
selbutton:=56;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button57Click(Sender: TObject);
begin
selbutton:=57;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button58Click(Sender: TObject);
begin
selbutton:=58;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button59Click(Sender: TObject);
begin
selbutton:=59;
Qkclicked(selbutton);
end;

procedure Taccsalesform.Button60Click(Sender: TObject);
begin
selbutton:=60;
Qkclicked(selbutton);
end;

procedure Taccsalesform.fkeypanelResize(Sender: TObject);
Var
Keyheight,keyspace:Integer;
begin
{resize the fkeys}
keyheight:=fkeypanel.Height div 6;
keyspace:=1;
Btnf2.Left:=2;
btnf2.Top:=keyspace;
btnf2.Width:=fkeypanel.Width -4;
btnf2.Height:=keyheight;
Btnf3.Left:=2;
btnf3.Top:=btnf2.Top+keyspace+keyheight;
btnf3.Width:=fkeypanel.Width -4;
btnf3.Height:=keyheight;
Btnf4.Left:=2;
btnf4.Top:=btnf3.Top+keyspace+keyheight;
btnf4.Width:=fkeypanel.Width -4;
btnf4.Height:=keyheight;
Btnf5.Left:=2;
btnf5.Top:=btnf4.Top+keyspace+keyheight;
btnf5.Width:=fkeypanel.Width -4;
btnf5.Height:=keyheight;
Btnf6.Left:=2;
btnf6.Top:=btnf5.Top+keyspace+keyheight;
btnf6.Width:=fkeypanel.Width -4;
btnf6.Height:=keyheight;
Btnf7.Left:=2;
btnf7.Top:=btnf6.Top+keyspace+keyheight;
btnf7.Width:=fkeypanel.Width -4;
btnf7.Height:=keyheight;
end;

end.
