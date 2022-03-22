object Form3: TForm3
  Left = 487
  Top = 235
  BorderStyle = bsToolWindow
  Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1083#1072#1073#1080#1088#1080#1085#1090#1086#1074
  ClientHeight = 329
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    465
    329)
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 313
    Height = 313
  end
  object Label1: TLabel
    Left = 344
    Top = 16
    Width = 42
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1064#1080#1088#1080#1085#1072':'
  end
  object Label2: TLabel
    Left = 344
    Top = 48
    Width = 41
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1089#1086#1090#1072':'
  end
  object Label3: TLabel
    Left = 328
    Top = 112
    Width = 123
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1099#1081' '#1088#1072#1079#1084#1077#1088':'
  end
  object Label4: TLabel
    Left = 328
    Top = 128
    Width = 35
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '199x99'
  end
  object Edit1: TEdit
    Left = 392
    Top = 8
    Width = 33
    Height = 21
    Anchors = [akTop, akRight]
    PopupMenu = PopupMenu1
    TabOrder = 0
    Text = '1'
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object UpDown1: TUpDown
    Left = 425
    Top = 8
    Width = 17
    Height = 21
    Anchors = [akTop, akRight]
    Min = 1
    Max = 200
    Position = 1
    TabOrder = 1
    OnClick = UpDown1Click
  end
  object Edit2: TEdit
    Left = 392
    Top = 40
    Width = 33
    Height = 21
    Anchors = [akTop, akRight]
    PopupMenu = PopupMenu1
    TabOrder = 2
    Text = '1'
    OnChange = Edit1Change
    OnKeyPress = Edit1KeyPress
  end
  object UpDown2: TUpDown
    Left = 425
    Top = 40
    Width = 17
    Height = 21
    Anchors = [akTop, akRight]
    Min = 1
    Position = 1
    TabOrder = 3
    OnClick = UpDown1Click
  end
  object Button1: TButton
    Left = 344
    Top = 72
    Width = 97
    Height = 33
    Anchors = [akTop, akRight]
    Caption = #1057#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 384
    Top = 296
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    Visible = False
    OnClick = Button2Click
  end
  object SaveDialog1: TSaveDialog
    Filter = #1051#1072#1073#1080#1088#1080#1085#1090'|*.lab'
    Left = 432
    Top = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 432
    Top = 40
  end
end
