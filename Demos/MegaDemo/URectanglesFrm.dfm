object RectanglesFrm: TRectanglesFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Rectangles'
  ClientHeight = 393
  ClientWidth = 564
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 192
    Height = 393
    ActivePage = tsMarkers
    Align = alLeft
    TabOrder = 0
    object tsMarkers: TTabSheet
      Caption = 'tsMarkers'
      TabVisible = False
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 85
        Height = 13
        Caption = 'List of Rectangles'
      end
      object lbItems: TListBox
        Left = 8
        Top = 56
        Width = 142
        Height = 281
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbItemsClick
      end
      object bUp: TButton
        Left = 150
        Top = 72
        Width = 35
        Height = 25
        Caption = 'Up'
        TabOrder = 1
        OnClick = bUpClick
      end
      object bDown: TButton
        Left = 150
        Top = 104
        Width = 35
        Height = 25
        Caption = 'Down'
        TabOrder = 2
        OnClick = bDownClick
      end
      object bNew: TButton
        Left = 150
        Top = 216
        Width = 35
        Height = 25
        Caption = 'New'
        TabOrder = 3
        OnClick = bNewClick
      end
      object bDel: TButton
        Left = 150
        Top = 248
        Width = 35
        Height = 25
        Caption = 'Del'
        TabOrder = 4
        OnClick = bDelClick
      end
      object bCenter: TButton
        Left = 8
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Center at...'
        TabOrder = 5
        OnClick = bCenterClick
      end
      object bZoomToAll: TButton
        Left = 89
        Top = 343
        Width = 75
        Height = 25
        Caption = 'Zoom To'
        TabOrder = 6
        OnClick = bZoomToAllClick
      end
    end
  end
  object pcMarker: TPageControl
    Left = 192
    Top = 0
    Width = 372
    Height = 393
    ActivePage = tsEvents
    Align = alClient
    TabOrder = 1
    object tsGeneral: TTabSheet
      Caption = 'General'
      object Label9: TLabel
        Left = 48
        Top = 325
        Width = 22
        Height = 13
        Caption = 'Text'
      end
      object Label36: TLabel
        Left = 32
        Top = 207
        Width = 56
        Height = 13
        Caption = 'StrokeColor'
      end
      object Label37: TLabel
        Left = 144
        Top = 207
        Width = 107
        Height = 13
        Caption = 'StrokeOpacity (0 to 1)'
      end
      object Label38: TLabel
        Left = 271
        Top = 207
        Width = 65
        Height = 13
        Caption = 'StrokeWeight'
      end
      object Label11: TLabel
        Left = 144
        Top = 256
        Width = 88
        Height = 13
        Caption = 'FillOpacity (0 to 1)'
      end
      object Label10: TLabel
        Left = 32
        Top = 256
        Width = 37
        Height = 13
        Caption = 'FillColor'
      end
      object cbClickable: TCheckBox
        Left = 48
        Top = 27
        Width = 97
        Height = 17
        Caption = 'Clickable'
        TabOrder = 0
        OnClick = cbClickableClick
      end
      object cbVisible: TCheckBox
        Left = 232
        Top = 27
        Width = 97
        Height = 17
        Caption = 'Visible'
        TabOrder = 1
        OnClick = cbVisibleClick
      end
      object cbEditable: TCheckBox
        Left = 48
        Top = 58
        Width = 97
        Height = 17
        Caption = 'Editable'
        TabOrder = 2
        OnClick = cbEditableClick
      end
      object eText: TEdit
        Left = 76
        Top = 322
        Width = 134
        Height = 21
        TabOrder = 3
        OnChange = eTextChange
      end
      object cbStrokeColor: TColorBox
        Left = 32
        Top = 223
        Width = 89
        Height = 22
        TabOrder = 4
        OnChange = cbStrokeColorChange
      end
      object eStrokeOpacity: TEdit
        Left = 144
        Top = 224
        Width = 57
        Height = 21
        TabOrder = 5
        Text = '0'
        OnChange = eStrokeOpacityChange
      end
      object eStrokeWeight: TSpinEdit
        Left = 271
        Top = 224
        Width = 57
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 6
        Value = 1
        OnChange = eStrokeWeightChange
      end
      object eFillOpacity: TEdit
        Left = 144
        Top = 273
        Width = 57
        Height = 21
        TabOrder = 7
        Text = '0'
        OnChange = eFillOpacityChange
      end
      object cbFillColor: TColorBox
        Left = 32
        Top = 272
        Width = 89
        Height = 22
        TabOrder = 8
        OnChange = cbFillColorChange
      end
      object GroupBox1: TGroupBox
        Left = 32
        Top = 88
        Width = 304
        Height = 102
        Caption = ' Bounds '
        TabOrder = 9
        object Label12: TLabel
          Left = 21
          Top = 72
          Width = 17
          Height = 13
          Caption = 'Lng'
        end
        object Label13: TLabel
          Left = 21
          Top = 45
          Width = 15
          Height = 13
          Caption = 'Lat'
        end
        object Label14: TLabel
          Left = 165
          Top = 72
          Width = 17
          Height = 13
          Caption = 'Lng'
        end
        object Label15: TLabel
          Left = 165
          Top = 45
          Width = 15
          Height = 13
          Caption = 'Lat'
        end
        object Label16: TLabel
          Left = 21
          Top = 24
          Width = 48
          Height = 13
          Caption = 'Northeast'
        end
        object Label17: TLabel
          Left = 165
          Top = 26
          Width = 51
          Height = 13
          Caption = 'Southwest'
        end
        object eNELng: TEdit
          Left = 44
          Top = 69
          Width = 100
          Height = 21
          TabOrder = 0
          Text = '0'
          OnChange = eNELngChange
        end
        object eNELat: TEdit
          Left = 44
          Top = 42
          Width = 100
          Height = 21
          TabOrder = 1
          Text = '0'
          OnChange = eNELatChange
        end
        object eSWLng: TEdit
          Left = 188
          Top = 69
          Width = 100
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = eSWLngChange
        end
        object eSWLat: TEdit
          Left = 188
          Top = 42
          Width = 100
          Height = 21
          TabOrder = 3
          Text = '0'
          OnChange = eSWLatChange
        end
      end
    end
    object tsInfoWin: TTabSheet
      Caption = 'InfoWin'
      ImageIndex = 1
      object Label33: TLabel
        Left = 40
        Top = 112
        Width = 55
        Height = 13
        Caption = 'Max. Width'
      end
      object Label3: TLabel
        Left = 240
        Top = 59
        Width = 31
        Height = 13
        Caption = 'Height'
      end
      object Label4: TLabel
        Left = 240
        Top = 87
        Width = 28
        Height = 13
        Caption = 'Width'
      end
      object Label5: TLabel
        Left = 232
        Top = 34
        Width = 56
        Height = 13
        Caption = 'Pixel Offset'
      end
      object Label6: TLabel
        Left = 40
        Top = 171
        Width = 68
        Height = 13
        Caption = 'HTML Content'
      end
      object cbCloseOtherBeforeOpen: TCheckBox
        Left = 40
        Top = 33
        Width = 130
        Height = 17
        Caption = 'CloseOtherBeforeOpen'
        TabOrder = 0
        OnClick = cbCloseOtherBeforeOpenClick
      end
      object cbDisableAutoPan: TCheckBox
        Left = 40
        Top = 62
        Width = 130
        Height = 17
        Caption = 'DisableAutoPan'
        TabOrder = 1
        OnClick = cbDisableAutoPanClick
      end
      object eMaxWidth: TSpinEdit
        Left = 102
        Top = 109
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
        OnChange = eMaxWidthChange
      end
      object ePixelOffsetH: TSpinEdit
        Left = 278
        Top = 56
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = ePixelOffsetHChange
      end
      object ePixelOffsetW: TSpinEdit
        Left = 278
        Top = 84
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 0
        OnChange = ePixelOffsetWChange
      end
      object mHTML: TMemo
        Left = 40
        Top = 192
        Width = 303
        Height = 125
        ScrollBars = ssVertical
        TabOrder = 5
        OnChange = mHTMLChange
      end
    end
    object tsEvents: TTabSheet
      Caption = 'Events Fired'
      ImageIndex = 2
      object cbOnClick: TCheckBox
        Left = 32
        Top = 48
        Width = 130
        Height = 17
        Caption = 'OnClick'
        TabOrder = 1
        OnClick = cbOnClickClick
      end
      object cbOnClickableChange: TCheckBox
        Left = 32
        Top = 72
        Width = 130
        Height = 17
        Caption = 'OnClickableChange'
        TabOrder = 2
        OnClick = cbOnClickableChangeClick
      end
      object cbOnDblClick: TCheckBox
        Left = 32
        Top = 96
        Width = 130
        Height = 17
        Caption = 'OnDblClick'
        TabOrder = 3
        OnClick = cbOnDblClickClick
      end
      object cbOnEditableChange: TCheckBox
        Left = 32
        Top = 121
        Width = 130
        Height = 17
        Caption = 'OnEditableChange'
        TabOrder = 4
        OnClick = cbOnEditableChangeClick
      end
      object cbOnMouseMove: TCheckBox
        Left = 32
        Top = 217
        Width = 130
        Height = 17
        Caption = 'OnMouseMove'
        TabOrder = 8
        OnClick = cbOnMouseMoveClick
      end
      object cbOnStrokeColorChange: TCheckBox
        Left = 184
        Top = 48
        Width = 150
        Height = 17
        Caption = 'OnStrokeColorChange'
        TabOrder = 13
        OnClick = cbOnStrokeColorChangeClick
      end
      object cbOnStrokeOpacityChange: TCheckBox
        Left = 184
        Top = 72
        Width = 150
        Height = 17
        Caption = 'OnStrokeOpacityChange'
        TabOrder = 14
        OnClick = cbOnStrokeOpacityChangeClick
      end
      object cbOnRightClick: TCheckBox
        Left = 184
        Top = 24
        Width = 150
        Height = 17
        Caption = 'OnRightClick'
        TabOrder = 12
        OnClick = cbOnRightClickClick
      end
      object cbOnMouseDown: TCheckBox
        Left = 32
        Top = 192
        Width = 130
        Height = 17
        Caption = 'OnMouseDown'
        TabOrder = 7
        OnClick = cbOnMouseDownClick
      end
      object cbOnMouseOver: TCheckBox
        Left = 32
        Top = 264
        Width = 130
        Height = 17
        Caption = 'OnMouseOver'
        TabOrder = 10
        OnClick = cbOnMouseOverClick
      end
      object cbOnMouseOut: TCheckBox
        Left = 32
        Top = 240
        Width = 130
        Height = 17
        Caption = 'OnMouseOut'
        TabOrder = 9
        OnClick = cbOnMouseOutClick
      end
      object cbOnMouseUp: TCheckBox
        Left = 32
        Top = 287
        Width = 130
        Height = 17
        Caption = 'OnMouseUp'
        TabOrder = 11
        OnClick = cbOnMouseUpClick
      end
      object cbOnStrokeWeightChange: TCheckBox
        Left = 184
        Top = 96
        Width = 150
        Height = 17
        Caption = 'OnStrokeWeightChange'
        TabOrder = 15
        OnClick = cbOnStrokeWeightChangeClick
      end
      object cbOnDisableAutoPanChange: TCheckBox
        Left = 184
        Top = 217
        Width = 150
        Height = 17
        Caption = 'OnDisableAutoPanChange'
        TabOrder = 19
        OnClick = cbOnDisableAutoPanChangeClick
      end
      object cbOnCloseOtherBeforeOpenChange: TCheckBox
        Left = 184
        Top = 192
        Width = 180
        Height = 17
        Caption = 'OnCloseOtherBeforeOpenChange'
        TabOrder = 18
        OnClick = cbOnCloseOtherBeforeOpenChangeClick
      end
      object cbOnCloseClick: TCheckBox
        Left = 184
        Top = 167
        Width = 150
        Height = 17
        Caption = 'OnCloseClick'
        TabOrder = 17
        OnClick = cbOnCloseClickClick
      end
      object cbOnVisibleChange: TCheckBox
        Left = 184
        Top = 121
        Width = 150
        Height = 17
        Caption = 'OnVisibleChange'
        TabOrder = 16
        OnClick = cbOnVisibleChangeClick
      end
      object cbOnHTMLContentChange: TCheckBox
        Left = 184
        Top = 240
        Width = 150
        Height = 17
        Caption = 'OnHTMLContentChange'
        TabOrder = 20
        OnClick = cbOnHTMLContentChangeClick
      end
      object cbOnMaxWidthChange: TCheckBox
        Left = 184
        Top = 264
        Width = 150
        Height = 17
        Caption = 'OnMaxWidthChange'
        TabOrder = 21
        OnClick = cbOnMaxWidthChangeClick
      end
      object cbOnPixelOffsetChange: TCheckBox
        Left = 184
        Top = 287
        Width = 150
        Height = 17
        Caption = 'OnPixelOffsetChange'
        TabOrder = 22
        OnClick = cbOnPixelOffsetChangeClick
      end
      object cbOnFillOpacityChange: TCheckBox
        Left = 32
        Top = 167
        Width = 130
        Height = 17
        Caption = 'OnFillOpacityChange'
        TabOrder = 6
        OnClick = cbOnFillOpacityChangeClick
      end
      object cbOnFillColorChange: TCheckBox
        Left = 32
        Top = 145
        Width = 130
        Height = 17
        Caption = 'OnFillColorChange'
        TabOrder = 5
        OnClick = cbOnFillColorChangeClick
      end
      object cbOnBoundsChanged: TCheckBox
        Left = 32
        Top = 24
        Width = 130
        Height = 17
        Caption = 'OnBoundsChanged'
        TabOrder = 0
        OnClick = cbOnBoundsChangedClick
      end
    end
    object tsGeometry: TTabSheet
      Caption = 'Geometry'
      ImageIndex = 3
      object lComArea: TLabel
        Left = 104
        Top = 62
        Width = 3
        Height = 13
      end
      object Label2: TLabel
        Left = 24
        Top = 27
        Width = 32
        Height = 13
        Caption = 'Radius'
      end
      object bComArea: TButton
        Left = 24
        Top = 54
        Width = 75
        Height = 25
        Caption = 'Compute Area'
        TabOrder = 0
        OnClick = bComAreaClick
      end
      object eRadius: TEdit
        Left = 62
        Top = 24
        Width = 64
        Height = 21
        TabOrder = 1
        Text = '-1'
      end
    end
  end
end
