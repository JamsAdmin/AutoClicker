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



    procedure savePickLocationList(list:TCustomListView);
    procedure loadPickLocationList(list:TCustomListView);

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

procedure TConfigManager.savePickLocationList(list: TCustomListView);
begin
  ListViewSaveToFile(list,getSysAppDataDir+'\'+'picklocation.txt');
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




    HotkeyInfoArr[Integer(HT_Playback)].Hotkey := FShoutcut_Playback;
    HotkeyInfoArr[Integer(HT_Playback)].HotkeyType := HT_Playback;
    HotkeyInfoArr[integer(HT_Playback)].HotkeyRegsteredID := 0;

end;


procedure TConfigManager.loadPickLocationList(list: TCustomListView);
begin
  ListViewLoadFromFile(list,getSysAppDataDir+'\'+'picklocation.txt');
end;

//procedure TConfigManager.SetPlaybackSpeed(iSpeed:Integer);
//begin
//    FPlaybackSpeed:=  iSpeed;
//    FInfo.WriteValue('PlaybackSpeed', iSpeed);
//end;
//
//function TConfigManager.getPlaybackSpeed: Integer;
//begin
//   result:=FPlaybackSpeed;
//end;

destructor TConfigManager.Destroy;
begin
  inherited;
end;


end.
