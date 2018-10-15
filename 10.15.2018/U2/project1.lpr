program project1;

{$mode objfpc}{$H+}

uses
  sysutils,math,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
procedure bin(vstup:string);
var
  i,j,k,typ:integer;
  vystup:extended;
  bin: array of integer;
begin
  SetLength(bin,length(vstup));
  j:=0;
  k:=0;
  vystup:=0;
  for i:=length(vstup) downto 1 do
  begin
    bin[j]:=StrToInt(vstup[i]);
    inc(j);
  end;
  for i:=0 to length(bin)-1 do
    if bin[i]=1 then
    begin
         vystup:=vystup+power(2,k);
         inc(k);
    end
    else
        inc(k);
  write(vystup:1:0);
end;
procedure(vstup:string);
var
  hex: array of char;
begin
  SetLength(hex,length(vstup));
  j:=0;
  vystup:=0;
  for i:=length(vstup) downto 1 do
  begin
    hex[j]:=StrToInt(vstup[i]);
    inc(j);
  end;
  //dorobiť

  writeln(vystup:1:0);
  end;

var
  typ:integer;
  vstup:string;
begin
  readln(vstup,typ);
  case typ of
  2:bin(vstup);
  8:oct(vstup);
  16:hex(vstup);
  end;
  readln;
end.
