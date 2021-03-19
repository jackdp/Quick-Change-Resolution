unit QCRES.MemIniFile.Helper;



interface

uses
  SysUtils, Classes, IniFiles,
  Graphics, Dialogs, StdCtrls, Forms, ComCtrls,
  JPL.Conversion, JPL.MemIniFile, JPP.CheckBox, JpJvCheckBox, JpJvRadioButton;


type

  TJppMemIniFileHelper = class helper for TJppMemIniFile
  public
    procedure WriteCheckBox(const Section: string; CheckBox: TJppCheckBox); overload;
    procedure WriteCheckBox(CheckBox: TJppCheckBox); overload;
    procedure ReadCheckBox(const Section: string; CheckBox: TJppCheckBox); overload;
    procedure ReadCheckBox(CheckBox: TJppCheckBox); overload;

    procedure WriteCheckBox(const Section: string; CheckBox: TJPJvCheckBox); overload;
    procedure WriteCheckBox(CheckBox: TJPJvCheckBox); overload;
    procedure ReadCheckBox(const Section: string; CheckBox: TJPJvCheckBox); overload;
    procedure ReadCheckBox(CheckBox: TJPJvCheckBox); overload;

    procedure WriteCheckBox(const Section: string; CheckBox: TJPJvRadioButton); overload;
    procedure WriteCheckBox(CheckBox: TJPJvRadioButton); overload;
    procedure ReadCheckBox(const Section: string; CheckBox: TJPJvRadioButton); overload;
    procedure ReadCheckBox(CheckBox: TJPJvRadioButton); overload;

    procedure WriteComboBoxIndex(const Section: string; ComboBox: TCustomComboBox); overload;
    procedure WriteComboBoxIndex(ComboBox: TCustomComboBox); overload;
    procedure ReadComboBoxIndex(const Section: string; ComboBox: TCustomComboBox); overload;
    procedure ReadComboBoxIndex(ComboBox: TCustomComboBox); overload;
  end;


implementation





{$region '                 TJppCheckBox                  '}
procedure TJppMemIniFileHelper.WriteCheckBox(const Section: string; CheckBox: TJppCheckBox);
begin
  WriteBool(Section, CheckBox.Name, CheckBox.Checked);
end;

procedure TJppMemIniFileHelper.WriteCheckBox(CheckBox: TJppCheckBox);
begin
  WriteCheckBox(CurrentSection, CheckBox);
end;

procedure TJppMemIniFileHelper.ReadCheckBox(const Section: string; CheckBox: TJppCheckBox);
begin
  CheckBox.Checked := ReadBool(Section, CheckBox.Name, CheckBox.Checked);
end;

procedure TJppMemIniFileHelper.ReadCheckBox(CheckBox: TJppCheckBox);
begin
  ReadCheckBox(CurrentSection, CheckBox);
end;
{$endregion TJppCheckBox}

{$region '                 TJPJvCheckBox                  '}
procedure TJppMemIniFileHelper.WriteCheckBox(const Section: string; CheckBox: TJPJvCheckBox);
begin
  WriteBool(Section, CheckBox.Name, CheckBox.Checked);
end;

procedure TJppMemIniFileHelper.WriteCheckBox(CheckBox: TJPJvCheckBox);
begin
  WriteCheckBox(CurrentSection, CheckBox);
end;

procedure TJppMemIniFileHelper.ReadCheckBox(const Section: string; CheckBox: TJPJvCheckBox);
begin
  CheckBox.Checked := ReadBool(Section, CheckBox.Name, CheckBox.Checked);
end;

procedure TJppMemIniFileHelper.ReadCheckBox(CheckBox: TJPJvCheckBox);
begin
  ReadCheckBox(CurrentSection, CheckBox);
end;
{$endregion TJPJvCheckBox}

{$region '                 TJPJvRadioButton                  '}
procedure TJppMemIniFileHelper.WriteCheckBox(const Section: string; CheckBox: TJPJvRadioButton);
begin
  WriteBool(Section, CheckBox.Name, CheckBox.Checked);
end;

procedure TJppMemIniFileHelper.WriteCheckBox(CheckBox: TJPJvRadioButton);
begin
  WriteCheckBox(CurrentSection, CheckBox);
end;

procedure TJppMemIniFileHelper.ReadCheckBox(const Section: string; CheckBox: TJPJvRadioButton);
begin
  CheckBox.Checked := ReadBool(Section, CheckBox.Name, CheckBox.Checked);
end;

procedure TJppMemIniFileHelper.ReadCheckBox(CheckBox: TJPJvRadioButton);
begin
  ReadCheckBox(CurrentSection, CheckBox);
end;
{$endregion TJPJvRadioButton}


{$region '                 TCustomComboBox                  '}
procedure TJppMemIniFileHelper.WriteComboBoxIndex(const Section: string; ComboBox: TCustomComboBox);
begin
  WriteInteger(Section, ComboBox.Name, ComboBox.ItemIndex);
end;

procedure TJppMemIniFileHelper.WriteComboBoxIndex(ComboBox: TCustomComboBox);
begin
  WriteComboBoxIndex(CurrentSection, ComboBox);
end;

procedure TJppMemIniFileHelper.ReadComboBoxIndex(const Section: string; ComboBox: TCustomComboBox);
var
  x: integer;
begin
  x := Ini.ReadInteger(Section, ComboBox.Name, ComboBox.ItemIndex);
  if not (x in [0..ComboBox.Items.Count - 1]) then Exit;
  ComboBox.ItemIndex := x;
end;

procedure TJppMemIniFileHelper.ReadComboBoxIndex(ComboBox: TCustomComboBox);
begin
  ReadComboBoxIndex(CurrentSection, ComboBox);
end;
{$endregion TCustomComboBox}



end.
