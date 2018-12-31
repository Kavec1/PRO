program project1;

{$mode objfpc}{$H+}

uses
  CRT,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  pole:array of array of char;
  x,y,i,j,rozmer,h,k,a,b,c,d,kx1,ky1,kx2,ky2,hs1,hs2:integer;
  p,key,k1,k2:char;
  h1,h2:boolean;

procedure karta1(x,y:integer);
begin
  write(pole[(x div 2)-1,y-1]);
  k1:=pole[(x div 2)-1,y-1];
  kx1:=(x div 2)-1;
  ky1:=y-1;
  pole[(x div 2)-1,y-1]:='*';
end;

procedure karta2(x,y:integer);
begin
  write(pole[(x div 2)-1,y-1]);
  k2:=pole[(x div 2)-1,y-1];
  kx2:=(x div 2)-1;
  ky2:=y-1;
  pole[(x div 2)-1,y-1]:='*';
  delay(1000);
  if k1=k2 then begin
    if h1 then
      inc(hs1)
    else
      inc(hs2);
  end else begin
    pole[kx1,ky1]:=k1;
    pole[kx2,ky2]:=k2;
    gotoxy((kx1+1)*2,ky1+1);
    write('*');
    gotoxy((kx2+1)*2,ky2+1);
    write('*');
    h1:=not h1;
    h2:=not h2;
  end;
end;

procedure game_end;
begin
  clrscr;
  if hs1=hs2 then
    writeln('Remiza')
  else if hs1>hs2 then
         writeln('Vyhral Hrac1 s ',hs1,' bodmi')
       else
         writeln('Vyhral Hrac2 s ',hs2,' bodmi');
  readln;
end;

function game():boolean;
var
  bool:boolean;
begin
  bool:=false;
  for i:=0 to rozmer do
    for j:=0 to rozmer do
      if pole[i,j]<>'*' then
        bool:=true;
      if not bool then
        game_end;
  game:=bool;
end;

begin
  randomize;
  x:=2;
  y:=1;
  k:=1;
  h1:=true;
  h2:=false;
  hs1:=0;
  hs2:=0;
  h:=65;

  writeln('Toto je hra pexeso pre 2 hracov');
  writeln('Hra sa ovlada pomocu sipiek a potvrdzuje sa cez enter');
  writeln;
  writeln('Rozmer hracej plochy je v rozmedzi 2-10, len parne');
  write('Zadajte rozmer hracej plochy: ');
  readln(rozmer);

  if (rozmer mod 2)=1 then
    inc(rozmer);

  if rozmer>10 then
    rozmer:=10;

  SetLength(pole,rozmer,rozmer);
  dec(rozmer);
  clrscr;

  for i:=0 to rozmer do       //vytvorenie hracej plochy
    for j:=0 to rozmer do
      if (j mod 2)=0 then
        pole[i,j]:=chr(h)
      else begin
        pole[i,j]:=chr(h);
        inc(h);
        if h=91 then
          h:=97;
      end;

 (* for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write(pole[i,j]:2);
    writeln;
  end;
  writeln; *)

  for i:=0 to rozmer*rozmer do begin    //poprehadzovanie hracej plochy
    a:=random(rozmer+1);
    b:=random(rozmer+1);
    c:=random(rozmer+1);
    d:=random(rozmer+1);
    p:=pole[a,b];
    pole[a,b]:=pole[c,d];
    pole[c,d]:=p;
  end;

  for i:=0 to rozmer do begin
    for j:=0 to rozmer do
      write('*':2);
    writeln;
  end;

  while game() do begin
    if h1 then begin
      gotoxy(rozmer*2+5,2);
      write('-> Hrac1: ',hs1);
      gotoxy(rozmer*2+5,3);
      write('   Hrac2: ',hs2);
    end else begin
      gotoxy(rozmer*2+5,2);
      write('   Hrac1: ',hs1);
      gotoxy(rozmer*2+5,3);
      write('-> Hrac2: ',hs2);
    end;
    gotoxy(x,y);
    key:=readkey;
    if key=#0 then begin
      case readkey of
        #72:begin
              if y<>1 then
                dec(y);
            end;
        #80:begin
              if y<>rozmer+1 then
                inc(y);
            end;
        #77:begin
              if x<>2*rozmer+2 then
                inc(x,2);
            end;
        #75:begin
              if x<>2 then
                dec(x,2);
            end;
      end;
      gotoxy(x,y);
    end else
    if key=#13 then begin
      if pole[(x div 2)-1,y-1]<>'*' then begin
        if(k mod 2)=1 then
          karta1(x,y)
        else
          karta2(x,y);
        inc(k);
      end;
    end;
  end;
end.

