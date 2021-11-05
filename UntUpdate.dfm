object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Notice'
  ClientHeight = 189
  ClientWidth = 381
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
  object lblNewVerDesc: TLabel
    Left = 38
    Top = 37
    Width = 323
    Height = 36
    Align = alCustom
    Caption = 
      'New version found! Please go to the official website to download' +
      ' the new version.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object btnUpdate: TRzButton
    Left = 43
    Top = 131
    Width = 130
    Height = 37
    Default = True
    Caption = 'Update'
    TabOrder = 0
    OnClick = btnUpdateClick
  end
  object btnCancel: TRzButton
    Left = 208
    Top = 131
    Width = 130
    Height = 37
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
