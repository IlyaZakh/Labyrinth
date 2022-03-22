unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, XPMan, Unit2, Unit3, StdCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    Image1: TImage;
    XPManifest1: TXPManifest;
    Label1: TLabel;
    Button1: TButton;
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Lab: array [1..200,1..100] of String[1];
  Cross: array [1..4852] of TPoint;
  F: Text;
  K: Integer;
  Size,Start: TPoint;

implementation

{$R *.dfm}

procedure Search3(X,Y:Integer);
var
  I,J,Am:Integer;
begin
  K:=0;
  for I:=1 to X do
    for J:=1 to Y do
      begin
        Am:=0;
        if Lab[I,J]<>'1' then
          begin
            if Lab[I,J-1]='0' then
              Am:=Am+1;
            if Lab[I,J+1]='0' then
              Am:=Am+1;
            if Lab[I-1,J]='0' then
              Am:=Am+1;
            if Lab[I+1,J]='0' then
              Am:=Am+1;
            if Am>2 then
              begin
                Lab[I,J]:='3';
                K:=K+1;
                Cross[K].X:=I;
                Cross[K].Y:=J;
              end;
          end;
      end;
end;

procedure Delete3(X,Y:Integer);
var
  I,J:Integer;
begin
  for I:=1 to X do
    for J:=1 to Y do
      if Lab[I,J]='3' then
        Lab[I,J]:='0';
end;

procedure ClearCross(A:Integer);
var
  I:Integer;
begin
  for I:=1 to A do
    begin
      Cross[I].X:=-1;
      Cross[I].Y:=-1;
    end;
end;

function SearchIn(X,Y:Integer):Boolean;
var
  I,Xa,Ya:Integer;
begin
  Result:=False;
  for I:=1 to K do
    begin
      Xa:=(Cross[I].X-1)*5;
      Ya:=(Cross[I].Y-1)*5;
      if ((X=Xa)or(X=Xa+1)or(X=Xa+2)or(X=Xa+3)or(X=Xa+4)or(X=Xa+5)) and
        ((Y=Ya)or(Y=Ya+1)or(Y=Ya+2)or(Y=Ya+3)or(Y=Ya+4)or(Y=Ya+5)) then
          begin
            Result:=True;
            Start.X:=Cross[I].X;
            Start.Y:=Cross[I].Y;
          end;
    end;
end;

procedure Draw(X,Y:Integer);
var
  I,J:Integer;
begin
  Form1.Image1.Canvas.Pen.Color:=clWhite;
  Form1.Image1.Canvas.Brush.Color:=clWhite;           //0 - пуста€ клетка
    Form1.Image1.Canvas.Rectangle(0,0,X*5,Y*5);       //1 - стена
  for I:=1 to X do                                    //2 - посещенна€ клетка
    for J:=1 to Y do                                  //3 - перекресток
      begin                                           //4 - невидима€ стена
        if (Lab[I,J]='0') or (Lab[I,J]='4') then
          begin
            Form1.Image1.Canvas.Pen.Color:=clWhite;
            Form1.Image1.Canvas.Brush.Color:=clWhite;
            Form1.Image1.Canvas.Rectangle((I-1)*5,(J-1)*5,I*5,J*5);
          end;
        if Lab[I,J]='1' then
          begin
            Form1.Image1.Canvas.Pen.Color:=clBlack;
            Form1.Image1.Canvas.Brush.Color:=clBlack;
            Form1.Image1.Canvas.Rectangle((I-1)*5,(J-1)*5,I*5,J*5);
          end;
        if Lab[I,J]='2' then
          begin
            Form1.Image1.Canvas.Pen.Color:=clRed;
            Form1.Image1.Canvas.Brush.Color:=clRed;
            Form1.Image1.Canvas.Rectangle((I-1)*5,(J-1)*5,I*5,J*5);
          end;
        if Lab[I,J]='3' then
          begin
            Form1.Image1.Canvas.Pen.Color:=clGreen;
            Form1.Image1.Canvas.Brush.Color:=clWhite;
            Form1.Image1.Canvas.Rectangle((I-1)*5,(J-1)*5,I*5,J*5);
          end;
      end;
  Form1.Image1.Canvas.Pen.Color:=clBlue;
  Form1.Image1.Canvas.Brush.Color:=clBlue;
  Form1.Image1.Canvas.Rectangle((Start.X-1)*5,(Start.Y-1)*5,Start.X*5,Start.Y*5);
end;

procedure Search;
var
  Top,Bottom,Left,Right:Boolean;
  A,Am,I,G: Integer;
  Way: array [1..100000] of TPoint;
  Direct: String[1];
