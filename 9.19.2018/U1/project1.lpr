program project1;

{$mode objfpc}{$H+}

uses
  sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,pocet,i,m50,parne:integer;
begin
  i:=0;
  m50:=0;
  parne:=0;
  vstup:=1;
  while vstup<>0 do
  begin
    inc(i);
    readln(vstup);
    if vstup>50 then
       inc(m50);
    if (vstup mod 2)=0 then
       inc(parne);
    pocet:=pocet+vstup;
  end;
  writeln(pocet/(i-1):1:5);
  writeln(m50);
  writeln(parne);
  readln;
end.

