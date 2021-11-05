object frmRegister: TfrmRegister
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Register'
  ClientHeight = 174
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lblEmail: TLabel
    Left = 15
    Top = 15
    Width = 108
    Height = 16
    Align = alCustom
    Caption = 'Registration Email:'
  end
  object lblKey: TLabel
    Left = 15
    Top = 72
    Width = 97
    Height = 16
    Align = alCustom
    Caption = 'Registration Key:'
  end
  object edtEmail: TRzEdit
    Left = 15
    Top = 37
    Width = 294
    Height = 24
    TabOrder = 0
  end
  object edtRegKey: TRzEdit
    Left = 15
    Top = 93
    Width = 294
    Height = 24
    TabOrder = 1
  end
  object btnRegister: TRzButton
    Left = 184
    Top = 131
    Width = 115
    Height = 35
    Caption = 'Register'
    TabOrder = 2
    OnClick = btnRegisterClick
  end
end
