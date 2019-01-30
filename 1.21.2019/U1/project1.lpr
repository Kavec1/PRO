program project1;

{$mode objfpc}{$H+}

uses
  sysUtils, Math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
(*Skupina A*)
var
  i,j,r:integer;
  priemer,s:real;
  meno,priezvisko,cislo:shortstring;
  mena:array of shortstring;
  vydavky:array of shortstring;
  sucet:array of real;
  stupanie:array of integer;
  m_p:array of shortstring;
  tf:textFile;
begin
  r:=0;
  assignFile(tf,'vstup.txt');
  reset(tf);
  while not eof(tf) do begin
    readln(tf);
    inc(r);
  end;
  setLength(mena,r div 3);
  setLength(vydavky,r div 3);
  setLength(m_p,r div 3);
  setLength(sucet,r div 3);
  setLength(stupanie,r div 3);
  r:=1;
  i:=0;
  j:=0;
  reset(tf);
  while not eof(tf) do begin
    if (r mod 3)=0 then begin
      readln(tf,vydavky[j]);
      inc(j);
    end else begin
      readln(tf,meno);
      readln(tf,priezvisko);
      mena[i]:=priezvisko+' '+meno;
      inc(i);
      inc(r);
    end;
    inc(r);
  end;
  closeFile(tf);
  DecimalSeparator:='.';
  s:=0;
  for i:=0 to length(vydavky)-1 do begin
    priemer:=0;
    r:=0;
    cislo:=vydavky[i];
    repeat
      priemer:=priemer+strToFloat(copy(cislo,1,pos(' ',cislo)-1));
      if s<strToFloat(copy(cislo,1,pos(' ',cislo)-1)) then
        inc(stupanie[i]);
      s:=strToFloat(copy(cislo,1,pos(' ',cislo)-1));
      delete(cislo,1,pos(' ',cislo)-1);
      inc(r);
    until pos(' ',cislo)<>0;
    sucet[i]:=priemer;
    priemer:=priemer/r;
    m_p[i]:=mena[i]+' '+floatToStr(priemer);
  end;

  i:=0;
  repeat
    inc(i);
  until maxValue(sucet)=sucet[i];
  writeln(mena[i],' minul: ',sucet[i]:0:2);
  writeln;

  i:=0;
  repeat
    inc(i);
  until maxValue(stupanie)=stupanie[i];
  writeln('Najviac stupal: ',mena[i],' a to po dobu ',stupanie[i]);
  writeln;

  for j:=0 to length(mena)-1 do
    for i:=0 to length(mena)-1 do begin
      meno:='';
      if mena[i]>mena[i+1] then begin
        meno:=m_p[i];
        m_p[i]:=m_p[i+1];
        m_p[i+1]:=meno;
      end;
    end;

  for i:=0 to length(mena)-1 do
    writeln(m_p[i]);

  readln;
end.

