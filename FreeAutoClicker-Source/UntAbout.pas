unit UntAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, pngimage, ExtCtrls;

type
  TfrmAbout = class(TForm)
    OKButton: TButton;
    pnl1: TPanel;
    img1: TImage;
    lblBigName: TRzLabel;
    pnl2: TPanel;
    lblVersion: TLabel;
    lblSoftName: TLabel;
    lblCopyRight: TLabel;
    lblURL: TLabel;
    lblVer: TLabel;
    procedure lblURLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  MyCommonFuns,UntConst,UntMain;

{$R *.dfm}

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
 g_TransLang.TransFormLang(self);

 lblVer.Caption:=VERSION_NUM;
end;

procedure TfrmAbout.lblURLClick(Sender: TObject);
begin
 OpenWebSite(lblURL.Caption);
end;

end.
