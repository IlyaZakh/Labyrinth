unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Form2.Close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Image1.Canvas.Brush.Color:=clBtnFace;
  Image1.Canvas.FillRect(Canvas.ClipRect);
  Image1.Canvas.Rectangle(-1,-1,66,66);
  Image1.Canvas.Brush.Color:=clYellow;
  Image1.Canvas.Ellipse(1,1,64,64);
  Image1.Canvas.Brush.Color:=clBlack;
  Image1.Canvas.Ellipse(19,18,26,35);
  Image1.Canvas.Ellipse(39,18,46,35);
  Image1.Canvas.Arc(10,10,55,55,15,40,55,40);
end;

end.
 