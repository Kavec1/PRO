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
  vstup:string;
  cif_sucet,i,j,k,d11_cif:integer;
  d2,d3,d4:boolean;
begin
  readln(vstup);
  d2:=FALSE;
  d3:=FALSE;
  d4:=FALSE;
  d11_cif:=0;

  case length(vstup) of
  1:vstup:='00'+vstup;
  2:vstup:='0'+vstup;
  end;

  if (StrToInt(vstup[length(vstup)]) mod 2)=0 then
  begin
    writeln('Delitelne 2');
    d2:=TRUE;
  end;

  for i:=1 to length(vstup) do
  cif_sucet:=cif_sucet+StrToInt(vstup[i]);
  if (cif_sucet mod 3)=0 then
  begin
    writeln('Delitelne 3');
    d3:=TRUE;
  end;

  if (StrToInt(vstup[length(vstup)-1]+vstup[length(vstup)]) mod 4)=0 then
  begin
    writeln('Delitelne 4');
    d4:=TRUE;
  end;

  if (StrToInt(vstup[length(vstup)])=0) or (StrToInt(vstup[length(vstup)])=5) then
  writeln('Delitelne 5');

  if d2 and d3 then
  writeln('Delitelne 6');

  if (StrToInt(vstup) mod 7)=0 then
  writeln('Delitelne 7');

  if (StrToInt(vstup[length(vstup)-2]+vstup[length(vstup)-1]+vstup[length(vstup)]) mod 8)=0 then
  writeln('Delitelne 8');

  if (cif_sucet mod 9)=0 then
  writeln('Delitelne 9');

  if StrToInt(vstup[length(vstup)])=0 then
  writeln('Delitelne 10');

  for j:=1 to length(vstup) do
  begin
    if (j mod 2)=0 then
       d11_cif:=d11_cif-StrToInt(vstup[j])
    else
       d11_cif:=d11_cif+StrToInt(vstup[j])
  end;
  if ((d11_cif mod 11)=0) or (d11_cif=0) then
  writeln('Delitelne 11');

  if d3 and d4 then
  writeln('Delitelne 12');

  if (StrToInt(vstup) mod 13)=0 then
  writeln('Delitelne 13');

  if (StrToInt(vstup) mod 17)=0 then
  writeln('Delitelne 17');

  if (StrToInt(vstup[length(vstup)-1]+vstup[length(vstup)]) mod 25)=0 then
  writeln('Delitelne 25');

  if (vstup[length(vstup)]+vstup[length(vstup)])='00' then
  writeln('Delitelne 100');

  readln;
end.

