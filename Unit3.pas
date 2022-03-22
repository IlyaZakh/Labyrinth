unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus;

type
  TForm3 = class(TForm)
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Lab: array [1..200,1..100] of Boolean;
  NLab: array [1..200,1..100] of String[1];
  W,H: Integer;
  F: Text;

implementation

{$R *.dfm}

procedure Draw(X,Y:Integer);
var
  I,J:Integer;
begin
  Form3.Image1.Canvas.Pen.Color:=clWhite;
  Form3.Image1.Canvas.Brush.Color:=clWhite;
    Form3.Image1.Canvas.Rectangle(0,0,X*5,Y*5);
  Form3.Image1.Canvas.Pen.Color:=clBlack;
  Form3.Image1.Canvas.Brush.Color:=clBlack;
  for I:=1 to X do
    for J:=1 to Y do
      begin
        if Lab[I,J] then
          Form3.Image1.Canvas.Rectangle((I-1)*5,(J-1)*5,I*5,J*5);
      end;
end;

procedure ClearLab(X,Y:Integer);
var
  I,J:Integer;
begin
  for I:=1 to 200 do
    for J:=1 to 100 do
      Lab[I,J]:=False;
  for I:=1 to X do
    for J:=1 to Y do
      if Odd(I) then
        Lab[I,J]:=True
      else
        if Odd(J) then
          Lab[I,J]:=True;
end;

procedure CopyNLab(X,Y:Integer);
var
  I,J:Integer;
begin
  for I:=1 to 200 do
    for J:=1 to 100 do
      NLab[I,J]:='';
  for I:=1 to X do
    for J:=1 to Y do
      if Lab[I,J]=True then
        NLab[I,J]:='1'           //'0'-непосещенная точка
      else                       //'1'-стена
        NLab[I,J]:='0'           //'2'-посещенная точка
end;

procedure Generate(X,Y:Integer);
var
  B,Top,Bottom,Left,Right: Boolean;
  I,J,A,Am,G: Integer;
  Way: array [1..4852] of TPoint;
  Direct: String[1];
