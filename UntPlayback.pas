unit UntPlayback;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, RzCmboBx, RzRadChk, Buttons,ComCtrls,
  PngSpeedButton, ExtCtrls, RzEdit, RzTrkBar, RzBorder,menus;

type
  TfrmPlaybackControl = class(TForm)
    chkRepeated: TRzCheckBox;
    chkReplayComplete: TRzCheckBox;
    cbbReplayComplete: TRzComboBox;
    btnStart: TPngSpeedButton;
    btnStop: TPngSpeedButton;
    tmrTrigger: TTimer;
    trckSpeed: TRzTrackBar;
    lblSpeed: TRzLabel;
    lblPlaybackSpeed: TRzLabel;
    rzhkPlayback: TRzHotKeyEdit;
    lblPlaybackStop: TLabel;
    rzbrdr1: TRzBorder;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure tmrTriggerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trckSpeedChange(Sender: TObject);
    procedure rzhkPlaybackExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chkRepeatedClick(Sender: TObject);
  private
  FOnStop: TNotifyEvent;

  FRunning:Boolean;
  FShouldStop:Boolean;
    procedure RunPlayback;
    procedure DoOnComplete;
    procedure resetStartStopCaption;
    function getPlaybackSpeed: Double;

    { Private declarations }
  public
    procedure DoHotkeyAction;
    procedure SetAutoStart();

    constructor Create(AOwner: TComponent;onStop: TNotifyEvent);overload;

    { Public declarations }
  end;

var
  frmPlaybackControl: TfrmPlaybackControl;

implementation

uses
 UntMain,KbMouseFun,UntCountDown,MyCommonFuns,HotkeyManager,UntConst;

{$R *.dfm}

{ TfrmStopPlayback }


//提升进程令牌函数
function AdjustProcessPrivilege(ProcessHandle:THandle;Token_Name:Pchar):boolean;
var
Token:THandle;
TokenPri:_TOKEN_PRIVILEGES;
ProcessDest:int64;
l:DWORD;
begin
  Result:=False;
  if OpenProcessToken(ProcessHandle,TOKEN_Adjust_Privileges,Token) then
  begin
  if LookupPrivilegeValue(nil,Token_Name,ProcessDest) then
  begin
  TokenPri.PrivilegeCount:=1;
  TokenPri.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED;
  TokenPri.Privileges[0].Luid:=ProcessDest;
  l:=0;
  //更新进程令牌，成功返回TRUE
  if AdjustTokenPrivileges(Token,False,TokenPri,sizeof(TokenPri),nil,l) then
  Result:=True;
  end;
  end;
end;



procedure TfrmPlaybackControl.DoOnComplete();
begin
   case cbbReplayComplete.ItemIndex of
   0:
    frmClicker.close;
   1:
   if AdjustProcessPrivilege(GetCurrentProcess,'SeShutdownPrivilege') then//提升权限
    begin
    SetSystemPowerState(false,TRUE);
    end;

   2:
   SendShutDownCommand(SD_LogOff);

   3:
   SendShutDownCommand(SD_ShutDown);
   end;
{
Quit
Sleep
Log Off Computer
Turn Off Computer

}
end;

procedure TfrmPlaybackControl.RunPlayback();
var
i:integer;

Action: string;
keyName: string;
x, y: Integer;
delay,delayStartTime: Integer;

vk:word;
mevent,keyevent:word;

l:TListItem;
frmCountDown: TfrmCountDown;

needDelayTime:integer;

begin
  for i:=0 to frmClicker.lvMacroList.Items.count-1 do
  begin
    if FShouldStop then
     exit;

    l:=frmClicker.lvMacroList.Items[i];
    Action:=l.SubItems[0];
    keyName:=l.SubItems[1];
    x:=StrToInt(l.SubItems[2]);
    y:=StrToInt(l.SubItems[3]);
    delay:=StrToInt(l.SubItems[4]);

    if isKeyAction(Action) then
    begin
      vk:=StringToVirtualKey(keyName);
      keyevent:=StringToKeyEvent(Action);
      MyKeyPress(vk,keyevent);
    end
    else
    begin

      mevent:=StringToMouse(keyName,Action);
      MymouseClick(x,y,mevent);
    end;

    delayStartTime:=GetTickCount;
    needDelayTime:=Trunc(delay/getPlaybackSpeed());
    while (GetTickCount-delayStartTime<needDelayTime) and (not FShouldStop) do
     application.ProcessMessages;
  end;


  //响应结束事件, 倒计时
  if chkReplayComplete.Checked then
  begin
    frmCountDown:=TfrmCountDown.Create(nil);
    if frmCountDown.ShowModal=mrOk then
     DoOnComplete();

    frmCountDown.Free;
  end;



