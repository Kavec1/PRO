program project1;

{$mode objfpc}{$H+}

uses
  SysUtils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };

const
  File_Name = 'Znamky.txt';

var
  tfOut: TextFile;
  i,j,znamky: integer;
  mena: array [1..10] of shortstring = ('Semion Mogilev','Al Capone','Charles "Lucky" Luciano','Pablo Escobar','John Gotti','Hisayuki Machii','Tony "Big Tuna" Accardi','Salvatore Riina','Dawood Ibrahim','Xie Caiping');
begin
  AssignFile(tfOut,File_Name);
  randomize;
  append(tfOut);
  for i:=1 to 10 do
  begin
    znamky:=0;
    for j:=1 to 4 do
      znamky:=znamky+(random(5)+1);

    write(mena[i]+' ma priemer znamok z maturity: ');
    writeln(znamky/4:1:1);
    write(tfOut,mena[i]+' ma priemer znamok z maturity: ');
    writeln(tfOut,znamky/4:1:1);
  end;
  writeln(tfOut,'---------------------------------------------------------');
  CloseFile(tfOut);
  readln;
end.

