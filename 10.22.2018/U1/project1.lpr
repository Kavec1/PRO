program project1;

{$mode objfpc}{$H+}

uses
  SysUtils, Math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  l,i,k,z,n,k_sum,z_sum:integer;
  pole:array of integer;
begin
  randomize;
  readln(l);
  SetLength(pole,l);
  k:=0;
  z:=0;
  n:=0;
  k_sum:=0;
  z_sum:=0;

  for i:=0 to l do
  begin
    pole[i]:=(random(201)-100);
    if pole[i]=0 then
      inc(n)
    else if pole[i]>0 then
         begin
           inc(k);
           inc(k_sum,pole[i]);
         end
         else
         begin
           inc(z);
           inc(z_sum,pole[i]);
         end;
  end;


  writeln('Kladnych: '+IntToStr(k));
  writeln('Zapornych: '+IntToStr(z));
  writeln('Nulovych: '+IntToStr(n));
  writeln('Kladny sucet: '+IntToStr(k_sum));
  writeln('Zaporny sucet: '+IntToStr(abs(z_sum)));
  if (k_sum+z_sum)>0 then
    writeln('Kladny sucet je vacsi!')
  else
    writeln('Zaporny sucet je vacsi!');

  readln;
end.

