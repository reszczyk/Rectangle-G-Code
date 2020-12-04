unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonExecute: TButton;
    EditWidth: TEdit;
    EditHeight: TEdit;
    LabelResult: TLabel;
    LabelWidth: TLabel;
    LabelHeight: TLabel;
    procedure ButtonExecuteClick(Sender: TObject);
    procedure EditWidthChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;


procedure TForm1.ButtonExecuteClick(Sender: TObject);
var
  WidthValue, HeightValue: Double;
  f: TFileStream;
  line: string;
begin
  f:=TFileStream.Create('Rectangle.gcode', fmCreate);
  f:=TFileStream.Create('Rectangle.txt', fmCreate);
  Line:= 'G1 X' + EditWidth.Text + ' Y0' + #13#10;
  f.Write(Pointer(Line)^, Length(Line));
  Line:= 'G1 X' + EditWidth.Text + ' Y' + EditHeight.Text + #13#10;
  f.Write(Pointer(Line)^, Length(Line));
  Line:= 'G1 X0' + ' Y' + EditHeight.Text + #13#10;
  f.Write(Pointer(Line)^, Length(Line));
  Line:= 'G1 X0 Y0' + #13#10;
  f.Write(Pointer(Line)^, Length(Line));
  f.Free;
  LabelResult.Caption:='Done';
end;

procedure TForm1.EditWidthChange(Sender: TObject);
begin

end;

end.

