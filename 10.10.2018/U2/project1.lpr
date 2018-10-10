program project1;

{$mode objfpc}{$H+}

uses
  math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

var
  vstup,i,j,b,h:integer;
  bin:array of integer;
  hex:array of char;
begin
  readln(vstup);
  b:=round(log2(vstup));
  h:=round(logn(16,vstup));
  SetLength(bin,b+1);
  SetLength(hex,h+1);
  j:=0;
  repeat
    bin[j]:=vstup mod 2;
    inc(j);
    vstup:= vstup div 2;
  until vstup=0;
  for i:=b downto 0 do
  write(bin[i]);
  readln;
end.            (*treba dokonciť*)