end;

procedure TfrmPlaybackControl.rzhkPlaybackExit(Sender: TObject);
begin
  g_ConfigManager.setHotkey(HT_Playback, rzhkPlayback.HotKey);

  g_HotkeyManager.RegisterOneHotKey(HT_Playback, rzhkPlayback.HotKey);

  resetStartStopCaption;
end;

procedure TfrmPlaybackControl.SetAutoStart;
begin
tmrTrigger.Enabled:=true;
end;

procedure TfrmPlaybackControl.tmrTriggerTimer(Sender: TObject);
begin
 btnStartClick(nil);
 tmrTrigger.Enabled:=false;

end;

function TfrmPlaybackControl.getPlaybackSpeed():Double;
var
  val: Integer;
begin
  val := trckSpeed.Position;
  if val >= 9 then
  begin
    result:= val - 8;
  end
  else
    result:=  1 / (10 - val);

end;
procedure TfrmPlaybackControl.trckSpeedChange(Sender: TObject);
var
  val: Integer;
begin
  val := trckSpeed.Position;
  if val >= 9 then
  begin
    lblPlaybackSpeed.Caption := IntToStr(val - 8) + ' X';
  end
  else
    lblPlaybackSpeed.Caption := '1/' + IntToStr(10 - val) + ' X';

 // g_ConfigManager.SetPlaybackSpeed(val);

end;

procedure TfrmPlaybackControl.btn1Click(Sender: TObject);
begin
getPlaybackSpeed();
end;

procedure TfrmPlaybackControl.DoHotkeyAction();
begin
  if FRunning then
   btnStopClick(nil)
  else
   btnStartClick(nil);

end;

procedure TfrmPlaybackControl.btnStartClick(Sender: TObject);
begin

  if FRunning then
  exit;

  try

    FRunning:=true;
    FShouldStop:=false;

    btnStart.Enabled:=false;
    btnStop.Enabled:=True;

    while not FShouldStop do
    begin
       RunPlayback();

       if not chkRepeated.Checked then  //不断重复
        break;
    end;

  finally
    FRunning:=false;

    btnStart.Enabled:=True;
    btnStop.Enabled:=false;
  end;

end;

procedure TfrmPlaybackControl.btnStopClick(Sender: TObject);
begin
FShouldStop:=true;

btnStart.Enabled:=True;
btnStop.Enabled:=false;


end;

procedure TfrmPlaybackControl.chkRepeatedClick(Sender: TObject);
begin
 if chkRepeated.Checked and (not g_Registered) then
 begin
    ShowMessage(Msg_FeatureForRegistredUserOnly);
    chkRepeated.Checked:=False;
    exit;
 end;

end;

constructor TfrmPlaybackControl.Create(AOwner: TComponent; onStop: TNotifyEvent);
begin
  inherited Create(nil);

  FOnStop:=onStop;


end;

procedure TfrmPlaybackControl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Assigned(FOnStop) then
  FOnStop(nil);

 btnStopClick(nil);

 frmClicker.Show;
end;

procedure TfrmPlaybackControl.FormCreate(Sender: TObject);
begin
FShouldStop:=false;
FRunning:=false;

 top:=Screen.Height-self.Height-50;
 left:= Screen.Width -self.Width-50;

 SetWindowPos(Handle,HWND_TOPMOST,Left,Top,Width,Height,SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

  g_TransLang.TransFormLang(self);
end;

procedure TfrmPlaybackControl.resetStartStopCaption();
begin
  btnStart.Caption:=Format(Text_Btn_Start,[ShortCutToText(rzhkPlayback.HotKey)]);
  btnStop.Caption:=Format(Text_Btn_Stop,[ShortCutToText(rzhkPlayback.HotKey)]);

end;


procedure TfrmPlaybackControl.FormShow(Sender: TObject);
begin
   resetStartStopCaption;

end;

end.
