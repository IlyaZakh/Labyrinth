object Form1: TForm1
  Left = 458
  Top = 124
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1051#1072#1073#1080#1088#1080#1085#1090#1099
  ClientHeight = 329
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
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
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
  end
  object Label1: TLabel
    Left = 328
    Top = 8
    Width = 98
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1088#1086#1081#1090#1077' '#1083#1072#1073#1080#1088#1080#1085#1090
  end
  object Button1: TButton
    Left = 384
    Top = 296
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1057#1073#1088#1086#1089
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Filter = #1051#1072#1073#1080#1088#1080#1085#1090'|*.lab'
    Left = 288
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 48
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N4: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = N4Click
      end
      object N5: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N5Click
      end
    end
    object N2: TMenuItem
      Caption = #1043#1077#1085#1077#1088#1072#1090#1086#1088' '#1083#1072#1073#1080#1088#1080#1085#1090#1086#1074
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N6: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = N6Click
      end
    end
  end
  object XPManifest1: TXPManifest
    Left = 288
    Top = 80
  end
end
