program project1;

{$mode objfpc}{$H+}

uses
  SysUtils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  i:integer;
  vstup:string;
  pole:array [97..122] of integer;
begin
  readln(vstup);
  for i:=1 to length(vstup) do
  begin
    LowerCase(vstup[i]);
    inc(pole[ord(vstup[i])]);
  end;

  for i:=97 to 122 do
  writeln(chr(i)+'='+IntToStr(pole[i]));

  readln;
end.

