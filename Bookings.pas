unit Bookings;

interface

uses

  Libc,DBXpress,LibcExec,

         
  SysUtils, Types, Classes, Variants, QTypes, QGraphics, QControls, QForms,
  QDialogs, QStdCtrls, QExtCtrls,DateUtils, QButtons, QMask, QGrids,DB,
  QDBGrids,Qt, QComCtrls, QMenus,QPrinters,Math;

type
  TBookingsform = class(TForm)
    Panel1: TPanel;
    btnDay: TButton;
    btnWeek: TButton;
    btn3week: TButton;
    btnMonth: TButton;
    btn3month: TButton;
    cbday: TComboBox;
    cbMonth: TComboBox;
    eyear: TEdit;
    Label1: TLabel;
    btnHome: TButton;
    btnUp: TBitBtn;
    btnDown: TBitBtn;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    Booking: TMenuItem;
    Status: TMenuItem;
    Createnew1: TMenuItem;
    Editcurrent1: TMenuItem;
    Unavailable1: TMenuItem;
    Enquiry1: TMenuItem;
    Hold1: TMenuItem;
    Booked1: TMenuItem;
    NoShow1: TMenuItem;
    Panel2: TPanel;
    PaintBox1: TPaintBox;
    Cancelled1: TMenuItem;
    Active1: TMenuItem;
    Completed1: TMenuItem;
    Free1: TMenuItem;
    Checkin1: TMenuItem;
    N1: TMenuItem;
    Checkout1: TMenuItem;
    N2: TMenuItem;
    Showstatus1: TMenuItem;
    Today1: TMenuItem;
    Tomorrow1: TMenuItem;
    N3: TMenuItem;
    Printavailability1: TMenuItem;
    N4: TMenuItem;
    Find1: TMenuItem;
    Person1: TMenuItem;
    Booking1: TMenuItem;
    N5: TMenuItem;
    AllowCharges1: TMenuItem;
    Quickadd1: TMenuItem;
    Timer2: TTimer;
    procedure cbdayChange(Sender: TObject);
    procedure cbMonthChange(Sender: TObject);
    procedure eyearChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fetchbookings;
    procedure btnHomeClick(Sender: TObject);
    Procedure GoHome;
    procedure btnDayClick(Sender: TObject);
    procedure btnWeekClick(Sender: TObject);
    procedure btn3weekClick(Sender: TObject);
    procedure btnMonthClick(Sender: TObject);
    procedure btn3monthClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure PaintBox1DblClick(Sender: TObject);
    procedure PaintBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure PaintBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Free1Click(Sender: TObject);
    procedure Completed1Click(Sender: TObject);
    procedure Checkout1Click(Sender: TObject);
    procedure Unavailable1Click(Sender: TObject);
    procedure Enquiry1Click(Sender: TObject);
    procedure Cancelled1Click(Sender: TObject);
    procedure Booked1Click(Sender: TObject);
    procedure Hold1Click(Sender: TObject);
    procedure NoShow1Click(Sender: TObject);
    procedure Today1Click(Sender: TObject);
    procedure Tomorrow1Click(Sender: TObject);
    procedure Printavailability1Click(Sender: TObject);
    procedure Checkin1Click(Sender: TObject);
    procedure Person1Click(Sender: TObject);
    procedure AllowCharges1Click(Sender: TObject);
    procedure Quickadd1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Active1Click(Sender: TObject);
  private
    { Private declarations }
    Function stationsettings:Boolean;
  public
    Function Newbookingnumber:String;
    Procedure Startbooking;
    Procedure Cancelbooking;
    Function periodoccupied(roomno:integer;startdate,enddate,starttime,endtime:TDatetime):string;
    Function onbooking(roomno:integer;mdate,mtime:TDatetime;notime:Boolean):integer;
    Procedure wherearewe(x,y:integer);
    Procedure Setstatus(bookingno,status:string);
    Function isoverlapped(roomno:string;startdate,starttime,enddate,endtime:TDatetime;buffer:integer):Boolean;
    { Public declarations }
  end;

var

  Bookingsform: TBookingsform;
  sServer,sDatabase,susername,suserpass,sfullname:String;
  oldServer,oldDatabase,oldusername:String;
  Homedir,logdir,filedir:String;
  Centredate,DStart,DEnd:TDatetime;
  Bookingstart,BookingEnd,Itemstart,Itemend:TDatetime;
  Screenwidth,screenheight,datetop,dateleft,dateheight,datewidth,gridtop,gridheight,spaceheight:Integer;
  Labelleft,labelwidth,labelheight,Labelcount:Integer;
  Divisions,divwidth:Integer;
  sView:String;
  Rooms,Roomsperpage,roomstart:Integer;
  Bookingref:String;
  InBooking,Editbooking,Editrooms,mClicked:Boolean;
  Lastmousex,lastmousey:Integer;
  sdatestyle:String;
  onroom:Boolean;
  oncalendar:Boolean;
  ondate:Boolean;
  Defaultsalestax:String;
  mousedate:TDatetime;{The date the mouse is positioned over}
  mousetime:TDatetime; {How far along that date we are positioned}
  mouseroom:Integer; {The room the mouse is positioned over}
  mouseroomno:String;
  rtclickroom:Integer;
  rtclickdate:TDatetime;
  rtclicktime:TDatetime;
  Dragitem:integer;
  Occstart,OccEnd:TDatetime; {The start and end of the occupied period}
  Newbookingstart,Newbookingend:TDatetime;
  Recordnr:Integer; {The record in the booking grid the user is positioned on}
  Guestno:Integer;
  Newroomnr,newGuestno,newroomtype,currentitem:Integer;
  Adminpassword:string;
  logging:boolean;
  Logfile:Textfile;
  loglevel,stationnumber:integer;
  stationname:string;
  olddate:Tdatetime;
  shelpfile,backupdir,backupfile:string;
  Databaseonline,onlyadmin:boolean;
  Basecurrency,Currencyused:string;
  basecurrencystring:String;
  Lastdisplaytime:TDatetime;
  Startdragdate,startdragtime:TDatetime;
  Startdragroom,lastdragroom:Integer;
  changebooking,dragview:boolean;
  extendstart,extendend:Boolean;
  Bookingdragstartdate,Bookingdragenddate:TDatetime;
  Bookingdragstarttime,Bookingdragendtime:TDatetime;
  editeditem:String;
  Currentbooking:string;
  Statday:TDatetime;
  chequestring:String;
  Bookingnr:String;
  Buffer:Integer;
  Holdposition:Boolean;
implementation

uses login, Bookinginfo, roomsetup, Loginerror, ledger,
  breport, Accdatamodule, Customer, Newguest;

{$R *.xfm}


Function TBookingsform.isoverlapped(roomno:string;startdate,starttime,enddate,endtime:TDatetime;buffer:integer):Boolean;
Var
Starthour,startmin,startsec,startmsec:Word;
Endhour,endmin,endsec,endmsec:Word;
Startpoint:TDatetime;
Endpoint:TDatetime;
checkstartpoint,Checkendpoint:TDatetime;
Overlaps:Boolean;
BEGIN
{First we take the start date and time and encode them into a single datetime}
decodetime(starttime,starthour,startmin,startsec,startmsec);
Startpoint:=startdate;
startpoint:=Recodetime(startpoint,starthour,startmin,startsec,startmsec);
Incminute(startpoint,(buffer*-1));

