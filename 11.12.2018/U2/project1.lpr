program project1;

{$mode objfpc}{$H+}

uses
  crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  tfIn:TextFile;
  slova: array [0..55] of shortstring;
  s,hadane,zobraz:shortstring;
  j,i:integer;
  key:char;
begin
  AssignFile(tfIn,'vstup3.txt');
  reset(tfIn);
  randomize;
  while not Eof(tfIn) do
  begin
    readln(tfIn,s);
    slova[j]:=s;
    inc(j);
  end;
  hadane:=slova[random(56)];
  for j:=1 to length(hadane) do
    zobraz[j]:='_';
  repeat
    key:=readkey;
    for i:=1 to length(hadane) do
      if key=hadane[i] then
        zobraz[i]:=key;
    write(zobraz);
  until zobraz=hadane;

  CloseFile(tfIn);
end.

