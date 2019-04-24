unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  tf: textFile;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  size,jj,pj,po,oo,i: integer;
  priemer: real;
  teploty: array of real;
  stanice:array of shortstring;
  riadok: shortstring;
begin
  size:=0;
  jj:=0;
  pj:=0;
  po:=0;
  oo:=0;
  i:=0;
  priemer:=0;

  assignFile(tf,Edit1.Text);
  reset(tf);
  while not eof(tf) do begin
    readln(tf);
    inc(size);
  end;
  closeFile(tf);

  setLength(teploty,size);
  setLength(stanice,size);
  Label1.Caption:='Počet meraní: '+intToStr(size);

  reset(tf);
  while not eof(tf) do begin
    readln(tf,riadok);
    case copy(riadok,length(riadok)-1,3) of
      'JJ':inc(jj);
      'PJ':inc(pj);
      'PO':inc(po);
      'OO':inc(oo);
    end;
    stanice[i]:=copy(riadok,1,3);
    delete(riadok,length(riadok)-2,3);
    delete(riadok,1,21);
    teploty[i]:=strToFloat(riadok);
    priemer:=priemer+strToFloat(riadok);
    Memo1.Lines.add(riadok);
    (*Memo1.Lines.addText(riadok);
    Memo1.Lines.append(riadok);*)
    inc(i);
  end;

  Label6.Caption:='JJ: '+intToStr(jj);
  Label7.Caption:='PO: '+intToStr(po);
  Label8.Caption:='PJ: '+intToStr(pj);
  Label9.Caption:='OO: '+intToStr(oo);

  Label3.Caption:='Najvyššia hodnota: '+floatToStr(maxValue(teploty))+'°C';
  for i:=0 to length(teploty) do
    if teploty[i]=maxValue(teploty) then
      break;
  Label10.Caption:='Na stanici: '+stanice[i];

  Label4.Caption:='Najnižšia hodnota: '+floatToStr(minValue(teploty))+'°C';
  for i:=0 to length(teploty) do
    if teploty[i]=minValue(teploty) then
      break;
  Label11.Caption:='Na stanici: '+stanice[i];

  Label5.Caption:='Priemerná hodnota:: '+floatToStrF(priemer/size,ffGeneral,2,0)+'°C';
end;

end.
