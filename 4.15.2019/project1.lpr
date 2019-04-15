program project1;

{$mode objfpc}{$H+}

uses
  Crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
function inArray(ar:array of boolean;st:boolean):boolean;
var
  p:boolean;
  i:integer;
begin
  p:=false;
  for i:=0 to length(ar)-1 do
    if ar[i]=st then
      p:=true;
  inArray:=p;
end;
var
  tf:textFile;
  riadok:shortstring;
  aj,sj:array of shortstring;
  spravne:array of boolean;
  i:integer;
begin
  randomize;
  i:=-1;
  assignFile(tf,'slovnik.txt');
  reset(tf);
  while not eof(tf) do begin
    inc(i);
    setLength(aj,length(aj)+1);
    setLength(sj,length(sj)+1);
    setLength(spravne,length(spravne)+1);
    spravne[i]:=False;
    readln(tf,riadok);
    aj[i]:=copy(riadok,1,pos(' ',riadok)-1);
    delete(riadok,1,pos(' ',riadok));
    sj[i]:=riadok;
  end;
  closeFile(tf);
  writeln('Toto je trapny slovnik');
  while inArray(spravne,False) do begin
    repeat
      i:=random(length(aj));
    until spravne[i]=False;
    writeln('Preloz toto slovo: '+ aj[i]);
    write('Tvoj preklad je: ');
    readln(riadok);
    clrscr;
    if riadok=sj[i] then begin
      writeln('Spravne! :)');
      spravne[i]:=True;
    end else begin
      writeln('Nespravne! :(');
    end;
  end;
  writeln('Koniec.');
  readln;
end.


