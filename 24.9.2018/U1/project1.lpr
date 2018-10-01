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
  slovo:shortstring;
  i,s:integer;
begin
  readln(slovo);
  s:=0;
  for i:=1 to length(slovo) do
  begin
    case slovo[i] of
    'a','e','i','o','u','y':begin
                                 slovo[i]:='*';
                                 inc(s);
                            end;
    end;
  end;
  writeln(slovo);
  writeln('Pocet samohlasok je: ' + IntToStr(s));
  readln;
end.

