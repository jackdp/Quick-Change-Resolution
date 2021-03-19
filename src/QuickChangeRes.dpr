program QuickChangeRes;

// Disable extended RTTI
{$IF CompilerVersion >= 21.0} // >= Delphi 2010
  {$WEAKLINKRTTI ON}
  {$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}

{$SetPEFlags 1}   // IMAGE_FILE_RELOCS_STRIPPED
{$SetPEFlags $20} // IMAGE_FILE_LARGE_ADDRESS_AWARE

uses
  Winapi.Windows,
  Vcl.Forms, Vcl.Graphics, System.SysUtils,
  JPL.Strings, JPL.Conversion, JPL.CmdLineParser, JPL.Dialogs,       JPL.DateTime,

  QCRES.FormMain in 'QCRES.FormMain.pas',
  QCRES.Types in 'QCRES.Types.pas',
  QCRES.Procs in 'QCRES.Procs.pas',
  QCRES.MemIniFile.Helper in 'QCRES.MemIniFile.Helper.pas',
  QCRES.FormAbout in 'QCRES.FormAbout.pas',
  QCRES.AppStrings in 'QCRES.AppStrings.pas';

{$R *.res}



{$region '                 ProcessRunParams                    '}
procedure ProcessRunParams;
var
  Cmd: TJPCmdLineParser;
  xw, xh: DWORD;
  s: string;
  CurrentUser, AllUsers: Boolean;
  wsp: TWinStrParams;
  Arr: TResArray;
  i: integer;
  DeviceInfo: TDisplayDeviceInfo;
begin
  Cmd := TJPCmdLineParser.Create;
  try

    Cmd.RegisterOption('lo', 'list-options', cvtNone, False, False, 'Lists available options.', '', 'MAIN');
    Cmd.RegisterOption('lr', 'list-resolutions', cvtNone, False, False, 'Lists available resolutions.', '', 'MAIN');
    Cmd.RegisterOption('r', 'set-resolution', cvtRequired, True, False, 'Sets the given resolution.', 'WxH', 'MAIN');
    Cmd.RegisterOption('u', 'user', cvtNone, False, False, 'Writes a new resolution to the system registry (for the current user).', '', 'MAIN');
    Cmd.RegisterOption('a', 'all', cvtNone, False, False, 'Writes a new resolution to the system registry (for all users).', '', 'MAIN');

    Cmd.Parse;

    wsp.FormCaption := APP_FULL_NAME;
    wsp.FormWidth := 740;
    wsp.FormHeight := 360;
    wsp.FormColor := clBtnFace;
    wsp.MemoBgColor := clWindow;
    wsp.MemoFontName := 'Consolas';
    wsp.MemoFontSize := 9;
    wsp.MemoFontColor := clWindowText;

    if Cmd.ErrorCount > 0 then
    begin
      wsp.MemoText := Cmd.ErrorsStr;
      ShowWinStr(wsp);
      Exit;
    end;

    // list of options
    if Cmd.IsOptionExists('lo') then
    begin
      s := APP_FULL_NAME + ENDL + ENDL + 'Available options:' + ENDL;
      s := s + Cmd.OptionsUsageStr('  ', 'MAIN', 110, '   ', 30);
      wsp.MemoText := s;
      ShowWinStr(wsp);
      Exit;
    end;

    // resolution list
    if Cmd.IsOptionExists('lr') then
    begin
      if not GetDisplayDeviceInfo(0, DeviceInfo) then
      begin
        wsp.MemoText := 'Unable to retrieve the list of available resolutions.';
        ShowWinStr(wsp);
        Exit;
      end;

      GetDisplayDeviceResolutions(0, DeviceInfo.BitsPerPixel, Arr);
      s := '';
      for i := 0 to High(Arr) do
        s := s + itos(Arr[i].Width) + 'x' + itos(Arr[i].Height) + ENDL;
      wsp.MemoText := 'Available resolutions:' + ENDL + ENDL + s;
      ShowWinStr(wsp);

      Exit;
    end;

    s := Cmd.GetOptionValue('r');

    if not TryGetRes(s, xw, xh) then
    begin
      ShowWinStr('Invalid resolution value: ' + s, APP_NAME);
      Exit;
    end;

    CurrentUser := Cmd.IsOptionExists('u');
    AllUsers := Cmd.IsOptionExists('a');

    if not ChangeDisplayResolution(0, xw, xh, CurrentUser, AllUsers) then
    begin
      ShowWinStr('The resolution cannot be set: ' + s, APP_NAME);
      Exit;
    end;

  finally
    Cmd.Free;
  end;
end;
{$endregion ProcessRunParams}


begin
  if ParamCount > 0 then
  begin
    ProcessRunParams;
    Exit;
  end;

  Application.Initialize;
  Application.MainFormOnTaskBar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAbout, FormAbout);

  ///////////////////////////////////////////// LANGUAGE ////////////////////////////////////////////////
  if Assigned(LangMgr) and (FileExists(LanguageIni)) then LangMgr.SetActiveLanguageByIniFileName(LanguageIni);
  FormMain.SetLang;
  //FormAbout.SetLang;
  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  Application.Run;
end.

