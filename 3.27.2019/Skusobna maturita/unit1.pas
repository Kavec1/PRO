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
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  tf:textFile;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,delay,z,c:integer;
  riadok:shortstring;
  farba:array of char;
  pocet:array of integer;
begin
  i:=0;
  z:=0;
  c:=0;
  delay:=10;
  assignFile(tf,'semafor.txt');
  reset(tf);
  while not eof(tf) do begin
    setLength(farba,length(farba)+1);
    setLength(pocet,length(pocet)+1);
    readln(tf,riadok);
    farba[i]:=riadok[1];
    if riadok[1]='v' then
      pocet[i]:=strToInt(copy(riadok,pos(' ',riadok),length(riadok)-pos(riadok,' ')))
    else
      pocet[i]:=length(riadok);
    inc(i);
  end;
  closeFile(tf);

  for i:=0 to length(farba)-1 do begin
    case farba[i] of
    'z':begin
        z:=z+pocet[i];
        Image1.Canvas.Brush.Color:=clGreen;
        Image1.Canvas.EllipseC(60,37,37,37);
        repaint;
        sleep(delay*pocet[i]);
        Image1.Canvas.Brush.Color:=clWhite;
        Image1.Canvas.EllipseC(60,37,37,37);
        end;
    'c':begin
          c:=c+pocet[i];
          Image1.Canvas.Brush.Color:=clRed;
          Image1.Canvas.EllipseC(60,185,37,37);
          repaint;
          sleep(delay*pocet[i]);
          Image1.Canvas.Brush.Color:=clWhite;
          Image1.Canvas.EllipseC(60,185,37,37);
        end;
    'v':begin
        for j:=0 to pocet[i] do begin
          Image1.Canvas.Brush.Color:=rgbToColor(255,144,0);
          Image1.Canvas.EllipseC(60,111,37,37);
          sleep(delay);
          repaint;
          Image1.Canvas.Brush.Color:=clWhite;
          Image1.Canvas.EllipseC(60,111,37,37);
          sleep(delay);
          repaint;
        end;
      end;
    end;
  end;
  if z>c then
    Label1.Caption:='Dlhsie svietila zelena!'
  else
    Label1.Caption:='Dlhsie svietila cervena!';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
  Image1.Canvas.Brush.Color:=clWhite;
  for i:=0 to 2 do
    Image1.Canvas.EllipseC(60,37+74*i,37,37);
end;

end.

