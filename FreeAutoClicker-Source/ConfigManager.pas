unit ConfigManager;

interface
uses windows,Obj_AbstractInfo,Character,UntConst,md5,SysUtils,
ComCtrls,MyCommonFuns,Forms,HotkeyManager,Classes,
Menus;

type

{ TConfig }

  TConfigManager = class(TObject)
  private
  FInfo:TAbstractInfo;
  FSoftRunTimes:Integer;
  FFirstUseTime:Double;

  FShoutcut_SimpleClick:Integer;
  FShoutcut_RecordMouse:Integer;
  FShoutcut_Playback:Integer;

  FPlaybackSpeed:integer;

    procedure ReloadHotkey;


  protected

  public



  UsageTime_Sec:Integer;

    procedure GetHotkeys(var HotkeyInfoArr: THotkeyInfoArr);
    procedure setHotkey(hkType: THotkeyType; shortCut: Integer);

    //function getPlaybackSpeed:Integer;
    //procedure SetPlaybackSpeed(iSpeed:Integer);

    function ReadRegCode(): string;
    procedure SaveRegCode(code: string);




    constructor Create(Info:TAbstractInfo);
    destructor Destroy; override;

  end;


implementation




const
  sIni_FirstUseTime='Enablefutula';
  sIni_LastTime_SetUsedTime='LastSetModCon';
  sIni_SoftRunTimes = 'SoftRunTimes';

{ TConfig }


constructor TConfigManager.Create(Info:TAbstractInfo);
begin
  FInfo:=Info;

  ReloadHotkey();

  UsageTime_Sec:= FInfo.ReadValue(IntToStr(GetDate), 0);

  FPlaybackSpeed:=  FInfo.ReadValue('PlaybackSpeed', 9);

end;


procedure TConfigManager.ReloadHotkey();
begin
  FShoutcut_SimpleClick:=  FInfo.ReadValue('HT_SimpleClick', TextToShortCut('F6'));
  FShoutcut_RecordMouse:=  FInfo.ReadValue('HT_RecordMouse', TextToShortCut('CTRL+F1'));
  FShoutcut_Playback:=  FInfo.ReadValue('HT_Playback', TextToShortCut('CTRL+F2'));

end;

procedure TConfigManager.setHotkey(hkType:THotkeyType; shortCut:Integer);
begin
  if hkType=HT_SimpleClick then
    FInfo.WriteValue('HT_SimpleClick', shortCut)
  else  if hkType=HT_RecordMouse then
    FInfo.WriteValue('HT_RecordMouse', shortCut)
  else  if hkType=HT_Playback then
    FInfo.WriteValue('HT_Playback', shortCut)
  else
    ShowMsgInfoBox('error!');


    ReloadHotkey();
end;



procedure TConfigManager.GetHotkeys(var HotkeyInfoArr: THotkeyInfoArr);
var
  Hotkey: TShortCut;
  i, AttrIndex: Integer;
begin
    AttrIndex := 0;
    FillChar(HotkeyInfoArr, SizeOf(HotkeyInfoArr), 0);

    HotkeyInfoArr[integer(HT_SimpleClick)].Hotkey := FShoutcut_SimpleClick;
    HotkeyInfoArr[integer(HT_SimpleClick)].HotkeyType := HT_SimpleClick;
    HotkeyInfoArr[integer(HT_SimpleClick)].HotkeyRegsteredID := 0;

    HotkeyInfoArr[integer(HT_RecordMouse)].Hotkey := FShoutcut_RecordMouse;
    HotkeyInfoArr[integer(HT_RecordMouse)].HotkeyType := HT_RecordMouse;
    HotkeyInfoArr[integer(HT_RecordMouse)].HotkeyRegsteredID := 0;

    HotkeyInfoArr[Integer(HT_Playback)].Hotkey := FShoutcut_Playback;
    HotkeyInfoArr[Integer(HT_Playback)].HotkeyType := HT_Playback;
    HotkeyInfoArr[integer(HT_Playback)].HotkeyRegsteredID := 0;

end;

destructor TConfigManager.Destroy;
begin
  inherited;
end;


end.
