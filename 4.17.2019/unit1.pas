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
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  tfi,tfo:textFile;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  sub,nazov:shortstring;
  poc,i,j:integer;
  kancel,rozloha,pracovisko:array of integer;
begin
  sub:=Edit1.Text;
  assignFile(tfi,sub);
  delete(sub,pos('.',sub),length(sub)-pos('.',sub)+1);
  assignFile(tfo,sub+'.out');
  reset(tfi);
  rewrite(tfo);

  readln(tfi,nazov);
  writeln(tfo,nazov);
  Memo1.Lines.Add(nazov);
  readln(tfi,poc);
  setLength(kancel,poc);
  setLength(rozloha,poc);
  setLength(pracovisko,poc);
  for i:=0 to poc-1 do begin
    readln(tfi,nazov);
    kancel[i]:=strToInt(copy(nazov,1,pos(' ',nazov)-1));
    delete(nazov,1,pos(' ',nazov));
    rozloha[i]:=strToInt(copy(nazov,1,pos(' ',nazov)-1));
    delete(nazov,1,pos(' ',nazov));
    pracovisko[i]:=strToInt(nazov);
  end;

  i:=0;
  repeat
    inc(i);
  until maxValue(kancel)=kancel[i];
  Memo1.Lines.Add('Najvyssie poschodie: '+copy(intToStr(kancel[i]),1,1));
  writeln(tfo,'Najvyssie poschodie: '+copy(intToStr(kancel[i]),1,1));

  nazov:='';
  j:=0;
  for i:=0 to length(kancel)-1 do
    if pracovisko[i]<>0 then begin
      nazov:=nazov+intToStr(kancel[i])+' ';
      inc(j);
    end;
  Memo1.Lines.Add('Zariadene kancelarie: '+nazov);
  writeln(tfo,'Zariadene kancelarie: '+nazov);

  Memo1.Lines.Add('Pocet zariadenych kancelarii: '+intToStr(j));
  writeln(tfo,'Pocet zariadenych kancelarii: '+intToStr(j));

  Memo1.Lines.Add('Najmensia plocha: '+intToStr(minValue(rozloha)));
  writeln(tfo,'Najmensia plocha: '+intToStr(minValue(rozloha)));

  i:=0;
  repeat
    inc(i);
  until minValue(rozloha)=rozloha[i];
  Memo1.Lines.Add('Najmensia kancelaria: '+intToStr(kancel[i]));
  writeln(tfo,'Najmensia kancelaria: '+intToStr(kancel[i]));

  i:=0;
  repeat
    inc(i);
  until 0=pracovisko[i];
  Memo1.Lines.Add('Nezariadena kancelaria: '+intToStr(kancel[i]));
  writeln(tfo,'Nezariadena kancelaria: '+intToStr(kancel[i]));

  //Najviac pracovisk:
  //Najmenej priestoru:

  j:=0;
  for i:=0 to length(pracovisko)-1 do
    j:=j+pracovisko[i];
  Memo1.Lines.Add('Pocet uradnikov: '+intToStr(j));
  writeln(tfo,'Pocet uradnikov: '+intToStr(j));

  i:=0;
  repeat
    inc(i);
  until 1=pracovisko[i];
  Memo1.Lines.Add('Kancelaria pre sefa: '+intToStr(kancel[i]));
  writeln(tfo,'Kancelaria pre sefa: '+intToStr(kancel[i]));

  Memo1.Lines.Add('Mzdove naklady: '+intToStr(j*13*1000+13*1050)+' eur');
  writeln(tfo,'Mzdove naklady: '+intToStr(j*13*1000+13*1050)+' eur');

  j:=0;
  for i:=0 to length(rozloha)-1 do
    j:=j+rozloha[i];
  Memo1.Lines.Add('Rozloha: '+intToStr(j)+' pocet upratovaciek: '+intToStr(ceil(j/200)));
  writeln(tfo,'Rozloha: '+intToStr(j)+' pocet upratovaciek: '+intToStr(ceil(j/200)));
  closeFile(tfi);
  closeFile(tfo);
end;

end.

