unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  f:file of integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  a,b:integer;
begin
  assignFile(f,Form1.Edit1.Text);
  reset(f);
  Form1.Memo1.Lines.Clear;
  Form1.Memo2.Lines.Clear;
  while not eof(f) do begin
    read(f,a);
    read(f,b);
    Form1.Memo2.Lines.Add(intToStr(a)+' '+intToStr(b));
    if a=0 then
      Form1.Memo1.Lines.Add('y='+intToStr(b));
    Form1.Memo1.Lines.Add('x='+floatToStr(-b/a));
  end;
  closeFile(f);
end;
end.