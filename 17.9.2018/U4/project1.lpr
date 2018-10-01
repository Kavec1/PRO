program project1;

{$mode objfpc}{$H+}

uses
  sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,rand_num,i:integer;
begin
  //randomize;
  rand_num:=random(100)+1;
  i:=0;

  repeat
    readln(vstup);
    inc(i);
    if vstup<rand_num then
       writeln('Hadane cislo je vacsie ako vase')
    else if vstup>rand_num then
            writeln('Hadane cislo je mensie ako vase');
  until vstup=rand_num;
  writeln('Uhadli ste na '+IntToStr(i)+' pokusov');
  readln;
end.

