unit UntHintWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmHint = class(TForm)
    tmrMoveWindow: TTimer;
    pnl1: TPanel;
    lblClickOrPress: TLabel;
    lbl3: TLabel;
    Label2: TLabel;
    lblPosY: TLabel;
    lblPosX: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure tmrMoveWindowTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnl1Click(Sender: TObject);
  private
    FSizeMove: Boolean;
    { Private declarations }
  public
    pos:TPoint;
    { Public declarations }
  end;

var
  frmHint: TfrmHint;

implementation

uses
  UntMain;

{$R *.dfm}




procedure TfrmHint.btn1Click(Sender: TObject);
var
  CurPos: TPoint;
begin
end;

procedure TfrmHint.FormCreate(Sender: TObject);
begin
 pos.X:=0;
 pos.Y:=0;

  g_TransLang.TransFormLang(self);

end;

procedure TfrmHint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  GetCursorPos(pos);

  close;
end;

procedure TfrmHint.pnl1Click(Sender: TObject);
begin

   GetCursorPos(pos);
   close;
end;

procedure TfrmHint.tmrMoveWindowTimer(Sender: TObject);
var
  CurPos: TPoint;
  LeftPos:TPoint;
begin
  if GetCursorPos(CurPos) then
  begin

     self.Left:=CurPos.X-5;
     self.Top:=CurPos.Y-5;

     lblPosX.Caption:=IntToStr(CurPos.X);
     lblPosY.Caption:=IntToStr(CurPos.Y);

     SetForegroundWindow(self.Handle);
  end;

end;






end.
