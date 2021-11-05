unit UntCountDown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, ExtCtrls;

type
  TfrmCountDown = class(TForm)
    lblNotice: TRzLabel;
    lblCountDown: TRzLabel;
    btnCancel: TRzButton;
    btnOK: TRzButton;
    tmr1: TTimer;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

    { Private declarations }
  public
    procedure setEventName(event:string);
    { Public declarations }
  end;


implementation

uses UntMain;

{$R *.dfm}

procedure TfrmCountDown.btnCancelClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
 close;
end;

procedure TfrmCountDown.btnOKClick(Sender: TObject);
begin
ModalResult:=mrOk;
Close;
end;

procedure TfrmCountDown.FormCreate(Sender: TObject);
begin
 g_TransLang.TransFormLang(self);
end;

procedure TfrmCountDown.setEventName(event: string);
begin
   Format(lblNotice.Caption,[event]);
end;

procedure TfrmCountDown.tmr1Timer(Sender: TObject);
var
sec:integer;
begin
 sec:= strtoint(lblCountDown.Caption);
 if sec<=0 then
 begin
   tmr1.Enabled:=false;
   btnOKClick(nil);
   exit;
 end;
 lblCountDown.Caption:=inttostr(sec-1);

end;

end.
