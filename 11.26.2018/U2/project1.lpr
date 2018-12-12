program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  cisla:array of integer;
  i,cislo:integer;
begin
  randomize;
  SetLength(cisla,20);

  for i:=1 to length(cisla) do
    cisla[i]:=random(11)-5;
  for i:=1 to length(cisla) do
    write(cisla[i],' ');
  readln(cislo);
  if 0 in cisla then
    writeln('t');
  readln;
end.

