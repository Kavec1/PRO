program project1;

{$mode objfpc}{$H+}

uses
  math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { buble sort };
var
  pole:array [1..5] of integer;
  i,cislo:integer;
begin
  randomize;
  for i:=1 to length(pole) do
    pole[i]:=random(101);

  for i:=1 to length(pole) do
    write(pole[i],' ');
  repeat
    for i:=1 to length(pole)-1 do
    begin
      if pole[i]>pole[i+1] then
      begin
        cislo:=pole[i];
        pole[i]:=pole[i+1];
        pole[i+1]:=cislo;
      end;
    end;
  until (MinValue(pole)=pole[1]) and (MaxValue(pole)=pole[length(pole)]);
  writeln;
  for i:=1 to length(pole) do
    write(pole[i],' ');
  readln;
end.

