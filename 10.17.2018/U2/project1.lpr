program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  i,j,k,p_slov:integer;
  vstup,kratke,dlhe,slovo:shortstring;
  slova: array of shortstring;
begin
  kratke:='';
  dlhe:='';
  slovo:='';
  p_slov:=0;
  j:=1;
  k:=0;
  readln(vstup);
  for i:=1 to length(vstup) do
    if vstup[i]=' ' then
       inc(p_slov);
  SetLength(slova,p_slov+1);
  for i:=1 to p_slov+1 do
  repeat
    slova[k]:=copy(vstup,1,pos(' ',vstup));
    delete(vstup,1,pos(' ',vstup));
    inc(k);
  until pos(' ',vstup)<>0;

  for i:=0 to length(slova) do
    writeln(slova[i]);
  readln;
end.

