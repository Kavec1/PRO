program project1;

{$mode objfpc}{$H+}

uses
  CRT,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  pole: array of array of char;
  rozmer,i,j,rand,pokus:integer;
begin
  randomize;
  readln(rozmer);
  if (rozmer mod 2)=1 then
    inc(rozmer);
  setLength(pole,rozmer,rozmer);
  dec(rozmer);
  for i:=0 to rozmer do begin
    rand:=random(rozmer);
    for j:=0 to rozmer do
      if j=rand then
        pole[i,j]:='L'
      else
        pole[i,j]:='X';
  end;
  clrscr;
(*  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write(pole[i,j]);
    writeln;
  end; *)

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write('*');
    writeln;
  end;

  readln;
end.

