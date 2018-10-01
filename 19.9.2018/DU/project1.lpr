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
  u,v,e:int64;
begin
  readln(u);
  readln(v);
  readln(a);
  repeat
    if u>v then
    begin
         e:=u-v;
         u:=e;
    end
    else if v>u then
         begin
            e:=v-u;
            v:=e;
         end;
  until u=v;
  writeln('Delitel cisel je: ' + IntToStr(e));
  readln;
end.
