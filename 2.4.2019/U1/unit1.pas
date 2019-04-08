unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Spin, Arrow, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ColorButton1: TColorButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ColorButton1ColorChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button10Click(Sender: TObject);
begin
  Form1.Shape1.Shape:=stRectangle;
  Form1.Shape1.Pen.Width:=1;
  Form1.Shape1.Brush.Style:=bsSolid;
  Form1.ColorButton1.ButtonColor:=clWhite;
  Form1.Shape1.Left:=264;
  Form1.Shape1.Top:=80;
  Form1.Shape1.Width:=65;
  Form1.Shape1.Height:=104;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Form1.ColorButton1.ButtonColor:=random(clWhite+1);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Form1.Shape1.Left:=random(Form1.Width-Form1.Shape1.Width);
  Form1.Shape1.Top:=random(Form1.Height-Form1.Shape1.Height);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form1.ColorButton1.ButtonColor:=clRed;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form1.ColorButton1.ButtonColor:=clGreen;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form1.ColorButton1.ButtonColor:=clBlue;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Form1.ColorButton1.ButtonColor:=clBlack;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Form1.Shape1.Shape:=stRectangle;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Form1.Shape1.Shape:=stEllipse;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Form1.Shape1.Brush.Style:=bsDiagCross;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Form1.Shape1.Brush.Style:=bsSolid;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Form1.Shape1.Pen.Width:=6;
end;

procedure TForm1.ColorButton1ColorChanged(Sender: TObject);
begin
  Form1.Shape1.Brush.Color:=Form1.ColorButton1.ButtonColor;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Form1.Shape1.Width:=Form1.SpinEdit1.Value;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  Form1.Shape1.Height:=Form1.SpinEdit2.Value;
end;

end.

