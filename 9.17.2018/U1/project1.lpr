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
  vstup,i:integer;
begin
  readln(vstup);
  if vstup=1 then
     writeln('Nieje mensie parne cislo.');
  for i:=1 to vstup do
  begin
    if (i mod 2)=0 then
       write(IntToStr(i)+' ');
  end;
  readln;
end.

