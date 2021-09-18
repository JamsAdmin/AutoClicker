unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, pngimage, ExtCtrls;

type
  TForm1 = class(TForm)
    OKButton: TButton;
    pnl1: TPanel;
    img1: TImage;
    lbl1: TRzLabel;
    pnl2: TPanel;
    lblVersion: TLabel;
    lblSoftName: TLabel;
    lblCopyRight: TLabel;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
