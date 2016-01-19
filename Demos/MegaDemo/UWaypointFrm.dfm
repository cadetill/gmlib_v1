object WaypointFrm: TWaypointFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Waypoint'
  ClientHeight = 212
  ClientWidth = 343
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 27
    Width = 39
    Height = 13
    Caption = 'Address'
  end
  object Label36: TLabel
    Left = 175
    Top = 58
    Width = 17
    Height = 13
    Caption = 'Lng'
  end
  object Label37: TLabel
    Left = 32
    Top = 58
    Width = 15
    Height = 13
    Caption = 'Lat'
  end
  object Label2: TLabel
    Left = 32
    Top = 139
    Width = 20
    Height = 13
    Caption = 'Title'
  end
  object eAddress: TEdit
    Left = 77
    Top = 24
    Width = 231
    Height = 21
    TabOrder = 0
  end
  object eLng: TEdit
    Left = 198
    Top = 55
    Width = 110
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object eLat: TEdit
    Left = 53
    Top = 55
    Width = 110
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object cbStopOver: TCheckBox
    Left = 32
    Top = 96
    Width = 97
    Height = 17
    Caption = 'StopOver'
    TabOrder = 3
  end
  object eTitle: TEdit
    Left = 77
    Top = 136
    Width = 231
    Height = 21
    TabOrder = 4
  end
  object bOk: TButton
    Left = 233
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 5
  end
end
