program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  mat1:array [1..5,1..5] of integer;
  mat2:array [1..5,1..5] of integer;
  sucet:array [1..5,1..5] of integer;
  //sucin:array [1..5,1..5] of integer;
  a,b:integer;
begin
  randomize;
  for a:=1 to 5 do
    for b:=1 to 5 do
    begin
      mat1[a,b]:=random(10);
      mat2[a,b]:=random(10);
    end;

  for a:=1 to 5 do
     for b:=1 to 5 do
       sucet[a,b]:=mat1[a,b]+mat2[a,b];

  for a:=1 to 5 do
     for b:=1 to 5 do
     sucin[a,b]:=(mat1[a,b]*mat2[])+(mat1[]*mat2[])+(mat1[]*mat2[])+(mat1[]*mat2[])+(mat1[]*mat2[])

  for a:=1 to 5 do
    for b:=1 to 5 do
    if b=5 then
      writeln(mat1[a,b]:3)
    else
      write(mat1[a,b]:3);

  writeln;

  for a:=1 to 5 do
    for b:=1 to 5 do
    if b=5 then
      writeln(mat2[a,b]:3)
    else
      write(mat2[a,b]:3);

  writeln;

  for a:=1 to 5 do
     for b:=1 to 5 do
     if b=5 then
       writeln(sucet[a,b]:3)
     else
       write(sucet[a,b]:3);

  readln;
end.

