program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  x:integer;
begin
  readln(x);
  case x of
       3..5: writeln('Jarne');
       6..8: writeln('Letne');
       9..11: writeln('Jesenne');
       12,1,2: writeln('Zimne');
       else  writeln('Nerob si srandu');
  end;
  readln;
end.

