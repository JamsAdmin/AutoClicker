unit UntMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel, ComCtrls, RzSpnEdt,
  MyCommonFuns, Obj_ThreadEx,
  RzButton, RzRadChk, RzCmboBx, RzTabs, Menus, UntConst, cstr, RzListVw,
  RzLabel,
  RzTrkBar, RzBorder, ConfigManager, Obj_RegInfo, HotkeyManager, Hooks,
  KbMouseFun,
  Buttons, PngSpeedButton,Obj_TransLang,RegistrationAPI, pngimage,HttpUtil,ShellAPI,UntEditLocation,
  HttpUtils;

type
  TfrmClicker = class(TForm)
    pgMain: TRzPageControl;
    shtClicker: TRzTabSheet;
    shtMacro: TRzTabSheet;
    grpClickInterval: TRzGroupBox;
    lblHour: TLabel;
    lblMin: TLabel;
    lblSec: TLabel;
    lblMill: TLabel;
    edtHour: TRzSpinEdit;
    edtMin: TRzSpinEdit;
    edtSec: TRzSpinEdit;
    edtMs: TRzSpinEdit;
    grpMouseAction: TRzGroupBox;
    lblMouseBtn: TLabel;
    lblClickType: TLabel;
    cbbMButton: TRzComboBox;
    cbbClickType: TRzComboBox;
    grpPosition: TRzGroupBox;
    rbCurrLocation: TRzRadioButton;
    rbPickLocation: TRzRadioButton;
    btnPick: TRzButton;
    btnStart: TRzButton;
    btnStop: TRzButton;
    grpRepeat: TRzGroupBox;
    rbTimesLimit: TRzRadioButton;
    rbNoTimesLimit: TRzRadioButton;
    edtRepeatTimes: TRzSpinEdit;
    btnStartRecord: TRzButton;
    btnShowPlayback: TRzButton;
    grpRecordOptions: TRzGroupBox;
    chkRecordDelay: TRzCheckBox;
    chkRecordMouseClick: TRzCheckBox;
    chkRecordKeyboard: TRzCheckBox;
    grpRecordHotkey: TRzGroupBox;
    lblRecordStopHotkey: TLabel;
    rzhkRecord: TRzHotKeyEdit;
    rzhkStartStop: TRzHotKeyEdit;
    lblStartStopHotkey: TLabel;
    chkRecordMove: TRzCheckBox;
    btnLoadRecord: TRzButton;
    btnSave: TRzButton;
    rbClickForMinutes: TRzRadioButton;
    lblMinutes: TRzLabel;
    edtClickMinutes: TRzSpinEdit;
    rzbrdr1: TRzBorder;
    tmrSimpleClick: TTimer;
    mmMain: TMainMenu;
    mniFile: TMenuItem;
    Load1: TMenuItem;
    SaveAs1: TMenuItem;
    mniHelp: TMenuItem;
    mniAbout: TMenuItem;
    mniRegister: TMenuItem;
    mniBuy: TMenuItem;
    mniN1: TMenuItem;
    dlgSaveRecord: TSaveDialog;
    dlgOpenRecord: TOpenDialog;
    lblCurrFile: TRzLabel;
    lblNoticeMenu: TRzLabel;
    pmRecord: TPopupMenu;
    mniDelete: TMenuItem;
    N1: TMenuItem;
    mniClear: TMenuItem;
    btn1: TButton;
    tmrBuyReminder: TTimer;
    tmrCheckReg: TTimer;
    btnContact: TPngSpeedButton;
    mmo1: TMemo;
    lblMacroDesc: TRzLabel;
    img1: TImage;
    lblURL: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lblEmail: TLabel;
    lvPicLocation: TRzListView;
    btnDelPick: TPngSpeedButton;
    btnEditPick: TPngSpeedButton;
    lvMacroList: TRzListView;
    procedure btnStartClick(Sender: TObject);
    procedure tmrSimpleClickTimer(Sender: TObject);
    procedure btnPickClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStartRecordClick(Sender: TObject);
    procedure rbPickLocationClick(Sender: TObject);
    procedure rbCurrLocationClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure mniBuyClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnLoadRecordClick(Sender: TObject);
    procedure btnShowPlaybackClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure rzhkRecordExit(Sender: TObject);
    procedure rzhkStartStopExit(Sender: TObject);
    procedure mniClearClick(Sender: TObject);
    procedure mniDeleteClick(Sender: TObject);
    procedure chkRecordKeyboardClick(Sender: TObject);
    procedure chkRecordMouseClickClick(Sender: TObject);
    procedure mniRegisterClick(Sender: TObject);
    procedure mniAboutClick(Sender: TObject);
    procedure tmrBuyReminderTimer(Sender: TObject);
    procedure tmrCheckRegTimer(Sender: TObject);
    procedure btnContactClick(Sender: TObject);
    procedure lblURLClick(Sender: TObject);
    procedure lblEmailClick(Sender: TObject);
    procedure btnDelPickClick(Sender: TObject);
    procedure btnEditPickClick(Sender: TObject);
  private
    FLimitTimes: Integer; 
    FCounter: Integer;
    FStartTime: Integer;

    FStartedSimpleClick: Boolean;
    FSimpleClicking:Boolean;
    FStartedRecord: Boolean;

    FHotkey_Clicker, FHotkey_Playback, Fhotkey_Record: Integer;

    FHookKeyboard, FHookMouse: THook;

    FLastMouseKBTime: Integer;

    procedure WMHotKey(var Msg: TWMHotKey);
    message WM_HOTKEY;

    procedure refreshStartStopButtonText;
    procedure DoClick(x, y: Integer; mouseBtn: TMouseButton;
      bSingleClick: Boolean);

    procedure showBuyWindow;

    procedure RegisterHotkey;
    procedure UnRegisterHotkey;
    procedure DoShowPlayback(Sender: TObject);
    procedure DoRecordMouse(Sender: TObject);
    procedure DoSimpleClick(Sender: TObject);
    procedure initKeyboardMouseHook;
    procedure DoKeyboardMouseHook(Hook: THook; var HookMsg: THookMessage);
    procedure addActionToListview(Action, keyName: string;
      x, y, delay: Integer);
    //procedure StartPlaybackThread;
    procedure showSmallStopWin;
    procedure DoSmallStopWinClose(Sender: TObject);
    procedure resetStartStopCaption;
    procedure DoStartOrStopPlayback(Sender: TObject);
    procedure multiClick(mouseBtnType: TMouseButton;bSingleClick: Boolean);
    procedure delayWithProcessMsg(delay: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClicker: TfrmClicker;
  g_Registered: Boolean;
  g_RegSoftInfo: TRegSoftInfo;
  g_ConfigManager: TConfigManager;
  g_HotkeyManager: THotkeyManager;

  g_API:TAPI;
  g_TransLang:TTransLang;

implementation

uses
  UntHintWindow, UntBuy, UntRegister,UntPlayback,UntAbout,CommConst,UntCountDown,md5,WebPageJump,superobject,UntUpdate;
{$R *.dfm}

procedure TfrmClicker.WMHotKey(var Msg: TWMHotKey);
begin

end;

procedure TfrmClicker.DoClick(x, y: Integer; mouseBtn: TMouseButton;
  bSingleClick: Boolean);
var
  mp: TPoint;
  iClickTimes, i: Integer;
  ww,hh:Integer;
begin

  if (x = -1) and (y = -1) then 
  begin
    GetCursorPos(mp);
    x := mp.x;
    y := mp.y;
  end;


  SetCursorPos(x,y);


  for i := 0 to iClickTimes - 1 do
  begin
    if mouseBtn = mbLeft then
    begin
     mouse_event( MOUSEEVENTF_LEFTDOWN, 0,0, 0, 0 );
     mouse_event( MOUSEEVENTF_LEFTUP, 0,0, 0, 0 );

    end
    else if mouseBtn = mbRight then
    begin

    end
    else
    begin
      mouse_event( MOUSEEVENTF_MIDDLEDOWN, 0,0, 0, 0 );
      mouse_event( MOUSEEVENTF_MIDDLEUP, 0,0, 0, 0 );
    // mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MIDDLEDOWN, x * 65535 div ww, y * 65535 div hh, 0, 0 );
    // mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MIDDLEUP, x * 65535 div ww, y * 65535 div hh, 0, 0 );
    end;
  end;


end;

function checkAlreadyRun(): Boolean;
begin
  
  CreateMutex(nil, False, PChar(Mutex));
  if GetLastError() = ERROR_ALREADY_EXISTS then
  begin
    result := true;
  end
  else
    result := False;
  // ============================

end;

procedure TfrmClicker.DoSimpleClick(Sender: TObject);
begin
  if FStartedSimpleClick then
    btnStopClick(nil)
  else
    btnStartClick(nil);
end;

procedure TfrmClicker.DoShowPlayback(Sender: TObject);
begin

    if FStartedSimpleClick then
    begin
       ShowMessage(Msg_StopAutoClickBeforePlayback);
      exit;
    end;

    if FStartedRecord then
    begin
       ShowMessage(Msg_StopRecordingBeforePlayback);
      exit;
    end;


   showSmallStopWin();


end;

procedure TfrmClicker.DoRecordMouse(Sender: TObject);
begin
  btnStartRecordClick(nil);
end;

procedure TfrmClicker.addActionToListview(Action: string; keyName: string;
  x, y: Integer; delay: Integer);
var
  l: TListItem;
begin
  lvMacroList.Items.BeginUpdate;


  l := lvMacroList.Items.add;
  l.Caption := IntToStr(lvMacroList.Items.count);
  l.SubItems.add(Action);
  l.SubItems.add(keyName);


  if chkRecordDelay.Checked then
   l.SubItems.add(IntToStr(delay))
   else
    l.SubItems.add(IntToStr(0));

  lvMacroList.Items.EndUpdate;
end;

procedure TfrmClicker.DoKeyboardMouseHook
  (Hook: THook; var HookMsg: THookMessage);
var
  LLKeyBoardHook: TLowLevelKeyboardHook;
  LLMouseHook: TLowLevelMouseHook;
  ScanCode: Integer;
  str: string;

  Action: string;
  keyName: string;
  x, y: Integer;
  delay: Integer;

  p: TPoint;
begin
  //if (HookMsg.Msg = WM_MOUSEMOVE) OR (HookMsg.Msg = WM_MOUSEWHEEL) then
  //  exit;
  if (HookMsg.Msg = WM_MOUSEWHEEL) then
    exit;

  if (HookMsg.Msg = WM_MOUSEMOVE) and (not chkRecordMove.Checked)  then
   exit;


  if Hook is TLowLevelMouseHook then
  begin
    LLMouseHook := TLowLevelMouseHook(Hook);
    // LLMouseHook.HookStruct

    // log(IntToStr(HookMsg.Msg));
    // mmo1.Lines.Add(IntToStr(HookMsg.LParam));

    case HookMsg.Msg of
      WM_MOUSEMOVE:
        Action := Text_Action_Move;
      WM_LBUTTONUP, WM_RBUTTONUP, WM_MBUTTONUP:
        Action := Text_Action_ClickUp;
      WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN:
        Action := Text_Action_ClickDown;
      WM_MOUSEWHEEL:
        Action := Text_Action_Wheel;
    end;

    keyName := MouseToString(HookMsg.Msg);
    GetCursorPos(p);
    x := p.x;
    y := p.y;
  end;

  if Hook is TLowLevelKeyboardHook then
  begin
    LLKeyBoardHook := TLowLevelKeyboardHook(Hook);

    if LLKeyBoardHook.LowLevelKeyStates.KeyState = ksKeyUp then
      Action := Text_Action_KeyUp
    else
      Action := Text_Action_KeyDown;

    keyName := VitualKeyToString(LLKeyBoardHook.keyName.ScanCode);
  end;

  addActionToListview(Action, keyName, x, y, delay);

end;

procedure TfrmClicker.initKeyboardMouseHook();
begin
  FHookKeyboard := THookInstance<TLowLevelKeyboardHook>.CreateHook(Self);
  FHookKeyboard.OnPreExecute := DoKeyboardMouseHook;

  FHookMouse := THookInstance<TLowLevelMouseHook>.CreateHook(Self);
  FHookMouse.OnPreExecute := DoKeyboardMouseHook;

end;


procedure TfrmClicker.lblURLClick(Sender: TObject);
begin
OpenWebSite(lblURL.Caption);
end;

procedure TfrmClicker.DoStartOrStopPlayback(Sender: TObject);
begin
    if Assigned(frmPlaybackControl) then
    begin
       frmPlaybackControl.DoHotkeyAction;
    end;
end;



procedure TfrmClicker.FormCreate(Sender: TObject);
var
  HotkeyInfoArr: THotkeyInfoArr;
  SoftInfo:TSoftInfo;
  code:string;
begin
  FHotkey_Clicker := 0;
  FHotkey_Playback := 0;
  Fhotkey_Record := 0;

  FStartedSimpleClick := False;
  FStartedRecord := False;

  FLastMouseKBTime := 0;

  FSimpleClicking:=false;


  SoftInfo.softEnName := soft_Clicker;
  SoftInfo.softVer := VERSION_NUM;
  SoftInfo.BuiltDate := 0;
  SoftInfo.lang := Curr_Lang;

  g_TransLang:=TTransLang.Create(SoftInfo);
  g_TransLang.TransFormLang(Self);


  if checkAlreadyRun then
  begin
    ShowMessage(Msg_AnotherIsRunning);
    application.ShowMainForm := False;
    PostQuitMessage(0);
    exit;
  end;

  g_API := TAPI.Create(SOFT_ID);

  g_api.checkKeyLocal('EXCEL-0658E-29C0B-0D432-2752A');


  Application.Title:=SOFT_TITLE;

  g_RegSoftInfo := TRegSoftInfo.Create(HKEY_Soft_ROOT, RegKeyPath);
  g_ConfigManager := TConfigManager.Create(g_RegSoftInfo); 

  g_HotkeyManager := THotkeyManager.Create(nil);
  g_HotkeyManager.OnSimpleClick := DoSimpleClick;
  g_HotkeyManager.OnRecordMouse := DoRecordMouse;
  g_HotkeyManager.OnShowPlayback := DoStartOrStopPlayback;

  g_ConfigManager.GetHotkeys(HotkeyInfoArr);

  rzhkStartStop.HotKey:=HotkeyInfoArr[integer(HT_SimpleClick)].Hotkey;
  rzhkRecord.HotKey:=HotkeyInfoArr[integer(HT_RecordMouse)].Hotkey;

  resetStartStopCaption;

  g_HotkeyManager.RegisterAllHotKey(HotkeyInfoArr);


  pgMain.ActivePage:=shtClicker;


  self.Caption:=self.Caption+' v'+VERSION_NUM;



  frmPlaybackControl:=TfrmPlaybackControl.Create(nil);
  frmPlaybackControl.rzhkPlayback.HotKey:=HotkeyInfoArr[integer(HT_Playback)].Hotkey;
  //frmPlaybackControl.trckSpeed.Position:=g_ConfigManager.getPlaybackSpeed();


  initKeyboardMouseHook();

  cbbMButton.ItemIndex:=0;
  cbbClickType.ItemIndex:=0;


  g_ConfigManager.loadPickLocationList(lvPicLocation);
  //mmoClickXY.Text:=g_RegSoftInfo.ReadValue('clickPosList','');
  rbCurrLocation.Checked:=g_RegSoftInfo.ReadValue('isClickCurrentPos',true);
  rbPickLocation.Checked:=not rbCurrLocation.Checked;


end;

procedure TfrmClicker.resetStartStopCaption();
begin
  btnStart.Caption:=Format(Text_Btn_Start,[ShortCutToText(rzhkStartStop.HotKey)]);
  btnStop.Caption:=Format(Text_Btn_Stop,[ShortCutToText(rzhkStartStop.HotKey)]);

end;

procedure TfrmClicker.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  g_ConfigManager.savePickLocationList(lvPicLocation);
  g_RegSoftInfo.WriteValue('isClickCurrentPos',rbCurrLocation.Checked);



  g_TransLang.Free;
  frmPlaybackControl.Free;

  g_HotkeyManager.Free;
  g_ConfigManager.Free;

    if Assigned(g_API) then
    g_API.Free;

end;



procedure TfrmClicker.chkRecordKeyboardClick(Sender: TObject);
begin
 if not chkRecordKeyboard.Checked and not chkRecordMouseClick.Checked then
  chkRecordKeyboard.Checked:=true;

end;

procedure TfrmClicker.chkRecordMouseClickClick(Sender: TObject);
begin
 if not chkRecordKeyboard.Checked and not chkRecordMouseClick.Checked then
  chkRecordMouseClick.Checked:=true;
end;

procedure TfrmClicker.mniAboutClick(Sender: TObject);
begin
  with TfrmAbout.Create(nil) do
  begin
    ShowModal;
    free;
    exit;
  end;

end;

procedure TfrmClicker.mniBuyClick(Sender: TObject);
begin
  g_API.OpenBuyPage();

end;

procedure TfrmClicker.mniClearClick(Sender: TObject);
begin
 lvMacroList.Clear;
end;

procedure TfrmClicker.mniDeleteClick(Sender: TObject);
begin
 if lvMacroList.ItemIndex<>-1 then
  lvMacroList.Items.Delete(lvMacroList.ItemIndex);
end;

procedure TfrmClicker.mniRegisterClick(Sender: TObject);
begin
  with TfrmRegister.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;

procedure TfrmClicker.btn1Click(Sender: TObject);
var
  TransLang: TTransLang;
  FrmDriProtect, FrmEncrypt, FrmDecrypt, FrmSettings, FrmAbout, FrmRegister,
    FrmChangePsw, FrmLoginPsw, FrmTempUnprotect, FrmRestoreAuthen,
    FrmRestoreResetPsw, FrmInputPswBox, FrmBuyHint, FrmAutoUpdata,
    FrmFilesDsty: TForm;
  bb: Boolean;
  List: TStringList;
  softinfo: TSoftInfo;

  frmhint:TfrmHint;
begin


end;


procedure TfrmClicker.btnClearClick(Sender: TObject);
begin
  lvMacroList.Clear;
end;

procedure TfrmClicker.btnContactClick(Sender: TObject);
begin
  g_API.OpenContactPage();
end;



procedure TfrmClicker.btnDelPickClick(Sender: TObject);
begin
  lvPicLocation.DeleteSelected;
end;

procedure TfrmClicker.btnEditPickClick(Sender: TObject);
var
item:TListItem;
begin

end;

procedure TfrmClicker.btnSaveClick(Sender: TObject);
var
str:string;
i:integer;
list:TStringList;
fname:string;
begin
  if lvMacroList.Items.Count<=0 then
  begin
    ShowMessage(Msg_RecordListEmpty);
    exit;
  end;

  if dlgSaveRecord.Execute then
  begin

   if not g_Registered then
   begin
     if lvMacroList.Items.Count>50 then
     begin
       ShowMessage(Msg_FailLongerThanAllow);
       Exit;
     end;
   end;


    fname:=dlgSaveRecord.FileName;
    list:=TStringList.Create;
    for i:= 0 to lvMacroList.Items.Count - 1 do
    begin
      list.Add(Format('%s,%s,%s,%s,%s',[lvMacroList.Items[i].SubItems[0],lvMacroList.Items[i].SubItems[1],lvMacroList.Items[i].SubItems[2],lvMacroList.Items[i].SubItems[3],lvMacroList.Items[i].SubItems[4]]));
    end;
    list.SaveToFile(fname);
    list.Free;
  end;


end;

procedure TfrmClicker.btnShowPlaybackClick(Sender: TObject);
begin
  if lvMacroList.Items.Count<=0 then
  begin
    ShowMessage(Msg_RecordListEmpty);
    exit;
  end;
  DoShowPlayback(nil);
end;

procedure TfrmClicker.btnLoadRecordClick(Sender: TObject);
var
i:integer;
list:TStringList;
fname,txt,ns:string;
dx:Integer;
sArr:array [0..4] of string;
iCount:Integer;
begin
  if dlgOpenRecord.Execute then
  begin

    lvMacroList.Clear;

    fname:=dlgOpenRecord.FileName;
    list:=TStringList.Create;
    list.LoadFromFile(fname);

    pgMain.ActivePage:=shtMacro;

    try
      for i:= 0 to list.Count - 1 do
      begin

        iCount:=0;
        txt:=list[i];
        while Length(txt) > 0 do
        begin
           dx := Pos(',', txt);
           if dx<=0 then
           begin
             sArr[iCount]:=txt;
             break;
           end;

        end;

        lvMacroList.Items.BeginUpdate;
        addActionToListview(sArr[0],sArr[1],StrToInt(sArr[2]),StrToInt(sArr[3]),StrToInt(sArr[4]));
        lvMacroList.Items.EndUpdate;

      end;

      lblCurrFile.Caption:=format(Text_Current_File,[fname]);
    except
      ShowMessage(Msg_ScriptCannotParsed);
    end;

    list.Free;
  end;



end;

procedure TfrmClicker.btnPickClick(Sender: TObject);
begin
  with TFrmHint.Create(nil) do
  begin
    Self.Hide;
    ShowModal;

    with lvPicLocation.Items.Add do
    begin
      Caption:=IntToStr(Pos.X);
      SubItems.Add(IntToStr(Pos.Y));
      SubItems.Add(IntToStr(1));
      SubItems.Add(IntToStr(100));
    end;
    //edtX.Text := ;
    //edtY.Text := ;

    Self.Show;

    Free;
  end;

end;

procedure TfrmClicker.btnStartClick(Sender: TObject);
var
  sec: Integer;
begin

  btnStart.Enabled:=false;
  btnStop.Enabled:=true;

  FLimitTimes := 0;
  if rbTimesLimit.Checked then
    FLimitTimes := StrToInt(edtRepeatTimes.Text)
  else
    FLimitTimes := -1;

  FCounter := 0;

  FStartTime := GetTickCount;
  sec := Trunc(edtHour.Value) * 3600 + Trunc(edtMin.Value) * 60 + Trunc
    (edtSec.Value);
  tmrSimpleClick.Interval := sec * 1000 + Trunc(edtMs.Value);
  tmrSimpleClick.Enabled := true;

  FStartedSimpleClick := true;

end;

procedure TfrmClicker.DoSmallStopWinClose(Sender: TObject);
begin

end;

procedure TfrmClicker.showSmallStopWin();
begin
     self.Hide;   
     frmPlaybackControl.ShowModal;
end;


procedure TfrmClicker.btnStartRecordClick(Sender: TObject);
begin
  FLastMouseKBTime := 0;

  if chkRecordKeyboard.Checked then
   FHookKeyboard.Active := not FStartedRecord;

  if chkRecordMouseClick.Checked then
   FHookMouse.Active := not FStartedRecord;

  FStartedRecord := not FStartedRecord;

  if FStartedRecord then
  begin
    btnShowPlayback.Enabled:=false;
    btnStartRecord.Caption:=Text_Btn_StopRecord
  end
   else
   begin
     btnShowPlayback.Enabled:=true;
     btnStartRecord.Caption:=Text_Btn_StartRecord;
   end;


end;

procedure TfrmClicker.btnStopClick(Sender: TObject);
begin


  btnStop.Enabled:=false;
  btnStart.Enabled:=True;

  FStartedSimpleClick := False;
  tmrSimpleClick.Enabled := False;


end;

procedure TfrmClicker.rbCurrLocationClick(Sender: TObject);
begin
  btnPick.Enabled := False;
end;

procedure TfrmClicker.rbPickLocationClick(Sender: TObject);
begin
  btnPick.Enabled := true;
end;

procedure TfrmClicker.refreshStartStopButtonText();
begin
  btnStart.Caption := Format
    (Text_Btn_Start, [ShortCutToText(rzhkStartStop.HotKey)]);
  btnStop.Caption := Format
    (Text_Btn_Stop, [ShortCutToText(rzhkStartStop.HotKey)]);

end;

procedure TfrmClicker.showBuyWindow();
begin
  with TfrmBuy.Create(nil) do
  begin
    ShowModal;
    Free;
  end;
end;


procedure TfrmClicker.RegisterHotkey;
begin

end;





procedure TfrmClicker.rzhkRecordExit(Sender: TObject);
begin
  g_ConfigManager.setHotkey(HT_RecordMouse, rzhkRecord.HotKey);

  g_HotkeyManager.RegisterOneHotKey(HT_RecordMouse, rzhkRecord.HotKey);
end;

procedure TfrmClicker.rzhkStartStopExit(Sender: TObject);
begin
  refreshStartStopButtonText;

  g_ConfigManager.setHotkey(HT_SimpleClick, rzhkStartStop.HotKey);

  g_HotkeyManager.RegisterOneHotKey(HT_SimpleClick, rzhkStartStop.HotKey);

  resetStartStopCaption;
end;

procedure TfrmClicker.tmrBuyReminderTimer(Sender: TObject);
begin
  if g_Registered then
  exit;

  tmrBuyReminder.Enabled:=False;
  with TfrmBuy.Create(nil) do
  begin
     ShowModal;
     free;
  end;

  tmrBuyReminder.Enabled:=True;


end;

procedure TfrmClicker.tmrCheckRegTimer(Sender: TObject);
begin
end;

procedure TfrmClicker.delayWithProcessMsg(delay:integer);
var
t1,t2:integer;
begin
      t1:=GetTickCount;
      //delay:=StrToInt(s3);
      while GetTickCount-t1<delay do
       Application.ProcessMessages;

end;

procedure TfrmClicker.multiClick(mouseBtnType: TMouseButton;bSingleClick: Boolean);
var
i,k:integer;
x,y,delay,times:integer;

t1,t2:integer;
item:TListItem;
begin
 for i:= 0 to lvPicLocation.Items.Count - 1 do
 begin
   item:=lvPicLocation.Items[i];
   //if sline='' then
  //  Continue;

   x:=StrToInt(item.Caption);
   y:=StrToInt(item.SubItems[0]);
   times:=StrToInt(item.SubItems[1]);
   delay:=StrToInt(item.SubItems[2]);


   //SplitThreeStr(sline,s1,s2,s3,',');
   //if isIntegerStr(s1) and isIntegerStr(s2) then
   begin

       for k:=0 to times - 1 do
       begin
         DoClick(x, y, mouseBtnType, bSingleClick);
         if not bSingleClick then
          delayWithProcessMsg(500);
       end;

   end;

 end;
end;

procedure TfrmClicker.tmrSimpleClickTimer(Sender: TObject);
var
  mouseBtnType: TMouseButton;
  bSingleClick: Boolean;
begin

if FSimpleClicking then
 exit;

try
  FSimpleClicking:=true;

   mouseBtnType := TMouseButton(cbbMButton.ItemIndex);
   bSingleClick := cbbClickType.ItemIndex = 0;



   if rbClickForMinutes.Checked and (GetTickCount - FStartTime > Trunc
       (edtClickMinutes.Value) * 60 * 1000) then 
   begin
     btnStopClick(nil);
     exit;
   end;
finally
  FSimpleClicking:=false;
end;

end;

procedure TfrmClicker.UnRegisterHotkey;
begin

end;

end.
