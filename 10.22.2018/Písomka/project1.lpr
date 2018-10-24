program project1;

{$mode objfpc}{$H+}

uses
  Math,crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
  {
    Náhodne vygeneruj 20 slov (každé slovo bude mať náhodne od 3 do 10 písmen), ktoré sa budú skladať len z malých písmen abecedy a vypíš ich.
    Všetky písmená "a" zmeň na veľké "A" a vypíš slová. Slová, ktoré obsahujú "A" budú vypísané červenou farbou (4).
    Vypíš najdlhšie slovo (slová).
}
const N=20;
type TSlova=array[1..N] of shortstring;
var slova:TSlova;
    d_slova: array [1..N] of integer;
    slovo:shortstring;
    pismeno:char;
    i,j,max,max_i:integer;
begin
  randomize;
  max:=0;
  for i:=1 to N do
  begin
    for j:=1 to random(8)+3 do
    begin
      pismeno:=chr(random(26)+97);
      if pismeno='a' then
      pismeno:='A';
      slovo:=slovo+pismeno;
      slova[i]:=slovo;
      d_slova[i]:=length(slovo);
    end;
    slovo:='';
  end;

  for i:=1 to N do
  begin
    if pos('A',slova[i])<>0 then
      textcolor(4)
    else
      textcolor(7);

    if max<length(slova[i]) then
    begin
      max:=length(slova[i]);
      max_i:=i;
    end;
    write(slova[i],', ');
  end;


  writeln();
  writeln('Najdlhsie slova su: '+slova[max_i]);
  readln()
end.

