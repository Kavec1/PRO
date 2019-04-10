unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  tf1, tf2, tf3: textFile;
  znamky: array of array of integer;
  predmet: array of shortstring;
  ziak: array of shortstring;

implementation

 procedure zoznam;
 var
   avg: real;
   i,j: integer;
 begin
   with Form1 do begin
     Button1.Visible:=False;
     Edit1.Visible:=False;
     Edit2.Visible:=False;
     Memo1.Visible:=True;
     Memo1.Clear;
   end;
   for j:=0 to length(ziak)-1 do begin
     avg:=0;
     for i:=0 to length(predmet)-1 do
       avg:=avg+znamky[j][i];
     avg:=avg/length(predmet);
     Form1.Memo1.Lines.Add(ziak[j]+' '+floatToStrF(avg, ffFixed, 2, 2));
   end;
 end;
 procedure add;
 begin
   with Form1 do begin
     Button1.Visible:=True;
     Button1.Caption:='Pridať';
     Edit1.Visible:=True;
     Edit1.Text:='Meno';
     Edit2.Visible:=True;
     Edit2.Text:='Priezvisko';
     Memo1.Visible:=False;
   end;
 end;
 procedure find;
 begin
   with Form1 do begin
     Button1.Visible:=True;
     Button1.Caption:='Hľadať';
     Edit1.Visible:=False;
     Edit2.Visible:=True;
     Edit2.Text:='Priezvisko';
     Memo1.Visible:=True;
     Memo1.Clear;
   end;
 end;
 procedure generate;
 var
   tf4 :textFile;
   i,j:integer;
 begin
   with Form1 do begin
     Button1.Visible:=False;
     Edit1.Visible:=False;
     Edit2.Visible:=False;
     Memo1.Visible:=True;
     Memo1.Clear;
     Memo1.Lines.Add('Hotovo!');
   end;
   for i:=0 to length(predmet)-1 do begin
     assignFile(tf4,predmet[i]+'.txt');
     rewrite(tf4);
     for j:=0 to length(ziak)-1 do begin
       if znamky[j][i]=5 then
         writeln(tf4,ziak[j]);
     end;
     closeFile(tf4);
   end;
 end;
 {$R *.lfm}

{ TForm1 }

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0:zoznam;
    1:add;
    2:find;
    3:generate;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j,predm:integer;
  znamka: shortstring;
begin
  randomize;
  i:=0;
  predm:=0;
  assignFile(tf1,'mena.txt');
  assignFile(tf2,'predmety.txt');
  assignFile(tf3,'znamky.txt');
  reset(tf1);
  reset(tf2);
  reset(tf3);

  while not eof(tf2) do begin
    setLength(predmet,length(predmet)+1);
    readln(tf2,predmet[predm]);
    inc(predm);
 end;

  while not eof(tf1) do begin
    setLength(ziak,length(ziak)+1);
    setLength(znamky,length(znamky)+1,predm);
    readln(tf1, ziak[i]);
    readln(tf3, znamka);

    for j:=0 to predm-1 do
      if pos(' ',znamka)<>0 then begin
        znamky[i][j]:=strToInt(copy(znamka,1,1));
        delete(znamka,1,2);
      end else
        znamky[i][j]:=strToInt(znamka);
    inc(i);
  end;
  closeFile(tf1);
  closeFile(tf2);
  closeFile(tf3);
end;

procedure TForm1.Button1Click(Sender: TObject);
 var
   meno,priezvisko,znamka: shortstring;
   i:integer;
begin
  if RadioGroup1.ItemIndex=1 then begin
    znamka:='';
    append(tf1);
    append(tf3);
    meno:=Form1.Edit1.Text;
    priezvisko:=Form1.Edit2.Text;
    writeln(tf1,meno+' '+priezvisko);
    for i:=0 to length(predmet)-2 do
      znamka:=znamka+intToStr(random(5)+1)+' ';
    znamka:=znamka+intToStr(random(5)+1);
    writeln(tf3,znamka);
    closeFile(tf1);
    closeFile(tf3);
  end;

  if RadioGroup1.ItemIndex=2 then begin
    for i:=0 to length(ziak) do
      if pos(Form1.Edit2.Text,ziak[i])<>0 then
        Form1.Memo1.Lines.Add(ziak[i]);
  end;
end;

end.

