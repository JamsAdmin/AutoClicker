unit UntConst;

interface
uses Windows,CommConst;

const

{$IFDEF Version_CH}
  Curr_Lang=Lang_CH;
{$ENDIF}

{$IFDEF Version_EN}
  Curr_Lang=Lang_EN;
{$ENDIF}

VERSION_NUM='1.30';
BUILT_DATE=211026;


  HKEY_Soft_ROOT = HKEY_CURRENT_USER;
  RegKeyPath = 'SOFTWARE\Clicker';
  Mutex = 'Mutex_ONLY_1Clicker';


  SOFT_ID='mouseclicker_win';



SOFT_TITLE='1Clicker';

   Text_Unregistered='';
   Text_Btn_Start='Start (%s)';
   Text_Btn_Stop='Stop (%s)';
   Text_Current_File='Current: %s';
   Text_Btn_StopRecord='Stop';
   Text_Btn_StartRecord='Start Recording';

   Msg_StopAutoClickBeforePlayback ='Stop Auto Click before the playback!';
   Msg_StopRecordingBeforePlayback='Stop Recording before the playback!';
   Msg_RecordListEmpty= 'The record list is empty!';
   Msg_ScriptCannotParsed='Error! The script cannot be parsed!';
   Msg_AnotherIsRunning='Another instance of this program is already running!';






//Right, Left, Middle



implementation


end.
