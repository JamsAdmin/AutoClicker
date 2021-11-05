object frmEditLocation: TfrmEditLocation
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Edit Location'
  ClientHeight = 196
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblX: TLabel
    Left = 64
    Top = 32
    Width = 10
    Height = 13
    Alignment = taRightJustify
    Caption = 'X:'
  end
  object lblY: TLabel
    Left = 64
    Top = 59
    Width = 10
    Height = 13
    Alignment = taRightJustify
    Caption = 'Y:'
  end
  object lblTimes: TLabel
    Left = 43
    Top = 87
    Width = 31
    Height = 13
    Alignment = taRightJustify
    Caption = 'Times:'
  end
  object lblDelay: TLabel
    Left = 22
    Top = 113
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Delay(ms):'
  end
  object edtX: TEdit
    Left = 80
    Top = 29
    Width = 168
    Height = 21
    TabOrder = 0
  end
  object edtY: TEdit
    Left = 80
    Top = 56
    Width = 168
    Height = 21
    TabOrder = 1
  end
  object edtTimes: TEdit
    Left = 80
    Top = 83
    Width = 168
    Height = 21
    TabOrder = 2
  end
  object edtDelay: TEdit
    Left = 80
    Top = 110
    Width = 168
    Height = 21
    TabOrder = 3
  end
  object btnOk: TRzButton
    Left = 98
    Top = 152
    Width = 98
    Height = 30
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
end
