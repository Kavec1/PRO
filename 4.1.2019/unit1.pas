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
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  { TREBALO BY DKONCIT }
var
  Form1: TForm1;
  tf:textFile;
  zrebovanie: array [0..5] of integer;
  tipy: array of array of integer;
implementation

function inArray(ar:array of integer;st:integer):boolean;
var
  p:boolean;
  i:integer;
begin
  p:=false;
  for i:=0 to length(ar)-1 do
    if ar[i]=st then
      p:=true;
  inArray:=p;
end;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j:integer;
  z:shortstring;
begin
  randomize;
  j:=-1;
  assignFile(tf,'loteria_2.txt');
  for i:=0 to length(zrebovanie) do
    zrebovanie[i]:=random(49)+1;
  reset(tf);
  while not eof(tf) do begin
    setLength(tipy,length(tipy)+1,6);
    readln(tf,z);
    inc(j);
    for i:=0 to 5 do begin
      if pos(' ',z)=0 then
        tipy[j][i]:=strToInt(copy(z,1,length(z)))
      else
        tipy[j][i]:=strToInt(copy(z,1,pos(' ',z)-1));
      delete(z,1,pos(' ',z));
    end;
  end;
  closeFile(tf);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  zreb:array [0..5] of integer;
  trafil:array [0..6] of integer;
  z:shortstring;
  i,p,j:integer;
begin
  p:=0;
  for i:=0 to 6 do
    trafil[i]:=0;

  z:=Edit1.Text;
  Button1.Enabled:=False;

  for i:=0 to 5 do begin
    if pos(' ',z)=0 then
      zreb[i]:=strToInt(copy(z,1,length(z)))
    else
      zreb[i]:=strToInt(copy(z,1,pos(' ',z)-1));
    delete(z,1,pos(' ',z));
  end;

  z:='';
  for i:=0 to 5 do
    z:=z+intToStr(zrebovanie[i])+' ';
  Label1.Caption:=z;

  for i:=0 to 5 do
    if inArray(zrebovanie,zreb[i]) then
      inc(p);
  Label2.Caption:='Pocet spravnych: '+intToStr(p);

  for j:=0 to length(tipy)-1 do begin
    p:=0;
    for i:=0 to 5 do
      if inArray(zrebovanie,tipy[j][i]) then
        inc(p);
    inc(trafil[p]);
    Memo1.Lines.Add('Tipujuci'+intToStr(j+1)+' trafil: '+intToStr(p));
  end;
  for i:=0 to 6 do
    Memo2.Lines.Add(intTostr(i)+' spravnych malo: '+intToStr(trafil[i]));
end;

end.

