object frmBuy: TfrmBuy
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Trial Reminder'
  ClientHeight = 275
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object lblNotice: TRzLabel
    Left = 22
    Top = 24
    Width = 350
    Height = 48
    Caption = 
      'With this trial version, you can only use the auto clicker for 5' +
      ' minutes. You must wait 1 minute to continue. If you like this s' +
      'oftware, Please buy a full version.'
    WordWrap = True
  end
  object lblTime: TRzLabel
    Left = 143
    Top = 109
    Width = 121
    Height = 55
    Caption = '01:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -48
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object bvl1: TBevel
    Left = 0
    Top = 215
    Width = 401
    Height = 57
    Shape = bsTopLine
  end
  object btnRegister: TRzButton
    Left = 131
    Top = 230
    Width = 100
    Height = 35
    Caption = 'Register'
    TabOrder = 0
    OnClick = btnRegisterClick
  end
  object btnBuy: TRzButton
    Left = 22
    Top = 230
    Width = 100
    Height = 35
    Caption = 'Buy Now!'
    TabOrder = 1
    OnClick = btnBuyClick
  end
  object btnContinue: TRzButton
    Left = 274
    Top = 230
    Width = 100
    Height = 35
    Caption = 'Continue'
    Enabled = False
    TabOrder = 2
    OnClick = btnContinueClick
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 16
    Top = 112
  end
end
