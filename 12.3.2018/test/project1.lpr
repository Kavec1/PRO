program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  mesh,slovo:shortstring;
  i:integer;
begin
  randomize;
  slovo:='najneobhospodarovatelnejsi';
  writeln(slovo);
  mesh:=slovo;
  delete(mesh,1,1);
  delete(mesh,length(mesh),length(mesh));
  if length(slovo)>=2 then
  begin
    for i:=1 to length(mesh) do
      mesh[i]:=mesh[random(length(mesh))+1];
    delete(slovo,2,length(slovo)-2);
    insert(mesh,slovo,2);
    write(slovo);
  end
  else
    write(slovo);
  readln;
end.

