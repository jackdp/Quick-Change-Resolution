unit QCRES.FormMain;

interface

uses

  // Win API
  Winapi.Windows,

  // System
  System.Classes, System.SysUtils, System.Actions,

  // VCL
  Vcl.Forms, Vcl.Controls, Vcl.Graphics,
  Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,

  // JPLib
  JPL.Strings, JPL.TStr, JPL.Conversion, JPL.MemIniFile,

  // JPPack
  JPP.Labels, JPP.Common.Procs,
  JPP.DoubleLineLabel, JPP.SimplePanel, JPP.BasicPngButtonEx, JPP.CheckBox, JPP.HtmlHint,

  // JP - JVCL
  JpJvCheckBox, JpJvRadioButton,

  // JVCL
  JvExStdCtrls, JvCheckBox, JvRadioButton, JvExComCtrls, JvListView,


  QCRES.Types, QCRES.Procs, QCRES.MemIniFile.Helper, QCRES.FormAbout, QCRES.AppStrings, Vcl.Menus;


type

  TFormMain = class(TForm)
    actEsc: TAction;
    actSetSelectedResolution: TAction;
    Actions: TActionList;
    dlblCurrentWidth: TJppDoubleLineLabel;
    dlblCurrentHeight: TJppDoubleLineLabel;
    pnLeft: TJppSimplePanel;
    lblCurrentResolution: TJppShadowLabel;
    pnCurrentResolution: TJppSimplePanel;
    lv: TJvListView;
    lblAvailableResolutions: TJppShadowLabel;
    btnSetSelectedResolution: TJppBasicPngButtonEx;
    lblInfo: TJppLabel;
    AppHint: TJppHtmlHint;
    chPermanent: TJPJvCheckBox;
    rbCurrentUser: TJPJvRadioButton;
    rbAllUsers: TJPJvRadioButton;
    actExit: TAction;
    actAbout: TAction;
    btnAbout: TJppBasicPngButtonEx;
    btnExit: TJppBasicPngButtonEx;
    btnLang: TJppBasicPngButtonEx;
    popLang: TPopupMenu;
    aa1: TMenuItem;
    actShowLangMenu: TAction;
    actUpdateLangMenu: TAction;    procedure actEscExecute(Sender: TObject);
    procedure actSetSelectedResolutionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GetResolutions(const DeviceNo: DWORD);
    procedure lvColumnClick(Sender: TObject; Column: TListColumn);
    procedure SelectResolution(const AWidth, AHeight: integer);
    procedure PrepareControls;
    procedure InitControls;
    procedure InitCtrls(Sender: TObject);
    procedure InitLang;
    procedure SetLang;
    procedure UpdateLangMenu;
    procedure ChangeLanguage(Sender: TObject);
    procedure SaveSettingsToIni;
    procedure LoadSettingsFromIni;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lvCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure actExitExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actShowLangMenuExecute(Sender: TObject);
    procedure actUpdateLangMenuExecute(Sender: TObject);
    procedure FixMainWindowPos;
  private
  public
  end;

var
  FormMain: TFormMain;
  bSortAscending: Boolean;
  IniFile: string;
  LangDir: string;
  LanguageIni: string;
  CurrentRes: TResolution;


implementation


{$R *.dfm}



{$region '                   Create & Close                        '}
procedure TFormMain.FormCreate(Sender: TObject);
begin
  Caption := APP_FULL_NAME;
  Application.Title := APP_FULL_NAME;
  bSortAscending := True;
  IniFile := ChangeFileExt(ParamStr(0), '.ini');
  LangDir := Rbs(ExtractFileDir(ParamStr(0))) + PathDelim + 'lang';
  Application.HintHidePause := 15000;

  Constraints.MinWidth := 399;
  Constraints.MaxWidth := 460;
  Constraints.MinHeight := 288;

  PrepareControls;
  InitLang;
  InitLangMgr;
  PrepareModuleStrings_Main;

  LoadSettingsFromIni;

  GetResolutions(0);

  InitControls;
  UpdateLangMenu;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettingsToIni;
  if Assigned(LangMgr) then LangMgr.Free;
end;

{$endregion Create & Close}


