program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  a:shortstring;
  i,o:integer;
begin
  o:=0;
  readln(a);
  for i:=1 to length(a) do begin
    if (i mod 2)=1 then
      o:=o+ord(a[i])
    else
      o:=o-ord(a[i]);
  end;
  writeln(o);
  readln;
end.

