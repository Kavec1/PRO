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
  cislo,i:integer;
  fakt:QWord;
begin
  AssignFile(tf,'vstup.txt');
  reset(tf);

  while not eof(tf) do
  begin
  fakt:=1;
  readln(tf,cislo);

  if cislo=0 then
    fakt:=1
  else
    repeat
      fakt:=fakt*cislo;
      if cislo<>1 then
        dec(cislo);
    until cislo=1;

  writeln(fakt);
  end;

  readln;
  closeFile(tf);
end.

