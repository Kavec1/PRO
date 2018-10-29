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
  hl_d,vd_d: array of integer;
  rozmer,i,j,k,m:integer;
begin
  randomize;
  readln(rozmer);
  SetLength(matica,rozmer,rozmer);
  SetLength(hl_d,rozmer);
  SetLength(vd_d,rozmer);
  k:=0;
  m:=0;

  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
      matica[i,j]:=random(100);

  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
      if i=j then
      begin
        hl_d[k]:=matica[i,j];
        inc(k);
      end;

  for i:=0 to rozmer-1 do
    for j:=rozmer-1 downto 0 do
      if i=abs(j-rozmer+1) then
      begin
        vd_d[m]:=matica[i,j];
        inc(m);
      end;

  for i:=0 to rozmer-1 do
    for j:=0 to rozmer-1 do
    begin
      if j=rozmer-1 then
        writeln(matica[i,j]:3)
      else
        write(matica[i,j]:3);
    end;

  writeln;

  for k:=0 to rozmer-1 do
    write(hl_d[k]:3);

  writeln;

  for m:=0 to rozmer-1 do
    write(vd_d[m]:3);

  readln;
end.

