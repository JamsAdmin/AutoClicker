unit UntUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton;

type
  TfrmUpdate = class(TForm)
    lblNewVerDesc: TLabel;
    btnUpdate: TRzButton;
    btnCancel: TRzButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
   FURL:string;

    { Private declarations }
  public
     procedure disableCancel;
     procedure setOpenNewVerPage(url:string);
    { Public declarations }
  end;

var
  frmUpdate: TfrmUpdate;

implementation

uses
  MyCommonFuns;

{$R *.dfm}

procedure TfrmUpdate.btnCancelClick(Sender: TObject);
begin
close;
end;

procedure TfrmUpdate.btnUpdateClick(Sender: TObject);
begin
  OpenWebSite(FURL);
  close;
end;

procedure TfrmUpdate.disableCancel();
begin
btnCancel.Enabled:=false;;

end;

procedure TfrmUpdate.setOpenNewVerPage(url: string);
begin
   FURL:=url;
end;

end.