decodetime(endtime,endhour,endmin,endsec,endmsec);
endpoint:=enddate;
endpoint:=Recodetime(endpoint,endhour,endmin,endsec,endmsec);
Incminute(endpoint,buffer);
Accdatamoduleform.Writelog('','','*****************************');
Accdatamoduleform.Writelog('','','Room is '+roomno);
Accdatamoduleform.Writelog('','','Buffered startpoint is '+datetimetostr(startpoint));
Accdatamoduleform.Writelog('','','Buffered endpoint is '+datetimetostr(endpoint));
Overlaps:=false;
{now we recall records from cdsbookingcheck (existing bookings)}
Accdatamoduleform.cdsbookingcheck.Close;
Accdatamoduleform.sqlbookingcheck.Close;
Accdatamoduleform.sqlbookingcheck.CommandText:='SELECT * FROM booking where enddate >= '''+formatdatetime(shortdateformat,startdate)+'''and startdate <= '''+formatdatetime(shortdateformat,enddate)+''' and bookingno <> '''+bookingref+''' and roomno = '''+roomno+'''';

Accdatamoduleform.Writelog('','','SQL: '+accdatamoduleform.sqlbookingcheck.commandtext);
Accdatamoduleform.cdsbookingcheck.Active:=true;
Accdatamoduleform.cdsbookingcheck.filtered:=false;
IF accdatamoduleform.cdsbookingcheck.IsEmpty=false THEN
  BEGIN
  {this calls up records that may overlap but which are not part of this booking}

  Accdatamoduleform.Writelog('','','Potential overlapping records '+inttostr(accdatamoduleform.cdsbookingcheck.RecordCount));
  {Conditions for overlap:
   1 Start point of existing booking is between startpoint and endpoint
   2 End point of existing booking is between startpoint and endpoint
   3 Startpoint of existing booking is >= startpoint and endpoint of existing booking is <= endpoint
   4 Startpoint is >= startpoint of existing booking and endpoint is <= endpoint of exisitng booking}
  Accdatamoduleform.cdsbookingcheck.First;
    REPEAT
    IF ((currentitem<>accdatamoduleform.cdsbookingcheckitem.Value)OR(Editbooking=false))
    AND (accdatamoduleform.cdsbookingcheckroomno.AsString = roomno) THEN
      BEGIN
      decodetime(accdatamoduleform.cdsbookingcheckstarttime.Value,starthour,startmin,startsec,startmsec);
      CheckStartpoint:=Accdatamoduleform.cdsbookingcheckstartdate.Value;
      checkstartpoint:=Recodetime(Checkstartpoint,starthour,startmin,startsec,startmsec);

      decodetime(accdatamoduleform.cdsbookingcheckendtime.Value,endhour,endmin,endsec,endmsec);
      checkendpoint:=Accdatamoduleform.cdsbookingcheckenddate.Value;
      Checkendpoint:=Recodetime(Checkendpoint,endhour,endmin,endsec,endmsec);

      Accdatamoduleform.Writelog('','','Startpoint to check is '+datetimetostr(checkstartpoint));
      Accdatamoduleform.Writelog('','','Endpoint to check is '+datetimetostr(checkendpoint));
      IF (Comparedatetime(checkendpoint,startpoint)>0)AND(Comparedatetime(checkendpoint,endpoint)<0)THEN overlaps:=true;

      IF (Comparedatetime(checkstartpoint,endpoint)<0)AND(Comparedatetime(checkendpoint,endpoint)>0)THEN overlaps:=true;

      IF (Comparedatetime(checkstartpoint,Startpoint)>=0)AND(Comparedatetime(checkendpoint,endpoint)<=0)THEN overlaps:=true;

      IF (Comparedatetime(checkstartpoint,Startpoint)<=0)AND(Comparedatetime(checkendpoint,endpoint)>=0)THEN overlaps:=true;
      END;
    IF Accdatamoduleform.cdsbookingcheck.eof=false THEN Accdatamoduleform.cdsbookingcheck.Next;
    IF overlaps=true THEN
    Accdatamoduleform.Writelog('','','Overlap with '+accdatamoduleform.cdsbookingcheckitem.AsString) ELSE
    Accdatamoduleform.Writelog('','','Overlap is false')
    UNTIL Accdatamoduleform.cdsbookingcheck.eof=true;
  END;
  {we will now know if there's an overlap with existing bookings on this room}
IF (overlaps = false)AND(accdatamoduleform.cdsbookingnew.IsEmpty=false) THEN
  BEGIN
  {this checks records that may overlap which are part of this booking}
  Accdatamoduleform.Writelog('','','Potential overlapping records '+inttostr(accdatamoduleform.cdsbookingnew.RecordCount));
  {Conditions for overlap:
   1 Start point of existing booking is between startpoint and endpoint
   2 End point of existing booking is between startpoint and endpoint
   3 Startpoint of existing booking is >= startpoint and endpoint of existing booking is <= endpoint
   4 Startpoint is >= startpoint of existing booking and endpoint is <= endpoint of exisitng booking}
  {If we are adding a new record, we check all existing records. If we are editing a record}
  {then we ignore the current record since that's the one we are checking}
  Accdatamoduleform.Writelog('','','Checking existing booking');
  Currentitem:=Accdatamoduleform.cdsbookingnewitem.Value;
  Accdatamoduleform.cdsbookingnew.First;
    REPEAT
    IF ((currentitem<>accdatamoduleform.cdsbookingnewitem.Value)OR(Editrooms=false))
    AND (accdatamoduleform.cdsbookingnewroomno.AsString = roomno) THEN
      BEGIN
      decodetime(accdatamoduleform.cdsbookingnewstarttime.Value,starthour,startmin,startsec,startmsec);
      CheckStartpoint:=Accdatamoduleform.cdsbookingnewstartdate.Value;
      checkstartpoint:=Recodetime(Checkstartpoint,starthour,startmin,startsec,startmsec);

      decodetime(accdatamoduleform.cdsbookingnewendtime.Value,endhour,endmin,endsec,endmsec);
      checkendpoint:=Accdatamoduleform.cdsbookingnewenddate.Value;
      Checkendpoint:=Recodetime(Checkendpoint,endhour,endmin,endsec,endmsec);
      Accdatamoduleform.Writelog('','','Startpoint to check is '+datetimetostr(checkstartpoint));
      Accdatamoduleform.Writelog('','','Endpoint to check is '+datetimetostr(checkendpoint));
      IF (Comparedatetime(checkendpoint,startpoint)>0)AND(Comparedatetime(checkendpoint,endpoint)<0)THEN overlaps:=true;

      IF (Comparedatetime(checkstartpoint,endpoint)<0)AND(Comparedatetime(checkendpoint,endpoint)>0)THEN overlaps:=true;

      IF (Comparedatetime(checkstartpoint,Startpoint)>=0)AND(Comparedatetime(checkendpoint,endpoint)<=0)THEN overlaps:=true;

      IF (Comparedatetime(checkstartpoint,Startpoint)<=0)AND(Comparedatetime(checkendpoint,endpoint)>=0)THEN overlaps:=true;
      END;
    IF Accdatamoduleform.cdsbookingnew.eof=false THEN Accdatamoduleform.cdsbookingnew.Next;
    IF overlaps=true THEN
    Accdatamoduleform.Writelog('','','Overlap with '+accdatamoduleform.cdsbookingnewitem.AsString) ELSE
    Accdatamoduleform.Writelog('','','Overlap is false')
    UNTIL Accdatamoduleform.cdsbookingnew.eof=true;
  accdatamoduleform.cdsbookingnew.locate('item',currentitem,[]);
  END;

Result:=overlaps;
END;

Procedure TBookingsform.Setstatus(bookingno,status:string);
Var
i:Integer;
BEGIN
{here we mark the current item as active. If it's part of a booking we}
{ask if the whole booking is to be marked the same}
accdatamoduleform.sbookingstatus.close;
accdatamoduleform.cbookingstatus.close;
accdatamoduleform.sbookingstatus.CommandText:='Select * from booking where bookingno = '''+bookingno+'''';
accdatamoduleform.cbookingstatus.Active:=true;
accdatamoduleform.cbookingstatus.filtered:=false;
IF accdatamoduleform.cbookingstatus.Locate('item',editeditem,[]) = true THEN
  BEGIN
  accdatamoduleform.cbookingstatus.Edit;
  accdatamoduleform.cbookingstatusstatus.Value:=Status;
  accdatamoduleform.cbookingstatus.post;


  IF accdatamoduleform.cbookingstatus.Recordcount>1 THEN
    BEGIN
    IF messagedlg('','Mark all parts of this booking as '+status+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
      BEGIN
      i:=1;
        REPEAT
        IF i<=accdatamoduleform.cbookingstatus.Recordcount THEN
          BEGIN
          accdatamoduleform.cbookingstatus.RecNo:=i;

          IF accdatamoduleform.cbookingstatusstatus.Value<>Status THEN
            BEGIN
            accdatamoduleform.cbookingstatus.Edit;
            accdatamoduleform.cbookingstatusstatus.Value:=Status;
            accdatamoduleform.cbookingstatus.post;
            END;
          END;
        i:=i+1;
        UNTIL i>accdatamoduleform.cbookingstatus.Recordcount;
      END;
    END;
  END;
IF accdatamoduleform.cbookingstatus.ChangeCount>0 THEN
  BEGIN
  IF messagedlg('','Save changes?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
    BEGIN
      Try
      Accdatamoduleform.cbookingstatus.ApplyUpdates(0);
      Except
      messagedlg('','Error - I could not apply the updates.',mtError,[mbOK],0);
      End;
    END ELSE accdatamoduleform.cbookingstatus.CancelUpdates;
  paintbox1.Repaint;
  END;
END;

Procedure TBookingsform.wherearewe(x,y:integer);
Var
j,thisroom:Integer;
done:Boolean;
divproportion:double;
divisions:integer;
BEGIN
  divisions:=(x-(dateleft+2))DIV divwidth;
  mousedate:=dstart+divisions;
  {the mouse time is the proportion of the current date}
  {}
  divproportion:=(x-((dateleft+2)+(divisions*divwidth)))/ divwidth;
  mousetime:=floattodatetime(divproportion);

  IF labelcount>0 THEN
    BEGIN
    j:=1;
    thisroom:=roomstart;
    mouseroom:=0;
      REPEAT
      IF (y>(gridtop+labelheight*(j-1)))AND(y<(gridtop+(labelheight*j)-5))THEN
      mouseroom:=thisroom;
      j:=j+1;
      thisroom:=thisroom+1;
      done:=(mouseroom>0)OR(j>labelcount);
      UNTIL done;
    END;
Statusbar1.Panels[1].Text:='Room '+inttostr(mouseroom);
Statusbar1.Panels[2].Text:='Date '+Formatdatetime('dd/mm/yyyy',mousedate);
Statusbar1.Panels[3].Text:='Time '+Formatdatetime('hh:mm',mousetime);
END;

Procedure TBookingsform.Startbooking;
Begin
{Newroomnr:=0;
newcustnr:=0;
newroomtype:=0;
Memo1.Clear;
earrive.Text:=Datetostr(mousedate);}
End;

Procedure TBookingsform.Cancelbooking;
Begin
{Newroomnr:=0;
newcustnr:=0;
newroomtype:=0;
Memo1.Clear;}
End;


Function TBookingsform.Newbookingnumber:string;
type
TNumbers = set of char;

Var
Numbers:TNumbers;
sOperator,sdate:String;
i:integer;
ibookingnumber:Integer;
sbookingnumber,sbooking:string;
found:Boolean;
BEGIN
Numbers:=['1','2','3','4','5','6','7','8','9','0'];
{what we want is an amalgam of the date, the operator and a unique identifier}
sdate:=formatdatetime(shortdateformat,Date);
i:=1;
  REPEAT
  IF i<=length(sdate)THEN
    BEGIN
    IF not(sdate[i] in numbers)THEN Delete(sdate,i,1)ELSE i:=i+1;
    END;
  UNTIL i>length(sdate);

{change this later}
sfullname:='John Campbell';
i:=1;
  REPEAT
  IF i<=length(sfullname)THEN
    BEGIN
    IF (i=1) OR((i>1)AND(sfullname[i-1]=' ')) THEN
    Insert(sfullname[i],soperator,length(soperator)+1);
    END;
  i:=i+1;
  UNTIL i>length(sfullname);
{now we need to filter out all bookings from today}
accdatamoduleform.sqlbooking.active:=false;
accdatamoduleform.cdsbooking.active:=false;
accdatamoduleform.sqlbooking.CommandText:='SELECT * FROM booking WHERE bookingdate = '''+formatdatetime(shortdateformat,Date)+'''';
accdatamoduleform.cdsbooking.Active:=true;
accdatamoduleform.cdsbooking.filtered:=false;
ibookingnumber:=1;
sbookingnumber:=inttostr(ibookingnumber);
IF accdatamoduleform.cdsbooking.IsEmpty=false THEN
  BEGIN
  found:=false;
    REPEAT
    sbookingnumber:=inttostr(ibookingnumber);
    sbooking:=soperator+sdate+sbookingnumber;
    IF accdatamoduleform.cdsbooking.locate('bookingno',sbooking,[])=false THEN found:=true;
    ibookingnumber:=ibookingnumber+1;
    UNTIL found=true;
  END ELSE sbooking:=soperator+sdate+sbookingnumber;
Result:=sbooking;
END;

Function TBookingsform.periodoccupied(roomno:integer;startdate,enddate,starttime,endtime:TDatetime):string;
Var
sstartdate,senddate:string;
overlap:string;
BEGIN
overlap:='free';
{we want to see if the specified room is free for the period required}
{this is used when dragging items}
{The function returns the booking number if there is one}
{find what room we're on. Not the mouseroom}
sstartdate:=formatdatetime(shortdateformat,startdate);
senddate:=formatdatetime(shortdateformat,enddate);
Accdatamoduleform.cdsrooms.Filtered:=false;
Accdatamoduleform.cdsrooms.Locate('item',roomno,[]);
Accdatamoduleform.cdsbookingcheck.Close;
Accdatamoduleform.sqlbookingcheck.Close;
Accdatamoduleform.sqlbookingcheck.CommandText:='SELECT * FROM booking where roomno = '''+accdatamoduleform.cdsroomsroomno.AsString+''' and enddate >= '''+sstartdate+''' and startdate <= '''+senddate+'''';
Accdatamoduleform.cdsbookingcheck.Active:=true;
Accdatamoduleform.cdsbookingcheck.Refresh;
accdatamoduleform.cdsbookingcheck.filtered:=false;
IF accdatamoduleform.cdsbookingcheck.IsEmpty=false THEN
  BEGIN
  {If there is an overlap of dates then the room is occupied}
  accdatamoduleform.cdsbookingcheck.First;
    REPEAT
      IF (accdatamoduleform.cdsbookingcheckenddate.Value>startdate)AND((accdatamoduleform.cdsbookingcheckenddate.Value<enddate)OR((accdatamoduleform.cdsbookingcheckenddate.Value=enddate)AND(accdatamoduleform.cdsbookingcheckendtime.Value<=endtime)))
      THEN overlap:=accdatamoduleform.cdsbookingcheckbookingno.Value;

      IF (overlap='free')AND((accdatamoduleform.cdsbookingcheckstartdate.Value>startdate)OR((accdatamoduleform.cdsbookingcheckstartdate.Value=startdate)AND(accdatamoduleform.cdsbookingcheckstarttime.Value>=starttime)))AND(accdatamoduleform.cdsbookingcheckstartdate.Value<enddate)
      THEN overlap:=accdatamoduleform.cdsbookingcheckbookingno.Value;

      IF (overlap='free')AND((accdatamoduleform.cdsbookingcheckstartdate.Value<startdate)OR((accdatamoduleform.cdsbookingcheckstartdate.Value=startdate)AND(accdatamoduleform.cdsbookingcheckstarttime.Value<=starttime)))AND((accdatamoduleform.cdsbookingcheckenddate.value>enddate)OR((accdatamoduleform.cdsbookingcheckenddate.value=enddate)AND(accdatamoduleform.cdsbookingcheckendtime.value>=endtime)))
      THEN overlap:=accdatamoduleform.cdsbookingcheckbookingno.Value;

    IF (overlap<>'free') THEN accdatamoduleform.cdsbookingcheck.Last;
    IF accdatamoduleform.cdsbookingcheck.Eof=false THEN accdatamoduleform.cdsbookingcheck.Next;
    UNTIL accdatamoduleform.cdsbookingcheck.eof=true;
statusbar1.Panels[6].Text:='drag status = '+inttostr(roomno)+' '+(sstartdate)+' '+(senddate)+' '+(formatdatetime('hh:mm',starttime))+' '+(formatdatetime('hh:mm',endtime))+' '+overlap;
  END ELSE statusbar1.Panels[6].Text:='empty';
result:=overlap;
END;

Function TBookingsform.onbooking(roomno:integer;mdate,mtime:TDatetime;notime:boolean):integer;
Var
sdate,stime,sroom:string;
latestitem,Thisitem:Integer;
lateststart:TDatetime;
BEGIN
{This function returns the booking number if the specified roomno, date and time are }
{in a booking and free otherwise}
sdate:=formatdatetime(shortdateformat,mdate);
stime:=formatdatetime('hh:mm',mtime);
thisitem:=-1;
currentbooking:='none';
IF (roomno<= Accdatamoduleform.cdsrooms.RecordCount)AND(roomno>0) THEN
    BEGIN
    Accdatamoduleform.cdsrooms.recno:=roomno;
    sroom:=accdatamoduleform.cdsroomsroomno.AsString;
    END ELSE sroom:='-1';
Accdatamoduleform.cdsbookingcheck.filtered:=false;
Accdatamoduleform.cdsbookingcheck.Close;
Accdatamoduleform.sqlbookingcheck.Close;
Accdatamoduleform.sqlbookingcheck.CommandText:='SELECT * FROM booking where roomno = '''+sroom+''' and startdate <= '''+sdate+''' and enddate >= '''+sdate+'''';
Accdatamoduleform.cdsbookingcheck.Active:=true;
Accdatamoduleform.cdsbookingcheck.Refresh;
IF accdatamoduleform.cdsbookingcheck.IsEmpty=false THEN
  BEGIN
  IF notime=false THEN
    BEGIN
    accdatamoduleform.Writelog('','','Records '+inttostr(accdatamoduleform.cdsbookingcheck.RecordCount));
    {we've already got a fairly restricted dataset here, so all we need to do is check times}
    accdatamoduleform.cdsbookingcheck.First;
      REPEAT
      IF ((accdatamoduleform.cdsbookingcheckstartdate.Value<mdate)
      OR ((accdatamoduleform.cdsbookingcheckstartdate.Value=mdate)
      AND(accdatamoduleform.cdsbookingcheckstarttime.Value<=mtime)))

      AND((accdatamoduleform.cdsbookingcheckenddate.Value>mdate)
      OR ((accdatamoduleform.cdsbookingcheckenddate.Value=mdate)
      AND(accdatamoduleform.cdsbookingcheckendtime.Value>=mtime)))

      THEN
        BEGIN
        thisitem:=accdatamoduleform.cdsbookingcheckitem.Value;
        currentitem:=thisitem;
        Editeditem:=inttostr(currentitem);
        Currentbooking:=accdatamoduleform.cdsbookingcheckbookingno.Value;
        END;
      IF accdatamoduleform.cdsbookingcheck.eof=false THEN accdatamoduleform.cdsbookingcheck.next;
      UNTIL  accdatamoduleform.cdsbookingcheck.eof=true;
    END ELSE
    BEGIN
    {if no time is requested we find the latest active booking if there is one, or a booked booking if there is one}
    accdatamoduleform.cdsbookingcheck.Filter:='Status = ''Active''';
    IF accdatamoduleform.cdsbookingcheck.recordcount>0 THEN
      BEGIN
      accdatamoduleform.cdsbookingcheck.first;
      latestitem:=accdatamoduleform.cdsbookingcheckitem.Value;
      lateststart:=accdatamoduleform.cdsbookingcheckstartdate.Value;
        REPEAT
        IF accdatamoduleform.cdsbookingcheckstartdate.Value>lateststart THEN
          BEGIN
          lateststart:=accdatamoduleform.cdsbookingcheckstartdate.Value;
          latestitem:=accdatamoduleform.cdsbookingcheckitem.value;
          END;
        IF accdatamoduleform.cdsbookingcheck.eof=false THEN accdatamoduleform.cdsbookingcheck.next;
        UNTIL accdatamoduleform.cdsbookingcheck.eof=true;
      IF accdatamoduleform.cdsbookingcheck.Locate('item',latestitem,[])=true THEN thisitem:=accdatamoduleform.cdsbookingcheckitem.Value ELSE thisitem:=-1;
      currentitem:=thisitem;
      editeditem:=inttostr(currentitem);
      currentbooking:=accdatamoduleform.cdsbookingcheckbookingno.Value;
      END ELSE
    IF accdatamoduleform.cdsbookingcheck.Locate('status','Booked',[])=true THEN
      BEGIN
      thisitem:=accdatamoduleform.cdsbookingcheckitem.Value;
      currentitem:=thisitem;
      editeditem:=inttostr(currentitem);
      currentbooking:=accdatamoduleform.cdsbookingcheckbookingno.Value;
      END;

    END;
  END;
