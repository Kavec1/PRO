program project1;

{$mode objfpc}{$H+}

uses
  math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
function my_power(a,b:float):float;
var
  men:integer;
  asd:float;
begin
  men:=0;
  if b<1 then
  begin
    repeat
      inc(men);
      b:=b*10;
    until (b-round(b)=0);
    my_power:=exp(((10**men)**-1)*ln(a**b))  //nefunguje
  end
  else
      my_power:=exp((b)*ln(a));
end;

var
  o,p:float;
begin
  readln(o,p);
  writeln(power(o,p));
  writeln(o**p);
  writeln(my_power(o,p));
  readln;
end.

