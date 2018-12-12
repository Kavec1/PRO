program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  tf:textFile;
  line,slovo,mesh:shortstring;
  i,r:integer;
  c:char;
begin
  randomize;
  assignFile(tf,'vstup.txt');
  reset(tf);
  while not eof(tf) do
  begin
    readln(tf,line);
    repeat
    if pos(' ',line)=0 then begin
      slovo:=line;
      delete(line,1,length(line));
    end
    else begin
      slovo:=copy(line,1,pos(' ',line)-1);
      delete(line,1,pos(' ',line));
    end;
    mesh:=slovo;
    delete(mesh,1,1);
    delete(mesh,length(mesh),length(mesh));
    if length(slovo)>=3 then begin
      for i:=1 to length(mesh) do begin
        c:=mesh[i];
        r:=random(length(mesh))+1;
        mesh[i]:=mesh[r];
        mesh[r]:=c;
      end;
      delete(slovo,2,length(slovo)-2);
      insert(mesh,slovo,2);
      write(slovo,' ');
    end
    else
      write(slovo,' ');
    until length(line)=0;
    writeln;
  end;
  readln;
  closeFile(tf);
end.

