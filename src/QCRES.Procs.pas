unit QCRES.Procs;

interface

uses
  Winapi.Windows, Winapi.ShellAPI,
  System.SysUtils,
  Vcl.Forms,
  JPL.Conversion,
  QCRES.Types;



function ChangeDisplayResolution(const DisplayDeviceIndex, NewWidth, NewHeight: DWORD; const Permanent, Global: Boolean): Boolean;
procedure GetDisplayDeviceResolutions(const DeviceNo, BitsPerPixel: DWORD; var Arr: TResArray);
function GetDisplayDeviceInfo(const DeviceHandle: THandle; var DeviceInfo: TDisplayDeviceInfo): Boolean;
function TryGetRes(const s: string; out Width, Height: DWORD): Boolean;
procedure GoToUrl(const URL: string);
procedure CenterForm(Form: TForm);



implementation


procedure GoToUrl(const URL: string);
begin
  ShellExecute(0, 'open', PChar(URL), '', '', SW_SHOW);
end;

function TryGetRes(const s: string; out Width, Height: DWORD): Boolean;
var
  xp: integer;
  sw, sh: string;
begin
  Result := False;
  xp := Pos('x', s);
  if xp <= 0 then Exit;

  sw := Copy(s, 1, xp - 1);
  sw := Trim(sw);
  sh := Copy(s, xp + 1, Length(s));
  sh := Trim(sh);


  if not TryStrToDWord(sw, Width) then Exit;
  if not TryStrToDWord(sh, Height) then Exit;
  Result := True;
end;

function GetDisplayDeviceInfo(const DeviceHandle: THandle; var DeviceInfo: TDisplayDeviceInfo): Boolean;
var
  DC: THandle;
begin
  Result := False;
  DeviceInfo.Clear;
  DC := GetDC(DeviceHandle);
  if DC = 0 then Exit;
  try
    DeviceInfo.Resolution.Width := GetDeviceCaps(DC, HORZRES);
    DeviceInfo.Resolution.Height := GetDeviceCaps(DC, VERTRES);
    DeviceInfo.Resolution.WidthMM := GetDeviceCaps(DC, HORZSIZE);
    DeviceInfo.Resolution.HeightMM := GetDeviceCaps(DC, VERTSIZE);
    DeviceInfo.BitsPerPixel := GetDeviceCaps(DC, BITSPIXEL);
    Result := True;
  finally
    ReleaseDC(DeviceHandle, DC);
  end;
end;

procedure GetDisplayDeviceResolutions(const DeviceNo, BitsPerPixel: DWORD; var Arr: TResArray);
var
  xWidth, xHeight, PrevWidth, PrevHeight, ModeNum: integer;
  DeviceMode: TDeviceMode;

  procedure Add;
  begin
    SetLength(Arr, Length(Arr) + 1);
    Arr[High(Arr)].Width := xWidth;
    Arr[High(Arr)].Height := xHeight;
  end;

begin
  SetLength(Arr, 0);

  if not EnumDisplaySettings(nil, ENUM_CURRENT_SETTINGS, DeviceMode) then Exit;

  PrevWidth := -1;
  PrevHeight := -1;
  ModeNum := 0;

  while True do
  begin
    Inc(ModeNum);

    if not EnumDisplaySettings(nil, ModeNum, DeviceMode) then Break;
    if DeviceMode.dmBitsPerPel <> BitsPerPixel then Continue;

    xWidth := DeviceMode.dmPelsWidth;
    xHeight := DeviceMode.dmPelsHeight;

    if (xWidth = PrevWidth) and (xHeight = PrevHeight) then Continue;

    PrevWidth := xWidth;
    PrevHeight := xHeight;

    Add;
  end;
end;


{$region '                      ChangeDisplayResolution                       '}
function ChangeDisplayResolution(const DisplayDeviceIndex, NewWidth, NewHeight: DWORD; const Permanent, Global: Boolean): Boolean;
var
  DeviceMode: TDeviceMode;
  DisplayDevice: TDisplayDevice;
  Flags: Cardinal;
begin
  Result := False;
  FillChar(DisplayDevice, SizeOf(TDisplayDevice), 0);
  DisplayDevice.cb := SizeOf(TDisplayDevice);

  if EnumDisplayDevices(nil, DisplayDeviceIndex, DisplayDevice, 0) then
  begin
    FillChar(DeviceMode, SizeOf(TDeviceMode), 0);
    DeviceMode.dmSize := SizeOf(TDeviceMode);
    DeviceMode.dmPelsWidth := NewWidth;
    DeviceMode.dmPelsHeight := NewHeight;
    DeviceMode.dmFields := DM_PELSWIDTH or DM_PELSHEIGHT;

    // Sprawdzenie, czy podana rozdzielczoœæ mo¿e byæ ustawiona
    if not ChangeDisplaySettingsEx(
         PChar(@DisplayDevice.DeviceName[0]),
         DeviceMode,
         0,
         CDS_TEST,
         nil
      ) = DISP_CHANGE_SUCCESSFUL then Exit;

    // Flags
    //   CDS_UPDATEREGISTRY - zmiana rozdzielczoœci bêdzie permanentna (zostanie zapisana w rejestrze) - for current user only
    //   CDS_GLOBAL - for all users
    //   0 - current session only
    // https://docs.microsoft.com/pl-pl/windows/win32/api/winuser/nf-winuser-changedisplaysettingsexw

    if (Permanent or Global) then
    begin
      Flags := CDS_UPDATEREGISTRY;
      if Global then Flags := Flags or CDS_GLOBAL;
    end
    else
      Flags := 0;

    Result := ChangeDisplaySettingsEx(
      PChar(@DisplayDevice.DeviceName[0]),
      DeviceMode,
      0,
      Flags,
      nil
    ) = DISP_CHANGE_SUCCESSFUL;
  end;
end;
{$endregion ChangeDisplayResolution}


procedure CenterForm(Form: TForm);
begin
  Form.Left := (Screen.Width div 2) - (Form.Width div 2);
  Form.Top := (Screen.Height div 2) - (Form.Height div 2);
end;


end.
