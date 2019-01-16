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

begin
  readln(retazec);
  readln(h);
  //readln(c);
  writeln(vyskyt(retazec,h));
  readln;
end.

