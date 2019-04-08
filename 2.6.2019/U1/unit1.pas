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
    Button2: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
const
  r:integer=10;
  w:integer=1000;
  h:integer=1000;
var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Form1.Width:=w;
  Form1.Height:=h;
  Form1.Image1.Width:=w;
  Form1.Image1.Height:=h;
  Form1.Image1.Canvas.Brush.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(0,0,Form1.Width,Form1.Height);
  Form1.Image1.Canvas.Brush.Color:=clBlack;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  x1,y1,x2,y2:integer;
begin
  x1:=random(Form1.Width);
  y1:=random(Form1.Height);
  x2:=random(Form1.Width);
  y2:=random(Form1.Height);
  Form1.Image1.Canvas.Brush.Color:=clGreen;
  Form1.Image1.Canvas.Brush.Style:=bsSolid;
  Form1.Image1.Canvas.EllipseC(x1,y1,r,r);
  Form1.Image1.Canvas.Brush.Color:=clRed;
  Form1.Image1.Canvas.EllipseC(x2,y2,r,r);
  Form1.Image1.Canvas.Brush.Style:=bsClear;
  if (x1>x2) and (y1>y2) then
    Form1.Image1.Canvas.Rectangle(x1+r,y1+r,x2-r,y2-r)
  else
    if (x1<x2) and (y1>y2) then
      Form1.Image1.Canvas.Rectangle(x1-r,y1+r,x2+r,y2-r)
    else
      if (x1<x2) and (y1<y2) then
        Form1.Image1.Canvas.Rectangle(x1-r,y1-r,x2+r,y2+r)
      else
        Form1.Image1.Canvas.Rectangle(x1+r,y1-r,x2-r,y2+r)
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.Image1.Canvas.Brush.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(0,0,Form1.Width,Form1.Height);
  Form1.Image1.Canvas.Brush.Color:=clBlack;
end;

end.

