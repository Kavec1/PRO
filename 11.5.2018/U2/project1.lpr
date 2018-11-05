program project1;

{$mode objfpc}{$H+}

uses
  crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

begin
  if ord(readkey)=0 then
  case readkey of
  #75:writeln('left');
  #77:writeln('right');
  #72:writeln('up');
  #80:writeln('down');
  end;
  readln;
end.

