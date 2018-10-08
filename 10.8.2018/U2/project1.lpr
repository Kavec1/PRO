program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  sum,i,max,min,max_r:integer;
  znamky: array [1..10] of integer;
begin
  randomize;
  sum:=0;
  max:=0;
  min:=21;
  max_r:=0;
  for i:=1 to 10 do
      znamky[i]:=(random(16)+5);

  for i:=1 to 10 do
  begin
    inc(sum,znamky[i]);
    if max<znamky[i] then
       begin
         max:=znamky[i];
         max_r:=i;
       end;
    if min>znamky[i] then
       min:=znamky[i];
  end;


  writeln(sum);
  writeln(sum-min-max);
  writeln(max_r);
  readln;
end.