IF Accdatamoduleform.cdsbookingcheck.Locate('item',thisitem,[]) THEN result:=thisitem ELSE result:=-1;
END;

procedure TBookingsform.cbdayChange(Sender: TObject);
Var
Dateok:boolean;
iday,imonth,iyear:Word;
begin
IF cbday.text<>'' THEN
  BEGIN
    REPEAT
      Try
      iyear:=strtoint(eyear.Text);
      imonth:=cbmonth.ItemIndex+1;
      iday:=cbday.ItemIndex+1;
      Centredate:=encodedate(iyear,imonth,iday);
      dateok:=true;
      Paintbox1.repaint;
      Except
      cbday.ItemIndex:=cbday.ItemIndex-1;
      Dateok:=false;
      End;
    UNTIL DateOK=True;
    END ELSE
    BEGIN
    decodedate(now,iyear,imonth,iday);
    cbday.ItemIndex:=iday-1;
    cbmonth.ItemIndex:=imonth-1;
    eyear.Text:=inttostr(iyear);
    END;
end;

procedure TBookingsform.cbMonthChange(Sender: TObject);
Var
Dateok:boolean;
iday,imonth,iyear:Word;
begin
IF cbmonth.text<>'' THEN
  BEGIN
    REPEAT
      Try
      iyear:=strtoint(eyear.Text);
      imonth:=cbmonth.ItemIndex+1;
      iday:=cbday.ItemIndex+1;
      Centredate:=encodedate(iyear,imonth,iday);
      dateok:=true;
      Paintbox1.repaint;
      Except
      cbday.ItemIndex:=cbday.ItemIndex-1;
      Dateok:=false;
      End;
    UNTIL DateOK=True;
    END ELSE
    BEGIN
    decodedate(now,iyear,imonth,iday);
    cbday.ItemIndex:=iday-1;
    cbmonth.ItemIndex:=imonth-1;
    eyear.Text:=inttostr(iyear);
    END;
end;

procedure TBookingsform.eyearChange(Sender: TObject);
Var
Dateok:boolean;
iday,imonth,iyear:Word;
begin
IF eyear.text<>'' THEN
  BEGIN
    REPEAT
      Try
      iyear:=strtoint(eyear.Text);
      imonth:=cbmonth.ItemIndex+1;
      iday:=cbday.ItemIndex+1;
      Centredate:=encodedate(iyear,imonth,iday);
      dateok:=true;
      Paintbox1.repaint;
      Except
      eyear.Text:=inttostr(yearof(date));
      Dateok:=false;
      End;
    UNTIL DateOK=True;
    END ELSE
    BEGIN
    decodedate(now,iyear,imonth,iday);
    cbday.ItemIndex:=iday-1;
    cbmonth.ItemIndex:=imonth-1;
    eyear.Text:=inttostr(iyear);
    END;
end;

Function TBookingsform.stationsettings:Boolean;
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
    accdatamoduleform.Getsysteminfo('system','stations','name','');
    IF accdatamoduleform.cdssysdata.locate('value',stationname,[loCaseInsensitive]) THEN
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


procedure TBookingsform.FormShow(Sender: TObject);

