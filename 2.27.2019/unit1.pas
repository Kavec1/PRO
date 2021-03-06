unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, ComCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    Image1: TImage;
    Label3: TLabel;
    TrackBar1: TTrackBar;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure obdlznik;
    procedure stvorec;
    procedure kruznica;
    procedure TrackBar1Change(Sender: TObject);
    procedure trojuholnik;
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
procedure TForm1.obdlznik;
var
  r,o:integer;
  s:real;
begin
  r:=Form1.TrackBar1.Position;
  Form1.Image1.Canvas.Rectangle(10,100,10+r,100+2*r);
  o:=2*(r+2*r);
  s:=r*2*r;
  Form1.Image1.Canvas.TextOut(380,60,intToStr(o));
  Form1.Image1.Canvas.TextOut(380,80,floatToStr(s));
end;

procedure TForm1.stvorec;
var
  r,o:integer;
  s:real;
begin
  r:=Form1.TrackBar1.Position;
  Form1.Image1.Canvas.Rectangle(10,100,10+r,100+r);
  o:=4*r;
  s:=r*r;
  Form1.Image1.Canvas.TextOut(380,60,intToStr(o));
  Form1.Image1.Canvas.TextOut(380,80,floatToStr(s));
end;

procedure TForm1.kruznica;
var
  r:integer;
  s,o:real;
begin
  r:=Form1.TrackBar1.Position;
  Form1.Image1.Canvas.EllipseC(110,200,r,r);
  o:=2*pi*r;
  s:=pi*r*r;
  Form1.Image1.Canvas.TextOut(380,60,floatToStr(o));
  Form1.Image1.Canvas.TextOut(380,80,floatToStr(s));
end;


procedure TForm1.trojuholnik;
var
  r,o:integer;
  s,v:real;
begin
  r:=Form1.TrackBar1.Position;
  o:=3*r;
  v:=sqrt(2*r*r);
  s:=(r*v)/2;
  Form1.Image1.Canvas.Polygon((10,100),(10+r,100),(10+r div 2,100+v));
  Form1.Image1.Canvas.TextOut(380,60,intToStr(o));
  Form1.Image1.Canvas.TextOut(380,80,floatToStr(s));
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  with Form1.Image1 do begin
    Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  end;
  case Form1.ComboBox1.ItemIndex of
    0:Form1.obdlznik;
    1:Form1.stvorec;
    2:Form1.kruznica;
    3:Form1.trojuholnik;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  with Form1.Image1 do begin
    Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  end;
  case Form1.ComboBox1.ItemIndex of
    0:Form1.obdlznik;
    1:Form1.stvorec;
    2:Form1.kruznica;
    3:Form1.trojuholnik;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with Form1.Image1 do begin
    Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  end;
end;


end.

