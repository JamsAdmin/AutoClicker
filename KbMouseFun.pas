unit KbMouseFun;

interface

Uses Classes, Grids, StdCtrls, Controls, Windows, Messages, SysUtils, forms;

// -- normalized ds
function VitualKeyToString(p_virtual_key_code: Word): String;
function StringToVirtualKey(p_virtual_key_name: String): Word;

function MouseToString(wm_msg: Integer): string;
function StringToMouse(text_mb,text_action: string): Word;

function isKeyAction(act:string):Boolean;

procedure MyKeyPress(key:Word;key_event:Integer);
procedure MymouseClick(x,y:Integer;mb_event:Cardinal);
function StringToKeyEvent(text_action: string): Word;


const

Text_Action_ClickDown='Click Down';
Text_Action_ClickUp='Click Up';

Text_Action_KeyDown='Key Down';
Text_Action_KeyUp='Key Up';

Text_Action_Move='Move';
Text_Action_Wheel='Wheel';



Text_Move='Move';
Text_LButton= 'LeftClick';
Text_RButton= 'RightClick';
Text_MButton= 'MiddleClick';
Text_XButton= 'XClick';
Text_WhellButton='Wheel';

var
Screen_Width:Integer=0;
Screen_Height:Integer=0;

implementation

procedure MymouseClick(x,y:Integer;mb_event:Cardinal);
begin
 if Screen_Width=0 then
  Screen_Width := GetSystemMetrics(SM_CXSCREEN);

 if Screen_Height=0 then
  Screen_Height := GetSystemMetrics(SM_CYSCREEN);


 mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_MOVE, x * 65535 div Screen_Width, y* 65535 div Screen_Height, 0, 0 );

mouse_event(MOUSEEVENTF_ABSOLUTE or mb_event, x * 65535 div Screen_Width, y * 65535 div Screen_Height, 0, 0 );
end;

procedure MyKeyPress(key:Word;key_event:Integer);
begin

keybd_event(key, 0, key_event ,0);

end;

procedure display_bug_stop(str: string);
begin
  MessageBox(0, PChar(str), nil, 0);

end;

function MouseToString(wm_msg: Integer): string;
begin
  case wm_msg of
    WM_MOUSEMOVE:
      result := Text_Move;
    WM_LBUTTONUP,WM_LBUTTONDOWN:
      result := Text_LButton;
    WM_RBUTTONUP,WM_RBUTTONDown:
    WM_MOUSEWHEEL:
      result := Text_WhellButton;
  end;
end;

function MouseMsgToAction(msg:Integer):string;
begin
    case msg of
      WM_MOUSEMOVE:
        result := Text_Action_Move;
      WM_LBUTTONUP, WM_RBUTTONUP, WM_MBUTTONUP:
        result := Text_Action_ClickUp;
      WM_LBUTTONDOWN, WM_RBUTTONDOWN, WM_MBUTTONDOWN:
        result := Text_Action_ClickDown;
      WM_MOUSEWHEEL:
        result := Text_Action_Wheel;
    end;

end;

function StringToMouse(text_mb,text_action: string): Word;
begin
if text_mb=Text_Move then result := MOUSEEVENTF_MOVE else
if text_mb=Text_WhellButton then result := MOUSEEVENTF_WHEEL else
if (text_mb=Text_LButton) and (text_action=Text_Action_ClickUp) then result := MOUSEEVENTF_LEFTUP else
if (text_mb=Text_LButton) and (text_action=Text_Action_ClickDown) then result := MOUSEEVENTF_LEFTDOWN else
if (text_mb=Text_RButton) and (text_action=Text_Action_ClickUp) then result := MOUSEEVENTF_RIGHTUP;
end;

function StringToKeyEvent(text_action: string): Word;
begin
  if text_action=Text_Action_KeyDown then result := 0 else
  if text_action=Text_Action_KeyUp then result := KEYEVENTF_KEYUP;

end;


function isKeyAction(act:string):Boolean;
begin
  result:= (act=Text_Action_KeyDown) or (act=Text_Action_KeyUp);
end;



//Text_Action_ClickDown='Click Down';
//Text_Action_ClickUp='Click Up';
//
//Text_Action_KeyDown='Key Down';
//Text_Action_KeyUp='Key Up';


