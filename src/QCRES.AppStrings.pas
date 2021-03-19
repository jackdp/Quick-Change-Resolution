unit QCRES.AppStrings;

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.IniFiles, System.Generics.Collections,
  Vcl.Menus,
  JPL.Strings, JPL.Conversion, JPL.LangMgr,
  QCRES.Types;


const
  LANG_INI_SECTION_MAIN = 'MAIN';
  LANG_INI_SECTION_ABOUT = 'About';


procedure InitLangMgr;
procedure PrepareModuleStrings_Main;
procedure PrepareModuleStrings_About;

var
  LangMgr: TLangMgr;
  lsMain: TLangSection;
  lsAbout: TLangSection;


implementation

uses
  QCRES.FormMain, QCRES.FormAbout;


procedure InitLangMgr;
begin
  if not Assigned(LangMgr) then LangMgr := TLangMgr.Create;
  LangMgr.AddFilesFromDir(LangDir);
end;


{$region '                              PrepareModuleStrings_Main                                  '}
procedure PrepareModuleStrings_Main;
begin
  if not Assigned(LangMgr) then InitLangMgr;
  if not Assigned(FormMain) then Exit;

  lsMain := LangMgr.AddSection(LANG_INI_SECTION_MAIN);

  with FormMain do
  begin

    lsMain.AddString('No', 'No');
    lsMain.AddString('Width', 'Width');
    lsMain.AddString('Height', 'Height');

    lsMain.AddLabel(lblAvailableResolutions);
    lsMain.AddLabel(lblCurrentResolution);
    lsMain.AddLabel(lblInfo);

    lsMain.AddAction(actSetSelectedResolution);
    lsMain.AddAction(actAbout);
    lsMain.AddAction(actExit);
    lsMain.AddAction(actShowLangMenu);

    lsMain.ac(chPermanent).
      ap('Caption', 'Permanent').
      ap('Hint', 'If checked, the new resolution will be saved in the <b>system registry</b>.\nIf unchecked, the new resolution will ' +
        'only be valid for the <b>current session</b>.'
      );

    lsMain.acc(rbCurrentUser);
    lsMain.acc(rbAllUsers);

  end;

end;
{$endregion PrepareModuleStrings_Main}



{$region '                             PrepareModuleStrings_About                              '}
procedure PrepareModuleStrings_About;
begin
  if not Assigned(LangMgr) then InitLangMgr;
  if not Assigned(FormAbout) then Exit;

  lsAbout := LangMgr.AddSection(LANG_INI_SECTION_ABOUT);

  with FormAbout do
  begin

    lsAbout.AddString('Caption', 'About');

  end;
end;
{$endregion PrepareModuleStrings_About}



initialization

  lsMain := nil;
  lsAbout := nil;

end.



