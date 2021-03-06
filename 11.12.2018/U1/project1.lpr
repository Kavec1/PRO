program project1;

{$mode objfpc}{$H+}

uses
  crt,SysUtils,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
const
  File_Name = 'obr3.txt';

var
  tfIn: TextFile;
  s:string;
  color,count,i:integer;
begin
  AssignFile(tfIn,File_Name);
  reset(tfIn);

  while not eof(tfIn) do
  begin
    readln(tfIn,s);
    repeat
      count:=StrToInt(copy(s,1,pos(' ',s)-1));
      delete(s,1,pos(' ',s));
      color:=StrToInt(copy(s,1,pos(' ',s)-1));
      delete(s,1,pos(' ',s));
      for i:=1 to count do
      begin
        textcolor(color);
        write('O');
      end;
    until pos(' ',s)=0;
    writeln;
  end;

  readln;
  CloseFile(tfIn);
end.

