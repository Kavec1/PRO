program project1;

{$mode objfpc}{$H+}

uses
  sysutils,crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  vstup,i,delitele:int64;
begin
  readln(vstup);
  clrscr;
  i:=0;
  delitele:=0;
  if vstup=0 then
     begin
       writeln('Zadane cislo niesmie byt 0');
       sleep(500);
       exit;
     end;
  writeln('Delitele cisla '+IntToStr(vstup)+' su:');
  repeat
    inc(i);
    if (vstup mod i)=0 then
       begin
         write(IntToStr(i)+' ');
         inc(delitele);
       end;
  until i=vstup;
  writeln;
  if delitele=2 then
     writeln('Cislo '+IntToStr(vstup)+' je prvocislo a ma len 2 delitele')
  else
      writeln('Delitelov cisla '+IntToStr(vstup)+' je: '+IntToStr(delitele));
  readln;
end.

