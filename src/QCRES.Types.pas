unit QCRES.Types;

interface

uses
  Winapi.Windows, System.SysUtils;


const
  APP_ID = 58;
  {$IFDEF WIN64} APP_BITS = '64'; {$ELSE} APP_BITS = '32'; {$ENDIF}
  APP_NAME = 'QuickChangeResolution';
  APP_VER_STR = '1.1';
  APP_FULL_NAME = APP_NAME + ' ' + APP_VER_STR + '  [' + APP_BITS + '-bit]';
  RELEASE_DATE_STR = '2021.10.13';
  URL_HOMEPAGE = 'https://www.pazera-software.com/products/quick-change-resolution/';
  URL_DONATION = 'https://www.pazera-software.com/donation/';
  URL_GITHUB = 'https://github.com/jackdp/Quick-Change-Resolution';
  APP_LICENSE = 'Freeware. Open source';

  ENUM_CURRENT_SETTINGS  = DWORD(-1);
  ENUM_REGISTRY_SETTINGS = DWORD(-2);

  EXIT_CODE_OK = 0;
  EXIT_CODE_ERROR = 1;


type


  TResolution = record
    Width: DWORD;
    Height: DWORD;
    WidthMM: DWORD;  // Width in millimeters
    HeightMM: DWORD; // Height in millimeters
    procedure Clear;
    function Valid: Boolean;
  end;

  TResArray = array of TResolution;

  TDisplayDeviceInfo = record
    Resolution: TResolution;
    BitsPerPixel: DWORD;
    procedure Clear;
    function Valid: Boolean;
  end;


implementation



procedure TDisplayDeviceInfo.Clear;
begin
  Resolution.Clear;
  BitsPerPixel := 0;
end;

function TDisplayDeviceInfo.Valid: Boolean;
begin
  Result := (Resolution.Valid) and (BitsPerPixel > 0);
end;



{ TResolution }

procedure TResolution.Clear;
begin
  Width := 0;
  Height := 0;
  WidthMM := 0;
  HeightMM := 0;
end;

function TResolution.Valid: Boolean;
begin
  Result := (Width > 0) and (Height > 0);
end;

end.
