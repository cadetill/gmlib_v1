object MainFrm: TMainFrm
  Left = 0
  Top = 0
  AlphaBlendValue = 0
  Caption = 'GMLib Mega Demo'
  ClientHeight = 405
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 269
    Width = 634
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 0
    ExplicitWidth = 297
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 386
    Width = 634
    Height = 19
    Panels = <
      item
        Width = 170
      end
      item
        Width = 100
      end
      item
        Width = 100
      end
      item
        Style = psOwnerDraw
        Text = 'www.cadetill.com'
        Width = 110
      end
      item
        Text = 'cadetill - '#169' 2010-2012'
        Width = 140
      end>
    OnMouseMove = sbStatusMouseMove
    OnMouseUp = sbStatusMouseUp
    OnDrawPanel = sbStatusDrawPanel
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 0
    Width = 634
    Height = 269
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 305
    ControlData = {
      4C00000087410000CD1B00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 272
    Width = 634
    Height = 114
    Align = alBottom
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
    DesignSize = (
      634
      114)
    object Label32: TLabel
      Left = 8
      Top = 4
      Width = 17
      Height = 14
      Caption = 'Lat'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 144
      Top = 4
      Width = 21
      Height = 14
      Caption = 'Lng'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lLat: TLabel
      Left = 34
      Top = 4
      Width = 104
      Height = 14
      AutoSize = False
    end
    object lLng: TLabel
      Left = 170
      Top = 4
      Width = 104
      Height = 14
      AutoSize = False
    end
    object Label1: TLabel
      Left = 288
      Top = 4
      Width = 7
      Height = 14
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lX: TLabel
      Left = 298
      Top = 4
      Width = 88
      Height = 14
      AutoSize = False
    end
    object Label3: TLabel
      Left = 392
      Top = 4
      Width = 7
      Height = 14
      Caption = 'Y'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lY: TLabel
      Left = 402
      Top = 4
      Width = 88
      Height = 14
      AutoSize = False
    end
    object mEvents: TMemo
      Left = 0
      Top = 25
      Width = 634
      Height = 89
      Align = alBottom
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object bClearLog: TButton
      Left = 552
      Top = 1
      Width = 75
      Height = 21
      Anchors = [akTop, akRight]
      Caption = 'Clear Log'
      TabOrder = 1
      OnClick = bClearLogClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 400
    Top = 24
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
    object Map1: TMenuItem
      Caption = 'Map'
      object N1MapProperties1: TMenuItem
        Caption = '&1. Map Properties'
        OnClick = N1MapProperties1Click
      end
      object N2PrintMap1: TMenuItem
        Caption = '&2. Print Map'
        OnClick = N2PrintMap1Click
      end
      object N3SaveMap1: TMenuItem
        Caption = '&3. Save Map'
        OnClick = N3SaveMap1Click
      end
      object N4SaveHTMLCode1: TMenuItem
        Caption = '&4. Save HTML Code'
        OnClick = N4SaveHTMLCode1Click
      end
    end
    object InfoWindows1: TMenuItem
      Caption = 'InfoWindows'
      Visible = False
    end
    object Figures1: TMenuItem
      Caption = 'Figures'
      object Markers1: TMenuItem
        Caption = '&1. Markers'
        OnClick = Markers1Click
      end
      object Polylines1: TMenuItem
        Caption = '&2. Polylines'
        OnClick = Polylines1Click
      end
      object Polygons1: TMenuItem
        Caption = '&3. Polygons'
        OnClick = Polygons1Click
      end
      object Rectangles1: TMenuItem
        Caption = '&4. Rectangles'
        OnClick = Rectangles1Click
      end
      object Circles1: TMenuItem
        Caption = '&5. Circles'
        OnClick = Circles1Click
      end
      object N6GroundOverlay1: TMenuItem
        Caption = '&6. GroundOverlay'
        OnClick = N6GroundOverlay1Click
      end
    end
    object Services1: TMenuItem
      Caption = 'Services'
      object GeoCoding1: TMenuItem
        Caption = 'GeoCoding'
        OnClick = GeoCoding1Click
      end
      object Directions1: TMenuItem
        Caption = 'Directions'
        OnClick = Directions1Click
      end
      object Elevation1: TMenuItem
        Caption = 'Elevation'
        OnClick = Elevation1Click
      end
      object ShowHideheapmap1: TMenuItem
        Caption = 'Show/Hide heapmap'
        OnClick = ShowHideheapmap1Click
      end
    end
  end
  object GMMap1: TGMMap
    APIKey = 'AIzaSyAh646wcvHAuOfk7KA3JRgwh4l46-RtEZw'
    IntervalEvents = 100
    Precision = 8
    RequiredProp.Center.Lat = 41.403185000000000000
    RequiredProp.Center.Lng = 2.173725000000000000
    RequiredProp.MapType = mtOSM
    RequiredProp.Zoom = 17
    Layers.Kml.Url = 
      'https://gmlibrary.googlecode.com/svn/trunk/Demos/bin/BarcelonaHo' +
      'tellochTuristGuide.kml'
    AfterPageLoaded = GMMap1AfterPageLoaded
    OnBoundsChanged = GMMap1BoundsChanged
    OnCenterChanged = GMMap1CenterChanged
    OnClick = GMMap1Click
    OnDblClick = GMMap1DblClick
    OnDrag = GMMap1Drag
    OnDragEnd = GMMap1DragEnd
    OnDragStart = GMMap1DragStart
    OnMapTypeIdChanged = GMMap1MapTypeIdChanged
    OnMouseMove = GMMap1MouseMove
    OnMouseOut = GMMap1MouseOut
    OnMouseOver = GMMap1MouseOver
    OnRightClick = GMMap1RightClick
    OnZoomChanged = GMMap1ZoomChanged
    OnWeatherClick = GMMap1WeatherClick
    OnPanoramioClick = GMMap1PanoramioClick
    OnActiveChange = GMMap1ActiveChange
    OnIntervalEventsChange = GMMap1IntervalEventsChange
    WebBrowser = WebBrowser1
    Left = 40
    Top = 40
  end
  object GMInfoWindow1: TGMInfoWindow
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        DisableAutoPan = False
        MaxWidth = 0
        CloseOtherBeforeOpen = True
        AutoOpen = True
      end>
    OnPositionChange = GMMarker1PositionChange
    Left = 104
    Top = 40
  end
  object GMPolygon1: TGMPolygon
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        StrokeOpacity = 1.000000000000000000
        Visible = False
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
        Text = 'TPol'
        FillOpacity = 0.500000000000000000
      end>
    OnClick = GMMarker1Click
    OnDblClick = GMMarker1DblClick
    OnMouseDown = GMMarker1MouseDown
    OnMouseMove = GMPolyline1MouseMove
    OnMouseOut = GMMarker1MouseOut
    OnMouseOver = GMMarker1MouseOver
    OnMouseUp = GMMarker1MouseUp
    OnRightClick = GMMarker1RightClick
    OnClickableChange = GMMarker1ClickableChange
    OnEditableChange = GMPolyline1EditableChange
    OnGeodesicChange = GMPolyline1GeodesicChange
    OnStrokeColorChange = GMPolyline1StrokeColorChange
    OnStrokeOpacityChange = GMPolyline1StrokeOpacityChange
    OnStrokeWeightChange = GMPolyline1StrokeWeightChange
    OnVisibleChange = GMMarker1VisibleChange
    OnPathChange = GMPolyline1PathChange
    OnFillColorChange = GMPolygon1FillColorChange
    OnFillOpacityChange = GMPolygon1FillOpacityChange
    Left = 104
    Top = 184
  end
  object GMRectangle1: TGMRectangle
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        Bounds.SW.Lat = 41.405425970000000000
        Bounds.SW.Lng = 2.114303500000000000
        Bounds.NE.Lat = 41.430014180000000000
        Bounds.NE.Lng = 2.142799720000000000
        FillOpacity = 0.200000000000000000
        StrokeOpacity = 1.000000000000000000
        StrokeWeight = 3
        InfoWindow.HTMLContent = 'Aix'#242' '#233's una prova d'#39'una finestra d'#39'informaci'#243
        Text = 'TRectangle'
        FillColor = clLime
        StrokeColor = clGreen
      end>
    OnBoundsChanged = GMRectangle1BoundsChanged
    OnClick = GMMarker1Click
    OnDblClick = GMMarker1DblClick
    OnMouseDown = GMMarker1MouseDown
    OnMouseMove = GMPolyline1MouseMove
    OnMouseOut = GMMarker1MouseOut
    OnMouseOver = GMMarker1MouseOver
    OnMouseUp = GMMarker1MouseUp
    OnRightClick = GMMarker1RightClick
    OnClickableChange = GMMarker1ClickableChange
    OnEditableChange = GMPolyline1EditableChange
    OnFillColorChange = GMPolygon1FillColorChange
    OnFillOpacityChange = GMPolygon1FillOpacityChange
    OnStrokeColorChange = GMPolyline1StrokeColorChange
    OnStrokeOpacityChange = GMPolyline1StrokeOpacityChange
    OnStrokeWeightChange = GMPolyline1StrokeWeightChange
    OnVisibleChange = GMMarker1VisibleChange
    Left = 104
    Top = 232
  end
  object GMCircle1: TGMCircle
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        Center.Lat = 41.405426000000000000
        Center.Lng = 2.210090000000000000
        FillOpacity = 0.200000000000000000
        StrokeOpacity = 0.200000000000000000
        StrokeWeight = 1
        AutoResize.Min = 1000
        AutoResize.Max = 10000
        AutoResize.Speed = 500
        Text = 'TCircle'
        FillColor = clAqua
        StrokeColor = clAqua
      end>
    OnCenterChange = GMCircle1CenterChange
    OnRadiusChange = GMCircle1RadiusChange
    OnClick = GMMarker1Click
    OnDblClick = GMMarker1DblClick
    OnMouseDown = GMMarker1MouseDown
    OnMouseMove = GMPolyline1MouseMove
    OnMouseOut = GMMarker1MouseOut
    OnMouseOver = GMMarker1MouseOver
    OnMouseUp = GMMarker1MouseUp
    OnRightClick = GMMarker1RightClick
    OnClickableChange = GMMarker1ClickableChange
    OnEditableChange = GMPolyline1EditableChange
    OnFillColorChange = GMPolygon1FillColorChange
    OnFillOpacityChange = GMPolygon1FillOpacityChange
    OnStrokeColorChange = GMPolyline1StrokeColorChange
    OnStrokeOpacityChange = GMPolyline1StrokeOpacityChange
    OnStrokeWeightChange = GMPolyline1StrokeWeightChange
    OnVisibleChange = GMMarker1VisibleChange
    Left = 104
    Top = 280
  end
  object GMPolyline1: TGMPolyline
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        StrokeOpacity = 1.000000000000000000
        LinePoints = <
          item
            Lat = 41.380866000000000000
            Lng = 2.122579000000000000
          end
          item
            Lat = 41.403185000000000000
            Lng = 2.173725000000000000
          end
          item
            Lat = 41.414282000000000000
            Lng = 2.151847000000000000
          end
          item
            Lat = 41.375875000000000000
            Lng = 2.177757000000000000
          end>
        Text = 'TPolyline'
        Icon.OffSet.Value = 10
        Icon.DistRepeat.Value = 10
        Icon.DistRepeat.Measure = mPixels
        Icon.Icon.FillOpacity = 1.000000000000000000
        Icon.Icon.Path = spDASHEDLINE
        Icon.Icon.StrokeOpacity = 1.000000000000000000
        Icon.Icon.StrokeWeight = 2
        CurveLine.Resolution = 0.160000000000000000
      end
      item
        StrokeOpacity = 1.000000000000000000
        Visible = False
        LinePoints = <
          item
            Lat = 41.340866000000000000
            Lng = 2.122579000000000000
          end
          item
            Lat = 41.363185000000000000
            Lng = 2.173725000000000000
          end
          item
            Lat = 41.374282000000000000
            Lng = 2.151847000000000000
          end
          item
            Lat = 41.335875000000000000
            Lng = 2.177757000000000000
          end>
        Text = 'TPolyline'
        Icon.DistRepeat.Value = 0
        Icon.DistRepeat.Measure = mPixels
        Icon.Icon.FillColor = clBlack
        Icon.Icon.StrokeColor = clBlack
        CurveLine.Resolution = 0.100000000000000000
      end>
    OnClick = GMMarker1Click
    OnDblClick = GMMarker1DblClick
    OnMouseDown = GMMarker1MouseDown
    OnMouseMove = GMPolyline1MouseMove
    OnMouseOut = GMMarker1MouseOut
    OnMouseOver = GMMarker1MouseOver
    OnMouseUp = GMMarker1MouseUp
    OnRightClick = GMMarker1RightClick
    OnClickableChange = GMMarker1ClickableChange
    OnEditableChange = GMPolyline1EditableChange
    OnGeodesicChange = GMPolyline1GeodesicChange
    OnStrokeColorChange = GMPolyline1StrokeColorChange
    OnStrokeOpacityChange = GMPolyline1StrokeOpacityChange
    OnStrokeWeightChange = GMPolyline1StrokeWeightChange
    OnVisibleChange = GMMarker1VisibleChange
    OnPathChange = GMPolyline1PathChange
    Left = 104
    Top = 136
  end
  object GMGeoCode1: TGMGeoCode
    Language = Espanol
    Map = GMMap1
    Marker = GMMarker1
    Icon = 'http://www.cadetill.com/imagenes/gallery/gmlib/marker.png'
    Region = rSPAIN
    LangCode = lcSPANISH
    Left = 200
    Top = 40
  end
  object GMDirection1: TGMDirection
    Language = Espanol
    Map = GMMap1
    DirectionsRequest.Destination.Address = 'Tarragona'
    DirectionsRequest.Origin.Address = 'Barcelona'
    DirectionsRequest.Region = rSPAIN
    DirectionsRequest.TransitOpt.ArrivalTime = 0.000000011574074074
    DirectionsRequest.TransitOpt.ArrivalDate = 25569.000000000000000000
    DirectionsRequest.TransitOpt.DepartureTime = 0.000000011574074074
    DirectionsRequest.TransitOpt.DepartureDate = 25569.000000000000000000
    DirectionsRequest.WaypointsList = <>
    OnDirectionsChanged = GMDirection1DirectionsChanged
    DirectionsRender.PolylineOptions.StrokeOpacity = 0.500000000000000000
    Left = 200
    Top = 88
  end
  object GMMarker1: TGMMarker
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        MarkerType = mtColored
        Draggable = True
        Position.Lat = 41.380866000000000000
        Position.Lng = 2.122579000000000000
        Title = 'Camp Nou'
        Icon = 'http://www.cadetill.com/imagenes/gallery/gmlib/marker.png'
        InfoWindow.HTMLContent = 
          '<h1>Camp Nou</h1>'#13#10'<p>El <b>Camp Nou</b> (nombre que en catal'#225'n ' +
          'significa "Campo Nuevo", pronunciado [kam '#39'now]), a menudo tambi' +
          #233'n citado err'#243'neamente como <i>Nou Camp</i>, es un recinto depor' +
          'tivo ubicado en Barcelona, Espa'#241'a. Es el estadio del F'#250'tbol Club' +
          ' Barcelona. Cuando el estadio estaba en construcci'#243'n, por los a'#241 +
          'os 50, iba a llamarse '#8220'Estadio Joan Gamper'#8221', pero la iniciativa ' +
          'no se llev'#243' a efecto. Se rumore'#243' que el entonces presidente del ' +
          'Barcelona, Francesc Mir'#243'-Sans, estaba ilusionado con que el esta' +
          'dio llevara su propio nombre, como en el caso del Bernab'#233'u en Ma' +
          'drid. Los problemas de la '#250'ltima fase de la presidencia de Mir'#243'-' +
          'Sans reafirmaron el nombre que popularmente hab'#237'a empezado a d'#225'r' +
          'sele, Camp Nou. En el momento de su inauguraci'#243'n, en 1957, fue b' +
          'autizado simplemente como Estadio del F. C. Barcelona. No fue ha' +
          'sta el a'#241'o 2001 en que se adopt'#243' oficialmente el nombre actual, ' +
          'que es la denominaci'#243'n con la que popularmente siempre ha sido c' +
          'onocido.</p>'
        InfoWindow.DisableAutoPan = True
        InfoWindow.PixelOffset.Height = 10
        InfoWindow.PixelOffset.Width = 10
        ShowInfoWinMouseOver = True
      end
      item
        MarkerType = mtStyledMarker
        Draggable = True
        Position.Lat = 41.403185000000000000
        Position.Lng = 2.173725000000000000
        Title = 'Bas'#237'lica de la Sagrada Familia'
        Icon = 'http://www.cadetill.com/imagenes/gallery/gmlib/marker.png'
        InfoWindow.HTMLContent = 
          '<h1>Templo Expiatorio de la Sagrada Familia</h1>'#13#10'<p><b>El Templ' +
          'o Expiatorio de la Sagrada Familia</b> (en catal'#225'n <i>Temple Exp' +
          'iatori de la Sagrada Fam'#237'lia</i>), conocido simplemente como la ' +
          '<b>Sagrada Familia</b> (<i>Sagrada Fam'#237'lia</i>), es una gran bas' +
          #237'lica cat'#243'lica de Barcelona (Espa'#241'a), dise'#241'ada por el arquitecto' +
          ' catal'#225'n Antoni Gaud'#237'. Iniciada en 1882, todav'#237'a est'#225' en constru' +
          'cci'#243'n (marzo de 2012). Es la obra maestra de Gaud'#237', y el m'#225'ximo ' +
          'exponente de la arquitectura modernista catalana. Es, con m'#225's de' +
          ' 4 millones de visitas anuales, el monumento m'#225's visitado de tod' +
          'a Espa'#241'a.</p>'#13#10'<p>La construcci'#243'n comenz'#243' en estilo neog'#243'tico, p' +
          'ero, al asumir el proyecto Gaud'#237' en 1883, fue completamente repl' +
          'anteado. Seg'#250'n su proceder habitual, a partir de bocetos general' +
          'es del edificio improvis'#243' la construcci'#243'n a medida que avanzaba.' +
          ' Se hizo cargo con s'#243'lo 31 a'#241'os, dedic'#225'ndole el resto de su vida' +
          ', los '#250'ltimos quince en exclusiva.</p>'
        InfoWindow.DisableAutoPan = True
        StyledMarker.ShowStar = True
      end
      item
        MarkerType = mtStyledMarker
        Draggable = True
        Position.Lat = 41.414282000000000000
        Position.Lng = 2.151847000000000000
        Title = 'Parc G'#252'ell'
        Icon = 'http://www.cadetill.com/imagenes/gallery/gmlib/marker.png'
        InfoWindow.HTMLContent = 
          '<h1>Parque G'#252'ell</h1>'#13#10'<p>El <b>Parque G'#252'ell</b> (<i>Parc G'#252'ell<' +
          '/i> en catal'#225'n y <i>Park G'#252'ell</i> en su denominaci'#243'n original) ' +
          'es un parque p'#250'blico con jardines y elementos arquitect'#243'nicos si' +
          'tuado en la parte superior de la ciudad de Barcelona (Espa'#241'a), e' +
          'n la vertiente que mira al mar de la monta'#241'a del Carmelo, perten' +
          'eciente a las estribaciones de la Sierra de Collserola. Administ' +
          'rativamente pertenece al barrio de La Salud, en el distrito de G' +
          'racia. Ideado como urbanizaci'#243'n, fue dise'#241'ado por el arquitecto ' +
          'Antoni Gaud'#237', m'#225'ximo exponente del modernismo catal'#225'n, por encar' +
          'go del empresario Eusebi G'#252'ell. Construido entre 1900 y 1914, fu' +
          'e inaugurado como parque p'#250'blico en 1926. En 1984 la Unesco incl' +
          'uy'#243' al Parque G'#252'ell dentro del Lugar Patrimonio de la Humanidad ' +
          #171'Obras de Antoni Gaud'#237#187'.</p>'
        InfoWindow.DisableAutoPan = True
        StyledMarker.StyledIcon = siBubble
        StyledMarker.TextColor = clBlue
      end
      item
        Draggable = True
        Position.Lat = 41.375875000000000000
        Position.Lng = 2.177757000000000000
        Title = 'Estatua de Col'#243'n'
        Icon = 'http://www.cadetill.com/imagenes/gallery/gmlib/marker.png'
        InfoWindow.HTMLContent = 
          '<h1>Monumento a Col'#243'n (Barcelona)</h1>'#13#10'<p>El <b>Monumento a Col' +
          #243'n</b> es una de las m'#225's famosas estatuas de la ciudad de Barcel' +
          'ona (Espa'#241'a). Construida en homenaje al descubridor Crist'#243'bal Co' +
          'l'#243'n, est'#225' erigida en la plaza del Portal de la Pau (en castellan' +
          'o, "Portal de la Paz"), punto de uni'#243'n entre el sur de las Rambl' +
          'as y el paseo de Col'#243'n, frente al puerto de Barcelona.</p>'#13#10'<p>E' +
          'l monumento fue construido como punto culminante de las obras de' +
          ' mejora del litoral de Barcelona efectuadas con motivo de la Exp' +
          'osici'#243'n Universal de Barcelona de 1888. Inaugurado el 1 de junio' +
          ' de 1888, en plena exposici'#243'n, se convirti'#243' enseguida en uno de ' +
          'los iconos m'#225's caracter'#237'sticos de la ciudad. En el interior de l' +
          'a columna hay un ascensor que permite subir hasta la semiesfera ' +
          'situada bajo los pies de la estatua, desde donde se divisa la ci' +
          'udad.</p>'
        InfoWindow.DisableAutoPan = True
      end
      item
        Position.Lat = 41.365875000000000000
        Position.Lng = 2.167757000000000000
        Title = 'TMarker'
      end>
    OnClick = GMMarker1Click
    OnDblClick = GMMarker1DblClick
    OnDrag = GMMarker1Drag
    OnDragEnd = GMMarker1DragEnd
    OnDragStart = GMMarker1DragStart
    OnMouseDown = GMMarker1MouseDown
    OnMouseOut = GMMarker1MouseOut
    OnMouseOver = GMMarker1MouseOver
    OnMouseUp = GMMarker1MouseUp
    OnRightClick = GMMarker1RightClick
    OnClickableChange = GMMarker1ClickableChange
    OnDraggableChange = GMMarker1DragableChange
    OnFlatChange = GMMarker1FlatChange
    OnPositionChange = GMMarker1PositionChange
    OnTitleChange = GMMarker1TitleChange
    OnVisibleChange = GMMarker1VisibleChange
    OnIconChange = GMMarker1IconChange
    Left = 104
    Top = 88
  end
  object GMElevation1: TGMElevation
    Language = Espanol
    Map = GMMap1
    LinePoints = <>
    Left = 200
    Top = 144
  end
  object GMGroundOverlay1: TGMGroundOverlay
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMMarker1CloseClick
    OnHTMLContentChange = GMMarker1HTMLContentChange
    OnDisableAutoPanChange = GMMarker1DisableAutoPanChange
    OnMaxWidthChange = GMMarker1MaxWidthChange
    OnPixelOffsetChange = GMMarker1PixelOffsetChange
    OnCloseOtherBeforeOpenChange = GMMarker1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        Bounds.SW.Lat = 41.313817870000000000
        Bounds.SW.Lng = 2.007959370000000000
        Bounds.NE.Lat = 41.417399720000000000
        Bounds.NE.Lng = 2.226999270000000000
        Clickable = True
        Visible = False
        Opacity = 1.000000000000000000
        Url = 
          'D:\Docs\Dropbox\Programacio\GoogleMaps\Components\Images\mapa.pn' +
          'g'
        InfoWindow.HTMLContent = 'ngf jy yu uyg kugkug'
        Text = 'TGroundOverlay'
      end>
    OnClick = GMMarker1Click
    OnDblClick = GMMarker1DblClick
    OnClickableChange = GMMarker1ClickableChange
    OnBoundsChanged = GMRectangle1BoundsChanged
    OnOpacityChange = GMGroundOverlay1OpacityChange
    OnUrlChange = GMGroundOverlay1UrlChange
    OnVisibleChange = GMMarker1VisibleChange
    Left = 104
    Top = 328
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.jpg'
    Filter = 'Jpg file|*.jpg'
    Left = 400
    Top = 80
  end
  object GMHeatmap1: TGMHeatmap
    Language = Espanol
    Map = GMMap1
    Data = <>
    Opacity = 0.600000000000000000
    Radius = 0
    Left = 200
    Top = 192
  end
end
