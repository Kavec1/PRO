program project1;

{$mode objfpc}{$H+}

uses
  CRT, sysUtils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  tf:textFile;
  key:char;
  i,c,y:integer;
  riadok:shortstring;
  film:array of array of shortstring;
  navs:array of array of integer;
begin
  y:=1;
  c:=-1;
  assign(tf,'nfilmov.txt');
  reset(tf);
  while not eof(tf) do begin
    inc(c);
    setLength(film,length(film)+1,2);
    setlength(navs,length(navs)+1,4);
    readln(tf,riadok);
    for i:=0 to 1 do begin
      film[c][i]:=copy(riadok,1,pos(';',riadok)-1);
      delete(riadok,1,pos(';',riadok)+1);
    end;
    for i:=0 to 2 do begin
      navs[c][i]:=strToInt(copy(riadok,1,pos(' ',riadok)-1));
      delete(riadok,1,pos(' ',riadok));
    end;
    navs[c][3]:=strToInt(riadok);
  end;
  Writeln(' Vypis filmov s celkovou navstevnostou');
  Writeln(' Vypis prvych 10 najuspesnejsich filmov s celkovou navstevnostou');
  Writeln(' Vyhladanie filmov podla zadaneho herca');
  Writeln(' Pridanie filmu');
  Writeln(' Vypis najobsadzovanejsieho herca');
  Writeln(' Vypis najnavstevovanejsich filmov v jednotlivych tyzdnoch');
  gotoxy(1,1);
  write('>');
  repeat
    key:=readkey;
    if key=#0 then begin
      gotoxy(1,y);
      write(' ');
      case readkey of
        #72:dec(y);
        #80:inc(y);
      end;
      gotoxy(1,y);
      write('>');
    end;
  until key=#13;
  case y of
    1:;
    2:;
    3:;
    4:;
    5:;
    6:;
  end;
  readln;
  closeFile(tf);
end.

