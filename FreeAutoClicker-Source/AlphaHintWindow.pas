unit AlphaHintWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAlphaHintWindow = class(THintWindow)
  private
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
  end;



implementation


{ TAlphaHintWindow }

constructor TAlphaHintWindow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // window might be updated quite frequently, so enable double buffer
  DoubleBuffered := True;
end;

procedure TAlphaHintWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  // include the layered window style (for alpha blending)
  Params.ExStyle := Params.ExStyle or WS_EX_LAYERED;
end;

procedure TAlphaHintWindow.CreateWindowHandle(const Params: TCreateParams);
begin
  inherited CreateWindowHandle(Params);
  // value of 220 here is the alpha (the same as form's AlphaBlendValue)
  SetLayeredWindowAttributes(Handle, ColorToRGB(clNone), 220, LWA_ALPHA);
end;

procedure TAlphaHintWindow.ActivateHint(Rect: TRect; const AHint: string);
var
  Monitor: TMonitor;
begin
  // from here was just stripped the animation part and fixed one bug
  // (setting a hint window top position when going off screen; it is
  // at least in Delphi 2009 with the most recent updates)
  Caption := AHint;
  Inc(Rect.Bottom, 4);
  UpdateBoundsRect(Rect);
  Monitor := Screen.MonitorFromPoint(Point(Rect.Left, Rect.Top));
  if Width > Monitor.Width then
    Width := Monitor.Width;
  if Height > Monitor.Height then
    Height := Monitor.Height;
  if Rect.Top + Height > Monitor.Top + Monitor.Height then
    Rect.Top := (Monitor.Top + Monitor.Height) - Height;
  if Rect.Left + Width > Monitor.Left + Monitor.Width then
    Rect.Left := (Monitor.Left + Monitor.Width) - Width;
  if Rect.Left < Monitor.Left then
    Rect.Left := Monitor.Left;
  if Rect.Top < Monitor.Top then
    Rect.Top := Monitor.Top;
  ParentWindow := Application.Handle;
  SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height,
    SWP_NOACTIVATE);
  ShowWindow(Handle, SW_SHOWNOACTIVATE);
  Invalidate;
end;

procedure TAlphaHintWindow.CMTextChanged(var Message: TMessage);
begin
  // do exactly nothing, because we're adjusting the size by ourselves
  // and the ancestor would just autosize the window by the text; text
  // or if you want Caption, is updated only by calling ActivateHint
end;


end.
