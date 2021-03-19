unit QCRES.FormAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, DzHTMLText2, JPL.Strings;

type
  TFormAbout = class(TForm)
    Actions: TActionList;
    actEsc: TAction;
    htt: TDzHTMLText2;
    procedure FormCreate(Sender: TObject);
    procedure actEscExecute(Sender: TObject);
    procedure FixHtmText;
  end;

var
  FormAbout: TFormAbout;

implementation

uses
  QCRES.FormMain, QCRES.Types;

{$R *.dfm}


procedure TFormAbout.FormCreate(Sender: TObject);
begin
  Caption := 'About';
  htt.Align := alClient;
  Font.Name := FormMain.Font.Name;
  Font.Size := FormMain.Font.Size;
  FixHtmText;
end;

procedure TFormAbout.FixHtmText;
var
  s: string;
begin
  s := htt.Text;

  s := ReplaceAll(s, '%APP_NAME%', APP_NAME);
  s := ReplaceAll(s, '%APP_VERSION%', APP_VER_STR + '  ' + APP_BITS + '-bit');
  s := ReplaceAll(s, '%APP_DATE%', RELEASE_DATE_STR);
  s := ReplaceAll(s, '%APP_URL%', URL_HOMEPAGE);
  s := ReplaceAll(s, '%APP_LICENSE%', APP_LICENSE);
  s := ReplaceAll(s, '%GITHUB_URL%', URL_GITHUB);
  s := ReplaceAll(s, '%DONATION%', 'Donation');

  htt.Text := s;
end;

procedure TFormAbout.actEscExecute(Sender: TObject);
begin
  Close;
end;



end.
