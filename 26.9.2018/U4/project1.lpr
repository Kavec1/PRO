program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,ret:shortstring;
  i:integer;
begin
  readln(vstup);
  readln(ret);
  i:=0;
  repeat
    if vstup[i]='a' then
    begin
      delete(vstup,i,1);
      insert(ret,vstup,i);
    end;
    inc(i);
  until pos('a',vstup)=0;
  writeln(vstup);
  readln;
end.

