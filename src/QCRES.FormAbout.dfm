object FormAbout: TFormAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FormAbout'
  ClientHeight = 335
  ClientWidth = 483
  Color = 14145495
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object htt: TDzHTMLText2
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 462
    Height = 329
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Text = 
      '<bbc:#FDF4B7>'#13#10'<c><fs:14><b>%APP_NAME%</b></fs>'#13#10#13#10'<fs:12>Versio' +
      'n %APP_VERSION%</fs>'#13#10'<fs:10>%APP_DATE%</fs>'#13#10'<fs:10>%APP_LICENS' +
      'E%</fs>'#13#10#13#10'<fs:10><a:%APP_URL%>%APP_URL%</a>'#13#10'<a:%GITHUB_URL%>%G' +
      'ITHUB_URL%</a>'#13#10'<a:https://www.pazera-software.com/donation/>%DO' +
      'NATION%</a></fs></c>'#13#10' '#13#10'<bbc:#D2E8DA><ln:#A9D3BA>'#13#10'<t:14><h3>Op' +
      'en source projects / components used in the program</h3>'#13#10#13#10'<li>' +
      'JPPack: <a:https://github.com/jackdp/JPPack>https://github.com/j' +
      'ackdp/JPPack</a>'#13#10'<li>JPLib: <a:https://github.com/jackdp/JPLib>' +
      'https://github.com/jackdp/JPLib</a>'#13#10'<li>JPModLib: <a:https://gi' +
      'thub.com/jackdp/JPModLib>https://github.com/jackdp/JPModLib</a> ' +
      #13#10'<li>JVCL: <a:https://github.com/project-jedi/jvcl>https://gith' +
      'ub.com/project-jedi/jvcl</a>'#13#10'<li>DzHTMLText2: <a:https://github' +
      '.com/jackdp/DzHTMLText2>https://github.com/jackdp/DzHTMLText2</a' +
      '> (<a:https://github.com/digao-dalpiaz/DzHTMLText>DzHTMLText</a>' +
      ' fork)'#13#10'</fs>'
    StyleLinkNormal.FontColor = 16089098
    StyleLinkHover.FontColor = 1908171
    TagH1Params.Font.Charset = DEFAULT_CHARSET
    TagH1Params.Font.Color = clWindowText
    TagH1Params.Font.Height = -24
    TagH1Params.Font.Name = 'Arial'
    TagH1Params.Font.Style = [fsBold]
    TagH2Params.Font.Charset = DEFAULT_CHARSET
    TagH2Params.Font.Color = clWindowText
    TagH2Params.Font.Height = -20
    TagH2Params.Font.Name = 'Arial'
    TagH2Params.Font.Style = [fsBold]
    TagH3Params.Font.Charset = DEFAULT_CHARSET
    TagH3Params.Font.Color = clWindowText
    TagH3Params.Font.Height = -15
    TagH3Params.Font.Name = 'Arial'
    TagH3Params.Font.Style = [fsBold]
    ExtraLineSpacing = 1
    TagLIParams.Margin = 26
    Border.Pen.Color = clGray
    Border.Visible = True
    ExplicitHeight = 305
  end
  object Actions: TActionList
    Left = 80
    Top = 32
    object actEsc: TAction
      Caption = 'actEsc'
      ShortCut = 27
      OnExecute = actEscExecute
    end
  end
end
