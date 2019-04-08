program project1;

{$mode objfpc}{$H+}

uses
  Math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes;
var                                           //NEFUNGUJE!!
  f: file of integer;
  i,j,r1,r2,s:integer;
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

  repeat
    for i:=0 to fileSize(f)-2 do begin
      seek(f,i);
      read(f,r1);
      read(f,r2);
      if r1>r2 then begin
        s:=r1;
        r1:=r2;
        r2:=s;
        seek(f,i);
        write(f,r1);
        write(f,r2);
      end;
    end;
    inc(j);
  until j=fileSize(f)-2;

  writeln;
  seek(f,0);
  for i:=0 to 20 do begin
    read(f,j);
    writeln(j);
  end;

  closefile(f);
  readln;
end.