begin
  Randomize;
  ClearLab(X,Y);
  CopyNLab(X,Y);
  W:=X;
  H:=Y;
  Lab[X,Y-1]:=False;
  NLab[X,Y-1]:='2';
  NLab[X-1,Y-1]:='2';
  A:=1;
  Way[A].X:=X-1;
  Way[A].Y:=Y-1;
  repeat
    B:=False;
    for I:=1 to X do
      for J:=1 to Y do
        if NLab[I,J]='0' then
          B:=True;
    if B then
      begin
        Am:=0;
        Top:=False;
        Bottom:=False;
        Left:=False;
        Right:=False;
        while Am=0 do
          begin
            if (NLab[Way[A].X,Way[A].Y-1]='1') and
              (NLab[Way[A].X,Way[A].Y-2]='0') then
                begin
                  Am:=Am+1;
                  Top:=True;
                end;
            if (NLab[Way[A].X,Way[A].Y+1]='1') and
              (NLab[Way[A].X,Way[A].Y+2]='0') then
                begin
                  Am:=Am+1;
                  Bottom:=True;
                end;
            if (NLab[Way[A].X-1,Way[A].Y]='1') and
              (NLab[Way[A].X-2,Way[A].Y]='0') then
                begin
                  Am:=Am+1;
                  Left:=True;
                end;
            if (NLab[Way[A].X+1,Way[A].Y]='1') and
              (NLab[Way[A].X+2,Way[A].Y]='0') then
                begin
                  Am:=Am+1;
                  Right:=True;
                end;
            if Am<>0 then
              begin
                Direct:='';
                G:=Random(Am)+1;
                if G=1 then
                  if Top then
                    Direct:='T'
                  else
                    if Bottom then
                      Direct:='B'
                    else
                      if Left then
                        Direct:='L'
                      else
                        Direct:='R'
                else
                  if G=2 then
                    if Bottom then
                      Direct:='B'
                    else
                      if Left then
                        Direct:='L'
                      else
                        if Right then
                          Direct:='R'
                        else
                          Direct:='T'
                  else
                    if G=3 then
                      if Left then
                        Direct:='L'
                      else
                        if Right then
                          Direct:='R'
                        else
                          if Top then
                            Direct:='T'
                          else
                            Direct:='B'
                    else
                      if Right then
                        Direct:='R'
                      else
                        if Top then
                          Direct:='T'
                        else
                          if Bottom then
                            Direct:='B'
                          else
                            Direct:='L';
                A:=A+1;
                if Direct='T' then
                  begin
                    Way[A].X:=Way[A-1].X;
                    Way[A].Y:=Way[A-1].Y-2;
                    Lab[Way[A].X,Way[A].Y+1]:=False;
                    NLab[Way[A].X,Way[A].Y+1]:='2';
                    NLab[Way[A].X,Way[A].Y]:='2';
                  end
                else
                  if Direct='B' then
                    begin
                      Way[A].X:=Way[A-1].X;
                      Way[A].Y:=Way[A-1].Y+2;
                      Lab[Way[A].X,Way[A].Y-1]:=False;
                      NLab[Way[A].X,Way[A].Y-1]:='2';
                      NLab[Way[A].X,Way[A].Y]:='2';
                    end
                  else
                    if Direct='L' then
                      begin
                        Way[A].X:=Way[A-1].X-2;
                        Way[A].Y:=Way[A-1].Y;
                        Lab[Way[A].X+1,Way[A].Y]:=False;
                        NLab[Way[A].X+1,Way[A].Y]:='2';
                        NLab[Way[A].X,Way[A].Y]:='2';
                      end
                    else
                      begin
                        Way[A].X:=Way[A-1].X+2;
                        Way[A].Y:=Way[A-1].Y;
                        Lab[Way[A].X-1,Way[A].Y]:=False;
                        NLab[Way[A].X-1,Way[A].Y]:='2';
                        NLab[Way[A].X,Way[A].Y]:='2';
                      end;
              end
            else
              A:=A-1;
          end;
      end;
  until
    B=False;
  Draw(X,Y);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  try
    if not Odd(StrToInt(Edit1.Text)) then
      Edit1.Text:=IntToStr(StrToInt(Edit1.Text)-1);
    if not Odd(StrToInt(Edit2.Text)) then
      Edit2.Text:=IntToStr(StrToInt(Edit2.Text)-1);
    if StrToInt(Edit1.Text)<3 then
      Edit1.Text:='3';
    if StrToInt(Edit2.Text)<3 then
      Edit2.Text:='3';
    if StrToInt(Edit1.Text)>=200 then
      Edit1.Text:='199';              
    if StrToInt(Edit2.Text)>=100 then
      Edit2.Text:='99';
    Image1.Canvas.Brush.Color := clWhite;
    Image1.Picture.Bitmap.Width:=StrToInt(Edit1.Text)*5;
    Image1.Picture.Bitmap.Height:=StrToInt(Edit2.Text)*5;
    Image1.Width:=StrToInt(Edit1.Text)*5;
    Image1.Height:=StrToInt(Edit2.Text)*5;
    if StrToInt(Edit1.Text)>=15 then
      Form3.ClientWidth:=Image1.Width+152
    else
      Form3.ClientWidth:=227;
    if StrToInt(Edit2.Text)>=29 then
      Form3.ClientHeight:=Image1.Height+16
    else
      Form3.ClientHeight:=161;
    Form3.Position:=poMainFormCenter;
    Button2.Visible:=True;
    Generate(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
  except
    ShowMessage('Введены неверные данные');
  end;
end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,#13]) then
    Key:=#0;
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
  try
    UpDown1.Position:=StrToInt(Edit1.Text);
    UpDown2.Position:=StrToInt(Edit2.Text);
  except
  end;
end;

procedure TForm3.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  Edit1.Text:=IntToStr(UpDown1.Position);
  Edit2.Text:=IntToStr(UpDown2.Position);
end;

procedure TForm3.Button2Click(Sender: TObject);
var
  I,J: Integer;
  S: String[199];
begin
  if SaveDialog1.Execute then
    begin
      AssignFile(F,SaveDialog1.FileName);
      ReWrite(F);
      for I:=1 to H do
        begin
          S:='';
          for J:=1 to W do
            if Lab[J,I] then
              S:=S+'1'
            else
              S:=S+'0';
          Writeln(F,S);
        end;
      CloseFile(F);
    end;
end;

end.
