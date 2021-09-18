unit HotkeyManager;

interface
uses Classes, Controls, Menus, Windows, Messages, SysUtils;

const
  ArrCount = 4;
type

  THotkeyType = (HT_Nothing,HT_SimpleClick, HT_RecordMouse, HT_Playback);
  THotkeyInfo = record
    Hotkey: TShortCut;
    HotkeyRegsteredID: Integer;
    HotkeyType: THotkeyType;
  end;

  THotkeyInfoArr = array[0..ArrCount] of THotkeyInfo;

{ THotkeyManager }
  THotkeyManager = class(TComponent)
  private
    FHandle: THandle;
    FHotkeyInfoArr: THotkeyInfoArr;

    FOnSimpleClick,
    FOnRecordMouse,
    FOnPlayback: TNotifyEvent;

  Shoutcut_SimpleClick:Integer;
  Shoutcut_RecordMouse:Integer;
  Shoutcut_Playback:Integer;


    function GetHotkeyTypeFromID(HotkeyID: Integer): THotkeyType;
    
  protected
    procedure WndProc(var Msg: TMessage);
  public
    procedure RegisterOneHotKey(hkType: THotkeyType; shortCut:TShortCut);

    procedure RegisterAllHotKey(HotkeyInfoArr: THotkeyInfoArr);
    procedure UnRegisterHotKeyNow;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property OnSimpleClick: TNotifyEvent read FOnSimpleClick write FOnSimpleClick;
    property OnRecordMouse: TNotifyEvent read FOnRecordMouse write FOnRecordMouse;
    property OnShowPlayback: TNotifyEvent read FOnPlayback write FOnPlayback;
  end;

implementation

{ TRegisterAllHotkeys }

constructor THotkeyManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FHandle := AllocateHWnd(WndProc);


end;


destructor THotkeyManager.Destroy;
begin
  UnRegisterHotKeyNow;

  DeallocateHWnd(FHandle);
  inherited Destroy;
end;

function THotkeyManager.GetHotkeyTypeFromID(HotkeyID: Integer): THotkeyType;
var
  i: Integer;
begin
  Result := HT_Nothing;
  for i := Low(FHotkeyInfoArr)+1 to High(FHotkeyInfoArr) do
    if FHotkeyInfoArr[i].HotkeyRegsteredID = HotkeyID then
      begin
        Result := FHotkeyInfoArr[i].HotkeyType;
        Break;
      end;
end;

procedure THotkeyManager.WndProc(var Msg: TMessage);
var
  HotkeyType: THotkeyType;
begin¡£
  if (not Assigned(OnSimpleClick)) or (not Assigned(OnRecordMouse))
    or (not Assigned(FOnPlayback)) then
    begin
      MessageBox(0, 'An Error occured while Loading Hotkeys', 'Error', 0);
      exit;
    end;

  with Msg do
    if Msg = WM_Hotkey then
      begin
        HotkeyType := GetHotkeyTypeFromID(wParam);

        if HotkeyType = HT_SimpleClick then FOnSimpleClick(Self);
        if HotkeyType = HT_RecordMouse then FOnRecordMouse(Self);
        if HotkeyType = HT_Playback then FOnPlayback(Self);

        Result := 1;
      end
    else
      Result := DefWindowProc(FHandle, Msg, wParam, lParam);
end;

procedure SeparateHotkey(Hotkey: Integer; var Modifiers, Vkey: Word);
var
  Shift: TShiftState;
begin
  Modifiers := 0; Vkey := 0;
  ShortCutToKey(Hotkey, Vkey, Shift);

  if ssShift in Shift then
    Modifiers := Modifiers or MOD_SHIFT;

  if ssCtrl in Shift then
    Modifiers := Modifiers or MOD_CONTROL;

  if ssAlt in Shift then
    Modifiers := Modifiers or MOD_ALT;
end;

procedure THotkeyManager.RegisterOneHotKey(hkType: THotkeyType; shortCut:TShortCut);
var
  i: Integer;
  Hotkey: Integer;
  Modifiers, Vkey: Word;
begin

  for i := Low(FHotkeyInfoArr)+1 to High(FHotkeyInfoArr) do
    if FHotkeyInfoArr[i].HotkeyType=hkType then
      begin

        if FHotkeyInfoArr[i].HotkeyRegsteredID<>0 then
         UnRegisterHotKey(FHandle, FHotkeyInfoArr[i].HotkeyRegsteredID);


        Hotkey := shortCut;

        SeparateHotkey(Hotkey, Modifiers, Vkey);
        FHotkeyInfoArr[i].HotkeyRegsteredID := GlobalAddAtom(PChar(Chr(i * i))) - $C000;

        RegisterHotKey(FHandle, FHotkeyInfoArr[i].HotkeyRegsteredID, Modifiers, Vkey);

        break;
      end;
end;


procedure THotkeyManager.RegisterAllHotKey(HotkeyInfoArr: THotkeyInfoArr);
var
  i: Integer;
  Hotkey: Integer;
  Modifiers, Vkey: Word;
begin
  FHotkeyInfoArr := HotkeyInfoArr;

  for i := Low(FHotkeyInfoArr)+1 to High(FHotkeyInfoArr) do
    if FHotkeyInfoArr[i].Hotkey <> 0 then
      begin
        Hotkey := FHotkeyInfoArr[i].Hotkey;

        SeparateHotkey(Hotkey, Modifiers, Vkey);
        FHotkeyInfoArr[i].HotkeyRegsteredID := GlobalAddAtom(PChar(Chr(i * i))) - $C000;

      end;
end;

procedure THotkeyManager.UnRegisterHotKeyNow;
var
  i: Integer;
begin
  for i := Low(FHotkeyInfoArr)+1 to High(FHotkeyInfoArr) do
    if FHotkeyInfoArr[i].HotkeyRegsteredID <> 0 then
      UnRegisterHotKey(FHandle, FHotkeyInfoArr[i].HotkeyRegsteredID);
end;

end.