function f_shift_state(p_shift_state: tShiftState): String;
begin
  result := '';
  if ssLeft in p_shift_state then
    result := result + 'L ';
  if ssRight in p_shift_state then
    result := result + 'R ';
  if ssMiddle in p_shift_state then
    result := result + 'M ';
  if ssDouble in p_shift_state then
    result := result + 'D ';
  if ssAlt in p_shift_state then
    result := result + 'Alt ';
  if ssCtrl in p_shift_state then
    result := result + 'Ctrl ';
  if ssShift in p_shift_state then
    result := result + 'Shift ';
end; // f_shift_state

function VitualKeyToString(p_virtual_key_code: Word): String;
begin
  case p_virtual_key_code of
    // -- keyboard arrows
    vk_Right:
      result := 'Right';
    vk_Left:
      result := 'Left';
    vk_Up:
      result := 'Up';
    vk_Down:
      result := 'Down';

    vk_Prior:
      result := 'PageUp';
    vk_Next:
      result := 'PageDown';
    vk_Home:
      result := 'Home';
    vk_End:
      result := 'End';
    vk_Insert:
      result := 'Insert';
    vk_Delete:
      result := 'Delete';

    VK_APPS:
      result:= 'Application';

    vk_LShift:
      result := 'LeftShift';
    vk_LControl:
      result := 'LeftCtrl';
    vk_LMenu:
      result := 'LeftAlt';
    VK_RSHIFT:
      result := 'RightShift';
    VK_RCONTROL:
      result := 'RightCtrl';
    VK_RMENU:
      result := 'RightAlt';
    vk_Capital:
      result := 'CapsLock';
    vk_NumLock:
      result := 'NumLock';

    vk_tab:
      result := 'Tab';
    vk_Return:
      result := 'Return';
    vk_Back:
      result := 'Backspace';

    vk_Escape:
      result := 'Escape';
    vk_Space:
      result := 'Space';

    vk_Select:
      result := 'Select';
    vk_Print:
      result := 'Print';
    vk_Execute:
      result := 'Execute';

    vk_Snapshot:
      result := 'PrintScreen';
    vk_Help:
      result := 'Help';

    vk_lButton:
      result := 'LeftMouseButton';
    vk_rButton:
      result := 'RightMouseButton';
    vk_Cancel:
      result := 'ControlBreak';
    vk_mButton:
      result := 'MiddleMouseButton';

    vk_Clear:
      result := 'Clear';
    vk_Pause:
      result := 'Pause';
    vk_Scroll:
      result := 'ScrollLock';
    vk_Multiply:
      result := 'Multiply';
    vk_Add:
      result := 'Add';
    vk_Separator:
      result := 'Separator';
    vk_Subtract:
      result := 'Subtract';
    vk_Decimal:
      result := 'Decimal';
    vk_Divide:
      result := 'Divide';

    vk_NumPad0 .. vk_Numpad9:
      result := 'NumPad' + IntToStr(p_virtual_key_code - vk_NumPad0);
    vk_F1 .. vk_F24:
      result := 'F' + IntToStr(p_virtual_key_code - vk_F1+1);

    (*
      vk_LSHIFT	Left Shift (only used with GetAsyncKeyState and GetKeyState)
      vk_RSHIFT	Right Shift (only used with GetAsyncKeyState and GetKeyState)
      vk_LCONTROL	Left Ctrl (only used with GetAsyncKeyState and GetKeyState)
      vk_RCONTROL	Right Ctrl (only used with GetAsyncKeyState and GetKeyState)
      *)

    Ord('A') .. Ord('Z'):
      result := chr(p_virtual_key_code);
  else
    result := chr(p_virtual_key_code);
  end; // case p_virtual_key_code
end; // f_virtual_key_code_name

function StringToVirtualKey(p_virtual_key_name: String): Word;
// -- lowercase
var
  l_number: Integer;
