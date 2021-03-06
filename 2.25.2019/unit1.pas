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
    Edit1: TEdit;
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
  x,y:integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  with Form1.Image1 do begin
    Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  tf:textFile;
  prikaz:shortstring;
  hodnota:integer;
  p:integer;
begin
  x:=250;
  y:=250;
  p:=1;
  with Form1.Image1 do begin
    Canvas.Brush.Color:=clWhite;
    Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  end;
  assignFile(tf,Form1.Edit1.Text);
  reset(tf);
  while not eof(tf) do begin
    readln(tf,prikaz);
    if pos(' ',prikaz)<>0 then begin
       hodnota:=strToInt(copy(prikaz,pos(' ',prikaz),length(prikaz)-1));
       delete(prikaz,pos(' ',prikaz),length(prikaz)-pos(' ',prikaz)+1);
    end;
    if prikaz='vpravo' then begin
      inc(p);
      if p=5 then
        p:=1;
    end;
    if prikaz='ciara' then
      case p of
        1:begin
            Form1.Image1.Canvas.Line(x,y,x,y-hodnota);
            y:=y-hodnota;
          end;
        2:begin
            Form1.Image1.Canvas.Line(x,y,x+hodnota,y);
            x:=x+hodnota;
          end;
        3:begin
            Form1.Image1.Canvas.Line(x,y,x,y+hodnota);
            y:=y+hodnota;
          end;
        4:begin
            Form1.Image1.Canvas.Line(x,y,x-hodnota,y);
            x:=x-hodnota;
          end;
      end;
  end;
  closeFile(tf);
end;

end.

