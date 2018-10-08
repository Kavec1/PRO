program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup:shortstring;
  i:integer;
begin
  readln(vstup);
  for i:=1 to length(vstup) do
  begin
    case ord(vstup[i]) of
    48..57:;
    65..90:;
    97..122:;
    else delete(vstup,i,i);
    end;
  end;
  writeln(vstup);
  readln;
end.

