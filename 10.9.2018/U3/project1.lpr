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
  per,q5:integer;
  q1,q2,q3,q4:char;

begin
     per:=0;
     writeln('dopovedajte na otazky ano(a) alebo nie(n), popripade cislom');
     writeln;

     write('Bude mat tato skola 100 rokov? ');
     readln(q1);
     writeln;
     if q1 = 'a' then
        per:= per+1;

     write('Vola sa tento programovaci jazik Pascal? ');
     readln(q2);
     writeln;
     if q2 = 'a' then
        per:= per+1;

     write('Nudim sa? ');
     readln(q3);
     writeln;
     if q3 = 'a' then
        per:= per+1;

     write('Na otazku je odpoved nie? ');
     readln(q4);
     writeln;
     if q4 = 'n' then
        per:= per+1;

     write('Kolko je 13^2? ');
     readln(q5);
     writeln;
     if q5 = 169 then
        per:= per+1;

     writeln;
     writeln('dosiahli ste ' + IntToStr(per) + ' bodov a uspeli ste na '+ IntToStr((per*100) div 5)+ '%');
     readln;
end.

