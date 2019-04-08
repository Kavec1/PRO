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

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  tf:textFile;
  jedlo:array of string;
  pocet:array of integer;
  k,i,j:integer;
  jed:char;
  poc:shortstring;
begin
  i:=0;
  j:=0;
  k:=0;
  assignFile(tf,Form1.Edit1.Caption);
  reset(tf);
  while not eof(tf) do begin
    readln(tf,poc);
    jed:=poc[length(poc)];
    delete(poc,length(poc)-1,2);
    (*for k:=0 to length(jedlo) do
      if jed=jedlo[k] then begin
        i:=0;
        repeat
          inc(i);
        until jed=jedlo[i];
        pocet[i]:=pocet[i]+strToInt(poc);
      end else begin  *)
        inc(j);
        setLength(pocet,j);
        setLength(jedlo,j);
        jedlo[j-1]:=jed;
        pocet[j-1]:=strToInt(poc);
      //end;
  end;
  closeFile(tf);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;

end.

