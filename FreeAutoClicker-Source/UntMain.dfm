object frmClicker: TfrmClicker
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = '1Clicker -Auto Mouse Clicker'
  ClientHeight = 496
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object pgMain: TRzPageControl
    Left = 10
    Top = 9
    Width = 705
    Height = 475
    ActivePage = shtClicker
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 22
    object shtClicker: TRzTabSheet
      Caption = 'Auto Clicker'
      object lblStartStopHotkey: TLabel
        Left = 22
        Top = 340
        Width = 106
        Height = 16
        Align = alCustom
        Alignment = taRightJustify
        Caption = 'Start/Stop Hotkey:'
      end
      object rzbrdr1: TRzBorder
        Left = 0
        Top = 380
        Width = 699
        Height = 8
        BorderOuter = fsFlat
        BorderSides = [sdTop]
        FlatColor = clSilver
      end
      object grpClickInterval: TRzGroupBox
        Left = 21
        Top = 27
        Width = 344
        Height = 94
        Caption = 'Click Interval'
        TabOrder = 0
        object lblHour: TLabel
          Left = 24
          Top = 29
          Width = 33
          Height = 16
          Caption = 'Hours'
        end
        object lblMin: TLabel
          Left = 104
          Top = 29
          Width = 44
          Height = 16
          Caption = 'Minutes'
        end
        object lblSec: TLabel
          Left = 176
          Top = 29
          Width = 48
          Height = 16
          Caption = 'Seconds'
        end
        object lblMill: TLabel
          Left = 256
          Top = 29
          Width = 62
          Height = 16
          Caption = 'Millisecond'
        end
        object edtHour: TRzSpinEdit
          Left = 24
          Top = 48
          Width = 57
          Height = 24
          AllowKeyEdit = True
          Max = 100.000000000000000000
          TabOrder = 0
        end
        object edtMin: TRzSpinEdit
          Left = 104
          Top = 48
          Width = 57
          Height = 24
          AllowKeyEdit = True
          Max = 100.000000000000000000
          TabOrder = 1
        end
        object edtSec: TRzSpinEdit
          Left = 177
          Top = 48
          Width = 57
          Height = 24
          AllowKeyEdit = True
          Max = 100.000000000000000000
          TabOrder = 2
        end
        object edtMs: TRzSpinEdit
          Left = 256
          Top = 48
          Width = 57
          Height = 24
          AllowKeyEdit = True
          Max = 100.000000000000000000
          Min = 1.000000000000000000
          Value = 100.000000000000000000
          TabOrder = 3
        end
      end
      object grpMouseAction: TRzGroupBox
        Left = 379
        Top = 27
        Width = 294
        Height = 94
        Caption = 'Mouse Action'
        TabOrder = 1
        object lblMouseBtn: TLabel
          Left = 11
          Top = 32
          Width = 77
          Height = 16
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Mouse Button'
        end
        object lblClickType: TLabel
          Left = 30
          Top = 64
          Width = 58
          Height = 16
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Click Type'
        end
        object cbbMButton: TRzComboBox
          Left = 120
          Top = 24
          Width = 145
          Height = 24
          Style = csDropDownList
          TabOrder = 0
          Text = 'Left'
          Items.Strings = (
            'Left'
            'Right'
            'Middle')
          ItemIndex = 0
        end
        object cbbClickType: TRzComboBox
          Left = 120
          Top = 54
          Width = 145
          Height = 24
          Style = csDropDownList
          TabOrder = 1
          Text = 'Single'
          Items.Strings = (
            'Single'
            'Double')
          ItemIndex = 0
        end
      end
      object grpPosition: TRzGroupBox
        Left = 21
        Top = 127
        Width = 652
        Height = 108
        Caption = 'Cursor Position'
        TabOrder = 2
        object lblPosRule: TRzLabel
          Left = 524
          Top = 86
          Width = 115
          Height = 16
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Rule: X,Y,Delay(ms)'
        end
        object rbCurrLocation: TRzRadioButton
          Left = 24
          Top = 50
          Width = 113
          Height = 18
          Caption = 'Current Location'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbCurrLocationClick
        end
        object rbPickLocation: TRzRadioButton
          Left = 312
          Top = 49
          Width = 19
          Height = 15
          TabOrder = 1
          OnClick = rbPickLocationClick
        end
        object btnPick: TRzButton
          Left = 337
          Top = 42
          Width = 109
          Height = 27
          Caption = 'Pick Location'
          Enabled = False
          TabOrder = 2
          OnClick = btnPickClick
        end
        object mmoClickXY: TMemo
          Left = 459
          Top = 12
          Width = 181
          Height = 68
          TabOrder = 3
        end
      end
      object btnStart: TRzButton
        Left = 380
        Top = 397
        Width = 137
        Height = 38
        Caption = 'Start (%s)'
        TabOrder = 3
        OnClick = btnStartClick
      end
      object btnStop: TRzButton
        Left = 536
        Top = 397
        Width = 137
        Height = 38
        Caption = 'Stop (%s)'
        Enabled = False
        TabOrder = 4
        OnClick = btnStopClick
      end
      object grpRepeat: TRzGroupBox
        Left = 21
        Top = 241
        Width = 652
        Height = 79
        Caption = 'Click Repeat'
        TabOrder = 5
        object lblMinutes: TRzLabel
          Left = 507
          Top = 38
          Width = 44
          Height = 16
          Caption = 'Minutes'
        end
        object rbTimesLimit: TRzRadioButton
          Left = 21
          Top = 38
          Width = 98
          Height = 18
          Caption = 'Repeat Times'
          TabOrder = 0
        end
        object rbNoTimesLimit: TRzRadioButton
          Left = 198
          Top = 38
          Width = 139
          Height = 18
          Caption = 'Repeat Until Stopped'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object edtRepeatTimes: TRzSpinEdit
          Left = 125
          Top = 32
          Width = 57
          Height = 24
          AllowKeyEdit = True
          Max = 99999999.000000000000000000
          Value = 10.000000000000000000
          TabOrder = 2
        end
        object rbClickForMinutes: TRzRadioButton
          Left = 369
          Top = 38
          Width = 69
          Height = 18
          Caption = 'Click for '
          TabOrder = 3
        end
        object edtClickMinutes: TRzSpinEdit
          Left = 444
          Top = 32
          Width = 57
          Height = 24
          AllowKeyEdit = True
          Max = 100.000000000000000000
          Min = 1.000000000000000000
          Value = 1.000000000000000000
          TabOrder = 4
        end
      end
      object rzhkStartStop: TRzHotKeyEdit
        Left = 142
        Top = 337
        Width = 235
        Height = 21
        BiDiMode = bdLeftToRight
        HotKey = 118
        Modifiers = []
        ParentBiDiMode = False
        TabOrder = 6
        OnExit = rzhkStartStopExit
      end
    end
    object shtMacro: TRzTabSheet
      Caption = 'Macro Recorder'
      object lblCurrFile: TRzLabel
        Left = 25
        Top = 371
        Width = 76
        Height = 16
        Caption = 'Current File: '
      end
      object lblNoticeMenu: TRzLabel
        Left = 519
        Top = 368
        Width = 153
        Height = 16
        Alignment = taRightJustify
        Caption = '* Right Click the list to edit'
      end
      object lblMacroDesc: TRzLabel
        Left = 68
        Top = 15
        Width = 602
        Height = 16
        Caption = 
          'This function can record a series of mouse and keyboard events, ' +
          'and can replay these events repeatedly.'
      end
      object img1: TImage
        Left = 32
        Top = 8
        Width = 30
        Height = 30
        AutoSize = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000001E0000
          001E08060000003B30AEA2000002984944415478DAED964B6813511486CF9D24
          2D0DB66A7CEC04C5924988D6851BEB421A7425E8AE609DB1D658054521371B37
          820A6EDC64023E1655E36BA615BAD3852B4975615CAB2199505170E1A2B56003
          AD26CD5C4FA63E32741E493B211B7F18E6CC7D9CEFDE33F79C19026D12F90FB6
          D2603217E8E0BC3B0923BD1AB0200724526B473B87769111365DD6963E4E2622
          73AE818F4BEA151C78B591B10CC78D53FEDA9AC18254CCA0BB81260339A5D060
          7455E02129DFCF01F7A639A0511A68FB276838DB1458905466E7F4F0DE8D1058
          E705F9D58C2D5CA1BC29C3B451900AF7B12B66E5ECD09E0D3012DDAADBB75F7C
          85AC5AB241B3B44243A71DC178904E60E363BB5DF83B39183BD7ABDBA377A6E1
          4759B3DD35866E180FDC134BF050AAD0C731F212CDCDE0AE6635C20E4EC443EF
          4CC1624ABDC018DC7419BA0C2270518EF3B74CC1983A0F3030238D38EAEEF2E8
          F7D262B551F4434CB1531660B5168ADD4E2E7C1E0263E797DFF1597CC7952A73
          9A52D37B3CE17D2BC0B11B85EE9F1D64BE110F5B7A7C20C576E8364D7F8299F9
          4A437BEE2CB39EF4A550C90016A5FC00032ED34A30012D2AD3F094013C98FCD2
          D54116165A092E33BF7F32B16DD100AE4948AA596CD9D7123083B74A82EFFFB7
          FB7AB05490B029DE9A1DB31456306A0AC63C1EC63C7ED40A30E6F149CCE3BF15
          D100D63FF6C4F71A571771174C7265563950FF936052AB0B020122BB0966C0C4
          711A520C4B311B887019E1821B60842A081557C4C06A02C2BF213C60D51FDDB5
          5EBF673E7CB783CE21749369F0ED42244AC56738F908AC42B8E8E7320D1EB5EE
          779028A9A35889EF3607853332E5EF398C71D6EF727A1D4D1EACBFD5B378A958
          162FFF298B6B06D7EB9894DFEE61DE20E1B460ED99695CB14A968A4F69F87393
          51698FDA06FE0557310C2E0438A9B20000000049454E44AE426082}
      end
      object btnStartRecord: TRzButton
        Left = 382
        Top = 398
        Width = 137
        Height = 38
        Caption = 'Start Recording'
        TabOrder = 0
        OnClick = btnStartRecordClick
      end
      object btnShowPlayback: TRzButton
        Left = 538
        Top = 398
        Width = 137
        Height = 38
        Caption = 'Playback'
        TabOrder = 1
        OnClick = btnShowPlaybackClick
      end
      object grpRecordOptions: TRzGroupBox
        Left = 20
        Top = 41
        Width = 309
        Height = 83
        Caption = 'Recording Options'
        TabOrder = 2
        object chkRecordDelay: TRzCheckBox
          Left = 27
          Top = 57
          Width = 50
          Height = 18
          Caption = 'Delay'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkRecordMouseClick: TRzCheckBox
          Left = 138
          Top = 25
          Width = 86
          Height = 18
          Caption = 'Mouse Click'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = chkRecordMouseClickClick
        end
        object chkRecordKeyboard: TRzCheckBox
          Left = 27
          Top = 25
          Width = 72
          Height = 18
          Caption = 'Keyboard'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = chkRecordKeyboardClick
        end
        object chkRecordMove: TRzCheckBox
          Left = 138
          Top = 57
          Width = 90
          Height = 18
          Caption = 'Mouse Move'
          State = cbUnchecked
          TabOrder = 3
        end
      end
      object grpRecordHotkey: TRzGroupBox
        Left = 335
        Top = 41
        Width = 349
        Height = 83
        Caption = 'Hot Key'
        TabOrder = 3
        object lblRecordStopHotkey: TLabel
          Left = 18
          Top = 21
          Width = 76
          Height = 16
          Align = alCustom
          Alignment = taRightJustify
          Caption = 'Record/Stop:'
        end
        object rzhkRecord: TRzHotKeyEdit
          Left = 23
          Top = 43
          Width = 234
          Height = 21
          BiDiMode = bdLeftToRight
          HotKey = 16496
          Modifiers = [hkCtrl]
          ParentBiDiMode = False
          TabOrder = 0
          OnExit = rzhkRecordExit
        end
      end
      object btnLoadRecord: TRzButton
        Left = 22
        Top = 398
        Width = 112
        Height = 38
        Caption = 'Load...'
        TabOrder = 4
        OnClick = btnLoadRecordClick
      end
      object btnSave: TRzButton
        Left = 148
        Top = 398
        Width = 112
        Height = 38
        Caption = 'Save As...'
        TabOrder = 5
        OnClick = btnSaveClick
      end
      object lvMacroList: TRzListView
        Left = 20
        Top = 135
        Width = 655
        Height = 231
        Columns = <
          item
            Caption = 'ID'
            Width = 70
          end
          item
            Caption = 'Action'
            Width = 150
          end
          item
            Caption = 'Key'
            Width = 100
          end
          item
            Caption = 'X'
            Width = 80
          end
          item
            Caption = 'Y'
            Width = 80
          end
          item
            Caption = 'Delay(ms)'
            Width = 154
          end>
        GridLines = True
        PopupMenu = pmRecord
        ReadOnly = True
        RowSelect = True
        TabOrder = 6
        ViewStyle = vsReport
      end
    end
  end
  object tmrSimpleClick: TTimer
    Enabled = False
    OnTimer = tmrSimpleClickTimer
    Left = 424
    Top = 160
  end
  object mmMain: TMainMenu
    Left = 144
    Top = 128
    object mniFile: TMenuItem
      Caption = 'File'
      object Load1: TMenuItem
        Caption = 'Load Macro...'
        OnClick = btnLoadRecordClick
      end
      object SaveAs1: TMenuItem
        Caption = 'Save...'
        OnClick = btnSaveClick
      end
    end
    object mniHelp: TMenuItem
      Caption = 'Help'
      object mniAbout: TMenuItem
        Caption = 'About'
        OnClick = mniAboutClick
      end
    end
  end
  object dlgSaveRecord: TSaveDialog
    DefaultExt = '.ini'
    Filter = 'Clicker Script|*.ini'
    Left = 584
    Top = 144
  end
  object dlgOpenRecord: TOpenDialog
    DefaultExt = '.ini'
    Filter = 'Clicker Script|*.ini'
    Left = 504
    Top = 88
  end
  object pmRecord: TPopupMenu
    Left = 216
    Top = 160
    object mniDelete: TMenuItem
      Caption = 'Delete'
      OnClick = mniDeleteClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mniClear: TMenuItem
      Caption = 'Clear'
      OnClick = mniClearClick
    end
  end
  object tmrBuyReminder: TTimer
    Interval = 300000
    Left = 576
    Top = 168
  end
  object tmrCheckReg: TTimer
    OnTimer = tmrCheckRegTimer
    Left = 264
    Top = 256
  end
end
