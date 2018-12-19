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
  x,y,i,j,rozmer,h,a,b,c,d:integer;
  p,key:char;
begin
  randomize;
  x:=2;
  y:=1;
  readln(rozmer);
  if (rozmer mod 2)=1 then
    inc(rozmer);
  if rozmer>10 then
    rozmer:=10;
  SetLength(pole,rozmer,rozmer);
  dec(rozmer);
  h:=64;
  clrscr;
  for i:=0 to rozmer do begin        //vytvorenie hacej plochy
    for j:=0 to rozmer do begin
      if (j mod 2)=1 then
        pole[i,j]:=chr(h)
      else begin
        inc(h);
        pole[i,j]:=chr(h);
        if h=90 then
          h:=97;
      end;
    end;
  end;

(*  for i:=0 to rozmer do begin
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

   while not keypressed do begin
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
    if key=#13 then
      break;
  end;
  readln;
end.

