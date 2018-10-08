program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  num:integer;
begin
  readln(num);
  if (num mod 2) = 0 then
     writeln('parne')
  else
      writeln('neparne');
  readln;
end.

