unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    //function inArray(ar:array of shortstring;st:shortstring):boolean;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  tf:textFile;

implementation
function inArray(ar:array of shortstring;st:shortstring):boolean;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  size,i,j,k,l:integer;
  riadok,krajina:shortstring;
  mena,krajiny:array of shortstring;
  skoky:array of array of integer;
  naj_skok,krajiny_p:array of integer;
begin
  size:=0;
  i:=0;
  k:=-1;

  assignFile(tf,'skoky_do_dialky.txt');
  reset(tf);
  while not eof(tf) do begin
    inc(size);
    readln(tf);
  end;

  setLength(mena,size);
  setLength(naj_skok,size);
  setLength(skoky,size,5);

  reset(tf);
  while not eof(tf) do begin
    readln(tf,riadok);
    for j:=1 to 5 do begin
      skoky[i][j-1]:=strToInt(copy(riadok,length(riadok)-2,3));
      delete(riadok,length(riadok)-3,4)
    end;
    mena[i]:=copy(riadok,1,pos(' ',riadok)-1);
    krajina:=copy(riadok,pos(' ',riadok)+1,3);
    Memo1.Append(krajina);
    inc(i);

    if inArray(krajiny,krajina) then begin
       for l:=0 to length(krajiny_p) do
         if krajiny[l]=krajina then
           krajiny_p[l]:=krajiny_p[l]+1;
    end else begin
      inc(k);
      setLength(krajiny,length(krajiny)+1);
      setLength(krajiny_p,length(krajiny_p)+1);
      krajiny_p[k]:=1;
      krajiny[k]:=krajina;
    end;
  end;

  for k:=0 to length(krajiny)-1 do
    Memo2.Append(krajiny[k]+' '+intToStr(krajiny_p[k]));
  for j:=0 to size-1 do
    for i:=0 to 4 do
      if maxValue(skoky[j])=skoky[j][i] then
         naj_skok[j]:=skoky[j][i];

  for i:=0 to size-1 do
    if maxValue(naj_skok)=naj_skok[i] then
       Label1.Caption:='Najlepší skokan: '+mena[i];
end;

end.

