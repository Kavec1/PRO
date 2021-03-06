program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  tf:textFile;
  i,j,op,ol,hp,hl,mp,ml:integer;
  vzorec:shortstring;
  poradie,pocet,podo,podh,podm:boolean;
begin
  assignFile(tf,'vstup.txt');
  reset(tf);
  while not eof(tf) do begin
    pocet:=false;
    poradie:=false;
    podo:=true;
    podh:=true;
    podm:=true;
    readln(tf,vzorec);
    writeln(vzorec);
    op:=0;
    ol:=0;
    hp:=0;
    hl:=0;
    mp:=0;
    ml:=0;

    for i:=1 to length(vzorec) do
      case vzorec[i] of
        '(':inc(ol);
        ')':inc(op);
        '[':inc(hl);
        ']':inc(hp);
        '{':inc(ml);
        '}':inc(mp);
      end;

    if (op=ol) and (hp=hl) and (mp=ml) then
      pocet:=true;

    i:=0;
    j:=0;
    if pocet then
      for i:=1 to length(vzorec) do
        if vzorec[i]='(' then begin
          repeat
            inc(j);
          until vzorec[j]=')';
          if i<j then begin
            delete(vzorec,i,1);
            dec(ol);
            delete(vzorec,j-1,1);
            dec(op);
          end else
            podo:=false;
          j:=0;
        end;

      i:=0;
    j:=0;
    if pocet then
      for i:=1 to length(vzorec) do
        if vzorec[i]='[' then begin
          repeat
            inc(j);
          until vzorec[j]=']';
          if i<j then begin
            delete(vzorec,i,1);
            dec(hl);
            delete(vzorec,j-1,1);
            dec(hp);
          end else
            podh:=false;
          j:=0;
        end;

      i:=0;
    j:=0;
    if pocet then
      for i:=1 to length(vzorec) do
        if vzorec[i]='{' then begin
          repeat
            inc(j);
          until vzorec[j]='}';
          if i<j then begin
            delete(vzorec,i,1);
            dec(ml);
            delete(vzorec,j-1,1);
            dec(mp);
          end else
            podm:=false;
          j:=0;
        end;

    if (op=ol) and (hp=hl) and (mp=ml) and podo and podh and podm then
      poradie:=true;

    if pocet and poradie then
      writeln('Vzorec je spravny')
    else
      writeln('Vzorec je nespravny');
    writeln;
    end;
  closeFile(tf);
  readln;
end.

