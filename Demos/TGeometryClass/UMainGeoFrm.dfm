object MainGeoFrm: TMainGeoFrm
  Left = 0
  Top = 0
  Caption = 'Main Form'
  ClientHeight = 444
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 140
    Width = 742
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 129
    ExplicitWidth = 315
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 742
    Height = 140
    Align = alTop
    Caption = ' '
    TabOrder = 0
    object Memo1: TMemo
      Left = 409
      Top = 1
      Width = 332
      Height = 138
      Align = alRight
      Lines.Strings = (
        'uses GMFunctionsVCL'
        ''
        'At design-time'
        '  - GMMap1.WebBrowser := WebBrowser1'
        '  - GMMap1.Active := True'
        '  - GMMap1.RequiredProp.Center.Lat := 41,39963248'
        '  - GMMap1.RequiredProp.Center.Lng := 2,16794777'
        '  - GMMap1.Precision := 8'
        '  - GMMarker1: 4 standard TMarkers'
        '  - GMPolygon1: 1 TPolygon'
        ''
        'At run-time'
        '  - Event GMMap1.AfterPageLoaded')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitHeight = 145
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 1
      Width = 408
      Height = 138
      Align = alClient
      TabOrder = 1
      ExplicitHeight = 145
      DesignSize = (
        387
        134)
      object Label1: TLabel
        Left = 16
        Top = 48
        Width = 158
        Height = 13
        Caption = 'EncodePath from GMPolygon1[0]'
      end
      object Label2: TLabel
        Left = 16
        Top = 88
        Width = 196
        Height = 13
        Caption = 'DecodePath from previous Encoded Path'
      end
      object Label3: TLabel
        Left = 16
        Top = 136
        Width = 323
        Height = 13
        Caption = 'ContainsLocation GMPolygon1[0] vs GMMarker[0] and GMMarker[2]'
      end
      object Label4: TLabel
        Left = 16
        Top = 184
        Width = 328
        Height = 13
        Caption = 'IsLocationOnEdge GMPolygon1[0] vs GMMarker[2] and GMMarker[1]'
      end
      object Label5: TLabel
        Left = 16
        Top = 5
        Width = 135
        Height = 13
        Caption = 'GMPolygon1[0] original Path'
      end
      object Label6: TLabel
        Left = 16
        Top = 232
        Width = 170
        Height = 13
        Caption = 'ComputeArea GMPolygon1[0] in m2'
      end
      object Label7: TLabel
        Left = 16
        Top = 275
        Width = 292
        Height = 13
        Caption = 'ComputeDistanceBetween GMMarker[0] vs GMMarker[1] in m'
      end
      object Label8: TLabel
        Left = 16
        Top = 318
        Width = 226
        Height = 13
        Caption = 'ComputeHeading GMMarker[0] vs GMMarker[1]'
      end
      object Label9: TLabel
        Left = 16
        Top = 361
        Width = 152
        Height = 13
        Caption = 'ComputeLength GMPolygon1[0]'
      end
      object Label10: TLabel
        Left = 16
        Top = 406
        Width = 274
        Height = 13
        Caption = 'ComputeOffset GMMarker[0], Distance 1000, heading 10'
      end
      object Label11: TLabel
        Left = 16
        Top = 446
        Width = 302
        Height = 13
        Caption = 'ComputeOffsetOrigin GMMarker[0], Distance 1000, heading 10'
      end
      object Label12: TLabel
        Left = 16
        Top = 489
        Width = 174
        Height = 13
        Caption = 'ComputeSignedArea GMPolygon1[0]'
      end
      object Label13: TLabel
        Left = 16
        Top = 534
        Width = 261
        Height = 13
        Caption = 'Interpolate GMMarker[0] vs GMMarker[1] Fraction 100'
      end
      object eEncodePath: TEdit
        Left = 24
        Top = 64
        Width = 273
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'eEncodePath'
      end
      object eDecodePath: TEdit
        Left = 24
        Top = 104
        Width = 273
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Text = 'eDecodePath'
      end
      object eContainsLocation0vs0: TEdit
        Left = 24
        Top = 152
        Width = 150
        Height = 21
        TabOrder = 2
        Text = 'eContainsLocation0vs0'
      end
      object eContainsLocation0vs2: TEdit
        Left = 180
        Top = 152
        Width = 150
        Height = 21
        TabOrder = 3
        Text = 'eContainsLocation0vs2'
      end
      object eIsLocationOnEdge0vs1: TEdit
        Left = 180
        Top = 203
        Width = 150
        Height = 21
        TabOrder = 4
        Text = 'eIsLocationOnEdge0vs1'
      end
      object eIsLocationOnEdge0vs2: TEdit
        Left = 24
        Top = 203
        Width = 150
        Height = 21
        TabOrder = 5
        Text = 'eIsLocationOnEdge0vs2'
      end
      object eOriginal: TEdit
        Left = 24
        Top = 21
        Width = 273
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        Text = 'eOriginal'
      end
      object eComputeArea: TEdit
        Left = 24
        Top = 248
        Width = 150
        Height = 21
        TabOrder = 7
        Text = 'eComputeArea'
      end
      object eComputeDistanceBetween: TEdit
        Left = 24
        Top = 291
        Width = 150
        Height = 21
        TabOrder = 8
        Text = 'eComputeDistanceBetween'
      end
      object eComputeHeading: TEdit
        Left = 24
        Top = 334
        Width = 150
        Height = 21
        TabOrder = 9
        Text = 'eComputeHeading'
      end
      object eComputeLength: TEdit
        Left = 24
        Top = 380
        Width = 150
        Height = 21
        TabOrder = 10
        Text = 'eComputeLength'
      end
      object eComputeOffset: TEdit
        Left = 24
        Top = 422
        Width = 150
        Height = 21
        TabOrder = 11
        Text = 'eComputeOffset'
      end
      object eComputeOffsetOrigin: TEdit
        Left = 24
        Top = 462
        Width = 150
        Height = 21
        TabOrder = 12
        Text = 'eComputeOffsetOrigin'
      end
      object eComputeSignedArea: TEdit
        Left = 24
        Top = 508
        Width = 150
        Height = 21
        TabOrder = 13
        Text = 'eComputeSignedArea'
      end
      object eInterpolate: TEdit
        Left = 24
        Top = 550
        Width = 150
        Height = 21
        TabOrder = 14
        Text = 'eInterpolate'
      end
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 143
    Width = 742
    Height = 301
    Align = alClient
    TabOrder = 1
    ExplicitTop = 129
    ExplicitWidth = 619
    ExplicitHeight = 298
    ControlData = {
      4C000000B04C00001C1F00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object GMMap1: TGMMap
    Language = Espanol
    Active = True
    IntervalEvents = 200
    Precision = 8
    RequiredProp.Center.Lat = 41.399632480000000000
    RequiredProp.Center.Lng = 2.167947770000000000
    RequiredProp.MapType = mtROADMAP
    RequiredProp.Zoom = 12
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
  object GMMarker1: TGMMarker
    Language = Espanol
    Map = GMMap1
    AutoUpdate = True
    VisualObjects = <
      item
        Tag = 0
        MarkerType = mtStyledMarker
        Animation.OnDrop = False
        Animation.Bounce = False
        Clickable = True
        Draggable = False
        Flat = False
        Position.Lat = 41.380866000000000000
        Position.Lng = 2.122579000000000000
        Title = '0'
        Visible = True
        Optimized = True
        RaiseOnDrag = True
        ColoredMarker.Width = 32
        ColoredMarker.Height = 32
        ColoredMarker.PrimaryColor = clRed
        ColoredMarker.StrokeColor = clBlack
        ColoredMarker.CornerColor = clWhite
        StyledMarker.StyledIcon = siMarker
        StyledMarker.ShowStar = False
        StyledMarker.BackgroundColor = clRed
        StyledMarker.TextColor = clBlack
        StyledMarker.StarColor = clLime
        InfoWindow.DisableAutoPan = False
        InfoWindow.MaxWidth = 0
        InfoWindow.PixelOffset.Height = 0
        InfoWindow.PixelOffset.Width = 0
        InfoWindow.CloseOtherBeforeOpen = True
        ShowInfoWinMouseOver = False
      end
      item
        Tag = 0
        MarkerType = mtStyledMarker
        Animation.OnDrop = False
        Animation.Bounce = False
        Clickable = True
        Draggable = False
        Flat = False
        Position.Lat = 41.403185000000000000
        Position.Lng = 2.173725000000000000
        Title = '1'
        Visible = True
        Optimized = True
        RaiseOnDrag = True
        ColoredMarker.Width = 32
        ColoredMarker.Height = 32
        ColoredMarker.PrimaryColor = clRed
        ColoredMarker.StrokeColor = clBlack
        ColoredMarker.CornerColor = clWhite
        StyledMarker.StyledIcon = siMarker
        StyledMarker.ShowStar = False
        StyledMarker.BackgroundColor = clRed
        StyledMarker.TextColor = clBlack
        StyledMarker.StarColor = clLime
        InfoWindow.DisableAutoPan = False
        InfoWindow.MaxWidth = 0
        InfoWindow.PixelOffset.Height = 0
        InfoWindow.PixelOffset.Width = 0
        InfoWindow.CloseOtherBeforeOpen = True
        ShowInfoWinMouseOver = False
      end
      item
        Tag = 0
        MarkerType = mtStyledMarker
        Animation.OnDrop = False
        Animation.Bounce = False
        Clickable = True
        Draggable = False
        Flat = False
        Position.Lat = 41.415382000000000000
        Position.Lng = 2.167700000000000000
        Title = '2'
        Visible = True
        Optimized = True
        RaiseOnDrag = True
        ColoredMarker.Width = 32
        ColoredMarker.Height = 32
        ColoredMarker.PrimaryColor = clRed
        ColoredMarker.StrokeColor = clBlack
        ColoredMarker.CornerColor = clWhite
        StyledMarker.StyledIcon = siMarker
        StyledMarker.ShowStar = False
        StyledMarker.BackgroundColor = clRed
        StyledMarker.TextColor = clBlack
        StyledMarker.StarColor = clLime
        InfoWindow.DisableAutoPan = False
        InfoWindow.MaxWidth = 0
        InfoWindow.PixelOffset.Height = 0
        InfoWindow.PixelOffset.Width = 0
        InfoWindow.CloseOtherBeforeOpen = True
        ShowInfoWinMouseOver = False
      end
      item
        Tag = 0
        MarkerType = mtStyledMarker
        Animation.OnDrop = False
        Animation.Bounce = False
        Clickable = True
        Draggable = False
        Flat = False
        Position.Lat = 41.375875000000000000
        Position.Lng = 2.177757000000000000
        Title = '3'
        Visible = True
        Optimized = True
        RaiseOnDrag = True
        ColoredMarker.Width = 32
        ColoredMarker.Height = 32
        ColoredMarker.PrimaryColor = clRed
        ColoredMarker.StrokeColor = clBlack
        ColoredMarker.CornerColor = clWhite
        StyledMarker.StyledIcon = siMarker
        StyledMarker.ShowStar = False
        StyledMarker.BackgroundColor = clRed
        StyledMarker.TextColor = clBlack
        StyledMarker.StarColor = clLime
        InfoWindow.DisableAutoPan = False
        InfoWindow.MaxWidth = 0
        InfoWindow.PixelOffset.Height = 0
        InfoWindow.PixelOffset.Width = 0
        InfoWindow.CloseOtherBeforeOpen = True
        ShowInfoWinMouseOver = False
      end>
    Left = 304
    Top = 152
  end
  object GMPolygon1: TGMPolygon
    Language = Espanol
    Map = GMMap1
    AutoUpdate = True
    VisualObjects = <
      item
        Tag = 0
        Clickable = True
        Editable = False
        Geodesic = False
        StrokeOpacity = 1.000000000000000000
        StrokeWeight = 2
        Visible = True
        AutoUpdatePath = True
        LinePoints = <
          item
            Lat = 41.403185000000000000
            Lng = 2.173725000000000000
          end
          item
            Lat = 41.432399270000000000
            Lng = 2.170203890000000000
          end
          item
            Lat = 41.415713950000000000
            Lng = 2.162254230000000000
          end>
        InfoWindow.DisableAutoPan = False
        InfoWindow.MaxWidth = 0
        InfoWindow.PixelOffset.Height = 0
        InfoWindow.PixelOffset.Width = 0
        InfoWindow.CloseOtherBeforeOpen = True
        Text = 'TPol'
        StrokeColor = clBlack
        FillColor = clRed
        FillOpacity = 0.500000000000000000
      end>
    Left = 376
    Top = 152
  end
end
