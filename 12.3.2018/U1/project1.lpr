program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
  tf,tfm,tfp:textFile;
  mp,meno:shortstring;
begin
  assignFile(tf,'vstup.txt');
  assignFile(tfm,'mena.txt');
  assignFile(tfp,'priezviska.txt');
  reset(tf);
  rewrite(tfm);
  rewrite(tfp);
  while not eof(tf) do
  begin
    readln(tf,mp);
    meno:=copy(mp,1,pos(' ',mp)-1);
    delete(mp,1,pos(' ',mp));
    writeln(tfm,meno);
    writeln(tfp,mp);
  end;
  closeFile(tf);
  closeFile(tfm);
  closeFile(tfp);
end.

