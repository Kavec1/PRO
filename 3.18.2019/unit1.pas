unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  hod,hrac,hraci:integer;
  hra: array [1..7] of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Form1.Image1.Canvas.Brush.Color:=rgbToColor(183,183,11);
  Form1.Image1.Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  Form1.Image1.Canvas.Brush.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(100,10,150,60);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  x,y,j:integer;
begin
  hod:=random(6)+1;
  if hrac=hraci then
    hrac:=1
  else
    inc(hrac);
  Form1.Image1.Canvas.Brush.Color:=rgbToColor(100+hrac*21,255 div hrac,36*hrac);
  Form1.Image1.Canvas.Rectangle(100,10,150,60);
  Form1.Image1.Canvas.Font.Size:=25;
  Form1.Image1.Canvas.TextOut(117,12,intToStr(hod));
  hra[hrac]:=hra[hrac]+hod;
  if hra[hrac]>=14 then begin
    Form1.Button2.Enabled:=False;
    hra[hrac]:=14;
    Form1.Image1.Canvas.Brush.Color:=rgbToColor(183,183,11);
    Form1.Image1.Canvas.TextOut(170,10,'Vyhral hrac: '+intToStr(hrac)+'!');
    Form1.Image1.Canvas.Brush.Color:=rgbToColor(100+hrac*21,255 div hrac,36*hrac);
    y:=70+(hrac-1)*50;
    for j:=0 to 13 do begin
      x:=15+j*50;
      Form1.Image1.Canvas.Rectangle(x,y,x+50,y+50);
    end;
  end else begin
    y:=70+(hrac-1)*50;
    for j:=0 to hra[hrac]-1 do begin
      x:=15+j*50;
      Form1.Image1.Canvas.Rectangle(x,y,x+50,y+50);
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,x,y:integer;
begin
  Form1.Button2.Enabled:=True;
  hraci:=strToInt(Form1.Edit1.Text);
  hrac:=0;
  if hraci>7 then
    hraci:=7;
  Form1.Image1.Canvas.Brush.Color:=rgbToColor(183,183,11);
  Form1.Image1.Canvas.Pen.Color:=rgbToColor(183,183,11);
  Form1.Image1.Canvas.Rectangle(169,9,500,60);
  Form1.Image1.Canvas.Rectangle(15,70,Form1.Image1.Width-1,Form1.Image1.Height-1);
  Form1.Image1.Canvas.Pen.Color:=clBlack;
  Form1.Image1.Canvas.Brush.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(100,10,150,60);
  for i:=0 to hraci-1 do begin
    y:=70+i*50;
    for j:=0 to 13 do begin
      x:=15+j*50;
      Form1.Image1.Canvas.Rectangle(x,y,x+50,y+50);
    end;
  end;
  for i:=1 to 7 do
    hra[i]:=0;
end;

end.

