program project1;

{$mode objfpc}{$H+}

uses
  sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,i:integer;
  vystup:int64;
begin
  readln(vstup);
  vystup:=1;
  for i:=1 to vstup do
  begin
    vystup:=vystup*i;
  end;
  writeln('faktorial cisla '+IntToStr(vstup)+' je: '+IntToStr(vystup));
  readln;
end.

