program AutoClicker;

uses
  Forms,
  UntMain in 'UntMain.pas' {frmClicker},
  UntConst in 'UntConst.pas',
  UntHintWindow in 'UntHintWindow.pas' {frmHint},
  HotkeyManager in 'HotkeyManager.pas',
  ConfigManager in 'ConfigManager.pas',
  UntRegister in 'UntRegister.pas' {frmRegister},
  UntBuy in 'UntBuy.pas' {frmBuy},
  Hooks in 'Hooks-master\Hooks.pas',
  KbMouseFun in 'KbMouseFun.pas',
  PlaybackThread in 'PlaybackThread.pas',
  UntPlayback in 'UntPlayback.pas' {frmPlaybackControl},
  UntDevelop in 'UntDevelop.pas',
  UntCountDown in 'UntCountDown.pas' {frmCountDown},
  UntAbout in 'UntAbout.pas' {frmAbout},
  RegistrationAPI in 'E:\chaoshiddai\ศํผþิดย๋\Common Unit\RegistrationAPI.pas',
  HttpUtil in 'E:\csdwork3\git\private-csdproject\downloader_installer\unit\HttpUtil.pas',
  WebPageJump in 'WebPageJump.pas',
  UntUpdate in 'UntUpdate.pas' {frmUpdate},
  UntEditLocation in 'UntEditLocation.pas' {frmEditLocation};

{$IFDEF Version_CH}
  {$R res\res_ch.res}
{$ENDIF}

{$IFDEF Version_EN}
 // {$R res\res_en.res}
{$ENDIF}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '1Clicker';
  Application.CreateForm(TfrmClicker, frmClicker);
  Application.Run;
end.
