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
  pole: array of array of char;
  rozmer,i,j,riadok:integer;
begin
  assignFile(tf,'vystup.txt');
  rewrite(tf);
  readln(rozmer);
  setLength(pole,rozmer,rozmer);
  dec(rozmer);

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do begin
      if (i=0) or (i=rozmer) then
        write(tf,'X')
      else
        if (j=0) or (j=rozmer) then
          write(tf,'X')
        else
          write(tf,' ');
    end;
    writeln(tf);
  end;

  writeln(tf);

  for i:=0 to rozmer do
    for j:=0 to rozmer do
      if i=j then
        pole[i,j]:='X'
      else
        if (rozmer-i)=j then
          pole[i,j]:='X';

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write(tf,pole[i,j]);
    writeln(tf);
  end;

  writeln(tf);

    for i:=0 to rozmer do begin
    for j:=0 to rozmer do begin
      if (i=0) or (i=rozmer) then
        pole[i,j]:='X'
      else
        if (j=0) or (j=rozmer) then
          pole[i,j]:='X';
    end;
  end;

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write(tf,pole[i,j]);
    writeln(tf);
  end;

  writeln(tf);

  riadok:=rozmer;
  for i:=rozmer downto 0 do begin
    for j:=riadok downto 0 do
      write(tf,'X');
    dec(riadok);
    writeln(tf);
  end;

  writeln(tf);

  riadok:=0;
  for i:=0 to rozmer do begin
    for j:=0 to riadok do
      write(tf,'X');
    inc(riadok);
    writeln(tf);
  end;
  closeFile(tf);
end.