procedure TFormMain.PrepareControls;
begin
  lv.Items.Clear;
  lv.Align := alClient;
  dlblCurrentWidth.RightCaption := '';
  dlblCurrentHeight.RightCaption := '';
  Font.Name := GetFontName(['Segoe UI', 'Tahoma', 'Verdana']);
  if Font.Name = 'Segoe UI' then Font.Size := 9 else Font.Size := 8;
  dlblCurrentWidth.RightCaptionFont.Name := Font.Name;
  dlblCurrentHeight.RightCaptionFont.Name := Font.Name;
  SetJppBasicPngButtonExFonts(btnSetSelectedResolution, Font.Name, Font.Size);
  AppHint.Font.Name := Font.Name;
  AppHint.Font.Size := Font.Size;

  btnExit.Appearance.Assign(btnSetSelectedResolution.Appearance);
  btnAbout.Appearance.Assign(btnSetSelectedResolution.Appearance);
  btnAbout.Appearance.ShowCaption := False;
  btnLang.Appearance.Assign(btnSetSelectedResolution.Appearance);
  btnLang.Appearance.ShowCaption := False;

  btnSetSelectedResolution.Appearance.Normal.Font.Style := [fsBold];
  btnSetSelectedResolution.Appearance.Hot.Font.Style := [fsBold];
  btnSetSelectedResolution.Appearance.Down.Font.Style := [fsBold];
  btnSetSelectedResolution.Appearance.Focused.Font.Style := [fsBold];
  btnSetSelectedResolution.Appearance.Disabled.Font.Style := [fsBold];
end;

procedure TFormMain.InitControls;
begin
  if (not rbCurrentUser.Checked) and (not rbAllUsers.Checked) then rbCurrentUser.Checked := True;
  rbCurrentUser.Enabled := chPermanent.Checked;
  rbAllUsers.Enabled := chPermanent.Checked;
end;



procedure TFormMain.InitCtrls(Sender: TObject);
begin
  InitControls;
end;

{$region '                             Language                               '}

  {$REGION '             InitLang              '}
procedure TFormMain.InitLang;
var
  fName: string;
begin
  fName := '';
  if not FileExists(IniFile) then
  begin

    case SysLocale.PriLangID of
      LANG_POLISH: fName := 'Polish.ini';
      LANG_ALBANIAN: fName := 'Albanian.ini';
      LANG_ARABIC: fName := 'Arabic.ini';
      LANG_BELARUSIAN: fName := 'Belarusian.ini';
      LANG_BULGARIAN: fName := 'Bulgarian.ini';
      LANG_CHINESE: fName := 'Chinese_Simplified.ini';
      LANG_CROATIAN: fName := 'Croatian.ini'; // LANG_SERBIAN = LANG_CROATIAN = $1A
      LANG_CZECH: fName := 'Czech.ini';
      LANG_DANISH: fName := 'Danish.ini';
      LANG_DUTCH: fName := 'Dutch.ini';
      LANG_ESTONIAN: fName := 'Estonian.ini';
      LANG_FINNISH: fName := 'Finnish.ini';
      LANG_FRENCH: fName := 'French.ini';
      LANG_GERMAN: fName := 'German.ini';
      LANG_GREEK: fName := 'Greek.ini';
      LANG_HEBREW: fName := 'Hebrew.ini';
      LANG_HUNGARIAN: fName := 'Hungarian.ini';
      LANG_ICELANDIC: fName := 'Icelandic.ini';
      LANG_ITALIAN: fName := 'Italian.ini';
      LANG_JAPANESE: fName := 'Japanese.ini';
      LANG_KOREAN: fName := 'Korean.ini';
      LANG_LATVIAN: fName := 'Latvian.ini';
      LANG_LITHUANIAN: fName := 'Lithuanian.ini';
      LANG_NORWEGIAN: fName := 'Norwegian.ini';
      LANG_PORTUGUESE: fName := 'Portuguese_BR.ini';
      LANG_ROMANIAN: fName := 'Romanian.ini';
      LANG_RUSSIAN: fName := 'Russian.ini';
      //LANG_SERBIAN: fName := 'Serbian.ini';  LANG_SERBIAN = LANG_CROATIAN
      LANG_SLOVAK: fName := 'Slovak.ini';
      LANG_SLOVENIAN: fName := 'Slovenian.ini';
      LANG_SPANISH: fName := 'Spanish.ini';
      LANG_SWEDISH: fName := 'Swedish.ini';
      LANG_THAI: fName := 'Thai.ini';
      LANG_TURKISH: fName := 'Turkish.ini';
      LANG_UKRAINIAN: fName := 'Ukrainian.ini';
      LANG_VIETNAMESE: fName := 'Vietnamese.ini';
      else fName := 'English.ini';
    end;

    if fName <> '' then fName := LangDir + '\' + fName;
    if FileExists(fName) then LanguageIni := fName;

  end;

