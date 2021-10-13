object FormMain: TFormMain
  Left = 349
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'FormMain'
  ClientHeight = 466
  ClientWidth = 379
  Color = 15000804
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    379
    466)
  PixelsPerInch = 96
  TextHeight = 15
  object lblInfo: TJppLabel
    Left = 215
    Top = 8
    Width = 151
    Height = 45
    Caption = 
      'Select the desired resolution on the list and click the button b' +
      'elow'
    WordWrap = True
    AnchoredControls.Bottom.Control = btnSetSelectedResolution
    AnchoredControls.Bottom.Spacing = 14
  end
  object pnLeft: TJppSimplePanel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 198
    Height = 456
    Margins.Left = 5
    Margins.Top = 5
    Margins.Bottom = 5
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DoubleBuffered = True
    ParentDoubleBuffered = False
    object lblAvailableResolutions: TJppShadowLabel
      Left = 0
      Top = 0
      Width = 198
      Height = 21
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Available resolutions'
      Color = 14803425
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Appearance.DisabledCaptionShadow.Color = -2147483628
      Appearance.BorderColor = clGray
      Appearance.BorderWidth = 1
      ExplicitTop = 8
      ExplicitWidth = 170
    end
    object lv: TJvListView
      AlignWithMargins = True
      Left = 10
      Top = 43
      Width = 176
      Height = 156
      Margins.Left = 1
      Margins.Top = 0
      Margins.Right = 1
      Margins.Bottom = 1
      BorderStyle = bsNone
      Columns = <
        item
          Caption = 'No'
          Width = 35
        end
        item
          Alignment = taRightJustify
          Caption = 'Width'
          Width = 65
        end
        item
          Alignment = taRightJustify
          Caption = 'Height'
          Width = 65
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lvColumnClick
      OnCustomDrawItem = lvCustomDrawItem
      ColumnsOrder = '0=35,1=65,2=65'
      SortOnClick = False
      ExtendedColumns = <
        item
        end
        item
        end
        item
        end>
    end
    object pnCurrentResolution: TJppSimplePanel
      Left = 0
      Top = 384
      Width = 198
      Height = 72
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Appearance.BackgroundColor = 16706520
      object dlblCurrentWidth: TJppDoubleLineLabel
        AlignWithMargins = True
        Left = 12
        Top = 27
        Width = 174
        Height = 15
        Margins.Left = 12
        Margins.Top = 6
        Margins.Right = 12
        RightCaption = '1 920'
        LinePeriod = 6
        Align = alTop
        Caption = 'Width:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        RightCaptionFont.Charset = DEFAULT_CHARSET
        RightCaptionFont.Color = clWindowText
        RightCaptionFont.Height = -11
        RightCaptionFont.Name = 'Tahoma'
        RightCaptionFont.Style = [fsBold]
        ExplicitLeft = 19
        ExplicitTop = 32
        ExplicitWidth = 179
      end
      object dlblCurrentHeight: TJppDoubleLineLabel
        AlignWithMargins = True
        Left = 12
        Top = 48
        Width = 174
        Height = 15
        Margins.Left = 12
        Margins.Right = 12
        RightCaption = '1 080'
        LinePeriod = 6
        Align = alTop
        Caption = 'Height:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        RightCaptionFont.Charset = DEFAULT_CHARSET
        RightCaptionFont.Color = clWindowText
        RightCaptionFont.Height = -11
        RightCaptionFont.Name = 'Tahoma'
        RightCaptionFont.Style = [fsBold]
        ExplicitLeft = 19
        ExplicitTop = 51
        ExplicitWidth = 179
      end
      object lblCurrentResolution: TJppShadowLabel
        Left = 0
        Top = 0
        Width = 198
        Height = 21
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Current resolution'
        Color = 16702392
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        Layout = tlCenter
        Appearance.DisabledCaptionShadow.Color = -2147483628
        Appearance.BorderColor = clGray
        Appearance.BorderWidth = 1
        ExplicitWidth = 168
      end
    end
  end
  object btnSetSelectedResolution: TJppBasicPngButtonEx
    Left = 215
    Top = 67
    Width = 154
    Height = 72
    Action = actSetSelectedResolution
    Caption = 'Set resolution'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Layout = blGlyphTop
    ParentFont = False
    TabOrder = 1
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000140000001408060000008D891D
      0D000000097048597300000EC400000EC401952B0E1B000001744944415478DA
      63FCFFFF3F03350123CCC0733E66B26CCC4CA640261399667D7FF7E3F75EB081
      40C36424B9D82F333232F251E23AA059BBC0065EF1B70812E1605B0D14EB07E2
      13649A570034CB1C666008D0C09540C170899587569363DA8B703B90FE905103
      470D1C4C067A030DDC0414380EC44F80B97B8DE4CA436B7CE6D554FEFBF37761
      DBF1B30C12DF7EF402E518F1986901344B086CE0D6586716BDDF7F1259FFFD9F
      F29F9161CD616989F8A5DAAADDFF9898F281F2F3B624B5A4005DF01CA8490C97
      694075DF81541DD840EFB9D571EAEF3F6EED2B99F21624E93FB7BA0F6818286F
      EED77BF5D637EDD2F50C8EBFFFBA910DF8FCFB8FAEEABA63D7D00D66F49A5365
      C2C8C47892E13FC3C5FF0CFF5D191918AB80A54E21D0B003BC3F7FF9B41C39A3
      C2FDE74F15BAC69B1FBF96D8EF38FB04C340900B816155C6C0C8D80E74F75BA0
      612240B1837F8086EDC8ECFA4A6AE4C00B5824430F000DF323C7301403A18646
      FEFEF96BE3CECCAE6FE4180602005E34136B026B82EC0000000049454E44AE42
      6082}
    Appearance.Normal.Border.Color = 7368816
    Appearance.Normal.Color = 16053492
    Appearance.Normal.Font.Charset = DEFAULT_CHARSET
    Appearance.Normal.Font.Color = clBlack
    Appearance.Normal.Font.Height = -11
    Appearance.Normal.Font.Name = 'Tahoma'
    Appearance.Normal.Font.Style = []
    Appearance.Normal.Gradient.SpeedPercent = 100
    Appearance.Normal.Gradient.ColorFrom = 16053492
    Appearance.Normal.Gradient.ColorTo = 15658734
    Appearance.Normal.BorderToGradientMargin = 0
    Appearance.Normal.SubCaptionColor = 14247949
    Appearance.Hot.Border.Color = 11632444
    Appearance.Hot.Color = 16705487
    Appearance.Hot.Font.Charset = DEFAULT_CHARSET
    Appearance.Hot.Font.Color = clBlack
    Appearance.Hot.Font.Height = -11
    Appearance.Hot.Font.Name = 'Tahoma'
    Appearance.Hot.Font.Style = []
    Appearance.Hot.Gradient.SpeedPercent = 100
    Appearance.Hot.Gradient.ColorFrom = 16705487
    Appearance.Hot.Gradient.ColorTo = 16702908
    Appearance.Hot.BorderToGradientMargin = 0
    Appearance.Hot.SubCaptionColor = 14247949
    Appearance.Down.Border.Color = 5849118
    Appearance.Down.Color = 16702392
    Appearance.Down.Font.Charset = DEFAULT_CHARSET
    Appearance.Down.Font.Color = clBlack
    Appearance.Down.Font.Height = -11
    Appearance.Down.Font.Name = 'Tahoma'
    Appearance.Down.Font.Style = []
    Appearance.Down.Gradient.SpeedPercent = 100
    Appearance.Down.Gradient.ColorFrom = 16702392
    Appearance.Down.Gradient.ColorTo = 16699813
    Appearance.Down.BorderToGradientMargin = 0
    Appearance.Down.SubCaptionColor = 14247949
    Appearance.Disabled.Border.Color = 11907757
    Appearance.Disabled.Color = 16053492
    Appearance.Disabled.Font.Charset = DEFAULT_CHARSET
    Appearance.Disabled.Font.Color = 10526880
    Appearance.Disabled.Font.Height = -11
    Appearance.Disabled.Font.Name = 'Tahoma'
    Appearance.Disabled.Font.Style = []
    Appearance.Disabled.Gradient.SpeedPercent = 100
    Appearance.Disabled.Gradient.ColorFrom = 16053492
    Appearance.Disabled.Gradient.ColorTo = 16053492
    Appearance.Disabled.GradientEnabled = False
    Appearance.Disabled.BorderToGradientMargin = 0
    Appearance.Disabled.SubCaptionColor = 10526880
    Appearance.Focused.Border.Color = 14910737
    Appearance.Focused.Color = 16053492
    Appearance.Focused.Font.Charset = DEFAULT_CHARSET
    Appearance.Focused.Font.Color = clBlack
    Appearance.Focused.Font.Height = -11
    Appearance.Focused.Font.Name = 'Tahoma'
    Appearance.Focused.Font.Style = []
    Appearance.Focused.Gradient.SpeedPercent = 100
    Appearance.Focused.Gradient.ColorFrom = 15856113
    Appearance.Focused.Gradient.ColorTo = 13619151
    Appearance.Focused.GradientEnabled = False
    Appearance.Focused.SubCaptionColor = 14247949
    Appearance.FocusRect.FocusType = frtCustom
    Appearance.FocusRect.Pen.Color = 14910737
    Appearance.FocusRect.Spacing = 1
    Appearance.BorderWhenDefault.Color = 13675044
    Appearance.SubCaptionFont.Charset = DEFAULT_CHARSET
    Appearance.SubCaptionFont.Color = clWindowText
    Appearance.SubCaptionFont.Height = -12
    Appearance.SubCaptionFont.Name = 'Tahoma'
    Appearance.SubCaptionFont.Style = []
    Appearance.SubCaption = 'F9'
    Appearance.CaptionsMargin = 3
    AnchoredControls.Bottom.Control = chPermanent
    AnchoredControls.Bottom.Spacing = 14
  end
  object chPermanent: TJPJvCheckBox
    Left = 215
    Top = 153
    Width = 79
    Height = 17
    Hint = 
      'If checked, the new resolution will be saved in the <b>system re' +
      'gistry</b>.'#13#10'If unchecked, the new resolution will only be valid' +
      ' for the <b>current session</b>.'
    Caption = 'Permanent'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 2
    OnClick = InitCtrls
    LinkedControls = <>
    AnchoredControls.Bottom.Control = rbCurrentUser
    AnchoredControls.Bottom.DeltaPosX = 10
  end
  object rbCurrentUser: TJPJvRadioButton
    Left = 225
    Top = 173
    Width = 124
    Height = 17
    Alignment = taLeftJustify
    Caption = 'For the current user'
    Checked = True
    TabOrder = 3
    TabStop = True
    LinkedControls = <>
    AnchoredControls.Bottom.Control = rbAllUsers
  end
  object rbAllUsers: TJPJvRadioButton
    Left = 225
    Top = 193
    Width = 83
    Height = 17
    Alignment = taLeftJustify
    Caption = 'For all users'
    TabOrder = 4
    LinkedControls = <>
  end
  object btnAbout: TJppBasicPngButtonEx
    Left = 258
    Top = 433
    Width = 28
    Height = 25
    Action = actAbout
    Caption = 'About...'
    ParentShowHint = False
    ShowHint = True
    Spacing = 0
    TabOrder = 5
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      61000000097048597300000EC400000EC401952B0E1B0000017B4944415478DA
      63FCFFFF3F032580119B01C6C953B4B94464FD814C75A8D0CDEFEF9F6F3C332B
      E32A5E03F4633A05F8A435A6313032863302E59015FE07A1FFFF577E7D753FEB
      DCFC820F180600350B02351F606464D4C5E764A0FACB5F5F3FB43F372FEF038A
      01B6E51B97013547A0A93F0EA52DD10C5971B8D33F0A6E8051F2142D1E11B9CB
      4047A3387B638DDB6D90DBFD5B77A9A27AE7FFFF9F9FDFE99E9A9A780D6C00D0
      F62AA0ED2DA4843E505F0DD0156D300316020D884557B4BCD4F905C8BEC8EE7D
      12580C580C34201EAF012BCB9CCE31FCFFC710DE7DC0889001D540039AB11AF0
      0F68400F56036A8106B4820D30499BA1CD2928790968084A206EA8760506E27F
      8680B63DAA689AFFFFFAF649EFE4E4D8ABC8D1B81CA83F9CC8685C09B43D1225
      1D18264E10E411533C0834448740E85F01266B7B60B27E8F62000818254D12E4
      16959F06140E63444B134065A0D4BC0AA8390BA619C3001830CF9EAFCDC62314
      0064AA41856EFDFEF669C309A09FD1D532529A9D013888D8E1B3FEE4AE000000
      0049454E44AE426082}
    Appearance.Normal.Border.Color = 7368816
    Appearance.Normal.Color = 15987699
    Appearance.Normal.Font.Charset = DEFAULT_CHARSET
    Appearance.Normal.Font.Color = clBlack
    Appearance.Normal.Font.Height = -11
    Appearance.Normal.Font.Name = 'Tahoma'
    Appearance.Normal.Font.Style = []
    Appearance.Normal.Gradient.SpeedPercent = 100
    Appearance.Normal.Gradient.ColorFrom = 15856113
    Appearance.Normal.Gradient.ColorTo = 13619151
    Appearance.Hot.Border.Color = 11632444
    Appearance.Hot.Color = 16578024
    Appearance.Hot.Font.Charset = DEFAULT_CHARSET
    Appearance.Hot.Font.Color = clBlack
    Appearance.Hot.Font.Height = -11
    Appearance.Hot.Font.Name = 'Tahoma'
    Appearance.Hot.Font.Style = []
    Appearance.Hot.Gradient.SpeedPercent = 100
    Appearance.Hot.Gradient.ColorFrom = 16643818
    Appearance.Hot.Gradient.ColorTo = 16112039
    Appearance.Down.Border.Color = 5849118
    Appearance.Down.Color = 15852229
    Appearance.Down.Font.Charset = DEFAULT_CHARSET
    Appearance.Down.Font.Color = clBlack
    Appearance.Down.Font.Height = -11
    Appearance.Down.Font.Name = 'Tahoma'
    Appearance.Down.Font.Style = []
    Appearance.Down.Gradient.SpeedPercent = 100
    Appearance.Down.Gradient.ColorFrom = 16577765
    Appearance.Down.Gradient.ColorTo = 14662002
    Appearance.Disabled.Border.Color = 11907757
    Appearance.Disabled.Color = 16053492
    Appearance.Disabled.Font.Charset = DEFAULT_CHARSET
    Appearance.Disabled.Font.Color = 10526880
    Appearance.Disabled.Font.Height = -11
    Appearance.Disabled.Font.Name = 'Tahoma'
    Appearance.Disabled.Font.Style = []
    Appearance.Disabled.Gradient.SpeedPercent = 100
    Appearance.Disabled.Gradient.ColorFrom = 16053492
    Appearance.Disabled.Gradient.ColorTo = 16053492
    Appearance.Disabled.SubCaptionColor = 10526880
    Appearance.Focused.Border.Color = 13675044
    Appearance.Focused.Color = 15987699
    Appearance.Focused.Font.Charset = DEFAULT_CHARSET
    Appearance.Focused.Font.Color = clBlack
    Appearance.Focused.Font.Height = -11
    Appearance.Focused.Font.Name = 'Tahoma'
    Appearance.Focused.Font.Style = []
    Appearance.Focused.Gradient.SpeedPercent = 100
    Appearance.Focused.Gradient.ColorFrom = 15856113
    Appearance.Focused.Gradient.ColorTo = 13619151
    Appearance.FocusRect.Pen.Color = 13675044
    Appearance.BorderWhenDefault.Color = 13675044
    Appearance.ShowCaption = False
    Appearance.SubCaptionFont.Charset = DEFAULT_CHARSET
    Appearance.SubCaptionFont.Color = clWindowText
    Appearance.SubCaptionFont.Height = -11
    Appearance.SubCaptionFont.Name = 'Tahoma'
    Appearance.SubCaptionFont.Style = []
    AnchoredControls.Left.Control = btnLang
    AnchoredControls.Left.Spacing = 8
  end
  object btnExit: TJppBasicPngButtonEx
    Left = 294
    Top = 433
    Width = 75
    Height = 25
    Action = actExit
    Anchors = [akRight, akBottom]
    Caption = 'Exit'
    TabOrder = 6
    Appearance.Normal.Border.Color = 7368816
    Appearance.Normal.Color = 15987699
    Appearance.Normal.Font.Charset = DEFAULT_CHARSET
    Appearance.Normal.Font.Color = clBlack
    Appearance.Normal.Font.Height = -11
    Appearance.Normal.Font.Name = 'Tahoma'
    Appearance.Normal.Font.Style = []
    Appearance.Normal.Gradient.SpeedPercent = 100
    Appearance.Normal.Gradient.ColorFrom = 15856113
    Appearance.Normal.Gradient.ColorTo = 13619151
    Appearance.Hot.Border.Color = 11632444
    Appearance.Hot.Color = 16578024
    Appearance.Hot.Font.Charset = DEFAULT_CHARSET
    Appearance.Hot.Font.Color = clBlack
    Appearance.Hot.Font.Height = -11
    Appearance.Hot.Font.Name = 'Tahoma'
    Appearance.Hot.Font.Style = []
    Appearance.Hot.Gradient.SpeedPercent = 100
    Appearance.Hot.Gradient.ColorFrom = 16643818
    Appearance.Hot.Gradient.ColorTo = 16112039
    Appearance.Down.Border.Color = 5849118
    Appearance.Down.Color = 15852229
    Appearance.Down.Font.Charset = DEFAULT_CHARSET
    Appearance.Down.Font.Color = clBlack
    Appearance.Down.Font.Height = -11
    Appearance.Down.Font.Name = 'Tahoma'
    Appearance.Down.Font.Style = []
    Appearance.Down.Gradient.SpeedPercent = 100
    Appearance.Down.Gradient.ColorFrom = 16577765
    Appearance.Down.Gradient.ColorTo = 14662002
    Appearance.Disabled.Border.Color = 11907757
    Appearance.Disabled.Color = 16053492
    Appearance.Disabled.Font.Charset = DEFAULT_CHARSET
    Appearance.Disabled.Font.Color = 10526880
    Appearance.Disabled.Font.Height = -11
    Appearance.Disabled.Font.Name = 'Tahoma'
    Appearance.Disabled.Font.Style = []
    Appearance.Disabled.Gradient.SpeedPercent = 100
    Appearance.Disabled.Gradient.ColorFrom = 16053492
    Appearance.Disabled.Gradient.ColorTo = 16053492
    Appearance.Disabled.SubCaptionColor = 10526880
    Appearance.Focused.Border.Color = 13675044
    Appearance.Focused.Color = 15987699
    Appearance.Focused.Font.Charset = DEFAULT_CHARSET
    Appearance.Focused.Font.Color = clBlack
    Appearance.Focused.Font.Height = -11
    Appearance.Focused.Font.Name = 'Tahoma'
    Appearance.Focused.Font.Style = []
    Appearance.Focused.Gradient.SpeedPercent = 100
    Appearance.Focused.Gradient.ColorFrom = 15856113
    Appearance.Focused.Gradient.ColorTo = 13619151
    Appearance.FocusRect.Pen.Color = 13675044
    Appearance.BorderWhenDefault.Color = 13675044
    Appearance.SubCaptionFont.Charset = DEFAULT_CHARSET
    Appearance.SubCaptionFont.Color = clWindowText
    Appearance.SubCaptionFont.Height = -11
    Appearance.SubCaptionFont.Name = 'Tahoma'
    Appearance.SubCaptionFont.Style = []
    AnchoredControls.Left.Control = btnAbout
    AnchoredControls.Left.Spacing = 8
  end
  object btnLang: TJppBasicPngButtonEx
    Left = 222
    Top = 433
    Width = 28
    Height = 25
    Action = actShowLangMenu
    ParentShowHint = False
    ShowHint = True
    Spacing = 0
    TabOrder = 7
    PngImage.Data = {
      89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
      61000000097048597300000EC400000EC401952B0E1B000001D84944415478DA
      6364A010306213B46F4ED7E69112090032D5A04237BFBE7AB7E140E5F46B780D
      B0AA8A171454969906140D030BFC67F80955C50E6483C0CA4F8F5F661D6E98F3
      01C300AB4AA06615998340A600506725506A32909E0C55960B640331633B90F3
      FED39357F687EB677F4031C07B6EF5722065FDEFEF5F2B26666637207BD2B7B7
      1F64FFFEFCC5C02B25F618C8CF03CAED02CA1D03B28F6C4D6E8D821B60D79CA6
      CD272D7AE9FF7F06901F41D808E212867D50F39D801864E33920D602EAD2FAF1
      FEB3EEDEE249D718A1B65701A96220DE03D5E007C457191919EF8283E2FF7F65
      20A50DC49BA0F22E40DC0B74451BCC8085404A0828E00BE6CFABFEFEF7D79F94
      1D199D4BC1AA271444B3F371CFD99AD4CA0955BF1948BD03AA8FC765C08FBF3F
      7F27EFC8EC8218D0971FCD2EC0836A0023D080248401D540AA88442FF4012D6C
      051BE0D09EA9CD2D2E7489011188C640CC8F16881F81F82C2C107F7EFAAAB7A7
      60C2555CD1E80E644FFCF6061A8DD2E068CC07CAED8446E351A0ED9128E9C0B6
      2145904F561C9C90FE0313122303E314505A804AE701C57281626DA084044CD6
      F6C0648D9A90C08634A60AF2C988614FCA10FE4AA0E62C98669C99C9B9374F9B
      4380172533FDFCFC7503D0CFF833133900008F36D2119D0274F2000000004945
      4E44AE426082}
    Appearance.Normal.Border.Color = 7368816
    Appearance.Normal.Color = 15987699
    Appearance.Normal.Font.Charset = DEFAULT_CHARSET
    Appearance.Normal.Font.Color = clBlack
    Appearance.Normal.Font.Height = -11
    Appearance.Normal.Font.Name = 'Tahoma'
    Appearance.Normal.Font.Style = []
    Appearance.Normal.Gradient.SpeedPercent = 100
    Appearance.Normal.Gradient.ColorFrom = 15856113
    Appearance.Normal.Gradient.ColorTo = 13619151
    Appearance.Hot.Border.Color = 11632444
    Appearance.Hot.Color = 16578024
    Appearance.Hot.Font.Charset = DEFAULT_CHARSET
    Appearance.Hot.Font.Color = clBlack
    Appearance.Hot.Font.Height = -11
    Appearance.Hot.Font.Name = 'Tahoma'
    Appearance.Hot.Font.Style = []
    Appearance.Hot.Gradient.SpeedPercent = 100
    Appearance.Hot.Gradient.ColorFrom = 16643818
    Appearance.Hot.Gradient.ColorTo = 16112039
    Appearance.Down.Border.Color = 5849118
    Appearance.Down.Color = 15852229
    Appearance.Down.Font.Charset = DEFAULT_CHARSET
    Appearance.Down.Font.Color = clBlack
    Appearance.Down.Font.Height = -11
    Appearance.Down.Font.Name = 'Tahoma'
    Appearance.Down.Font.Style = []
    Appearance.Down.Gradient.SpeedPercent = 100
    Appearance.Down.Gradient.ColorFrom = 16577765
    Appearance.Down.Gradient.ColorTo = 14662002
    Appearance.Disabled.Border.Color = 11907757
    Appearance.Disabled.Color = 16053492
    Appearance.Disabled.Font.Charset = DEFAULT_CHARSET
    Appearance.Disabled.Font.Color = 10526880
    Appearance.Disabled.Font.Height = -11
    Appearance.Disabled.Font.Name = 'Tahoma'
    Appearance.Disabled.Font.Style = []
    Appearance.Disabled.Gradient.SpeedPercent = 100
    Appearance.Disabled.Gradient.ColorFrom = 16053492
    Appearance.Disabled.Gradient.ColorTo = 16053492
    Appearance.Disabled.SubCaptionColor = 10526880
    Appearance.Focused.Border.Color = 13675044
    Appearance.Focused.Color = 15987699
    Appearance.Focused.Font.Charset = DEFAULT_CHARSET
    Appearance.Focused.Font.Color = clBlack
    Appearance.Focused.Font.Height = -11
    Appearance.Focused.Font.Name = 'Tahoma'
    Appearance.Focused.Font.Style = []
    Appearance.Focused.Gradient.SpeedPercent = 100
    Appearance.Focused.Gradient.ColorFrom = 15856113
    Appearance.Focused.Gradient.ColorTo = 13619151
    Appearance.FocusRect.Pen.Color = 13675044
    Appearance.BorderWhenDefault.Color = 13675044
    Appearance.SubCaptionFont.Charset = DEFAULT_CHARSET
    Appearance.SubCaptionFont.Color = clWindowText
    Appearance.SubCaptionFont.Height = -11
    Appearance.SubCaptionFont.Name = 'Tahoma'
    Appearance.SubCaptionFont.Style = []
  end
  object Actions: TActionList
    Left = 72
    Top = 264
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = actEscExecute
    end
    object actSetSelectedResolution: TAction
      Caption = 'Set resolution'
      ShortCut = 120
      OnExecute = actSetSelectedResolutionExecute
    end
    object actExit: TAction
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actAbout: TAction
      Caption = 'About...'
      Hint = 'About...'
      OnExecute = actAboutExecute
    end
    object actShowLangMenu: TAction
      Hint = 'Language'
      OnExecute = actShowLangMenuExecute
    end
    object actUpdateLangMenu: TAction
      Caption = 'actUpdateLangMenu'
      ShortCut = 24699
      OnExecute = actUpdateLangMenuExecute
    end
  end
  object AppHint: TJppHtmlHint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Appearance.LightModeColors.ArrowBackground = 16358206
    Appearance.LightModeColors.ArrowRectBorder = 14906630
    Appearance.LightModeColors.mclDarkGreen = 5807415
    Appearance.DarkModeColors.Background = 3881787
    Appearance.DarkModeColors.Text = 13882323
    Appearance.DarkModeColors.Border = 3223857
    Appearance.DarkModeColors.Arrow = 15658734
    Appearance.DarkModeColors.ArrowBackground = 1644825
    Appearance.DarkModeColors.ArrowRectBorder = clBlack
    Appearance.DarkModeColors.mclDarkGray = 7368816
    Appearance.DarkModeColors.mclLightGray = 12171705
    Appearance.DarkModeColors.mclDarkBlue = 15890688
    Appearance.DarkModeColors.mclLightBlue = 16756318
    Appearance.DarkModeColors.mclDarkGreen = 3779635
    Appearance.DarkModeColors.mclLightGreen = 5762651
    Appearance.DarkModeColors.mclDarkRed = 2368767
    Appearance.DarkModeColors.mclLightRed = 7303167
    Appearance.DarkModeColors.mclDarkCyan = 13553152
    Appearance.DarkModeColors.mclLightCyan = 16777041
    Appearance.DarkModeColors.mclDarkMagenta = 16719103
    Appearance.DarkModeColors.mclLightMagenta = 16745727
    Appearance.DarkModeColors.mclDarkYellow = 48857
    Appearance.DarkModeColors.mclLightYellow = 7335423
    Left = 288
    Top = 224
  end
  object popLang: TPopupMenu
    Left = 248
    Top = 312
    object aa1: TMenuItem
      Caption = 'aa'
    end
  end
end
