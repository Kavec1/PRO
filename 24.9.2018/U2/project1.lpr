program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup:string;
  s,i:integer;
begin
  readln(vstup);
  s:=1;
  for i:=1 to length(vstup) do
      if (vstup[i]=' ') and (vstup[i+1]<>' ') then
         inc(s);


  writeln(s);
  readln;
end.

