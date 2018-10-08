program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  i,j,p_s:integer;
  gen_ch:char;
  vystup:string;
begin
  randomize;
  readln(p_s);

  for i:=1 to p_s do
  begin
      for j:=1 to (random(11)+5) do
      begin
          if random(2)=0 then
             gen_ch:=chr(random(26)+65)
          else
              gen_ch:=chr(random(26)+97);
          vystup:=vystup+gen_ch;
      end;
      vystup:=vystup+' ';
  end;

  writeln(vystup);
  readln;
end.

