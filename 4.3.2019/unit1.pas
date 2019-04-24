unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Math;

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
  tf1,tf2:textFile;
  size:integer;
  dlzka:array of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  h,d,l,p,x,y,xo,yo,i:integer;
  posuny:string;
  posun:char;
begin
  reset(tf1);
  rewrite(tf2);
  while not eof(tf1) do begin
    h:=0;
    d:=0;
    l:=0;
    p:=0;
    xo:=Image1.Width div 2;
    yo:=Image1.Height div 2;
    Image1.Canvas.Pen.Color:=random(clWhite);
    readln(tf1,posuny);
    for i:=0 to length(posuny)-1 do begin
      posun:=posuny[i+1];
      case posun of
        'H':begin
              if d<>0 then
                write(tf2,'D'+intToStr(d));
              if l<>0 then
                write(tf2,'L'+intToStr(l));
              if p<>0 then
                write(tf2,'P'+intToStr(p));
              y:=yo-5;
              x:=xo;
              inc(h);
              d:=0;
              l:=0;
              p:=0;
            end;
        'D':begin
              if h<>0 then
                write(tf2,'H'+intToStr(h));
              if l<>0 then
                write(tf2,'L'+intToStr(l));
              if p<>0 then
                write(tf2,'P'+intToStr(p));
              y:=yo+5;
              x:=xo;
              inc(d);
              h:=0;
              l:=0;
              p:=0;
            end;
        'L':begin
              if h<>0 then
                write(tf2,'H'+intToStr(h));
              if d<>0 then
                write(tf2,'D'+intToStr(d));
              if p<>0 then
                write(tf2,'P'+intToStr(p));
              x:=xo-5;
              y:=yo;
              inc(l);
              h:=0;
              d:=0;
              p:=0;
            end;
        'P':begin
              if h<>0 then
                write(tf2,'H'+intToStr(h));
              if d<>0 then
                write(tf2,'D'+intToStr(d));
              if l<>0 then
                write(tf2,'L'+intToStr(L));
              x:=xo+5;
              y:=yo;
              inc(p);
              h:=0;
              d:=0;
              l:=0;
            end;
      end;
      Image1.Canvas.Pen.Width:=5;
      Image1.Canvas.Line(xo,yo,x,y);
      repaint;
      sleep(5);
      xo:=x;
      yo:=y;
    end;
    if h<>0 then
      write(tf2,'H'+intToStr(h));
    if d<>0 then
      write(tf2,'D'+intToStr(d));
    if l<>0 then
      write(tf2,'L'+intToStr(L));
    if p<>0 then
      write(tf2,'P'+intToStr(p));
    writeln(tf2);
    sleep(500);
  end;
  closeFile(tf1);
  closeFile(tf2);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  line:string;
begin
  randomize;
  size:=0;
  assignFile(tf1,'hada.txt');
  assignFile(tf2,'hada_k.txt');
  reset(tf1);
  while not eof(tf1) do begin
    setLength(dlzka,length(dlzka)+1);
    readln(tf1,line);
    dlzka[size]:=length(line);
    inc(size);
  end;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Image1.Canvas.TextOut(75,6,'Pocet hier: '+intTostr(size));
  Image1.Canvas.TextOut(160,6,'Najkratsia hra: '+intTostr(minValue(dlzka))+' krokov');
  Image1.Canvas.TextOut(300,6,'Najdlhsia hra: '+intTostr(maxValue(dlzka))+' krokov');
  closeFile(tf1);
end;

end.

