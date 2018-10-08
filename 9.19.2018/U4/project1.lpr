program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  pole:array of integer;
  vstup,i,delitele:integer;
begin
  readln(vstup);
  delitele:=0;
  for i:=1 to vstup do
  begin
    if (vstup mod i)=0 then
       inc(delitele);

  end;
  if (delitele=2) and (i=vstup) then
     writeln('Cislo je prvocislo')
  else
      writeln('cislo nieje prvocislo');
  readln;
end.

