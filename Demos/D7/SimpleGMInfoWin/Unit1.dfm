object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 427
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 41
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object bDo: TButton
      Left = 16
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Do InfoWin'
      Enabled = False
      TabOrder = 0
      OnClick = bDoClick
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 41
    Width = 619
    Height = 386
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C000000FA3F0000E52700000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object GMMap1: TGMMap
    Language = Espanol
    Active = True
    IntervalEvents = 200
    Precision = 0
    RequiredProp.Center.Lat = 41.399632480000000000
    RequiredProp.Center.Lng = 2.167947770000000000
    RequiredProp.MapType = mtROADMAP
    RequiredProp.Zoom = 8
    NonVisualProp.MaxZoom = 0
    NonVisualProp.MinZoom = 0
    NonVisualProp.MapMaker = False
    Layers.Panoramio.Filtered = False
    Layers.Panoramio.Clickable = True
    Layers.Panoramio.Show = False
    Layers.Traffic.Show = False
    Layers.Transit.Show = False
    Layers.Bicycling.Show = False
    Layers.Weather.Show = False
    Layers.Weather.Clickable = True
    Layers.Weather.LabelColor = lcBLACK
    Layers.Weather.SuppressInfoWindows = False
    Layers.Weather.TemperatureUnit = tuCELSIUS
    Layers.Weather.WindSpeedUnit = wsKILOMETERS_PER_HOUR
    AfterPageLoaded = GMMap1AfterPageLoaded
    VisualProp.MapTypeCtrl.Position = cpTOP_RIGHT
    VisualProp.MapTypeCtrl.Style = mtcDEFAULT
    VisualProp.MapTypeCtrl.Show = True
    VisualProp.OverviewMapCtrl.Opened = True
    VisualProp.OverviewMapCtrl.Show = True
    VisualProp.PanCtrl.Position = cpTOP_LEFT
    VisualProp.PanCtrl.Show = True
    VisualProp.RotateCtrl.Position = cpTOP_LEFT
    VisualProp.RotateCtrl.Show = True
    VisualProp.ScaleCtrl.Position = cpBOTTOM_LEFT
    VisualProp.ScaleCtrl.Style = scDEFAULT
    VisualProp.ScaleCtrl.Show = True
    VisualProp.StreetViewCtrl.Position = cpTOP_LEFT
    VisualProp.StreetViewCtrl.Show = True
    VisualProp.ZoomCtrl.Position = cpTOP_LEFT
    VisualProp.ZoomCtrl.Style = zcDEFAULT
    VisualProp.ZoomCtrl.Show = True
    VisualProp.BGColor = 15659247
    WebBrowser = WebBrowser1
    Left = 240
    Top = 152
  end
  object GMInfoWindow1: TGMInfoWindow
    Language = Espanol
    Map = GMMap1
    AutoUpdate = True
    VisualObjects = <>
    Left = 328
    Top = 152
  end
end