end;
  {$ENDREGION InitLang}

procedure TFormMain.SetLang;
var
  sWidth, sHeight: string;
begin
  sWidth := lsMain.GetString('Width', 'Width');
  sHeight := lsMain.GetString('Height', 'Height');

  lv.Columns[0].Caption := lsMain.GetString('No', 'No');
  lv.Columns[1].Caption := sWidth;
  lv.Columns[2].Caption := sHeight;
  dlblCurrentWidth.Caption := sWidth + ':';
  dlblCurrentHeight.Caption := sHeight + ':';
end;

procedure TFormMain.UpdateLangMenu;
var
  sl: TStringList;
  Item: TMenuItem;
  i, xInd: integer;
begin
  popLang.Items.Clear;
  xInd := LangMgr.GetLangIndexByFileName(LanguageIni);
  sl := TStringList.Create;
  try
    LangMgr.GetLanguageNames_EnglishAndNative(sl, ' - ');
    for i := 0 to sl.Count - 1 do
    begin
      Item := TMenuItem.Create(popLang);
      Item.Caption := sl[i];
      Item.Tag := i;
      if i = xInd then Item.Checked := True;
      Item.OnClick := ChangeLanguage;
      popLang.Items.Add(Item);
    end;
  finally
    sl.Free;
  end;
end;

procedure TFormMain.ChangeLanguage(Sender: TObject);
var
  Item: TMenuItem;
  i, xInd: integer;
begin
  if not (Sender is TMenuItem) then Exit;
  Item := Sender as TMenuItem;
  LangMgr.SetActiveLanguageByIndex(Item.Tag);
  xInd := Item.Tag;
  LanguageIni := LangMgr.GetLanguageFileNameByIndex(xInd);
  for i := 0 to popLang.Items.Count - 1 do
  begin
    Item := popLang.Items[i];
    Item.Checked := i = xInd;
  end;

  SetLang;
end;

procedure TFormMain.actShowLangMenuExecute(Sender: TObject);
begin
  popLang.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFormMain.actUpdateLangMenuExecute(Sender: TObject);
begin
  UpdateLangMenu;
  LangMgr.SetActiveLanguageByIniFileName(LanguageIni);
  SetLang;
  //FormAbout.SetLang;
end;

{$endregion Language}

procedure TFormMain.GetResolutions(const DeviceNo: DWORD);
var
  xWidth, xHeight, i: integer;
  li: TListItem;
  Arr: TResArray;
  DeviceInfo: TDisplayDeviceInfo;

  procedure Add;
  begin
    SetLength(Arr, Length(Arr) + 1);
    Arr[High(Arr)].Width := xWidth;
    Arr[High(Arr)].Height := xHeight;
  end;

begin

  dlblCurrentWidth.RightCaption := '';
  dlblCurrentHeight.RightCaption := '';
  lv.Items.Clear;

  if not GetDisplayDeviceInfo(Handle, DeviceInfo) then Exit;

  CurrentRes := DeviceInfo.Resolution;

  dlblCurrentWidth.RightCaption := IntToStrEx(CurrentRes.Width) + ' pix   (' + IntToStrEx(CurrentRes.WidthMM) + ' mm)';
  dlblCurrentHeight.RightCaption := IntToStrEx(CurrentRes.Height) + ' pix   (' + IntToStrEx(CurrentRes.HeightMM) + ' mm)';

  GetDisplayDeviceResolutions(DeviceNo, DeviceInfo.BitsPerPixel, Arr);

  lv.Items.BeginUpdate;
  try

    for i := High(Arr) downto 0 do
    begin
      li := lv.Items.Add;
      li.Caption := itos(lv.Items.Count);
      li.SubItems.Add(IntToStrEx(Arr[i].Width));
      li.SubItems.Add(IntToStrEx(Arr[i].Height));
    end;

    SelectResolution(CurrentRes.Width, CurrentRes.Height);


  finally
    lv.Items.EndUpdate;
  end;
end;

procedure TFormMain.SelectResolution(const AWidth, AHeight: integer);
var
  i, xw, xh: integer;
  li: TListItem;
begin
  for i := 0 to lv.Items.Count - 1 do
  begin
    li := lv.Items[i];
    xw := StrToIntDef(RemoveSpaces(li.SubItems[0]), -1);
    xh := StrToIntDef(RemoveSpaces(li.SubItems[1]), -1);
    if (xw = AWidth) and (xh = AHeight) then
    begin
      lv.Items[i].Selected := True;
      Break;
    end;
  end;
end;

