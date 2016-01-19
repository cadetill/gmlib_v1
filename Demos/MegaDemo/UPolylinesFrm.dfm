object PolylinesFrm: TPolylinesFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Polylines'
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
        Width = 73
        Height = 13
        Caption = 'List of Polylines'
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
    ActivePage = tsGeometry
    Align = alClient
    TabOrder = 1
    object tsGeneral: TTabSheet
      Caption = 'General'
      object Label36: TLabel
        Left = 48
        Top = 152
        Width = 56
        Height = 13
        Caption = 'StrokeColor'
      end
      object Label37: TLabel
        Left = 48
        Top = 216
        Width = 107
        Height = 13
        Caption = 'StrokeOpacity (0 to 1)'
      end
      object Label38: TLabel
        Left = 48
        Top = 264
        Width = 65
        Height = 13
        Caption = 'StrokeWeight'
      end
      object Label9: TLabel
        Left = 48
        Top = 301
        Width = 22
        Height = 13
        Caption = 'Text'
      end
      object cbClickable: TCheckBox
        Left = 48
        Top = 70
        Width = 97
        Height = 17
        Caption = 'Clickable'
        TabOrder = 1
        OnClick = cbClickableClick
      end
      object cbGeodesic: TCheckBox
        Left = 232
        Top = 39
        Width = 97
        Height = 17
        Caption = 'Geodesic'
        TabOrder = 2
        OnClick = cbGeodesicClick
      end
      object cbVisible: TCheckBox
        Left = 232
        Top = 70
        Width = 97
        Height = 17
        Caption = 'Visible'
        TabOrder = 3
        OnClick = cbVisibleClick
      end
      object cbEditable: TCheckBox
        Left = 48
        Top = 101
        Width = 97
        Height = 17
        Caption = 'Editable'
        TabOrder = 4
        OnClick = cbEditableClick
      end
      object cbStrokeColor: TColorBox
        Left = 48
        Top = 168
        Width = 89
        Height = 22
        TabOrder = 5
        OnChange = cbStrokeColorChange
      end
      object eStrokeOpacity: TEdit
        Left = 161
        Top = 213
        Width = 57
        Height = 21
        TabOrder = 6
        Text = '0'
        OnChange = eStrokeOpacityChange
      end
      object eStrokeWeight: TSpinEdit
        Left = 119
        Top = 261
        Width = 57
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 7
        Value = 1
        OnChange = eStrokeWeightChange
      end
      object cbAutoUpdatePath: TCheckBox
        Left = 48
        Top = 39
        Width = 97
        Height = 17
        Caption = 'AutoUpdatePath'
        TabOrder = 0
        OnClick = cbAutoUpdatePathClick
      end
      object eText: TEdit
        Left = 76
        Top = 298
        Width = 134
        Height = 21
        TabOrder = 8
        OnChange = eTextChange
      end
    end
    object tsLinePoints: TTabSheet
      Caption = 'Line Points'
      ImageIndex = 3
      object Label2: TLabel
        Left = 16
        Top = 14
        Width = 83
        Height = 13
        Caption = 'List of Line Points'
      end
      object Label7: TLabel
        Left = 53
        Top = 264
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object Label8: TLabel
        Left = 53
        Top = 288
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object lbPoints: TListBox
        Left = 16
        Top = 38
        Width = 248
        Height = 163
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbPointsClick
      end
      object bUpP: TButton
        Left = 270
        Top = 54
        Width = 35
        Height = 25
        Caption = 'Up'
        TabOrder = 1
        OnClick = bUpPClick
      end
      object bDownP: TButton
        Left = 270
        Top = 86
        Width = 35
        Height = 25
        Caption = 'Down'
        TabOrder = 2
        OnClick = bDownPClick
      end
      object bCenterP: TButton
        Left = 16
        Top = 207
        Width = 75
        Height = 25
        Caption = 'Center at...'
        TabOrder = 3
        OnClick = bCenterPClick
      end
      object bNewP: TButton
        Left = 270
        Top = 142
        Width = 35
        Height = 25
        Caption = 'New'
        TabOrder = 4
        OnClick = bNewPClick
      end
      object bDelP: TButton
        Left = 270
        Top = 174
        Width = 35
        Height = 25
        Caption = 'Del'
        TabOrder = 5
        OnClick = bDelPClick
      end
      object eLat: TEdit
        Left = 106
        Top = 261
        Width = 134
        Height = 21
        TabOrder = 6
        Text = '0'
        OnChange = eLatChange
      end
      object eLng: TEdit
        Left = 106
        Top = 285
        Width = 134
        Height = 21
        TabOrder = 7
        Text = '0'
        OnChange = eLngChange
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
        Top = 24
        Width = 130
        Height = 17
        Caption = 'OnClick'
        TabOrder = 0
        OnClick = cbOnClickClick
      end
      object cbOnClickableChange: TCheckBox
        Left = 32
        Top = 48
        Width = 130
        Height = 17
        Caption = 'OnClickableChange'
        TabOrder = 1
        OnClick = cbOnClickableChangeClick
      end
      object cbOnDblClick: TCheckBox
        Left = 32
        Top = 72
        Width = 130
        Height = 17
        Caption = 'OnDblClick'
        TabOrder = 2
        OnClick = cbOnDblClickClick
      end
      object cbOnEditableChange: TCheckBox
        Left = 32
        Top = 96
        Width = 130
        Height = 17
        Caption = 'OnEditableChange'
        TabOrder = 3
        OnClick = cbOnEditableChangeClick
      end
      object cbOnGeodesicChange: TCheckBox
        Left = 32
        Top = 120
        Width = 130
        Height = 17
        Caption = 'OnGeodesicChange'
        TabOrder = 4
        OnClick = cbOnGeodesicChangeClick
      end
      object cbOnMouseMove: TCheckBox
        Left = 32
        Top = 169
        Width = 130
        Height = 17
        Caption = 'OnMouseMove'
        TabOrder = 6
        OnClick = cbOnMouseMoveClick
      end
      object cbOnPathChange: TCheckBox
        Left = 32
        Top = 264
        Width = 130
        Height = 17
        Caption = 'OnPathChange'
        TabOrder = 10
        OnClick = cbOnPathChangeClick
      end
      object cbOnStrokeColorChange: TCheckBox
        Left = 184
        Top = 24
        Width = 130
        Height = 17
        Caption = 'OnStrokeColorChange'
        TabOrder = 12
        OnClick = cbOnStrokeColorChangeClick
      end
      object cbOnStrokeOpacityChange: TCheckBox
        Left = 184
        Top = 48
        Width = 130
        Height = 17
        Caption = 'OnStrokeOpacityChange'
        TabOrder = 13
        OnClick = cbOnStrokeOpacityChangeClick
      end
      object cbOnRightClick: TCheckBox
        Left = 32
        Top = 287
        Width = 150
        Height = 17
        Caption = 'OnRightClick'
        TabOrder = 11
        OnClick = cbOnRightClickClick
      end
      object cbOnMouseDown: TCheckBox
        Left = 32
        Top = 145
        Width = 130
        Height = 17
        Caption = 'OnMouseDown'
        TabOrder = 5
        OnClick = cbOnMouseDownClick
      end
      object cbOnMouseOver: TCheckBox
        Left = 32
        Top = 216
        Width = 130
        Height = 17
        Caption = 'OnMouseOver'
        TabOrder = 8
        OnClick = cbOnMouseOverClick
      end
      object cbOnMouseOut: TCheckBox
        Left = 32
        Top = 192
        Width = 130
        Height = 17
        Caption = 'OnMouseOut'
        TabOrder = 7
        OnClick = cbOnMouseOutClick
      end
      object cbOnMouseUp: TCheckBox
        Left = 32
        Top = 241
        Width = 150
        Height = 17
        Caption = 'OnMouseUp'
        TabOrder = 9
        OnClick = cbOnMouseUpClick
      end
      object cbOnStrokeWeightChange: TCheckBox
        Left = 184
        Top = 72
        Width = 150
        Height = 17
        Caption = 'OnStrokeWeightChange'
        TabOrder = 14
        OnClick = cbOnStrokeWeightChangeClick
      end
      object cbOnDisableAutoPanChange: TCheckBox
        Left = 184
        Top = 217
        Width = 150
        Height = 17
        Caption = 'OnDisableAutoPanChange'
        TabOrder = 18
        OnClick = cbOnDisableAutoPanChangeClick
      end
      object cbOnCloseOtherBeforeOpenChange: TCheckBox
        Left = 184
        Top = 192
        Width = 180
        Height = 17
        Caption = 'OnCloseOtherBeforeOpenChange'
        TabOrder = 17
        OnClick = cbOnCloseOtherBeforeOpenChangeClick
      end
      object cbOnCloseClick: TCheckBox
        Left = 184
        Top = 168
        Width = 150
        Height = 17
        Caption = 'OnCloseClick'
        TabOrder = 16
        OnClick = cbOnCloseClickClick
      end
      object cbOnVisibleChange: TCheckBox
        Left = 184
        Top = 96
        Width = 150
        Height = 17
        Caption = 'OnVisibleChange'
        TabOrder = 15
        OnClick = cbOnVisibleChangeClick
      end
      object cbOnHTMLContentChange: TCheckBox
        Left = 184
        Top = 240
        Width = 150
        Height = 17
        Caption = 'OnHTMLContentChange'
        TabOrder = 19
        OnClick = cbOnHTMLContentChangeClick
      end
      object cbOnMaxWidthChange: TCheckBox
        Left = 184
        Top = 264
        Width = 150
        Height = 17
        Caption = 'OnMaxWidthChange'
        TabOrder = 20
        OnClick = cbOnMaxWidthChangeClick
      end
      object cbOnPixelOffsetChange: TCheckBox
        Left = 184
        Top = 287
        Width = 150
        Height = 17
        Caption = 'OnPixelOffsetChange'
        TabOrder = 21
        OnClick = cbOnPixelOffsetChangeClick
      end
    end
    object tsIcon: TTabSheet
      Caption = 'Icon'
      ImageIndex = 4
      object GroupBox1: TGroupBox
        Left = 3
        Top = 38
        Width = 177
        Height = 105
        Caption = ' Repeat '
        TabOrder = 0
        object lRMeasure: TLabel
          Left = 24
          Top = 24
          Width = 41
          Height = 13
          Caption = 'Measure'
        end
        object lRValue: TLabel
          Left = 39
          Top = 68
          Width = 26
          Height = 13
          Caption = 'Value'
        end
        object cbRMeasure: TComboBox
          Left = 71
          Top = 21
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 0
          Text = 'mPercentage'
          OnChange = cbRMeasureChange
          Items.Strings = (
            'mPixels'
            'mPercentage')
        end
        object eRValue: TSpinEdit
          Left = 71
          Top = 64
          Width = 57
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 1
          Value = 1
          OnChange = eRValueChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 184
        Top = 38
        Width = 177
        Height = 105
        Caption = ' Offset '
        TabOrder = 1
        object lOMeasure: TLabel
          Left = 24
          Top = 24
          Width = 41
          Height = 13
          Caption = 'Measure'
        end
        object lOValue: TLabel
          Left = 39
          Top = 68
          Width = 26
          Height = 13
          Caption = 'Value'
        end
        object cbOMeasure: TComboBox
          Left = 71
          Top = 21
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 0
          Text = 'mPercentage'
          OnChange = cbOMeasureChange
          Items.Strings = (
            'mPixels'
            'mPercentage')
        end
        object eOValue: TSpinEdit
          Left = 71
          Top = 64
          Width = 57
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 1
          Value = 1
          OnChange = eOValueChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 168
        Width = 358
        Height = 185
        Caption = ' Icon '
        TabOrder = 2
        object lIFillColor: TLabel
          Left = 24
          Top = 76
          Width = 37
          Height = 13
          Caption = 'FillColor'
        end
        object lIFillOpacity: TLabel
          Left = 151
          Top = 76
          Width = 88
          Height = 13
          Caption = 'FillOpacity (0 to 1)'
        end
        object lIPath: TLabel
          Left = 24
          Top = 24
          Width = 22
          Height = 13
          Caption = 'Path'
        end
        object lIStrokeColor: TLabel
          Left = 24
          Top = 132
          Width = 56
          Height = 13
          Caption = 'StrokeColor'
        end
        object lIStrokeOpacity: TLabel
          Left = 152
          Top = 132
          Width = 107
          Height = 13
          Caption = 'StrokeOpacity (0 to 1)'
        end
        object lIStrokeWeight: TLabel
          Left = 272
          Top = 132
          Width = 65
          Height = 13
          Caption = 'StrokeWeight'
        end
        object cbIFillColor: TColorBox
          Left = 24
          Top = 95
          Width = 89
          Height = 22
          TabOrder = 1
          OnChange = cbIFillColorChange
        end
        object eIFillOpacity: TEdit
          Left = 151
          Top = 96
          Width = 57
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = eIFillOpacityChange
        end
        object cbIPath: TComboBox
          Left = 24
          Top = 43
          Width = 177
          Height = 21
          Style = csDropDownList
          TabOrder = 0
          OnChange = cbIPathChange
          Items.Strings = (
            'spNONE'
            'spBACKWARD_CLOSED_ARROW'
            'spBACKWARD_OPEN_ARROW'
            'spCIRCLE'
            'spFORWARD_CLOSED_ARROW'
            'spFORWARD_OPEN_ARROW'
            'spDASHEDLINE')
        end
        object cbIStrokeColor: TColorBox
          Left = 24
          Top = 150
          Width = 89
          Height = 22
          TabOrder = 3
          OnChange = cbIStrokeColorChange
        end
        object eIStrokeOpacity: TEdit
          Left = 151
          Top = 151
          Width = 57
          Height = 21
          TabOrder = 4
          Text = '0'
          OnChange = eIStrokeOpacityChange
        end
        object eIStrokeWeight: TSpinEdit
          Left = 272
          Top = 150
          Width = 57
          Height = 22
          MaxValue = 10
          MinValue = 1
          TabOrder = 5
          Value = 1
          OnChange = eIStrokeWeightChange
        end
      end
    end
    object tsElev: TTabSheet
      Caption = 'Elevation'
      ImageIndex = 5
      object Chart1: TChart
        Left = 0
        Top = 153
        Width = 364
        Height = 212
        BackWall.Visible = False
        BottomWall.Visible = False
        LeftWall.Visible = False
        Legend.Shadow.Visible = False
        Legend.Visible = False
        Title.Text.Strings = (
          'TChart')
        Title.Visible = False
        View3D = False
        View3DWalls = False
        Align = alClient
        TabOrder = 0
        PrintMargins = (
          15
          3
          15
          3)
        ColorPaletteIndex = 13
        object Series1: TAreaSeries
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Shadow.Color = 8684676
          Marks.Shadow.Smooth = False
          Marks.Shadow.Visible = False
          Marks.ShapeStyle = fosRoundRectangle
          Marks.Symbol.Shadow.Smooth = False
          Marks.Symbol.Shadow.Visible = False
          Marks.Visible = False
          ShowInLegend = False
          AreaChartBrush.Color = clGray
          AreaChartBrush.BackColor = clDefault
          Dark3D = False
          DrawArea = True
          Pointer.InflateMargins = False
          Pointer.Style = psStar
          Pointer.Visible = False
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Y'
          YValues.Order = loNone
          Data = {
            001900000000000000001895400000000000808B400000000000C88E40000000
            000030914000000000002C8F4000000000004E91400000000000169240000000
            00001A93400000000000A8914000000000009090400000000000C69140000000
            000062914000000000001A934000000000000C924000000000009A9040000000
            00001291400000000000F2924000000000008893400000000000D29440000000
            0000FC92400000000000529240000000000042934000000000006E9440000000
            00009C93400000000000969440}
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 364
        Height = 153
        Align = alTop
        Caption = ' '
        TabOrder = 1
        object Shape1: TShape
          Left = 24
          Top = 3
          Width = 196
          Height = 32
        end
        object Label100: TLabel
          Left = 108
          Top = 11
          Width = 39
          Height = 13
          Caption = 'Samples'
        end
        object lbElevations: TListBox
          Left = 24
          Top = 40
          Width = 313
          Height = 97
          ItemHeight = 13
          TabOrder = 0
        end
        object rbAlongPath: TRadioButton
          Left = 28
          Top = 10
          Width = 73
          Height = 17
          Caption = 'Along Path'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbAlongPathClick
        end
        object rbForLocation: TRadioButton
          Left = 256
          Top = 10
          Width = 81
          Height = 17
          Caption = 'For Location'
          TabOrder = 2
          OnClick = rbForLocationClick
        end
        object eSamples: TSpinEdit
          Left = 153
          Top = 8
          Width = 57
          Height = 22
          MaxValue = 512
          MinValue = 2
          TabOrder = 3
          Value = 512
          OnChange = eStrokeWeightChange
        end
      end
    end
    object tsGeometry: TTabSheet
      Caption = 'Geometry'
      ImageIndex = 6
      object Label14: TLabel
        Left = 29
        Top = 120
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object Label15: TLabel
        Left = 29
        Top = 144
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object Label16: TLabel
        Left = 29
        Top = 168
        Width = 47
        Height = 13
        Caption = 'Tolerance'
      end
      object Label17: TLabel
        Left = 24
        Top = 211
        Width = 32
        Height = 13
        Caption = 'Radius'
      end
      object lComArea: TLabel
        Left = 104
        Top = 246
        Width = 3
        Height = 13
      end
      object eEncodePath: TEdit
        Left = 104
        Top = 48
        Width = 209
        Height = 21
        TabOrder = 0
        Text = 'eEncodePath'
      end
      object bEncodePath: TButton
        Left = 24
        Top = 30
        Width = 75
        Height = 25
        Caption = 'Encode Path'
        TabOrder = 1
        OnClick = bEncodePathClick
      end
      object bDecodePath: TButton
        Left = 24
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Decode Path'
        TabOrder = 2
        OnClick = bDecodePathClick
      end
      object eLatIsLoc: TEdit
        Left = 82
        Top = 117
        Width = 134
        Height = 21
        TabOrder = 3
        Text = '0'
        OnChange = eLatChange
      end
      object eLngIsLoc: TEdit
        Left = 82
        Top = 141
        Width = 134
        Height = 21
        TabOrder = 4
        Text = '0'
        OnChange = eLngChange
      end
      object bIsLoc: TButton
        Left = 224
        Top = 139
        Width = 89
        Height = 25
        Caption = 'Is Loc. On Edge'
        TabOrder = 5
        OnClick = bIsLocClick
      end
      object eTolerance: TEdit
        Left = 82
        Top = 165
        Width = 47
        Height = 21
        TabOrder = 6
        Text = '-1'
        OnChange = eLngChange
      end
      object eRadius: TEdit
        Left = 62
        Top = 208
        Width = 64
        Height = 21
        TabOrder = 7
        Text = '-1'
      end
      object bComArea: TButton
        Left = 24
        Top = 238
        Width = 75
        Height = 25
        Caption = 'Compute Area'
        TabOrder = 8
        OnClick = bComAreaClick
      end
    end
    object tsCurveLine: TTabSheet
      Caption = 'Curve Line'
      ImageIndex = 7
      object Label101: TLabel
        Left = 60
        Top = 117
        Width = 50
        Height = 13
        Caption = 'Resolution'
      end
      object Label102: TLabel
        Left = 60
        Top = 165
        Width = 42
        Height = 13
        Caption = 'Multiplier'
      end
      object cbCLActive: TCheckBox
        Left = 40
        Top = 48
        Width = 97
        Height = 17
        Caption = 'Active'
        TabOrder = 0
        OnClick = cbCLActiveClick
      end
      object cbCLHoriz: TCheckBox
        Left = 40
        Top = 79
        Width = 97
        Height = 17
        Caption = 'Horizontal'
        TabOrder = 1
        OnClick = cbCLHorizClick
      end
      object eCLRes: TEdit
        Left = 121
        Top = 114
        Width = 57
        Height = 21
        TabOrder = 2
        Text = '0'
        OnChange = eCLResChange
      end
      object eCLMulti: TSpinEdit
        Left = 108
        Top = 162
        Width = 57
        Height = 22
        MaxValue = 50
        MinValue = 1
        TabOrder = 3
        Value = 1
        OnChange = eCLMultiChange
      end
    end
  end
end
