program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  pole: array [1..5] of integer;
  i,min,naj:integer;
begin
  min:=10000;
  for i:=1 to 5 do
  readln(pole[i]);

  naj:=0;
  for i:=1 to 5 do
  begin
    if pole[i]<min then
    min:=pole[i];

    if pole[i]<pole[i+1] then
    inc(naj);
  end;
  writeln;
  writeln(min);
  writeln(naj);
  writeln('end');
  readln;
end.
