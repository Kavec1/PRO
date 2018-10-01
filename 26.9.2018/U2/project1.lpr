program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,nieco,vystup:shortstring;
  i,j,k:integer;
begin
  readln(vstup);
  SetLength(vystup, (length(vstup)+2));
  for i:=2 to length(vstup)+1 do
  begin
    //delete(nieco,i,length(vstup));
    for j:=length(vstup) downto 1 do
    begin
         nieco[k]:=vstup[j];
         inc(k);
    end;
    vystup:=vstup+nieco;
    writeln(vystup);
  end;
  (*for i:=length(vstup) downto 2 do
  begin
    nieco:=vstup;
    delete(nieco,i,length(vstup));
    vystup:=nieco;
    writeln(vystup);
  end;  *)
  readln;
end.

