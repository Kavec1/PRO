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
  Skr,Sst,polomer,strana:real;
begin
  writeln('program ktory porvna kruh a stvorec');
  writeln;

  write('zadajte polomer kruhu: ');
  readln(polomer);

  write('zadajte stranu stvorca: ');
  readln(strana);

  Skr:= (2*pi*polomer);
  Sst:= (strana*strana);

  writeln;
  if Sst = Skr then
     writeln('obsahy su rovne a rovnaju sa ' + FloatToStr(Sst))
  else if Sst > Skr then
          writeln('obsah stvorca je vecsi o ' + FloatToStr(Sst-Skr))
       else
         writeln('obsah kruhu je vecsi o ' + FloatToStr(Skr-Sst));
  readln;
end.

