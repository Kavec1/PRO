program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  tf:TextFile;
  pole:array of shortstring;
  slovo:shortstring;
  i,j,rozmer:integer;
begin
  AssignFile(tf,'vstup.txt');
  reset(tf);
  rozmer:=0;
  while not eof(tf) do
  begin
    readln(tf);
    inc(rozmer);
  end;
  reset(tf);
  SetLength(pole,rozmer);
  i:=0;
  j:=0;
  while not eof(tf) do
  begin
    readln(tf,pole[i]);
    inc(i);
  end;

  repeat
    for i:=0 to length(pole)-2 do
    begin
      if pole[i]>pole[i+1] then
      begin
        slovo:=pole[i];
        pole[i]:=pole[i+1];
        pole[i+1]:=slovo;
      end;
    end;
    inc(j);
  until j=rozmer-1;
  for i:=0 to length(pole)-1 do
    writeln(pole[i]);
  CloseFile(tf);
  readln;
end.

