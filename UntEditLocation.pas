unit UntEditLocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls,ComCtrls;

type
  TfrmEditLocation = class(TForm)
    lblX: TLabel;
    edtX: TEdit;
    lblY: TLabel;
    edtY: TEdit;
    lblTimes: TLabel;
    edtTimes: TEdit;
    edtDelay: TEdit;
    lblDelay: TLabel;
    btnOk: TRzButton;
    procedure btnOkClick(Sender: TObject);
  private

    { Private declarations }
  public
    procedure loadData(item: tlistItem);
    { Public declarations }
  end;
implementation

{$R *.dfm}

procedure TfrmEditLocation.loadData(item:tlistItem);
begin
        edtX.Text:=item.Caption;
        edtY.Text:=item.SubItems[0];
        edtTimes.Text:=item.SubItems[1];
        edtDelay.Text:=item.SubItems[2];

end;


procedure TfrmEditLocation.btnOkClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