procedure TFormMain.actSetSelectedResolutionExecute(Sender: TObject);
var
  li: TListItem;
  xWidth, xHeight: integer;
begin
  li := lv.Selected;
  if li = nil then Exit;
  xWidth := stoi(RemoveSpaces(li.SubItems[0]));
  xHeight := stoi(RemoveSpaces(li.SubItems[1]));

  ChangeDisplayResolution(0, xWidth, xHeight, chPermanent.Checked, rbAllUsers.Checked);
  FixMainWindowPos;

  GetResolutions(0);
end;

procedure TFormMain.FixMainWindowPos;
begin
  if
    (Left < 0) or (Left > Screen.Width - Width) or
    (Top < 0) or (Top > Screen.Height - Height)
  then
    CenterForm(Self);
end;




{$region '                   Load & Save settings                       '}
procedure TFormMain.LoadSettingsFromIni;
var
  Ini: TJppMemIniFile;
  s: string;
begin
  if not FileExists(IniFile) then Exit;
  Ini := TJppMemIniFile.Create(IniFile, TEncoding.UTF8);
  try

    Ini.CurrentSection := 'MAIN';

    Ini.ReadFormPos(Self);
    FixMainWindowPos;

    actEsc.Enabled := Ini.ReadBool('EscExit', False);

    s := LangDir + PathDelim + Ini.ReadString('LanguageFile', LanguageIni);
    if FileExists(s) then LanguageIni := s;

    Ini.ReadCheckBox(chPermanent);
    Ini.ReadRadioButton(rbCurrentUser);
    Ini.ReadRadioButton(rbAllUsers);

  finally
    Ini.Free;
  end;
end;

procedure TFormMain.SaveSettingsToIni;
var
  Ini: TJppMemIniFile;
begin
  Ini := TJppMemIniFile.Create(IniFile, TEncoding.UTF8);
  try

    Ini.CurrentSection := 'MAIN';

    Ini.WriteFormPos(Self);

    Ini.WriteString('LanguageFile', ExtractFileName(LanguageIni));

    Ini.WriteCheckBox(chPermanent);
    Ini.WriteRadioButton(rbCurrentUser);
    Ini.WriteRadioButton(rbAllUsers);

    Ini.UpdateFile;

  finally
    Ini.Free;
  end;
end;
{$endregion Load & Save settings}

{$region '                    Sorting                       '}
function CompareProc(Item1, Item2: TListItem; Param: LPARAM): Integer; stdcall;
var
  s1, s2: string;
begin
  case Param of
    0:
      begin
        s1 := Pad(Item1.Caption, 4, '0');
        s2 := Pad(Item2.Caption, 4 ,'0');
      end;
    1:
      begin
        s1 := Pad(RemoveSpaces(Item1.SubItems[0]), 6, '0');
        s2 := Pad(RemoveSpaces(Item2.SubItems[0]), 6 ,'0');
      end;
    2:
      begin
        s1 := Pad(RemoveSpaces(Item1.SubItems[1]), 6, '0');
        s2 := Pad(RemoveSpaces(Item2.SubItems[1]), 6 ,'0');
      end;
    else Exit(0);
  end;

  Result := CompareStr(s1, s2);
  if not bSortAscending then Result := -Result;
end;

procedure TFormMain.lvColumnClick(Sender: TObject; Column: TListColumn);
begin
  bSortAscending := not bSortAscending;
  lv.CustomSort(@CompareProc, Column.Index);
end;


{$endregion Sorting}

procedure TFormMain.lvCustomDrawItem(Sender: TCustomListView; Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  sWidth, sHeight: string;
  li: TJvListItem;
begin
  if not Assigned(Item) then Exit;

  sWidth := RemoveSpaces(Item.SubItems[0]);
  sHeight := RemoveSpaces(Item.SubItems[1]);
  li := TJvListItem(Item);

  if Length(sHeight) > 3 then
  begin
    // Bold font when Height > 999, so that the user can quickly distinguish between higher and low resolutions.
    li.Font.Style := [fsBold];
  end;

  if (sWidth = itos(CurrentRes.Width)) and (sHeight = itos(CurrentRes.Height)) then
  begin
    li.Font.Style := [fsBold];
    li.Font.Color := RGB(128,000,128);
  end;
end;



procedure TFormMain.actAboutExecute(Sender: TObject);
begin
  FormAbout.Show;
end;

procedure TFormMain.actEscExecute(Sender: TObject);
begin
  if actEsc.Enabled then Close;
end;

procedure TFormMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

end.