Var
oldhost,oldpass:string;
  begin
  {Get the local information and check it}
  {If it's wrong, display the login error form}
  {If it's right, show the login form}
  homedir:=getcurrentdir; {This is where the application is}
  backupdir:=homedir+'/backup/'; {This will change once we know the database}
  IF directoryexists(backupdir)=False THEN mkdir(backupdir);
  Setcurrentdir(backupdir);

  Accdatamoduleform.cdslocaldata.FileName:=backupdir+'xlocaldata';
  Accdatamoduleform.Writelog('','','Local data file '+Accdatamoduleform.cdslocaldata.FileName);
  Try
  IF accdatamoduleform.cdslocaldata.active=false THEN accdatamoduleform.cdslocaldata.CreateDataSet;
  IF Fileexists(accdatamoduleform.cdslocaldata.filename)THEN
    BEGIN
    accdatamoduleform.cdslocaldata.loadfromfile();
    Accdatamoduleform.Writelog('','','Local data file found');
    statusbar1.Repaint;
    END ELSE accdatamoduleform.cdslocaldata.active:=true;

  IF accdatamoduleform.cdslocaldata.Locate('parameter','station name',[])=true
  THEN
    BEGIN
    stationname:=accdatamoduleform.cdslocaldatavalue.Value;
    Accdatamoduleform.Writelog('','','Station name is '+stationname);
    END ELSE
    BEGIN
    Stationname:='none';
    Accdatamoduleform.Writelog('','','No station name found');
    END;
  IF accdatamoduleform.cdslocaldata.Locate('parameter','server',[])=true
  THEN
    BEGIN
    sserver:=accdatamoduleform.cdslocaldatavalue.Value;
    Accdatamoduleform.Writelog('','','Server is '+stationname);
    END ELSE
    BEGIN
    sserver:='0.0.0.0';
    Accdatamoduleform.Writelog('','','No server address found');
    END;
  IF accdatamoduleform.cdslocaldata.Locate('parameter','password',[])=true
  THEN
    BEGIN
    adminpassword:=accdatamoduleform.cdslocaldatavalue.Value;
    Accdatamoduleform.Writelog('','','Admin password ok');
    END ELSE
    BEGIN
    Adminpassword:='none';
    Accdatamoduleform.Writelog('','','No admin password found');
    END;
  Except
  Stationname:='none';
  sserver:='0.0.0.0';
  Adminpassword:='none';
  Accdatamoduleform.Writelog('','','Exception: Local details not found');
  End;

  oldhost:=sserver;
  oldpass:=adminpassword;

  Try
  Accdatamoduleform.adminconn.close;
  Accdatamoduleform.adminconn.Params.Values['database']:='system';
  Accdatamoduleform.adminconn.Params.Values['User_name']:='postgres';
  Accdatamoduleform.adminconn.Params.Values['HostName']:=sserver;
  Accdatamoduleform.adminconn.Params.Values['Password']:=adminpassword;
  {we just open the connection to check if these values are correct}
  {If they're not, we generate an exception}
  Accdatamoduleform.adminconn.Open;
  Accdatamoduleform.adminconn.Close;
  Databaseonline:=true;
  Accdatamoduleform.Writelog('','','Admin details seem to be correct - continuing');
  {If we've got this far, the login details must be correct}
  Except
  {something's wrong. Ask the user for the correct}
  {server and password}
  Databaseonline:=false;
  Loginerrorform := TLoginerrorform.Create(self);
    try
    Loginerrorform.ShowModal;
    finally
    Loginerrorform.Free;
    end;
  End;

  logdir:=homedir+'/logs';
  filedir:=homedir+'/files';
  IF directoryexists(logdir)=false THEN Createdir(logdir);
  IF directoryexists(filedir)=false THEN Createdir(filedir);
  IF directoryexists(homedir+'/notes')=False THEN mkdir(homedir+'/notes');
  accdatamoduleform.Setlogfile;
  loglevel:=0;
  Olddate:=Date;
  shelpfile:=homedir+'/help/';
  Application.HelpFile:=shelpfile;

  Accdatamoduleform.Writelog('','','Home directory is '+homedir);
  Accdatamoduleform.Writelog('','','Log directory is '+logdir);
  Accdatamoduleform.Writelog('','','Help directory is '+shelpfile);
  Accdatamoduleform.Writelog('','','Backup directory is '+backupdir);
  Accdatamoduleform.Writelog('','','Sysdata filename '+Accdatamoduleform.cdssysdata.filename);

  IF Databaseonline=true THEN
    BEGIN
      Try
      {let's try to open sysdata. If that table isn't there then we tell the user}
      {to run the setup utility}
      Accdatamoduleform.cdssysdata.filtered:=false;
      IF Accdatamoduleform.cdssysdata.active=false THEN Accdatamoduleform.cdssysdata.active:=true;
      IF (Databaseonline=true)AND(Accdatamoduleform.cdssysdata.ChangeCount=0)THEN Accdatamoduleform.cdssysdata.Refresh;
      Except
      {something's wrong}
      Messagedlg('','A required table is missing. Please run the setup program',mtError,[mbOK],0);
      Application.Terminate;
      End;

    IF stationsettings=false THEN application.Terminate;

    {If we couldn't find a station name, we won't have got this far}
    loginform.cbserver.Clear;
    accdatamoduleform.Getsysteminfo('system','settings','server name','');
    IF accdatamoduleform.cdssysdata.IsEmpty=false THEN
      BEGIN
      accdatamoduleform.cdssysdata.First;
        REPEAT
        loginform.cbserver.Items.Add(accdatamoduleform.cdssysdatavalue.Value);
        IF accdatamoduleform.cdssysdata.eof=false THEN accdatamoduleform.cdssysdata.next;
        UNTIL accdatamoduleform.cdssysdata.eof=true;
      END;
    loginform.cbdatabase.Clear;
    accdatamoduleform.Getsysteminfo('system','databases','database name','');
    IF accdatamoduleform.cdssysdata.IsEmpty=false THEN
      BEGIN
      accdatamoduleform.cdssysdata.First;
        REPEAT
        loginform.cbdatabase.Items.Add(accdatamoduleform.cdssysdatavalue.Value);
        IF accdatamoduleform.cdssysdata.eof=false THEN accdatamoduleform.cdssysdata.next;
        UNTIL accdatamoduleform.cdssysdata.eof=true;
      END;

    loginform.cbuser.Clear;
    accdatamoduleform.Getsysteminfo('system','users','name','');
    IF accdatamoduleform.cdssysdata.IsEmpty=false THEN
      BEGIN
      accdatamoduleform.cdssysdata.First;
        REPEAT
        loginform.cbuser.Items.Add(accdatamoduleform.cdssysdatavalue.Value);
        IF accdatamoduleform.cdssysdata.eof=false THEN accdatamoduleform.cdssysdata.next;
        UNTIL accdatamoduleform.cdssysdata.eof=true;
      END;
    IF accdatamoduleform.Getsysteminfo('system','settings','bookinglock','none')=stationname THEN
    accdatamoduleform.Setsysteminfo('system','settings','bookinglock','none');
    sdatabase:=Accdatamoduleform.Getsysteminfo(stationname,'settings','database name','');
    susername:=Accdatamoduleform.Getsysteminfo(stationname,'settings','user name','');
    logging:=strtobool(Accdatamoduleform.Getsysteminfo(stationname,'settings','logging','true'));
    loglevel:=strtoint(Accdatamoduleform.Getsysteminfo(stationname,'settings','loglevel','2'));
    oldserver:=sserver; {used to compare with any user input}
    olddatabase:=sdatabase;
    oldusername:=susername;
    basecurrency:=Accdatamoduleform.getsysteminfo(sdatabase,'settings','basecurrency','');
    Currencyused:=basecurrency;
    buffer:=strtoint(accdatamoduleform.getsysteminfo('system','settings','buffer','30'));
    loginform.cbserver.itemindex:=loginform.cbserver.Items.IndexOf(oldserver);
    loginform.cbdatabase.itemindex:=loginform.cbdatabase.Items.IndexOf(olddatabase);
    loginform.cbuser.ItemIndex:=loginform.cbuser.Items.IndexOf(oldusername);
    loginform.ShowModal;
    END ELSE
    BEGIN
    Messagedlg('','Unable to make a connection to the server using the details you supplied.',mtError,[mbOK],0);
    Application.Terminate;
    END;
  end;


procedure TBookingsform.Fetchbookings;
Var
sName,sNotes:String;
bstartdate,benddate:TDatetime;
xbstart,xbend,ybstart:Integer;
xstartmin,xendmin:integer;
xroom,xtext,ytext:Integer;
intdays:integer;
intmins:integer;
currenttimepos:integer;
squarewidth:integer;
done:boolean;
BEGIN
accdatamoduleform.cdsbooking.Filtered:=false;
IF accdatamoduleform.cdsbooking.IsEmpty=false THEN
  BEGIN
  Accdatamoduleform.cdsbooking.First;
    REPEAT
    {need to find the start date and room number}
    {Find booking start date and end date}
    Bstartdate:=accdatamoduleform.cdsbookingstartdate.Value;
    BEnddate:=accdatamoduleform.cdsbookingenddate.Value;
    xroom:=accdatamoduleform.cdsbookingroomno.Value;
    Sname:=accdatamoduleform.cdsbookinglabel.Value+' ('+accdatamoduleform.cdsbookingguests.AsString+')';
    Snotes:=accdatamoduleform.cdsbookingnotes.Value;
    IF Bstartdate>=dstart THEN
      BEGIN
      {we calculate the number of spaces between the booking start and the grid start}

      xbstart:=labelleft+labelwidth+4+(daysbetween(BStartdate,dstart)*divwidth);
      xbend:=xbstart+(daysbetween(Bstartdate,BEnddate)*divwidth);
      IF accdatamoduleform.cdsbookingnotime.Value=false THEN
        BEGIN
        xstartmin:=hoursbetween(accdatamoduleform.cdsbookingstarttime.Value,strtotime('0:00'));
        xstartmin:=(xstartmin*divwidth)div 24;
        xbstart:=xbstart+xstartmin;
        xendmin:=hoursbetween(accdatamoduleform.cdsbookingendtime.Value,strtotime('0:00'));
        xendmin:=(xendmin*divwidth)div 24;
        xbend:=xbend+xendmin;
        END;
      END ELSE
      BEGIN
      xbstart:=labelleft+labelwidth+4;
      xbend:=xbstart+(daysbetween(dstart,BEnddate)*divwidth);
      IF accdatamoduleform.cdsbookingnotime.Value=false THEN
        BEGIN
        xendmin:=hoursbetween(accdatamoduleform.cdsbookingendtime.Value,strtotime('0:00'));
        xendmin:=(xendmin*divwidth)div 24;
        xbend:=xbend+xendmin;
        END;
      END;

    IF xbend>screenwidth-14 THEN xbend:=screenwidth-14;
    {The above is a bit crude - need to find out where the right hand}
    {side of the grid is}
    IF accdatamoduleform.cdsrooms.Locate('roomno',xroom,[])= true THEN
      BEGIN
      ybstart:=gridtop+((accdatamoduleform.cdsrooms.RecNo-1)*labelheight)+((labelheight*2)DIV 3);
      xtext:= xbstart+((xbend-xbstart)DIV 10);
      ytext:=gridtop+((accdatamoduleform.cdsrooms.RecNo-1)*labelheight)+((labelheight*1)DIV 3);
      paintbox1.canvas.Pen.Width:=2;
      IF accdatamoduleform.cdsbookingcustno.Value = -1 THEN paintbox1.Canvas.Font.Style:=[fsitalic]
      ELSE paintbox1.Canvas.Font.Style:=[];
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='BOOKED' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clBlue;
        paintbox1.canvas.Pen.Style:=psSolid;
        paintbox1.canvas.font.color:=clWhite;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='UNAVAILABL' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clRed;
        paintbox1.canvas.Pen.Style:=psDashdot;
        paintbox1.canvas.font.color:=clWhite;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='NO SHOW' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clRed;
        paintbox1.canvas.Pen.Style:=psSolid;
        paintbox1.canvas.font.color:=clWhite;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='ENQUIRY' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clWhite;
        paintbox1.canvas.Pen.Style:=psDashdot;
        paintbox1.canvas.font.color:=clWhite;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='HOLD' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clYellow;
        paintbox1.canvas.Pen.Style:=psSolid;
        paintbox1.canvas.font.color:=clWhite;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='ACTIVE' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clLime;
        paintbox1.canvas.Pen.Style:=psSolid;
        paintbox1.canvas.font.color:=clRed;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='CANCELLED' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clGray;
        paintbox1.canvas.Pen.Style:=psSolid;
        paintbox1.canvas.font.color:=clGray;
        END ELSE
      IF Uppercase(accdatamoduleform.cdsbookingstatus.Value)='COMPLETED' THEN
        BEGIN
        paintbox1.canvas.Pen.Color:=clWhite;
        paintbox1.canvas.Pen.Style:=psSolid;
        paintbox1.canvas.font.color:=clWhite;
        END;
      paintbox1.canvas.MoveTo(xbstart,ybstart);
      paintbox1.canvas.LineTo(xbend,ybstart);
      paintbox1.canvas.MoveTo(xbend,ybstart-3);
      paintbox1.canvas.LineTo(xbend,ybstart+3);
      paintbox1.canvas.Font.Size:=12;
      IF xbend-xbstart < paintbox1.canvas.TextWidth(sname+'      ')THEN
        BEGIN
          REPEAT
          {take some letters out}
          IF length(sname)>0 THEN delete(sname,length(sname),1);
          done:= (paintbox1.canvas.TextWidth(sname+'      ')<xbend-xbstart)OR(length(sname)=0);
          UNTIL done;
        Insert('...',sname,length(sname)+1);
        END;
        BEGIN
        paintbox1.canvas.TextOut(xtext,ytext,sname);
        xtext:=xtext+paintbox1.Canvas.TextWidth(sname+' ');
        IF accdatamoduleform.cdsbookingcharge.Value=true THEN
          BEGIN
          paintbox1.Canvas.Font.Color:=clYellow;
          paintbox1.canvas.TextOut(xtext,ytext,basecurrencystring);
          xtext:=xtext+paintbox1.Canvas.TextWidth('  ');
          END;
        IF snotes<>'' THEN
          BEGIN
          paintbox1.canvas.font.color:=clLime;
          paintbox1.canvas.brush.color:=clRed;
          xtext:=xtext+paintbox1.Canvas.TextWidth(basecurrencystring+' ');
          squarewidth:=paintbox1.Canvas.Textheight(sname)div 2;
          paintbox1.canvas.Ellipse(xtext,ytext,xtext+(2*squarewidth),ytext+(2*squarewidth));
          END;
        END;
      END;
    IF accdatamoduleform.cdsbooking.eof=false THEN accdatamoduleform.cdsbooking.next;
    UNTIL accdatamoduleform.cdsbooking.eof=true;
    {add in any current bookings}
  END;
{now add the timeline if it is visible}
IF (dstart<=date)AND(dend>=date)THEN
  BEGIN
  {draw the timeline if it's visible}
  intdays:=daysbetween(now,dstart)*divwidth;
  intmins:=((minutesbetween(time,strtotime('0:00')))*divwidth)div 1440;
  currenttimepos:=labelleft+labelwidth+4+(intdays)+(intmins);
  paintbox1.canvas.MoveTo(currenttimepos,gridtop);
  paintbox1.canvas.pen.width:=1;
  paintbox1.canvas.Pen.Style:=psdashdot;
  paintbox1.canvas.Pen.Color:=clGray;
  paintbox1.canvas.LineTo(currenttimepos,gridtop+gridheight);
  END;
Lastdisplaytime:=now;
END;


procedure TBookingsform.btnHomeClick(Sender: TObject);
begin
Gohome;
end;

Procedure TBookingsform.GoHome;
Var
iday,imonth,iyear:Word;
begin
{This simply centres the display on the current date}
{with a one day view}
decodedate(date,iyear,imonth,iday);
cbday.ItemIndex:=iday-1;
cbmonth.ItemIndex:=imonth-1;
eyear.Text:=inttostr(iyear);
Centredate:=date;
sview:='day';
Paintbox1.Repaint;
end;


procedure TBookingsform.btnDayClick(Sender: TObject);
begin
{This sets the start and end dates to the centre}
{date selected by the user}
sview:='day';
Paintbox1.Repaint;
end;

procedure TBookingsform.btnWeekClick(Sender: TObject);
begin
{This shows a week view centred on the date}
{selected by the user}
sview:='week';
Paintbox1.Repaint;
end;

procedure TBookingsform.btn3weekClick(Sender: TObject);
begin
{This gives a 21 day view centred on the date}
{selected by the user}
sview:='3week';
Paintbox1.Repaint;
end;

procedure TBookingsform.btnMonthClick(Sender: TObject);
begin
{This gives a 31 day view centred on the date}
{selected by the user}
sview:='month';
Paintbox1.Repaint;
end;

procedure TBookingsform.btn3monthClick(Sender: TObject);
begin
{This gives a 93 day view centred on the}
{date selected by the user}
sview:='3month';
Paintbox1.Repaint;
end;

procedure TBookingsform.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
accdatamoduleform.cdsaddress.Close;
accdatamoduleform.cdsrooms.close;
accdatamoduleform.cdsbooking.close;
accdatamoduleform.cdsaccount.close;
accdatamoduleform.conn.close;
accdatamoduleform.adminconn.close;
end;

procedure TBookingsform.FormResize(Sender: TObject);
begin
Panel1.Width:=bookinginfoform.Width div 2;
end;

procedure TBookingsform.Label1Click(Sender: TObject);
begin
roomsetupform.showmodal;
accdatamoduleform.cdsbooking.Refresh;
end;

procedure TBookingsform.Timer1Timer(Sender: TObject);
  Var
  Datenow:TDatetime;
  begin
  Statusbar1.Panels[4].Text:=Formatdatetime('hh:mm:ss',now);
  Datenow:=Date;
  IF dayof(olddate)<>Dayof(Datenow)THEN
    BEGIN
    accdatamoduleform.Setlogfile;
    {also shift the view by 1 day}
    centredate:=centredate+1;
    olddate:=datenow;
    END;
  IF minutesbetween(now,lastdisplaytime)>5 THEN Paintbox1.Repaint;
  end;


procedure TBookingsform.PaintBox1Paint(Sender: TObject);
Var
testdiv,dwidth:integer;
i,j:Integer;
dispdate:TDatetime;
Sdate,sroom,sroomno:String;
numrooms:Integer;
sstartdate,senddate:String;
begin
IF (changebooking=false)AND(ledgerform.Visible=false)AND(roomsetupform.Visible=false)AND(customerform.visible=false) THEN
  BEGIN
IF sview='day' THEN
  BEGIN
  dstart:=centredate;
  dend:=centredate;
  Divisions:=1;
  END ELSE
IF sview='week' THEN
  BEGIN
  dstart:=centredate-3;
  dend:=centredate+3;
  divisions:=7;
  END ELSE
IF sview='3week' THEN
  BEGIN
  dstart:=centredate-10;
  dend:=centredate+10;
  divisions:=21;
  END ELSE
IF sview='month' THEN
  BEGIN
  dstart:=centredate-15;
  dend:=centredate+15;
  divisions:=31;
  END ELSE
IF sview='3month' THEN
  BEGIN
  dstart:=centredate-46;
  dend:=centredate+46;
  {how many divisions can we fit in?}
  testdiv:=93;
  dwidth:=datewidth div testdiv;
  divisions:=datewidth div dwidth;
  END;
Try
sstartdate:=formatdatetime(shortdateformat,dstart);
senddate:=formatdatetime(shortdateformat,dend);
Except
sStartdate:=formatdatetime(shortdateformat,date);
sEnddate:=formatdatetime(shortdateformat,date);
End;

Datetop:=8;
BtnUp.Top:=Datetop;
gridtop:=datetop+dateheight+8;
spaceheight:=panel1.Top-gridtop-4; {space available - used to calculate height of labels}
labelheight:=spaceheight div (roomsperpage+1);
gridheight:=(labelcount*labelheight)-8;
if divisions>0 THEN divwidth:=datewidth div divisions ELSE divwidth:=0;
paintbox1.canvas.Pen.Width:=3;
paintbox1.canvas.pen.Style:=pssolid;
paintbox1.canvas.Pen.Color:=clBlue;
paintbox1.canvas.Rectangle(Dateleft,datetop,Dateleft+(divwidth*divisions),datetop+dateheight);
{draw the date lines for the top of the calendar}
  j:=0;
    REPEAT
    dispdate:=dstart+j;
    IF dayof(dispdate)=1 THEN
      BEGIN
      paintbox1.canvas.Pen.Color:=clRed;
      paintbox1.canvas.Pen.Width:=3;
      END ELSE
      BEGIN
      paintbox1.canvas.Pen.Color:=clWhite;
      paintbox1.canvas.Pen.Width:=1;
      END;
    paintbox1.canvas.Moveto(dateleft+(divwidth*j),datetop+3);
    IF (j>0)AND(divisions>1) THEN
      BEGIN
      paintbox1.canvas.Lineto(dateleft+(divwidth*j),datetop+dateheight-3);
      END;
    j:=j+1;
    UNTIL j=divisions;

{This is to see if the relevant room is occupied today}
  accdatamoduleform.cdsbookingcheck.Active:=false;
  accdatamoduleform.sqlbookingcheck.Active:=false;
  accdatamoduleform.sqlbookingcheck.CommandText:='SELECT * FROM booking where enddate> '''+datetimetostr(date)+''' AND startdate <= '''+datetimetostr(date)+'''';
  accdatamoduleform.cdsbookingcheck.active:=true;
  accdatamoduleform.cdsbookingcheck.Filtered:=false;
  Accdatamoduleform.cdsbookingcheck.Refresh;

paintbox1.canvas.Font.Size:=11;
paintbox1.canvas.font.Color:=clWhite;
paintbox1.canvas.Font.Style:=[fsBold];
{we need to see what rooms are active}
Accdatamoduleform.cdsrooms.Filter:='created <= '''+senddate+'''';
Accdatamoduleform.cdsrooms.Filtered:=true;
Rooms:=accdatamoduleform.cdsrooms.RecordCount;
  IF rooms>roomsperpage THEN
    BEGIN
    Labelcount:=roomsperpage;
    Bookingsform.btnDown.Visible:=true;
    END ELSE
    BEGIN
    labelcount:=rooms;
    Bookingsform.btnDown.Visible:=false;
    END;
  Bookingsform.btnUp.Visible:=false;
For i:=1 TO labelcount DO
  BEGIN
  paintbox1.canvas.Pen.Width:=3;
  paintbox1.canvas.pen.Style:=pssolid;
  Accdatamoduleform.cdsrooms.recno:=roomstart+(i-1);
  sroomno:=accdatamoduleform.cdsroomsroomno.AsString;
  {Draw the room rectangle - the colour depends on situation}
  {Briefly, if we're not in a booking, rooms will be red if occupied on the current day}
  {and green if unoccupied. If we are in a booking, rooms will be yellow if unavailable}
  {and green if available during the current booking}
  IF Inbooking=True THEN
    BEGIN
    Occstart:=NewBookingstart;
    Occend:=Newbookingend;
    END ELSE
    BEGIN
    Occstart:=Date;
    Occend:=Date;
    END;
  {Now see if there are bookings for this date range}
accdatamoduleform.cdsbookingcheck.Filter:='Roomno = '''+sroomno+'''and startdate <= '''+formatdatetime(shortdateformat,occstart)+''' and enddate >= '''+formatdatetime(shortdateformat,occend)+'''';
accdatamoduleform.cdsbookingcheck.Filtered:=true;
IF accdatamoduleform.cdsbookingcheck.IsEmpty=false THEN
  BEGIN
  IF Inbooking=False THEN
  paintbox1.canvas.Pen.Color:=$001010FF ELSE
  paintbox1.canvas.Pen.color:=$002070FF;
  END ELSE
  BEGIN
  IF Inbooking=False THEN
  paintbox1.canvas.Pen.Color:=clLime ELSE
  paintbox1.canvas.pen.Color:=clWhite;
  END;

paintbox1.canvas.Rectangle(labelleft,Gridtop+(labelheight*(i-1)),labelleft+labelwidth,Gridtop+(labelheight*i)-5);

  {Draw the calendar rectangle for this room}
  paintbox1.canvas.Pen.Color:=clYellow;
  paintbox1.canvas.Rectangle(labelleft+labelwidth+4,gridtop+(labelheight*(i-1)),labelleft+labelwidth+4+(divwidth*divisions),gridtop+(labelheight*i)-5);
  {and fill in the date lines}

  paintbox1.canvas.pen.Width:=1;
  paintbox1.canvas.Pen.Color:=clGray;
  paintbox1.canvas.Pen.Style:=psSolid;
  BEGIN
  IF accdatamoduleform.cdsroomscreated.Value < dstart THEN
  j:=0 ELSE j:=daysbetween(accdatamoduleform.cdsroomscreated.Value,dstart);
    REPEAT
    paintbox1.canvas.Moveto(dateleft+(divwidth*j),gridtop+(labelheight*(i-1))+2);
    paintbox1.canvas.Lineto(dateleft+(divwidth*j),Gridtop+(labelheight*i)-8);
    j:=j+1;
    UNTIL j=divisions;
  END;
  sroom:='Room '+accdatamoduleform.cdsroomsroomno.AsString;
  paintbox1.canvas.TextOut(labelleft+3,Gridtop+(labelheight*(i-1)+(1*labelheight div 20)),sroom);
  sroom:=accdatamoduleform.cdsroomsroomname.AsString;
  paintbox1.canvas.TextOut(labelleft+3,Gridtop+(labelheight*(i-1)+(6*labelheight div 20)),sroom);
  IF labelheight>paintbox1.canvas.TextHeight(sroom)*3 THEN
    BEGIN
    sroom:='';
    numrooms:=accdatamoduleform.cdsroomsdouble.Value;
    IF numrooms>0 THEN Insert(inttostr(numrooms)+'D ',sroom,length(sroom)+1);
    numrooms:=accdatamoduleform.cdsroomssingle.Value;
    IF numrooms>0 THEN Insert(inttostr(numrooms)+'S  ',sroom,length(sroom)+1);
    paintbox1.canvas.TextOut(labelleft+3,Gridtop+(labelheight*(i-1)+(11*labelheight div 20)),sroom);
    END;
  END;

FOR i:=0 TO divisions do
  BEGIN
  dispdate:=dstart+i;
  IF i<divisions THEN
    BEGIN
    {write out the dates}
    IF divisions = 1 THEN
      BEGIN
      paintbox1.canvas.Font.size:=20;
      sdate:=formatdatetime('dddd dd mmmm yyyy',dispdate);
      IF dateof(dispdate)=dateof(date) THEN Paintbox1.Canvas.Brush.Color:=clRed ELSE
        BEGIN
        IF (dayofweek(dispdate)=1)OR(dayofweek(dispdate)=7)THEN
        Paintbox1.Canvas.Brush.Color:=clBlue ELSE
        Paintbox1.Canvas.Brush.Color:=clGreen;
        END;
      paintbox1.Canvas.Rectangle(dateleft+1,datetop+1,dateleft+divwidth-2,datetop+dateheight-2);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(divwidth div 3),datetop+(dateheight div 4),sdate);
      END ELSE
    IF divisions = 7 THEN
      BEGIN
      paintbox1.canvas.Font.size:=14;
      sdate:=formatdatetime('dd mmm yyyy',dispdate);
      IF dateof(dispdate)=dateof(date) THEN Paintbox1.Canvas.Brush.Color:=clRed ELSE
        BEGIN
        IF (dayofweek(dispdate)=1)OR(dayofweek(dispdate)=7)THEN
        Paintbox1.Canvas.Brush.Color:=clBlue ELSE
        Paintbox1.Canvas.Brush.Color:=clGreen;
        END;
      paintbox1.Canvas.Rectangle(dateleft+(divwidth*i)+1,datetop+1,dateleft+(divwidth*(i+1))-2,datetop+dateheight-2);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(divwidth div 6),datetop+(dateheight div 4),sdate);
      END ELSE
    IF divisions = 21 THEN
      BEGIN
      paintbox1.canvas.Font.size:=12;
      IF dateof(dispdate)=dateof(date) THEN Paintbox1.Canvas.Brush.Color:=clRed ELSE
        BEGIN
        IF (dayofweek(dispdate)=1)OR(dayofweek(dispdate)=7)THEN
        Paintbox1.Canvas.Brush.Color:=clBlue ELSE
        Paintbox1.Canvas.Brush.Color:=clGreen;
        END;      paintbox1.Canvas.Rectangle(dateleft+(divwidth*i)+1,datetop+1,dateleft+(divwidth*(i+1))-2,datetop+dateheight-2);
      sdate:=formatdatetime('dd',dispdate);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(divwidth div 8),datetop+2,sdate);
      sdate:=formatdatetime('mmm',dispdate);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(divwidth div 8),datetop+(3*dateheight div 10),sdate);
      sdate:=formatdatetime('yyyy',dispdate);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(divwidth div 8),datetop+(6*dateheight div 10),sdate);
      END ELSE
    IF divisions = 31 THEN
      BEGIN
      paintbox1.canvas.Font.size:=10;
      IF dateof(dispdate)=dateof(date) THEN Paintbox1.Canvas.Brush.Color:=clRed ELSE
        BEGIN
        IF (dayofweek(dispdate)=1)OR(dayofweek(dispdate)=7)THEN
        Paintbox1.Canvas.Brush.Color:=clBlue ELSE
        Paintbox1.Canvas.Brush.Color:=clGreen;
        END;      paintbox1.Canvas.Rectangle(dateleft+(divwidth*i)+1,datetop+1,dateleft+(divwidth*(i+1))-2,datetop+dateheight-2);
      sdate:=formatdatetime('dd',dispdate);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(2*divwidth div 10),datetop+2,sdate);
      sdate:=formatdatetime('mmm',dispdate);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(2*divwidth div 10),datetop+(3*dateheight div 10),sdate);
      sdate:=formatdatetime('yy',dispdate);
      paintbox1.canvas.TextOut(dateleft+(divwidth*i)+(2*divwidth div 10),datetop+(6*dateheight div 10),sdate);
      END ELSE {it's a 3 month view which has a variable number of days}
      BEGIN
      IF ((dayof(dispdate)=1)AND(i<divisions - 19))OR((i=0)AND(dayof(dispdate)<18)) THEN
        BEGIN
        paintbox1.canvas.Font.size:=14;
        paintbox1.canvas.Font.Color:=clWhite;
        sdate:=formatdatetime('mmmm yyyy',dispdate);
        paintbox1.canvas.Rectangle(dateleft+(divwidth*(i+4)+2),datetop+(3*dateheight div 10),dateleft+(divwidth*(i+20)),datetop+(7*dateheight div 10));
        paintbox1.canvas.TextOut(dateleft+(divwidth*(i+6)+2),datetop+(3*dateheight div 10),sdate);
        END;
      {there's no room for individual days, instead we show months}
      {find the start of a month}
      END
    END;
  END;
{now put in the bookings}

IF accdatamoduleform.cdsbooking.ChangeCount=0 THEN
  BEGIN
  accdatamoduleform.cdsbooking.Active:=false;
  accdatamoduleform.sqlbooking.Active:=false;
  accdatamoduleform.sqlbooking.CommandText:='SELECT * FROM booking where (startdate <= '''+sstartdate+''' AND enddate>= '''+sstartdate+''')OR(startdate <= '''+senddate+''' AND enddate>= '''+senddate+''') OR(startdate >= '''+sstartdate+''' AND enddate<= '''+senddate+''')';
  accdatamoduleform.cdsbooking.active:=true;
  accdatamoduleform.cdsbooking.Filtered:=false;
  END;
Fetchbookings;
 END;
end;

procedure TBookingsform.PaintBox1DblClick(Sender: TObject);
Var
roomnumber:Integer;
smousedate:String;
smousetime:string;
smouseroom:string;
bookinglock:string;
begin
timer2.Enabled:=false;
{IF holdposition=false THEN}
Currentitem:=onbooking(mouseroom,mousedate,mousetime,false);
statusbar1.Panels[5].Text:=inttostr(currentitem)+' '+currentbooking;
Bookinglock:=accdatamoduleform.Getsysteminfo('system','settings','bookinglock','none');
IF (oncalendar=true)AND(Inbooking=false)AND((bookinglock='none')OR(bookinglock=stationname)) THEN
  BEGIN
  Try
  accdatamoduleform.Setsysteminfo('system','settings','bookinglock',stationname);
  IF mouseroom<=accdatamoduleform.cdsrooms.recordcount THEN
    BEGIN
    accdatamoduleform.cdsrooms.recno:=mouseroom;
    roomnumber:=accdatamoduleform.cdsroomsroomno.Value;
    END ELSE roomnumber:=0;
  smousedate:=formatdatetime(shortdateformat,mousedate);
  smousetime:=formatdatetime('hh:mm',mousetime);
  smouseroom:=inttostr(roomnumber);
  {we need to select bookings which exist for this room, on this day}
  {at this time}
  accdatamoduleform.cdsbookingcheck.Active:=false;
  accdatamoduleform.sqlbookingcheck.Close;
  accdatamoduleform.sqlbookingcheck.CommandText:='select * from booking where (roomno= '''+smouseroom+''')AND( ((startdate='''+smousedate+''') AND (starttime <= '''+smousetime+''')) OR ((enddate='''+smousedate+''')AND(endtime>='''+smousetime+''')) OR ((startdate<'''+smousedate+''')AND(enddate>'''+smousedate+''')))';
  accdatamoduleform.cdsbookingcheck.Active:=true;
  accdatamoduleform.cdsbookingcheck.Refresh;
  accdatamoduleform.cdsbookingcheck.Filtered:=false;
  editrooms:=false;
  IF accdatamoduleform.cdsbookingcheck.IsEmpty=false THEN
    BEGIN
    {It's an existing booking. load the details}
    Bookingnr:=accdatamoduleform.cdsbookingcheckbookingno.Value;
    InBooking:=True;
    Editbooking:=True;
    END ELSE
    BEGIN
    Bookingnr:=Newbookingnumber;
    InBooking:=True;
    Editbooking:=False;
    END;
  Bookinginfoform.Show;
  Bookinginfoform.SetFocus;
  Except
  {except someone else has set a booking}
  Messagedlg('','?Unable to set a booking lock. Terminal '+bookinglock+'is in a booking',mtInformation,[mbOK],0);
  {Holdposition:=false;}
  End;
  END ELSE
  BEGIN
  Messagedlg('','Unable to set a booking lock. Terminal '+bookinglock+' is in a booking',mtInformation,[mbOK],0);
  {Holdposition:=false;}
  END;
end;

procedure TBookingsform.PaintBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);

Var
Occupied:boolean;
begin
{we want to allow dropping on the calendar but nowhere else}
wherearewe(x,y);
timer2.Enabled:=false;
IF lastdragroom<>mouseroom THEN
  BEGIN
  {reposition the record}
  IF (mouseroom>0) and (mouseroom <= accdatamoduleform.cdsrooms.recordcount) THEN
  Accdatamoduleform.cdsrooms.recno:=mouseroom;
  mouseroomno:=accdatamoduleform.cdsroomsroomno.asstring;
  lastdragroom:=mouseroom;
  Occupied:=isoverlapped(mouseroomno,bookingdragstartdate,bookingdragstarttime,bookingdragenddate,bookingdragendtime,0);
  END ELSE
  BEGIN
  IF (mousedate>bookingdragenddate)OR((mousedate=bookingdragenddate)AND(mousetime>bookingdragendtime))THEN
    BEGIN
    {we have dragged beyond the end of the booking extending it at the end}
    {so the new limits on the booking are bookingdragstartdate/time to mousedate/time}
    Occupied:=isoverlapped(mouseroomno,bookingdragstartdate,bookingdragstarttime,mousedate,mousetime,0);
    END ELSE
    BEGIN
    {we have dragged before the start of the booking extending it at the start}
    {so the new limits on the booking are mouse date/time to bookingdragenddate/time}
    Occupied:=isoverlapped(mouseroomno,mousedate,mousetime,bookingdragenddate,bookingdragendtime,0);
    END;
  END;
IF (source is TPaintbox)AND(oncalendar=true)
AND(occupied=false) THEN accept:=true ELSE accept:=false;
end;

procedure TBookingsform.PaintBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Var
Bookingstatus:string;
j,thisroom:integer;
done:Boolean;
begin
Thisroom:=roomstart;
IF (ledgerform.Visible=false)AND(bookinginfoform.Visible=false) THEN
  BEGIN
  IF (x>dateleft) AND (x<dateleft+datewidth)AND(y>datetop)AND(y<datetop+dateheight)THEN
    BEGIN
    {we're on the date bar}
    {find the date}
    onroom:=false;
    ondate:=true;
    oncalendar:=false;
    mousedate:=dstart+(x-(dateleft+2))DIV divwidth;
    END ELSE
  IF (x>labelleft) AND (x<labelleft+labelwidth)THEN
    BEGIN
    {we're on the rooms. Find the room}
    onroom:=true;
    ondate:=false;
    oncalendar:=false;
    IF labelcount>0 THEN
      BEGIN
      j:=1;
      mouseroom:=0;
        REPEAT
        IF (y>(gridtop+labelheight*(j-1)))AND(y<(gridtop+(labelheight*j)-5))THEN
        mouseroom:=thisroom;
        j:=j+1;
        thisroom:=thisroom+1;
        done:=(mouseroom>0)OR(j>labelcount);
        UNTIL done;
      END;
    Currentitem:=onbooking(mouseroom,mousedate,mousetime,true);
    END ELSE
  IF (x>labelleft+labelwidth+4) AND (x<screenwidth-14)THEN
    BEGIN
    {we're on the calendar Find the date and room}
    onroom:=false;
    ondate:=false;
    oncalendar:=true;
    wherearewe(x,y);
    END ELSE
    BEGIN
    {no valid position}
    onroom:=false;
    ondate:=false;
    oncalendar:=false;
    END;

  mclicked:=true;
  IF oncalendar=true THEN
    BEGIN
    dragview:=false;
    {get the current booking if there is one}
    {IF holdposition=false THEN}
    Currentitem:=onbooking(mouseroom,mousedate,mousetime,false);
    statusbar1.Panels[5].Text:=inttostr(currentitem)+' '+currentbooking;
    {Holdposition:=true;}
    IF button=mbRight THEN
      BEGIN
      {show a pop up menu}
      popupmenu1.Items[0].Enabled:=true;
      popupmenu1.Items[0].Items[0].Enabled:=false;
      popupmenu1.Items[0].Items[1].Enabled:=false;
      popupmenu1.Items[0].Items[2].Enabled:=false;
      popupmenu1.Items[0].Items[4].Enabled:=false;
      popupmenu1.Items[0].Items[5].Enabled:=false;
      popupmenu1.Items[0].Items[5].Caption:='Check out';
      popupmenu1.Items[0].Items[7].Enabled:=false;

      popupmenu1.Items[1].Enabled:=true;
      popupmenu1.Items[1].Items[0].Enabled:=false;
      popupmenu1.Items[1].Items[1].Enabled:=false;
      popupmenu1.Items[1].Items[2].Enabled:=false;
      popupmenu1.Items[1].Items[3].Enabled:=false;
      popupmenu1.Items[1].Items[4].Enabled:=false;
      popupmenu1.Items[1].Items[5].Enabled:=false;
      popupmenu1.Items[1].Items[6].Enabled:=false;
      popupmenu1.Items[1].Items[7].Enabled:=false;
      IF currentbooking<>'none' THEN
        BEGIN
        Bookingstatus:=accdatamoduleform.cdsbookingcheckstatus.Value;
        allowcharges1.Checked:= accdatamoduleform.cdsbookingcheckcharge.Value;
        IF bookingstatus='Active' THEN
          BEGIN
          {If it's active we only allow completed}
          popupmenu1.Items[0].Items[1].Enabled:=true;
          popupmenu1.Items[0].Items[5].Enabled:=true;
          popupmenu1.Items[0].Items[7].Enabled:=true;
          popupmenu1.Items[1].Items[8].Enabled:=true;
          END ELSE
        IF bookingstatus='Booked' THEN
          BEGIN
          {If the status is booked then we can allow}
          {no show, cancelled or active}
          popupmenu1.Items[0].Items[1].Enabled:=true;
          popupmenu1.Items[0].Items[4].Enabled:=true;
          popupmenu1.Items[1].Items[4].Enabled:=true;
          popupmenu1.Items[1].Items[5].Enabled:=true;
      	  popupmenu1.Items[1].Items[6].Enabled:=true;
          END ELSE
        IF bookingstatus='Hold' THEN
          BEGIN
          {If it's held we allow booked or free}
          popupmenu1.Items[0].Items[1].Enabled:=true;
          popupmenu1.Items[1].Items[3].Enabled:=true;
	  popupmenu1.Items[1].Items[8].Enabled:=true;
          END ELSE
        IF bookingstatus='Enquiry' THEN
          BEGIN
          {If it's enquiry we allow hold booked or free}
          popupmenu1.Items[0].Items[1].Enabled:=true;
          popupmenu1.Items[1].Items[2].Enabled:=true;
      	  popupmenu1.Items[1].Items[3].Enabled:=true;
	  popupmenu1.Items[1].Items[8].Enabled:=true;
          END ELSE
        IF bookingstatus='Unavailable' THEN
          BEGIN
          {If it's unavailable we allow free}
          popupmenu1.Items[0].Items[1].Enabled:=true;
	  popupmenu1.Items[1].Items[8].Enabled:=true;
          END ELSE
        IF bookingstatus='Completed' THEN
          BEGIN
          popupmenu1.Items[0].Items[5].Caption:='View receipt';
          popupmenu1.Items[0].Items[5].Enabled:=true;
          END;
        END ELSE
        BEGIN
        {maybe allow new booking here}
        popupmenu1.Items[0].Items[2].Enabled:=true;
        END;
      popupmenu1.Popup(x,y);
      END ELSE
      BEGIN
      {allow dragging if there's a booking}
      {we'll need to load cdsbookingnew with the current booking to allow overlap checking}
        IF currentitem<>-1 THEN
        BEGIN
        Accdatamoduleform.cdsbookingnew.Close;
        Accdatamoduleform.sqlbookingnew.Close;
        Accdatamoduleform.sqlbookingnew.CommandText:='SELECT * FROM booking where bookingno = '''+currentbooking+'''';
        Accdatamoduleform.cdsbookingnew.Active:=true;
        Accdatamoduleform.cdsbookingnew.Locate('item',currentitem,[]);
        editrooms:=true;
        editbooking:=true;
        editeditem:=inttostr(currentitem);
        Bookingref:=currentbooking;
        {we also want to reposition ourselves on the item we clicked}
        accdatamoduleform.cdsbookingcheck.Locate('item',currentitem,[]);
        {also show the notes in the title bar}
        IF accdatamoduleform.cdsbookingchecknotes.Value<>'' THEN Timer2.Enabled:=true;
        {need a check to prevent moving completed bookings}
        {it's a booking so we can drag it}
        {the following are the absolute start time and date of the booking}

        Bookingdragstartdate:=accdatamoduleform.cdsbookingcheckstartdate.Value;
        Bookingdragenddate:=accdatamoduleform.cdsbookingcheckenddate.Value;
        Bookingdragstarttime:=accdatamoduleform.cdsbookingcheckstarttime.Value;
        Bookingdragendtime:=accdatamoduleform.cdsbookingcheckendtime.Value;

        {and these are the start time and date of the mouse position}
        startdragdate:=mousedate;
        startdragtime:=mousetime;
        startdragroom:=mouseroom;
        accdatamoduleform.cdsrooms.RecNo:=mouseroom;
        mouseroomno:=accdatamoduleform.cdsroomsroomno.AsString;
        lastdragroom:=startdragroom;
        paintbox1.Cursor:=crSizeNWSE;
        dragitem:=accdatamoduleform.cdsbookingcheckitem.value;
        paintbox1.BeginDrag(false,-5);
        END ELSE paintbox1.Cursor:=crDefault;
      END;
    END ELSE
  IF ondate = true THEN
    BEGIN
    {work out where we are for dragging the view}
    {this is not strictly a drag and drop operation, we're simply shifting the view}
    {by the difference between where the mouse pointer is when we click and}
    {where it is when we let go}
    dragview:=true;
    startdragdate:=mousedate;
    END ELSE
  IF onroom = true THEN
    BEGIN
    IF currentitem<>-1 THEN
      BEGIN
      IF accdatamoduleform.cdsbookingcheckstatus.Value='Active' THEN
      Messagedlg('','TEST: Item '+accdatamoduleform.cdsbookingcheckitem.AsString+' is active',mterror,[mbOK],0) ELSE
      IF accdatamoduleform.cdsbookingcheckstatus.Value='Booked' THEN
      Messagedlg('','TEST: Item '+accdatamoduleform.cdsbookingcheckitem.AsString+' is booked',mterror,[mbOK],0) ELSE

      {room is occupied - if status is 'Booked' check the guests in}
      {if status is Active check them out}
      END ELSE
      BEGIN
      {room is free. Show new booking form}
      Messagedlg('','TEST: Room is free',mterror,[mbOK],0);
      END;
    END;
  END;
end;

procedure TBookingsform.PaintBox1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
timer2.Enabled:=false;
IF button=mbLeft THEN
  BEGIN
  paintbox1.Cursor:=crDefault;
  IF ondate=true THEN
    BEGIN
    mousedate:=dstart+(x-(dateleft+2))DIV divwidth;
    IF mousedate=startdragdate THEN
      BEGIN
      centredate:=mousedate;
      IF sview='week' THEN sview:='day' ELSE
      IF sview='3week' THEN sview:='week' ELSE
      IF sview='month' THEN sview:='3week' ELSE
      IF sview='3month' THEN sview:='month';
      END ELSE
      BEGIN
      {we want to shift the view by the number of days we have moved the mouse}
      centredate:=centredate-(mousedate-startdragdate);
      END;
    END;
  END ELSE
  BEGIN
  {Holdposition:=false;}
  IF ondate=true THEN
    BEGIN
    centredate:=mousedate;
    IF sview='day' THEN sview:='week' ELSE
    IF sview='week' THEN sview:='3week' ELSE
    IF sview='3week' THEN sview:='month' ELSE
    IF sview='month' THEN sview:='3month';
    END;
  END;
cbday.ItemIndex:=dayof(centredate)-1;
cbmonth.ItemIndex:=monthof(centredate)-1;
eyear.Text:=inttostr(yearof(centredate));
Paintbox1.Repaint;
Paintbox1.Cursor:=crDefault;
end;

procedure TBookingsform.PaintBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
newstartdate,newenddate,newstarttime,newendtime:TDatetime;
newroom,roomlabel:integer;
newdate,newtime:TDatetime;
Bookinglength,Newlength:TDatetime;
firstquarter:TDatetime;
lastquarter:TDatetime;
lastquarterstart:TDatetime;
firstquarterend:TDatetime;
Oldcost,Newcost:Double;
  begin
  {now we have to work out where we are and where we started}
  Changebooking:=false;
  newstartdate:=bookingdragstartdate;
  newenddate:=bookingdragenddate;
  newstarttime:=bookingdragstarttime;
  newendtime:=bookingdragendtime;
  Accdatamoduleform.cdsbooking.Locate('item',currentitem,[]);
  oldcost:=accdatamoduleform.cdsbookingprice.AsFloat;
  newcost:=oldcost;
  wherearewe(x,y);
  newdate:=mousedate;
  newtime:=mousetime;
  IF (mouseroom>0)AND(mouseroom<=accdatamoduleform.cdsrooms.RecordCount) THEN accdatamoduleform.cdsrooms.RecNo:=mouseroom;
  roomlabel:=accdatamoduleform.cdsroomsroomno.Value;
  newroom:=roomlabel;

  IF mouseroom<>startdragroom THEN
    BEGIN

    {confirm change room}
    IF messagedlg('','Move this booking to room'+inttostr(roomlabel)+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
      BEGIN
      newroom:=roomlabel;
      changebooking:=true;
      END;
    END ELSE
    BEGIN
    extendstart:=false;
    extendend:=false;
    Bookinglength:=(bookingdragenddate+bookingdragendtime)-(bookingdragstartdate+bookingdragstarttime);
    Firstquarter:=Bookinglength/4;
    lastquarter:=(3*bookinglength)/4;
    Firstquarterend:=Bookingdragstartdate+bookingdragstarttime+firstquarter;
    Lastquarterstart:=Bookingdragstartdate+bookingdragstarttime+lastquarter;
    newstartdate:=bookingdragstartdate;
    newenddate:=bookingdragenddate;
    newstarttime:=bookingdragstarttime;
    newendtime:=bookingdragendtime;
    IF (startdragdate+startdragtime)>Lastquarterstart THEN
      BEGIN
      {we're moving the end date}
      IF (mousedate+mousetime)< (bookingdragstartdate+bookingdragstarttime) THEN
    	BEGIN
        {we've tried to move the end to before the start}
        {ask if we want to move the whole booking}
    	IF messagedlg('','Can''t move the end time this far back. Do you want to move the whole booking instead?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
      	  BEGIN
          newenddate:=newdate;
          newstartdate:=newenddate-(bookingdragenddate-bookingdragstartdate);
          {move the whole booking to end on the date we're dropping at }
          changebooking:=true;
          END;
    	END ELSE
    	BEGIN
        {normal end change}
    	IF messagedlg('','Change the end time for this booking to '+formatdatetime('hh:mm',newtime)+' on '+formatdatetime('dd/mm/yyyy',newdate)+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
     	  BEGIN
          {move the enddate}
          newenddate:=newdate;
          newendtime:=newtime;
          changebooking:=true;
          END;
        END;
      END ELSE
    IF (startdragdate+startdragtime)<Firstquarterend THEN
      BEGIN
      {we're trying to move the start time}
      IF (mousedate+mousetime)> (bookingdragenddate+bookingdragendtime) THEN
        BEGIN
        {tried to move to after the end}
      	IF messagedlg('','Can''t move the start time this far forward. Do you want to move the whole booking instead?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
      	  BEGIN
          {move the whole booking to start on the day we're dropping at}
          newstartdate:=newdate;
          newenddate:=newstartdate+(bookingdragenddate-bookingdragstartdate);
          changebooking:=true;
          END;
        END ELSE
      	BEGIN
    	IF messagedlg('','Change the start time for this booking to '+formatdatetime('hh:mm',mousetime)+' on '+formatdatetime('dd/mm/yyyy',mousedate)+'?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
     	  BEGIN
          {move the startdate}
          newstartdate:=newdate;
          newstarttime:=newtime;
          changebooking:=true;
          END;
        END;               
      END;            
    newlength:=(newenddate+newendtime)-(newstartdate+newstarttime);
    IF (newlength<>bookinglength)AND(int(newlength)>0)THEN
      BEGIN
      {recalculate the cost}
      newcost:=(oldcost/roundto(bookinglength,0))*roundto(newlength,0);
      IF newcost <> oldcost THEN
        BEGIN
        IF Messagedlg('','The length of this booking has changed. The new price is '+formatfloat('£0.00',newcost)+'. Is this correct?',mtconfirmation,[mbYes,mbNo],0)=mrNo THEN
          BEGIN                        
          Messagedlg('','The cost of this item has been left unchanged. If you want to alter the price please edit the item manually',mtinformation,[mbOK],0);
          newcost:=oldcost;
          END;
        END;     
      END;   
    END;
  IF changebooking=true THEN
    BEGIN
    IF accdatamoduleform.cdsbooking.locate('item',editeditem,[])=true THEN
      BEGIN
      {we should query the room type here}
      accdatamoduleform.cdsbooking.Edit;
      accdatamoduleform.cdsbookingstartdate.Value:=newstartdate;
      accdatamoduleform.cdsbookingstarttime.Value:=newstarttime;
      accdatamoduleform.cdsbookingenddate.Value:=newenddate;
      accdatamoduleform.cdsbookingendtime.Value:=newendtime;
      accdatamoduleform.cdsbookingroomno.Value:=newroom;
      accdatamoduleform.cdsbookingprice.AsFloat:=newcost;
      accdatamoduleform.cdsbooking.Post;
      Changebooking:=false;
      Paintbox1.repaint;
      Editbooking:=false;
      editrooms:=false;
      END ELSE
      BEGIN
      Accdatamoduleform.Writelog('','','DEBUG: Cannot locate item '+editeditem);
      Changebooking:=false;
      Paintbox1.repaint;
      Editbooking:=false;
      editrooms:=false;
      messagedlg('','Moving of room did not work - counld not locate record '+editeditem,mtconfirmation,[mbYes,mbNo],0);
      END;
    END;
  IF accdatamoduleform.cdsbooking.ChangeCount>0 THEN
    BEGIN
    IF messagedlg('','Save changes?',mtconfirmation,[mbYes,mbNo],0)=mrYes THEN
      BEGIN
        Try
        Accdatamoduleform.cdsbooking.ApplyUpdates(0);
        Except
        {something didn't work}
        End;
      END ELSE
      BEGIN
      Accdatamoduleform.cdsbooking.CancelUpdates;
      Paintbox1.repaint;
      END;
    END;
  paintbox1.Cursor:=crDefault;
  editrooms:=false;
  end;

procedure TBookingsform.Free1Click(Sender: TObject);
begin
{here we delete the current item. If it's part of a booking we}
{ask if the whole booking is to be deleted}
accdatamoduleform.cdsbookingnew.close;
accdatamoduleform.sqlbookingnew.close;
accdatamoduleform.sqlbookingnew.CommandText:='select * from booking where bookingno = '''+currentbooking+'''';
accdatamoduleform.cdsbookingnew.Active:=false;
IF accdatamoduleform.cdsbookingnew.IsEmpty=false THEN
  BEGIN
  IF accdatamoduleform.cdsbookingnew.RecordCount>1 THEN
    BEGIN
    IF messagedlg('','Free all parts of this booking?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
      BEGIN
      accdatamoduleform.cdsbookingnew.First;
        REPEAT
        accdatamoduleform.cdsbookingnew.delete;
        UNTIL accdatamoduleform.cdsbookingnew.IsEmpty=true;
      END;
    END ELSE accdatamoduleform.cdsbookingnew.delete;
  END;
IF accdatamoduleform.cdsbookingnew.ChangeCount>0 THEN
  BEGIN
  IF messagedlg('','Save changes?',mtConfirmation,[mbYes,mbNo],0)=mrYes THEN
  accdatamoduleform.cdsbookingnew.applyupdates(0);
  END;
end;

procedure TBookingsform.Checkout1Click(Sender: TObject);
begin
statusbar1.Panels[7].Text:=currentbooking;
Ledgerform.visible:=true;
end;

procedure TBookingsform.Unavailable1Click(Sender: TObject);
begin
setstatus(currentbooking,'Unavailabl');
end;

procedure TBookingsform.Enquiry1Click(Sender: TObject);
begin
setstatus(currentbooking,'Enquiry');
end;



procedure TBookingsform.Booked1Click(Sender: TObject);
begin
setstatus(currentbooking,'Booked');
end;

procedure TBookingsform.Cancelled1Click(Sender: TObject);
begin
setstatus(currentbooking,'Cancelled');
end;

procedure TBookingsform.Completed1Click(Sender: TObject);
begin
setstatus(currentbooking,'Completed');
end;

procedure TBookingsform.Hold1Click(Sender: TObject);
begin
setstatus(currentbooking,'Hold');
end;

procedure TBookingsform.NoShow1Click(Sender: TObject);
begin
setstatus(currentbooking,'No Show');
end;

procedure TBookingsform.Today1Click(Sender: TObject);
begin
Statday:=date;
BReportform.Visible:=true;
BReportform.Setfocus;
end;

procedure TBookingsform.Tomorrow1Click(Sender: TObject);
begin
Statday:=date+1;
BReportform.Visible:=true;
BReportform.Setfocus;
end;

procedure TBookingsform.Printavailability1Click(Sender: TObject);
{quick n dirty. Print 30 days from today}
VAR
i,dateoffset:integer;
currentdate:TDatetime;
scurrentdate:string;
scurrentroomtype:String;
outputline:string;
Roomlist,Freelist:TStringlist;
roomindex,freecount:integer;
{ipagewidth,ipageheight,}ipitch:Integer;
 begin
 Roomlist:=Tstringlist.Create;
 Freelist:=Tstringlist.Create;
 Accdatamoduleform.sqlrooms.Close;
 Accdatamoduleform.cdsrooms.close;
 Accdatamoduleform.sqlrooms.CommandText:='SELECT * FROM ROOMS where active = true and accommodation > 0';
 Accdatamoduleform.cdsrooms.Active:=true;
 IF accdatamoduleform.cdsrooms.IsEmpty=false THEN
   BEGIN
   Accdatamoduleform.cdsrooms.First;
     REPEAT
     IF Roomlist.IndexOf(accdatamoduleform.cdsroomsroomtype.Value)=-1
       THEN Roomlist.Add(accdatamoduleform.cdsroomsroomtype.Value);
     IF Accdatamoduleform.cdsrooms.Eof=false THEN Accdatamoduleform.cdsrooms.Next;
     UNTIL Accdatamoduleform.cdsrooms.eof=true;
   END;
 IF roomlist.Count>0 THEN
   BEGIN
   Accdatamoduleform.sqlbookingcheck.Close;
   Accdatamoduleform.cdsbookingcheck.Close;
   Accdatamoduleform.sqlbookingcheck.CommandText:='SELECT * FROM booking where ((startdate >= '''+formatdatetime(shortdateformat,date)+''')AND(startdate <= '''+formatdatetime(shortdateformat,date+30)+''')) OR ((enddate >= '''+formatdatetime(shortdateformat,date)+''')AND(enddate <= '''+formatdatetime(shortdateformat,date+30)+''')) ';
   Accdatamoduleform.cdsbookingcheck.Open;
   accdatamoduleform.cdsbookingcheck.filtered:=false;
   IF Accdatamoduleform.cdsbookingcheck.IsEmpty=false THEN
     BEGIN
     Printer.Title:='Availability';
     Printer.BeginDoc;
     Printer.Canvas.Font.Name:='Adobe Helvetica';
     Printer.Canvas.Font.Size:=14;
     Printer.Canvas.TextOut(40,40,'SPREAD EAGLE HOTEL AVAILABILITY');
     dateoffset:=0;
     ipitch:=20;
       REPEAT
       currentdate:=date+dateoffset;
       Freelist.Clear;
       Freelist.Add(formatdatetime(shortdateformat,currentdate));
       scurrentdate:=formatdatetime(shortdateformat,currentdate);
       {now, for each date we need to find what rooms are available}
       Roomindex:=0;
         REPEAT
         IF roomindex< roomlist.count THEN
           BEGIN
           scurrentroomtype:=Roomlist[roomindex];
           Accdatamoduleform.cdsrooms.Filter:='roomtype = '''+scurrentroomtype+'''';
           Accdatamoduleform.cdsrooms.Filtered:=true;
           {now see what rooms are available}
           IF accdatamoduleform.cdsrooms.IsEmpty=false THEN
             BEGIN
             freecount:=0;
               REPEAT
               {now select from booking for this day for this room}
               {we want to check if the startdate is this day or before and the end}
               {date is tomorrow or after}
               Accdatamoduleform.cdsbookingcheck.filter:='startdate <= '''+scurrentdate+''' AND enddate > '''+scurrentdate+''' and roomno = '''+accdatamoduleform.cdsroomsroomno.asstring+'''';
               accdatamoduleform.cdsbookingcheck.Filtered:=true;
               IF accdatamoduleform.cdsbookingcheck.IsEmpty=true THEN freecount:=freecount+1;
               IF accdatamoduleform.cdsrooms.eof=false THEN accdatamoduleform.cdsrooms.next;
               UNTIL accdatamoduleform.cdsrooms.eof=true;
             Freelist.Add(scurrentroomtype);
             Freelist.Add(': ');
             Freelist.Add(inttostr(freecount));
             IF roomindex<roomlist.count THEN Freelist.Add(', ');
             END;
           {now we have the number of free rooms of this type for this date}
           END;
         roomindex:=roomindex+1;
         UNTIL roomindex=roomlist.count;
       IF Freelist.Count>0 THEN
         BEGIN
         i:=0;
         outputline:='   ';
           REPEAT
           IF i<freelist.count THEN
             BEGIN
             Insert(freelist[i],outputline,length(outputline)+1);
             IF i=0 THEN insert('   ',outputline,length(outputline)+1);
             END;
           i:=i+1;
           UNTIL i=freelist.count;
         END;
       Printer.Canvas.TextOut(10,104+ipitch*dateoffset,outputline);
       Printer.Canvas.MoveTo(10,106+ipitch*dateoffset);
       Printer.Canvas.Lineto(Printer.PageWidth,106+ipitch*dateoffset);
       dateoffset:=dateoffset+1;
       UNTIL dateoffset=31;
     Printer.EndDoc;
     END ELSE MessageDlg('Nothing to print!' ,mtError,[mbOK],0);
   END ELSE MessageDlg('No rooms defined!' ,mtError,[mbOK],0);
accdatamoduleform.sqlrooms.close;
accdatamoduleform.cdsrooms.active:=false;
accdatamoduleform.sqlrooms.commandtext:='SELECT * FROM rooms where active = true';
accdatamoduleform.cdsrooms.active:=true;

Roomlist.Free;
Freelist.Free;
end;

procedure TBookingsform.Checkin1Click(Sender: TObject);
begin
Paintbox1.Repaint;
setstatus(currentbooking,'Active');
end;

procedure TBookingsform.Person1Click(Sender: TObject);
begin
customerform.visible:=true;
end;

procedure TBookingsform.AllowCharges1Click(Sender: TObject);
begin
{we'll allow charges to be made to the room that we are on if it is active}
accdatamoduleform.sqlbookingcheck.close;
accdatamoduleform.cdsbookingcheck.close;
accdatamoduleform.sqlbookingcheck.commandtext:='select * from booking where item = '''+inttostr(currentitem)+'''';
accdatamoduleform.cdsbookingcheck.open;
accdatamoduleform.cdsbookingcheck.filtered:=false;
IF accdatamoduleform.cdsbookingcheck.locate('item',currentitem,[])=true THEN
  BEGIN
  IF accdatamoduleform.cdsbookingcheckcharge.Value=false THEN
    BEGIN
    accdatamoduleform.cdsbookingcheck.Edit;
    accdatamoduleform.cdsbookingcheckcharge.Value:=true;
    accdatamoduleform.cdsbookingcheck.Post;
    allowcharges1.Checked:=true;
    END ELSE
    BEGIN
    accdatamoduleform.cdsbookingcheck.Edit;
    accdatamoduleform.cdsbookingcheckcharge.Value:=false;
    accdatamoduleform.cdsbookingcheck.Post;
    allowcharges1.Checked:=false;
    END;
  END;
IF accdatamoduleform.cdsbookingcheck.ChangeCount>0 THEN accdatamoduleform.cdsbookingcheck.ApplyUpdates(0);
Paintbox1.Repaint;
end;

procedure TBookingsform.Quickadd1Click(Sender: TObject);
begin
Quickcloseform.Showmodal;
end;

procedure TBookingsform.Timer2Timer(Sender: TObject);
begin
{show a bar with the booking notes}
paintbox1.Canvas.Brush.Color:=clYellow;
paintbox1.Canvas.Font.color:=clBlack;
paintbox1.canvas.Rectangle(Dateleft+10,datetop+5,Dateleft+(divwidth*divisions)-10,datetop+dateheight-5);
paintbox1.canvas.TextOut(Dateleft+15,Datetop+5,accdatamoduleform.cdsbookingchecknotes.Value);
end;

procedure TBookingsform.Active1Click(Sender: TObject);
begin
MessageDlg('This function has been moved. Check in now by selecting ''ACTION|CHECK IN' ,mtInformation,[mbOK],0);
end;

end.
