unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  x,y:integer;
begin
  x:=random(Form1.Width);
  y:=random(Form1.Height);
  Form1.Image1.Canvas.Line(x,y,x+10,y);
  Form1.Image1.Canvas.Line(x,y,x+10,y+10);
  Form1.Image1.Canvas.Line(x,y,x,y+10);
  Form1.Image1.Canvas.Line(x+10,y,x,y+10);
  Form1.Image1.Canvas.Line(x,y,x+5,y+5);
  //Form1.Image1.Canvas.Line();Form1.Image1.Canvas.Line();Form1.Image1.Canvas.Line();
end;

end.

