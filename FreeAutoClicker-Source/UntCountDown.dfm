object frmCountDown: TfrmCountDown
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Warning'
  ClientHeight = 169
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNotice: TRzLabel
    Left = 32
    Top = 32
    Width = 238
    Height = 16
    Caption = 'Playback completed!  Are to ready to %s?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCountDown: TRzLabel
    Left = 163
    Top = 64
    Width = 22
    Height = 25
    Caption = '60'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnCancel: TRzButton
    Left = 200
    Top = 120
    Width = 121
    Height = 33
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = btnCancelClick
  end
  object btnOK: TRzButton
    Left = 40
    Top = 120
    Width = 121
    Height = 33
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 296
    Top = 72
  end
end
