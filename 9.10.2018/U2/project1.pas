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
  a,b:real;
begin
  writeln('riesenie rovnice v tvare ax+=0');
  writeln('zadaj a');
  readln(a);
  writeln('zadaj b');
  readln(b);
  if (a=0) and (b=0) then
     writeln('nekonecne vela rieseni')
  else if (a=0) and (b<>0) then
       writeln('nema riesenie')
       else
         write('vysledok je '+ FloatToStr(-(b/a)));
  readln;
end.