begin
  if p_virtual_key_name = 'Right' then
    result := vk_Right
  else if p_virtual_key_name = 'Left' then
    result := vk_Left
  else if p_virtual_key_name = 'Up' then
    result := vk_Up
  else if p_virtual_key_name = 'Down' then
    result := vk_Down
  else if p_virtual_key_name = 'PageUp' then
    result := vk_Prior
  else if p_virtual_key_name = 'PageDown' then
    result := vk_Next
  else if p_virtual_key_name = 'Home' then
    result := vk_Home
  else if p_virtual_key_name = 'End' then
    result := vk_End
  else if p_virtual_key_name = 'Insert' then
    result := vk_Insert
  else if p_virtual_key_name = 'Delete' then
    result := vk_Delete
  else if p_virtual_key_name='Application' then
     result:= VK_APPS
  else if p_virtual_key_name = 'LeftShift' then
    result := vk_LShift
  else if p_virtual_key_name = 'LeftCtrl' then
    result := vk_LControl
  else if p_virtual_key_name = 'LeftAlt' then
    result := vk_LMenu
  else if p_virtual_key_name = 'RightShift' then
    result := VK_RSHIFT
  else if p_virtual_key_name = 'RightCtrl' then
    result := VK_RCONTROL
  else if p_virtual_key_name = 'RightAlt' then
    result := VK_RMENU
  else if p_virtual_key_name = 'CapsLock' then
    result := vk_Capital
  else if p_virtual_key_name = 'NumLock' then
    result := vk_NumLock
  else if p_virtual_key_name = 'Tab' then
    result := vk_tab
  else if p_virtual_key_name = 'Return' then
    result := vk_Return
  else if p_virtual_key_name = 'Backspace' then
    result := vk_Back
  else if p_virtual_key_name = 'Escape' then
    result := vk_Escape
  else if p_virtual_key_name = 'Space' then
    result := vk_Space
  else if p_virtual_key_name = 'Select' then
    result := vk_Select
  else if p_virtual_key_name = 'Print' then
    result := vk_Print
  else if p_virtual_key_name = 'Execute' then
    result := vk_Execute
  else if p_virtual_key_name = 'PrintScreen' then
    result := vk_Snapshot
  else if p_virtual_key_name = 'Help' then
    result := vk_Help
  else if p_virtual_key_name = 'LeftMouseButton' then
    result := vk_lButton
  else if p_virtual_key_name = 'RightMouseButton' then
    result := vk_rButton
  else if p_virtual_key_name = 'ControlBreak' then
    result := vk_Cancel
  else if p_virtual_key_name = 'MiddleMouseButton' then
    result := vk_mButton
  else if p_virtual_key_name = 'Clear' then
    result := vk_Clear
  else if p_virtual_key_name = 'Pause' then
    result := vk_Pause
  else if p_virtual_key_name = 'ScrollLock' then
    result := vk_Scroll
  else if p_virtual_key_name = 'Multiply' then
    result := vk_Multiply
  else if p_virtual_key_name = 'Add' then
    result := vk_Add
  else if p_virtual_key_name = 'Separator' then
    result := vk_Separator
  else if p_virtual_key_name = 'Subtract' then
    result := vk_Subtract
  else if p_virtual_key_name = 'Decimal' then
    result := vk_Decimal
  else if p_virtual_key_name = 'Divide' then
    result := vk_Divide
  else if (p_virtual_key_name[1] = 'F') and (Length(p_virtual_key_name)>1) then
  begin
    Delete(p_virtual_key_name, 1, 1);
    l_number := StrToInt(p_virtual_key_name);
    result := vk_F1 + l_number - 1;
  end  else if Copy(p_virtual_key_name, 1, 6) = 'NumPad' then
  begin
    Delete(p_virtual_key_name, 1, 6);
    l_number := StrToInt(p_virtual_key_name);
    result := vk_NumPad0 + l_number;
  end
  else
  begin
    // -- the key code is the ascii code vk_A => 48
   // Delete(p_virtual_key_name, 1, 1);
    if Length(p_virtual_key_name) = 1 then
      result := Ord(p_virtual_key_name[1])
    else
    begin
      display_bug_stop('unknown vk ' + p_virtual_key_name);
      result := $FFFF;
    end;
  end;

  (*
    vk_LSHIFT	Left Shift (only used with GetAsyncKeyState and GetKeyState)
    vk_RSHIFT	Right Shift (only used with GetAsyncKeyState and GetKeyState)
    vk_LCONTROL	Left Ctrl (only used with GetAsyncKeyState and GetKeyState)
    vk_RCONTROL	Right Ctrl (only used with GetAsyncKeyState and GetKeyState)
    *)
end;
// f_name_to_virtual_key_code
end.
