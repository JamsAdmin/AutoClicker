object frmClicker: TfrmClicker
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = '1Clicker -Free Auto Clicker'
  ClientHeight = 511
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
  object lblURL: TLabel
    Left = 556
    Top = 489
    Width = 145
    Height = 14
    Cursor = crHandPoint
    Caption = 'https://www.1Clicker.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblURLClick
  end
  object Label1: TLabel
    Left = 499
    Top = 491
    Width = 51
    Height = 16
    Align = alCustom
    Alignment = taRightJustify
    Caption = 'Website:'
  end
  object Label2: TLabel
    Left = 18
    Top = 490
    Width = 48
    Height = 16
    Align = alCustom
    Alignment = taRightJustify
    Caption = 'Contact:'
  end
  object lblEmail: TLabel
    Left = 72
    Top = 489
    Width = 121
    Height = 14
    Cursor = crHandPoint
    Caption = 'support@1Clicker.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = lblEmailClick
  end
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
        Top = 357
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
      object btnContact: TPngSpeedButton
        Left = 16
        Top = 397
        Width = 137
        Height = 38
        Caption = #32852#31995#23458#26381
        Visible = False
        OnClick = btnContactClick
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000031A4944415478DAC5954D68135110C76776B3BB2D2AE2A942BB9B7EA5
          9BB4480B15EB412107AB070F5E6C054B0F22225A05412D9EC47A1041BCA95051
          103C88150F4A11692DB5224A2D4845A3493FD46C52112F8A1FB4BBC9BEE76C9A
          68B24924158B0F029BD937F37BF39F99B708CBBCF0BF0342D52BD68AC9640B17
          788B80D0ECD8188717C870D2F678269BDEFFF8F8D780B02A1D00C44B8830CE38
          7F8688E30273E2F3560ED04AEF821CF158206A9E5F3220A229FD9CB306CE795F
          209E7C5868CF9456564BBCB31465952859BB7C33F0B524405893E980D0E937AC
          5BA5E83CE555B65386831E86BEFAB839F347404493076DE4271BA389E7D9F669
          4D6EA420414441B4394402317328E7BDAAD491DF301DAAB62820A24A07B9004D
          FE68A227DBFE4655B621F2FBF498C9A8831C4FE986D557A0663504E92D02909F
          021777EAF1F9B98CED5D3594994C9EE18C75512DC652C02A4F1005615400A1BD
          C15878E096D794AC8AE659F8940398AE2CAFB2453B4CF4956E696C807B64AF76
          9D769423DC081889CB39D96AD230657BC61F4D8EE60088DC497FDBFD86B92FC7
          A14A5E8702DC716BEB009C16763702C5E9A576B6F574EBFE06A8CA154436A61B
          89EBD90EB3B5B03A9194BF888C057D698942AA67B388C223D11655DFDC7C3C07
          50A3E898E437F598D5521220D5869AD2CE803B5D739B7ECC29321469630740A3
          38E08F5ACD6E89C809B7BA255AD455E9275D3792E3639A6AEA52D4C9FCD99314
          8FD77F988FB92522E9B83F6A9E2BA9C8E430409B42792DE995BB80C30EDADF59
          5291D3C19E20133B326D4A855C0F025ECDA49B27872A5DA4919F08C412D7B262
          146ED3B4C31E01516F30AC13A9D378A543C869F08CC481428088267503089B74
          C3DCBFE82F9FA68B700D010F67F6E45D15614D1A91181EA98B5B2F9D19706C3E
          C37A0D4596533BA7D8B4B789E665889E2BB3DFE701428D208BDF651341D8A21B
          0B2350C24A077F45D31ECC4C7B5180B3DED64045C296EF92BE1128B77AFC11F8
          5634039285A2ECA5E0BBDDC18B027E69EC558E72C6BB69322748DB69BA1A66C8
          A19CBE116D54AB0D9C431B727E41CFD27C49809464CBF9C9FC176BD9013F018C
          2287285B51F3740000000049454E44AE426082}
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
        Top = 119
        Width = 652
        Height = 133
        Caption = 'Cursor Position'
        TabOrder = 2
        object btnDelPick: TPngSpeedButton
          Left = 627
          Top = 45
          Width = 22
          Height = 25
          Flat = True
          OnClick = btnDelPickClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
            61000000644944415478DA6364A0103052D30007287D80801E1475E806EC07E2
            06206EC4A1B91E2AEF88CD006405D80CC12A872D0CB029C46930AE4044D6C080
            C7557863A11ECD00ACE142330328F20245814851343A305098901CA0F40106FC
            00451D553313590000C93C26114E2FF5DF0000000049454E44AE426082}
        end
        object btnEditPick: TPngSpeedButton
          Left = 627
          Top = 14
          Width = 22
          Height = 25
          Flat = True
          OnClick = btnEditPickClick
          PngImage.Data = {
            89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
            0D000000EE4944415478DA6364A03260A4B5810E78D41EC022A606C4B7701978
            0288CD7118761588C380F81A941F0AC45D40AC00B5C8119B81FFA1120718F003
            9061AB80780510CF04E2FDC8FA48351066D802204E04E27A204E006245725C08
            330CE4AA0CA8610D401C00C41B49351066D82420CE4732CC09EA6506520C8419
            D60DC46548861903F139749B89311024DE02C4B54886A902F11DA8BC160322F6
            091AE803C4FD500360868903F12B24355780388781C8580645802010EB334012
            310710FFC4E203A2930DC8556240BC1D880F03F1472C11469281C48051031100
            5F694308306230A0C0810CC3507C44F5121B00D6BB51157BAE5F710000000049
            454E44AE426082}
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
          Left = 250
          Top = 50
          Width = 19
          Height = 15
          TabOrder = 1
          OnClick = rbPickLocationClick
        end
        object btnPick: TRzButton
          Left = 275
          Top = 43
          Width = 109
          Height = 27
          Caption = 'Pick Location'
          Enabled = False
          TabOrder = 2
          OnClick = btnPickClick
        end
        object lvPicLocation: TRzListView
          Left = 395
          Top = 12
          Width = 229
          Height = 114
          Columns = <
            item
              Caption = 'X'
              Width = 40
            end
            item
              Caption = 'Y'
              Width = 40
            end
            item
              Caption = 'Times'
            end
            item
              Caption = 'Delay(ms)'
              Width = 78
            end>
          EditOnRowClick = True
          RowSelect = True
          TabOrder = 3
          ViewStyle = vsReport
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
        Top = 258
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
        Top = 354
        Width = 235
        Height = 21
        BiDiMode = bdLeftToRight
        HotKey = 118
        Modifiers = []
        ParentBiDiMode = False
        TabOrder = 6
        OnExit = rzhkStartStopExit
      end
      object btn1: TButton
        Left = 565
        Top = 322
        Width = 125
        Height = 52
        Caption = 'btn1'
        TabOrder = 7
        Visible = False
        OnClick = btn1Click
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
        Top = 134
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
  object mmo1: TMemo
    Left = 420
    Top = 352
    Width = 161
    Height = 54
    Lines.Strings = (
      'mmo1')
    ScrollBars = ssBoth
    TabOrder = 1
    Visible = False
  end
  object tmrSimpleClick: TTimer
    Enabled = False
    OnTimer = tmrSimpleClickTimer
    Left = 336
    Top = 104
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
      object mniRegister: TMenuItem
        Caption = 'Register'
        OnClick = mniRegisterClick
      end
      object mniBuy: TMenuItem
        Caption = 'Buy Now!'
        OnClick = mniBuyClick
      end
      object mniN1: TMenuItem
        Caption = '-'
      end
      object mniAbout: TMenuItem
        Caption = 'About'
        OnClick = mniAboutClick
      end
    end
  end
  object dlgSaveRecord: TSaveDialog
    DefaultExt = '.ini'
    Filter = 'Clicker Script|*.ini'
    Left = 288
    Top = 104
  end
  object dlgOpenRecord: TOpenDialog
    DefaultExt = '.ini'
    Filter = 'Clicker Script|*.ini'
    Left = 480
    Top = 88
  end
  object pmRecord: TPopupMenu
    Left = 352
    Top = 104
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
    OnTimer = tmrBuyReminderTimer
    Left = 208
    Top = 256
  end
  object tmrCheckReg: TTimer
    Interval = 100
    OnTimer = tmrCheckRegTimer
    Left = 248
    Top = 256
  end
end
