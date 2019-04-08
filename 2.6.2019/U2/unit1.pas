unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Spin,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    SpinEdit1: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
const
  st:integer=10;
var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.SpinEdit1Change(Sender: TObject);
var
  v,i,j:integer;
begin
  Form1.Image1.Canvas.Brush.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  v:=Form1.SpinEdit1.Value-1;
  Form1.Image1.Canvas.Brush.Color:=random(clwhite);
  for j:=0 to v do
    if (j mod 2)=0 then
      for i:=0 to v-j do
        Form1.Image1.Canvas.Rectangle((i*st+(st div 2)*j)+(Form1.Image1.Width div 2),Form1.Image1.Height-(st+st*j),(st+i*st+(st div 2)*j)+(Form1.Image1.Width div 2),Form1.Image1.Height-st*j)
    else
      for i:=0 to v-j do
        Form1.Image1.Canvas.Rectangle((i*st+(st div 2)*j)+(Form1.Image1.Width div 2),Form1.Image1.Height-(st+st*j),(st+i*st+(st div 2)*j)+(Form1.Image1.Width div 2),Form1.Image1.Height-st*j);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Form1.Image1.Canvas.Brush.Color:=clWhite;
  Form1.Image1.Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
end;

end.

