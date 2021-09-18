unit UntConst;

interface
uses Windows,CommConst;

const


VERSION_NUM='1.20';
BUILT_DATE=210906;


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
   Text_ExpirationDate='Expiration';
   Text_LifeTimeValid=' -Lifetime';

   Msg_StopAutoClickBeforePlayback ='Stop Auto Click before the playback!';
   Msg_StopRecordingBeforePlayback='Stop Recording before the playback!';
   Msg_RecordListEmpty= 'The record list is empty!';
   Msg_ScriptCannotParsed='Error! The script cannot be parsed!';
   Msg_AnotherIsRunning='Another instance of this program is already running!';
   Msg_FailLongerThanAllow='Save failed! The trial version only allows to save scripts with no more than 100 lines of records!';
   Msg_RegIncorrect='The registration code is incorrect!';
   Msg_RegSuccess='Registration successful! Please restart the program.';
   Msg_FeatureForRegistredUserOnly='This feature is only available to registered users! ';





implementation


end.
