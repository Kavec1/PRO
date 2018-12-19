program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  pole:array of array of integer;
  i,j,rozmer,h,a,b,c,d:integer;
begin
  randomize;
  h:=0;
  rozmer:=2*(random(100)+1);
  SetLength(pole,rozmer,rozmer);
  dec(rozmer);
  for i:=0 to rozmer do begin
    for j:=0 to rozmer do begin
      if (j mod 2)=1 then
        pole[i,j]:=h
      else begin
        inc(h);
        pole[i,j]:=h
      end;
    end;
  end;

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write(pole[i,j]:6);
    writeln;
  end;
  writeln;

  for i:=0 to rozmer*rozmer do begin
    a:=random(rozmer+1);
    b:=random(rozmer+1);
    c:=random(rozmer+1);
    d:=random(rozmer+1);
    h:=pole[a,b];
    pole[a,b]:=pole[c,d];
    pole[c,d]:=h;
  end;

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write(pole[i,j]:6);
    writeln;
  end;

  readln;
end.

