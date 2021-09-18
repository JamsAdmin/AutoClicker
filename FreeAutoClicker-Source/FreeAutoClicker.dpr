program AutoClicker;

uses
  Forms,
  UntMain in 'UntMain.pas' {frmClicker},
  UntConst in 'UntConst.pas',
  UntHintWindow in 'UntHintWindow.pas' {frmHint},
  HotkeyManager in 'HotkeyManager.pas',
  ConfigManager in 'ConfigManager.pas',
  Hooks in 'Hooks-master\Hooks.pas',
  PlaybackThread in 'PlaybackThread.pas',
  UntPlayback in 'UntPlayback.pas' {frmPlaybackControl},
  UntCountDown in 'UntCountDown.pas' {frmCountDown},
  UntAbout in 'UntAbout.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '1Clicker';
  Application.CreateForm(TfrmClicker, frmClicker);
  Application.Run;
end.
