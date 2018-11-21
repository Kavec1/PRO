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
  tf:textfile;
  line:shortstring;
  dolar,i,c,poplatok:integer;
  rate,eur,cena,vsimne:real;
begin
  assignfile(tf,'vstup.txt');
  reset(tf);
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
  vsimne:=trunc(poplatok*0.1);
  cena:=(poplatok+vsimne)*rate;
  writeln(cena:0:2,'$');
  writeln('Vsimne pre pana ochotneho je ',vsimne:0:0,' eur');
  readln;
  CloseFile(tf);
end.

