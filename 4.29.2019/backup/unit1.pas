unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
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
  tf:textFile;
  meno,priezvisko,priezvisko_c,profesia:array of shortstring;
  plat:array of real;
implementation

{$R *.lfm}

procedure sort(var pole:array of shortstring;bool:boolean);
var
  i,j:integer;
  slovo:shortstring;
begin
  j:=0;
  if bool then begin       //vzostupne
    repeat
      for i:=0 to length(pole)-2 do begin
        if pole[i]>pole[i+1] then begin
          slovo:=pole[i];
          pole[i]:=pole[i+1];
          pole[i+1]:=slovo;
        end;
      end;
      inc(j);
    until j=length(pole);
  end else begin         //zostupne
    repeat
      for i:=0 to length(pole)-2 do begin
        if pole[i]<pole[i+1] then begin
          slovo:=pole[i];
          pole[i]:=pole[i+1];
          pole[i+1]:=slovo;
        end;
      end;
      inc(j);
    until j=length(pole);
  end;
end;

procedure file_read;
var
  p:shortstring;
  i:integer;
begin
  i:=0;
  reset(tf);
  setLength(meno,0);
  setLength(priezvisko,0);
  setLength(priezvisko_c,0);
  setLength(profesia,0);
  setLength(plat,0);
  while not eof(tf) do begin
    setLength(meno,length(meno)+1);
    setLength(priezvisko,length(priezvisko)+1);
    setLength(priezvisko_c,length(priezvisko_c)+1);
    setLength(profesia,length(profesia)+1);
    setLength(plat,length(plat)+1);
    readln(tf,meno[i]);
    readln(tf,p);
    priezvisko[i]:=p;
    priezvisko_c[i]:=p;
    readln(tf,profesia[i]);
    readln(tf,plat[i]);
    inc(i);
  end;
  sort(priezvisko_c,true);
  closeFile(tf);
end;

procedure file_write;
var
  i:integer;
begin
  i:=0;
  rewrite(tf);
  for i:=0 to length(meno)-1 do begin
    writeln(tf,meno[i]);
    writeln(tf,priezvisko[i]);
    writeln(tf,profesia[i]);
    writeln(tf,FloatToStrF(plat[i],FFfixed,0,2));
  end;
  closeFile(tf);
end;

{ TForm1 }

procedure TForm1.RadioGroup1Click(Sender: TObject);
var
  avg:real;
  i,j:integer;
begin
  avg:=0;
  case Form1.RadioGroup1.ItemIndex of
    0:begin
      with Form1 do begin
        Edit1.Visible:=False;
        Edit2.Visible:=False;
        Edit3.Visible:=False;
        Edit4.Visible:=False;
        Button1.Visible:=False;
      end;
      file_read;
      Memo1.Lines.Clear;
      for i:=0 to length(priezvisko_c)-1 do begin
        j:=-1;
        repeat
          inc(j);
        until priezvisko[j]=priezvisko_c[i];
        Memo1.Lines.Add(meno[j]+' '+priezvisko[j]+' '+profesia[j]+' '+floatToStrF(plat[j],FFfixed,0,2));
      end;
    end;
    1:begin
      with Form1 do begin
        Edit1.Visible:=False;
        Edit2.Text:='Priezvisko';
        Edit2.Visible:=True;
        Edit3.Visible:=False;
        Edit4.Visible:=False;
        Button1.Visible:=True;
      end;
      file_read;
      Memo1.Lines.Clear;
    end;
    2:begin
      with Form1 do begin
        Edit1.Visible:=False;
        Edit2.Visible:=False;
        Edit3.Text:='Profesia';
        Edit3.Visible:=True;
        Edit4.Visible:=False;
        Button1.Visible:=True;
      end;
      file_read;
      Memo1.Lines.Clear;
    end;
    3:begin
      Memo1.Lines.Clear;
      with Form1 do begin
        Edit1.Text:='Meno';
        Edit1.Visible:=True;
        Edit2.Text:='Priezvisko';
        Edit2.Visible:=True;
        Edit3.Text:='Profesia';
        Edit3.Visible:=True;
        Edit4.Text:='Plat';
        Edit4.Visible:=True;
        Button1.Visible:=True;
      end;
      file_read;
    end;
    4:begin
      Memo1.Lines.Clear;
      with Form1 do begin
        Edit1.Visible:=False;
        Edit2.Visible:=True;
        Edit3.Visible:=False;
        Edit4.Visible:=False;
        Button1.Visible:=True;
      end;
      file_read;
    end;
    5:begin
      with Form1 do begin
        Edit1.Visible:=False;
        Edit2.Visible:=False;
        Edit3.Visible:=False;
        Edit4.Visible:=False;
        Button1.Visible:=False;
      end;
      file_read;
      for i:=0 to length(plat)-1 do begin
          avg:=avg+plat[i];
      end;
      avg:=(avg/length(plat))/30.126;
      Memo1.Lines.Clear;
      Memo1.Lines.Add(floatToStrF(avg,FFfixed,0,2)+'€');
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  assignFile(tf,'vstup.txt');
  DecimalSeparator:=',';
  with Form1 do begin
    Edit1.Visible:=False;
    Edit2.Visible:=False;
    Edit3.Visible:=False;
    Edit4.Visible:=False;
    Button1.Visible:=False;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
begin
  i:=-1;
  Memo1.Lines.Clear;
  case Form1.RadioGroup1.ItemIndex of
    1:begin
      repeat
        inc(i);
      until Form1.Edit2.Text=priezvisko[i];
      Memo1.Lines.Add(meno[i]+' '+priezvisko[i]+' '+profesia[i]+' '+floatToStrF(plat[i],FFfixed,0,2));
    end;
    2:begin
      repeat
        inc(i);
      until Form1.Edit3.Text=profesia[i];
      Memo1.Lines.Add(meno[i]+' '+priezvisko[i]+' '+profesia[i]+' '+floatToStrF(plat[i],FFfixed,0,2));
    end;
    3:begin
      setLength(meno,length(meno)+1);
      setLength(priezvisko,length(priezvisko)+1);
      setLength(profesia,length(profesia)+1);
      setLength(plat,length(plat)+1);

      meno[Length(meno)-1]:=Form1.Edit1.Text;
      priezvisko[Length(priezvisko)-1]:=Form1.Edit2.Text;
      profesia[Length(profesia)-1]:=Form1.Edit3.Text;
      plat[Length(plat)-1]:=strToFloat(Form1.Edit4.Text);

      file_write;
    end;
  end;
end;

end.

