program project1;

{$mode objfpc}{$H+}

uses
  Math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  f: file of integer;
  i,j:integer;
begin
  assign(f,'subor');
  rewrite(f);
  for i:=0 to 20 do
    write(f,random(201)-100);

  seek(f,0);
  for i:=0 to 20 do begin
    read(f,j);
    writeln(j);
  end;
  closefile(f);
  readln;
end.

