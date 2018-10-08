program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,vystup:shortstring;
  i,j:integer;
begin
  readln(vstup);
  vystup:=vstup;
  j:=1;
  for i:=length(vstup) downto 1 do
  begin
    vystup[j]:=vstup[i];
    inc(j);
  end;
  writeln(vystup);
  readln;
end.

