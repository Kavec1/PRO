program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  i,j,max,min,max_p,min_p:integer;
  slovo:shortstring;
  pole: array [1..5] of shortstring;
begin
  randomize;
  max:=0;
  max_p:=0;
  min:=16;
  min_p:=0;
  for i:=1 to 5 do
  begin
    for j:=0 to random(14)+2 do
        slovo:=slovo+chr(random(26)+65);
    pole[i]:=slovo;
    if max<length(slovo) then
    begin
      max:=length(slovo);
      max_p:=i;
    end;
    if min>length(slovo) then
    begin
      min:=length(slovo);
      min_p:=i;
    end;
    slovo:='';
  end;
  for i:=1 to 5 do
  begin
    //dorobiť
  end;
  writeln(max_p);
  writeln(min_p);
  readln;
end.

