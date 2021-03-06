unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type
  TZoz = record
    meno:shortstring;
    priezvisko:shortstring;
    znacka:shortstring;
    model:shortstring;
    spz:shortstring;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function g_spz:shortstring;
    procedure readFile;
    procedure RadioGroup1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  f:file of TZoz;
  zoznam:array of TZoz;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  assignFile(f,'file.dat');
  readFile;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  spztka:shortstring;
  i:integer;
begin
  spztka:=g_spz;
  Form1.Label1.Caption:=spztka;
  for i:=0 to length(zoznam)-1 do
    with zoznam[i] do begin
      meno:=Form1.Edit1.Text;
      priezvisko:=Form1.Edit2.Text;
      znacka:=Form1.Edit3.Text;
      model:=Form1.Edit4.Text;
      spz:=spztka;
    end;
  reset(f);
  seek(f,fileSize(f)-1);
  for i:=0 to length(zoznam)-1 do
    write(f,zoznam[i]);
  closeFile(f);
end;

function Tform1.g_spz:shortstring;
begin
  g_spz:='ZA-'+intToStr(random(10))+intToStr(random(10))+intToStr(random(10))+chr(random(26)+65)+chr(random(26)+65);
end;

procedure TForm1.readFile;
var
  a:TZoz;
  i:integer;
begin
  i:=0;
  reset(f);
  while not eof(f) do begin
    inc(i);
    setlength(zoznam,i);
    read(f,a);
    zoznam[i-1]:=a;
  end;
  closeFile(f);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var
  i:integer;
begin
  case Form1.RadioGroup1.ItemIndex of
    0:begin
        Form1.Edit1.Visible:=False;
        Form1.Edit2.Visible:=False;
        Form1.Edit3.Visible:=False;
        Form1.Edit4.Visible:=False;
        Form1.Label1.Visible:=False;
        Form1.Button1.Visible:=False;
        Form1.Memo1.Visible:=True;
        readFile;
        for i:=0 to length(zoznam)-1 do
          with Form1.Memo1.Lines do begin
            Clear;
            add(zoznam[i].meno);
            add(zoznam[i].priezvisko);
            add(zoznam[i].znacka);
            add(zoznam[i].model);
            add(zoznam[i].spz);
          end;
      end;
    1:begin
        Form1.Memo1.Visible:=False;
        Form1.Edit1.Visible:=True;
        Form1.Edit2.Visible:=True;
        Form1.Edit3.Visible:=True;
        Form1.Edit4.Visible:=True;
        Form1.Label1.Visible:=True;
        Form1.Button1.Visible:=True;
        Form1.Label1.Caption:='';
      end;
    2:begin
        Form1.Memo1.Visible:=False;
        Form1.Edit1.Visible:=False;
        Form1.Edit2.Visible:=False;
        Form1.Edit3.Visible:=False;
        Form1.Edit4.Visible:=False;
        Form1.Label1.Visible:=False;
        Form1.Button1.Visible:=False;
    end;
    3:begin
        Form1.Memo1.Visible:=False;
        Form1.Edit1.Visible:=False;
        Form1.Edit2.Visible:=False;
        Form1.Edit3.Visible:=False;
        Form1.Edit4.Visible:=False;
        Form1.Label1.Visible:=False;
        Form1.Button1.Visible:=False;
    end;
  end;
end;

end.

