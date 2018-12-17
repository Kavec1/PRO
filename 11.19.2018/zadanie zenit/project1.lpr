program project1;

{$mode objfpc}{$H+}

uses
  SysUtils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  banknote:array [1..15] of real = (500,200,100,50,20,10,5,2,1,0.5,0.2,0.1,0.05,0.02,0.01);
  cleny:array of integer;
  tf:textfile;
  line,miesto:shortstring;
  dolar,i,c,poplatok,clen,sum_clen:integer;
  rate,eur,cena,vsimne:real;
begin
  assignfile(tf,'vstup.txt');
  reset(tf);
  DecimalSeparator:='.';
  c:=0;
  writeln('M. KAVEC 4B GVOZA');
  writeln('Indiana Jones hlada Janosikov poklad.');

  readln(tf,line);
  dolar:=StrToInt(copy(line,1,pos(' ',line)-1));
  delete(line,1,pos(' ',line));
  rate:=StrToFloat(line);
  write(dolar,'$ = ');
  eur:=dolar/rate;
  write(eur:0:2);
  writeln(' eur');
  writeln('Baka vyplati:');
  for i:=1 to length(banknote) do
  begin
    while (eur-banknote[i])>0 do
    begin
      eur:=eur-banknote[i];
      inc(c);
    end;
    write(c,' kus ');
    writeln(banknote[i]:0:2,' eur');
    c:=0;
  end;

  readln(tf,poplatok);
  write('Na licenciu za ',poplatok,' eur potrebuje Indy ');
  vsimne:=(trunc(poplatok*0.01)+1)*10;
  cena:=(poplatok+vsimne)*rate;
  writeln(cena:0:2,'$');
  writeln('Vsimne pre pana ochotneho je ',vsimne:0:0,' eur');

  readln(tf,miesto);
  writeln(miesto,' je nazov miesta odkial Indy startuje.');

  sum_clen:=0;
  readln(tf,clen);
  if clen>20 then
    clen:=20;
  dec(clen);
  SetLength(cleny,clen);
  cleny[0]:=0;
  cleny[1]:=1;
  for i:=2 to clen do
      cleny[i]:=cleny[i-1] + cleny[i-2];
  write(clen+1,' clenov:');
  for i:=0 to clen do
  begin
      write(' ',cleny[i]);
      inc(sum_clen,cleny[i]);
  end;
  writeln;
  writeln('Sucet: ',sum_clen);
  write('Cifry:');
  for i:=0 to clen do
  begin
      if length(IntToStr(cleny[i]))>1 then
        cleny[i]:=cleny[i]-(trunc(cleny[i]/10))*10;
      write(' ',cleny[i]);
  end;

  readln;
  CloseFile(tf);
end.

