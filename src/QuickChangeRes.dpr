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
  JPL.Strings, JPL.Conversion, JPL.CmdLineParser, JPL.Dialogs,
  JPP.Common.Procs,

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
  s, Category: string;
  CurrentUser, AllUsers: Boolean;
  wsp: TWinStrParams;
  Arr: TResArray;
  i: integer;
  DeviceInfo: TDisplayDeviceInfo;
  xErrors: integer;
begin
  Cmd := TJPCmdLineParser.Create;
  try

    Category := 'MAIN';

    Cmd.RegisterOption('r', 'set-resolution', cvtRequired, True, False, 'Sets the given resolution (W = width, H = height).', 'WxH', Category);
    Cmd.RegisterOption('u', 'user', cvtNone, False, False, 'Writes a new resolution to the system registry (for the current user).', '', Category);
    Cmd.RegisterOption('a', 'all', cvtNone, False, False, 'Writes a new resolution to the system registry (for all users).', '', Category);

    Category := 'HELP';
    Cmd.RegisterLongOption('home', cvtNone, False, False, 'Open program home page in the default browser.', '', Category);
    Cmd.RegisterLongOption('github', cvtNone, False, False, 'Open source code repository on the GitHub.', '', Category);
    Cmd.RegisterOption('h', 'help', cvtNone, False, False, 'Show this help.', '', Category);
    Cmd.RegisterShortOption('?', cvtNone, False, True, 'Show help (hidden).', '', Category); // hidden option

    Cmd.Parse;

    wsp.FormCaption := APP_FULL_NAME;
    wsp.FormWidth := 744;
    wsp.FormHeight := 480;
    wsp.FormColor := clBtnFace;
    wsp.MemoBgColor := clWindow;
    wsp.MemoFontName := GetFontName(['Fira Mono', 'Consolas', 'Courier New']);
    wsp.MemoFontSize := 9;
    wsp.MemoFontColor := clWindowText;


    xErrors := Cmd.ErrorCount;

    // Help, option & resolution list
    if Cmd.IsOptionExists('lo') or Cmd.IsOptionExists('h') or (xErrors > 0) or Cmd.IsOptionExists('?') or (Cmd.IsOptionExists('lr')) then
    begin

      if xErrors > 0 then
      begin
        s :=  Cmd.ErrorsStr + ENDL + ENDL;
        ExitCode := EXIT_CODE_ERROR;
      end;

      s := s + APP_FULL_NAME + '  ' + RELEASE_DATE_STR + ENDL + ENDL;
      s := s + 'Small utility that allows you to quickly change the display resolution' + ENDL + 'of the current monitor.' + ENDL;

      s := s + ENDL + 'Available options:' + ENDL;
      s := s + Cmd.OptionsUsageStr('  ', 'MAIN', 110, '   ', 30);

      s := s + ENDL + ENDL + 'Help and links:' + ENDL;
      s := s + Cmd.OptionsUsageStr('  ', 'HELP', 110, '   ', 30);

      // List of resolutions
      if not GetDisplayDeviceInfo(0, DeviceInfo) then s := s + 'Unable to retrieve the current display device information.'
      else
      begin
        s := s + ENDL + ENDL + 'Current resolution: ' + ENDL +
          '  ' + itos(DeviceInfo.Resolution.Width) + ' x ' + itos(DeviceInfo.Resolution.Height) + ' [pix]' + ENDL +
          '  ' + itos(DeviceInfo.Resolution.WidthMM) + ' x ' + itos(DeviceInfo.Resolution.HeightMM) + ' [mm]';

        GetDisplayDeviceResolutions(0, DeviceInfo.BitsPerPixel, Arr);
        s := s + ENDL + ENDL + 'Resolutions supported by your monitor:' + ENDL;
        for i := 0 to High(Arr) do
          s := s + '  ' + itos(Arr[i].Width) + 'x' + itos(Arr[i].Height) + ENDL;
      end;

      wsp.MemoText := s;
      ShowWinStr(wsp);
      Exit;
    end;

    // home page
    if Cmd.IsLongOptionExists('home') then
    begin
      GoToUrl(URL_HOMEPAGE);
      Exit;
    end;

    // GitHub page
    if Cmd.IsLongOptionExists('github') then
    begin
      GoToUrl(URL_GITHUB);
      Exit;
    end;

    //----------------- Setting new resolution --------------------------
    if Cmd.IsOptionExists('r') then
    begin
      ExitCode := EXIT_CODE_ERROR;
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
        ShowWinStr('The specified resolution cannot be set: ' + s, APP_NAME);
        Exit;
      end;

      ExitCode := EXIT_CODE_OK;
    end
    else
    begin
      if Cmd.IsOptionExists('u') or Cmd.IsOptionExists('a') then
      begin
        ExitCode := EXIT_CODE_ERROR;
        ShowWinStr('You must also specify a new resolution (the "-r" option).', APP_NAME);
        Exit;
      end;
    end;
    //--------------------------------------------------------------------


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
  ///////////////////////////////////////////////////////////////////////////////////////////////////////

  Application.Run;
end.

