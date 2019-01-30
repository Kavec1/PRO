program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, kniznica
  { you can add units after this };
var
  a:real;
  c,b:integer;
  retazec:shortstring;
  h:shortstring;
  pole:array of shortstring;

begin
  //readln(retazec);
  //readln(h);
  //readln(c);
  setLength(pole,3);
  pole[0]:='ahoj';
  pole[1]:='5';
  pole[2]:='dobre';
  sort(pole,false);
  for c:=0 to length(pole)-1 do
    writeln(pole[c]);
  //writeln(pole);
  readln;
end.

