program project1;

{$mode objfpc}{$H+}

uses
  crt,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
type
  tcrtcoord = 1..255;
var
  x,y:tcrtcoord;
  key:char;
procedure left;
begin
  //clrscr;
  dec(x);
end;
procedure right;
begin
  //clrscr;
  inc(x);
end;
procedure up;
begin
  //clrscr;
  dec(y);
end;
procedure down;
begin
  //clrscr;
  inc(y);
end;
begin
  x:=1;
  y:=1;
  gotoxy(x,y);
  while not keypressed do begin
  key:=readkey;
  if key=#0 then
  begin
    case readkey of
      #75:left;
      #77:right;
      #72:up;
      #80:down;
      #82:write('X');
      #83:write(' ');
      #71:write('*');
      #73:write('-');
    end;
    gotoxy(x,y);
  end
  else
  if key=#13 then
    write('enter')
    else
    write(key);

  end;
end.

