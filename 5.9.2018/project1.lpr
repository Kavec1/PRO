program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  a,b:integer;

procedure exit;
begin
  writeln;
  writeln;
  writeln('Press ENTER to quit');
  readln;
end;
    {MAIN}
begin
     write('zadaj cislo: ');
     readln(a);
     write('zadaj cislo rozne od 0: ');
     readln(b);
     writeln;
     if b<>0 then
     begin
          write('sucet: ');
          writeln(a+b);
          write('rozdiel: ');
          writeln(a-b);
          write('sucin: ');
          writeln(a*b);
          write('rozdiel: ');
          writeln(a/b:1:5);
          write('celosciselny rozdiel: ');
          writeln(a div b);
     end else
     begin
          writeln;
          writeln('cislo bolo rovne 0');
          exit;
     end;
     exit;
end.