begin
  Randomize;
  A:=1;
  Way[A].X:=Start.X;
  Way[A].Y:=Start.Y;
  while (Way[A].X<>Size.X) or (Way[A].Y<>Size.Y-1) do
    begin
      Top:=False;
      Bottom:=False;
      Left:=False;
      Right:=False;
      Am:=0;
      if Lab[Way[A].X,Way[A].Y-1]='0' then
        begin
          Am:=Am+1;
          Top:=True;
        end;
      if Lab[Way[A].X,Way[A].Y+1]='0' then
        begin
          Am:=Am+1;
          Bottom:=True;
        end;
      if Lab[Way[A].X-1,Way[A].Y]='0' then
        begin
          Am:=Am+1;
          Left:=True;
        end;
      if Lab[Way[A].X+1,Way[A].Y]='0' then
        begin
          Am:=Am+1;
          Right:=True;
        end;
      if Am<>0 then
        begin
          Direct:='';
          G:=Random(Am)+1;
          case G of
            1 : if Top then
                  Direct:='T'
                else
                  if Bottom then
                    Direct:='B'
                  else
                    if Left then
                      Direct:='L'
                    else
                      Direct:='R';
            2 : if Bottom then
                  Direct:='B'
                else
                  if Left then
                    Direct:='L'
                  else
                    if Right then
                      Direct:='R'
                    else
                      Direct:='T';
            3 : if Left then
                  Direct:='L'
                else
                  if Right then
                    Direct:='R'
                  else
                    if Top then
                      Direct:='T'
                    else
                      Direct:='B';
            4 : if Right then
                  Direct:='R'
                else
                  if Top then
                    Direct:='T'
                  else
                    if Bottom then
                      Direct:='B'
                    else
                      Direct:='L';
          end;
          A:=A+1;
          if Direct='T' then
            begin
              Way[A].X:=Way[A-1].X;
              Way[A].Y:=Way[A-1].Y-1;
              Lab[Way[A-1].X,Way[A-1].Y]:='2';
            end
          else
            if Direct='B' then
              begin
                Way[A].X:=Way[A-1].X;
                Way[A].Y:=Way[A-1].Y+1;
                Lab[Way[A-1].X,Way[A-1].Y]:='2';
              end
            else
              if Direct='L' then
                begin
                  Way[A].X:=Way[A-1].X-1;
                  Way[A].Y:=Way[A-1].Y;
                  Lab[Way[A-1].X,Way[A-1].Y]:='2';
                end
              else
                if Direct='R' then
                  begin
                    Way[A].X:=Way[A-1].X+1;
                    Way[A].Y:=Way[A-1].Y;
                    Lab[Way[A-1].X,Way[A-1].Y]:='2';
                  end;
        end
      else
        begin
          Lab[Way[A].X,Way[A].Y]:='4';
          A:=A-1;
        end;
    end;
  for I:=1 to A do
    Lab[Way[A].X,Way[A].Y]:='2';
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Form2.Position:=poMainFormCenter;
  Form2.Show;
end;

procedure TForm1.N4Click(Sender: TObject);
var
  S:String;
  H,I:Integer;
begin
  if OpenDialog1.Execute then
    begin
      H:=0;
      AssignFile(F, OpenDialog1.FileName);
      Reset(F);
      while not EOF(F) do
        begin
          Readln(F,S);
          H:=H+1;
          if H=1 then
            begin
              Image1.Width:=Length(S)*5;
              Image1.Picture.Bitmap.Width:=Length(S)*5;
              if Length(S)>=21 then
                Form1.ClientWidth:=Image1.Width+152
              else
                Form1.ClientWidth:=257;
            end;
          for I:=1 to Length(S) do
            Lab[I,H]:=S[I];
        end;
      Image1.Height:=H*5;
      Image1.Picture.Bitmap.Height:=H*5;
      if H>=21 then
        Form1.ClientHeight:=Image1.Height+16
      else
        Form1.ClientHeight:=121;
      CloseFile(F);
      Size.X:=Round(Image1.Width/5);
      Size.Y:=H;
      Start.X:=0;
      Start.Y:=0;
      Search3(Size.X,Size.Y);
      Draw(Size.X,Size.Y);
      Form1.Position:=poDesktopCenter;
      Label1.Caption:='¬ыберите точку';
      Button1.Visible:=False;
    end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Form3.Position:=poMainFormCenter;
  Form3.Show;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if SearchIn(X,Y) then
    Image1.Cursor:=crHandPoint
  else
    Image1.Cursor:=crDefault;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if SearchIn(X,Y) then
    begin
      Label1.Caption:='';
      Delete3(Size.X,Size.Y);
      ClearCross(K);
      Search;
      Draw(Size.X,Size.Y);
      Button1.Visible:=True;
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  S:String;
  H,I:Integer;
begin
  H:=0;
  AssignFile(F, OpenDialog1.FileName);
  Reset(F);
  while not EOF(F) do
    begin
      Readln(F,S);
      H:=H+1;
      if H=1 then
        begin
          Image1.Width:=Length(S)*5;
          Image1.Picture.Bitmap.Width:=Length(S)*5;
          if Length(S)>=21 then
            Form1.ClientWidth:=Image1.Width+152
          else
            Form1.ClientWidth:=257;
        end;
      for I:=1 to Length(S) do
        Lab[I,H]:=S[I];
    end;
  Image1.Height:=H*5;
  Image1.Picture.Bitmap.Height:=H*5;
  if H>=21 then
    Form1.ClientHeight:=Image1.Height+16
  else
    Form1.ClientHeight:=121;
  CloseFile(F);
  Size.X:=Round(Image1.Width/5);
  Size.Y:=H;
  Start.X:=0;
  Start.Y:=0;
  Search3(Size.X,Size.Y);
  Draw(Size.X,Size.Y);
  Label1.Caption:='¬ыберите точку';
  Button1.Visible:=False;
end;

end.
