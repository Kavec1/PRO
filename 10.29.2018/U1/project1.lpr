program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  matica: array of array of integer;
  rozmer,i,j:integer;
begin
  readln(rozmer);
  SetLength(matica,rozmer,rozmer);
  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
    begin
      if i=j then
        matica[i,j]:=1
      else
        matica[i,j]:=0;
    end;

  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
    begin
      if j=rozmer-1 then
        writeln(matica[i,j])
      else
        write(matica[i,j]);
    end;

  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
      matica[i,j]:=0;

  for i:=0 to rozmer-1 do
    for j:=rozmer-1 downto 0 do
    begin
      if i=abs(j-rozmer+1) then
        matica[i,j]:=1
      else
        matica[i,j]:=0;
    end;

  writeln;

  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
    begin
      if j=rozmer-1 then
        writeln(matica[i,j])
      else
        write(matica[i,j]);
    end;

  readln;
end.

