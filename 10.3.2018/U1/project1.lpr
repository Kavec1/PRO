program project1;

{$mode objfpc}{$H+}

uses
  crt, sysutils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  pole: array of integer;
  dlzka,i,j:integer;
begin
  randomize;
  readln(dlzka);
  SetLength(pole,dlzka);
  for j:=0 to dlzka-1 do
  pole[j]:=(random(500)-250);

  for i:=0 to dlzka-1 do
  begin
    if (i mod 2)=0 then
    begin
       if pole[i]<0 then
          TextColor(green)
       else
           TextColor(red);
       write(IntToStr(pole[i])+' ');
    end;
  end;

  writeln;

  for i:=0 to dlzka-1 do
  begin
    if (i mod 2)<>0 then
    begin
       if pole[i]<0 then
          TextColor(green)
       else
           TextColor(red);
       write(IntToStr(pole[i])+' ');
    end;
  end;

  readln;
end.

