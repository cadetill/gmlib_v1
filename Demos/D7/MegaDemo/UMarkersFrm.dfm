object MarkersFrm: TMarkersFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Markers'
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
  object pcMarker: TPageControl
    Left = 192
    Top = 0
    Width = 372
    Height = 393
    ActivePage = tsGeneral
    Align = alClient
    TabOrder = 0
    object tsGeneral: TTabSheet
      Caption = 'General'
      object Label37: TLabel
        Left = 43
        Top = 176
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object Label36: TLabel
        Left = 43
        Top = 200
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object Label38: TLabel
        Left = 43
        Top = 240
        Width = 20
        Height = 13
        Caption = 'Title'
      end
      object Label2: TLabel
        Left = 43
        Top = 272
        Width = 21
        Height = 13
        Caption = 'Icon'
      end
      object Label13: TLabel
        Left = 43
        Top = 304
        Width = 60
        Height = 13
        Caption = 'Marker Type'
      end
      object cbBounce: TCheckBox
        Left = 40
        Top = 17
        Width = 127
        Height = 17
        Caption = 'Animation - Bounce'
        TabOrder = 0
        OnClick = cbBounceClick
      end
      object cbOnDrop: TCheckBox
        Left = 40
        Top = 40
        Width = 127
        Height = 17
        Caption = 'Animation - OnDrop'
        TabOrder = 1
        OnClick = cbOnDropClick
      end
      object cbClickable: TCheckBox
        Left = 40
        Top = 79
        Width = 127
        Height = 17
        Caption = 'Clickable'
        TabOrder = 2
        OnClick = cbClickableClick
      end
      object cbDraggable: TCheckBox
        Left = 40
        Top = 110
        Width = 127
        Height = 17
        Caption = 'Draggable'
        TabOrder = 3
        OnClick = cbDraggableClick
      end
      object cbFlat: TCheckBox
        Left = 40
        Top = 143
        Width = 127
        Height = 17
        Caption = 'Flat'
        TabOrder = 4
        OnClick = cbFlatClick
      end
      object cbOptimized: TCheckBox
        Left = 216
        Top = 79
        Width = 127
        Height = 17
        Caption = 'Optimized'
        TabOrder = 5
        OnClick = cbOptimizedClick
      end
      object cbRaiseOnDrag: TCheckBox
        Left = 216
        Top = 110
        Width = 127
        Height = 17
        Caption = 'Raise on drag'
        TabOrder = 6
        OnClick = cbRaiseOnDragClick
      end
      object cbVisible: TCheckBox
        Left = 216
        Top = 141
        Width = 127
        Height = 17
        Caption = 'Visible'
        TabOrder = 7
        OnClick = cbVisibleClick
      end
      object eLat: TEdit
        Left = 96
        Top = 173
        Width = 134
        Height = 21
        TabOrder = 8
        Text = '0'
        OnChange = eLatChange
      end
      object eLng: TEdit
        Left = 96
        Top = 197
        Width = 134
        Height = 21
        TabOrder = 9
        Text = '0'
        OnChange = eLngChange
      end
      object eTitle: TEdit
        Left = 72
        Top = 237
        Width = 158
        Height = 21
        TabOrder = 10
        OnChange = eTitleChange
      end
      object eIcon: TEdit
        Left = 72
        Top = 269
        Width = 271
        Height = 21
        TabOrder = 11
        OnChange = eIconChange
      end
      object cbMarkerType: TComboBox
        Left = 108
        Top = 301
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 12
        OnChange = cbMarkerTypeChange
        Items.Strings = (
          'mtStandard'
          'mtColored'
          'mtStyledMarker'
          'mtWithLabel')
      end
      object cbShowIWMouseOver: TCheckBox
        Left = 40
        Top = 336
        Width = 145
        Height = 17
        Caption = 'ShowInfoWinMouseOver'
        TabOrder = 13
        OnClick = cbShowIWMouseOverClick
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
        Left = 101
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
      object cbOnDrag: TCheckBox
        Left = 32
        Top = 96
        Width = 130
        Height = 17
        Caption = 'OnDrag'
        TabOrder = 3
        OnClick = cbOnDragClick
      end
      object cbOnDraggableChange: TCheckBox
        Left = 32
        Top = 120
        Width = 130
        Height = 17
        Caption = 'OnDraggableChange'
        TabOrder = 4
        OnClick = cbOnDraggableChangeClick
      end
      object cbOnDragEnd: TCheckBox
        Left = 32
        Top = 144
        Width = 130
        Height = 17
        Caption = 'OnDragEnd'
        TabOrder = 5
        OnClick = cbOnDragEndClick
      end
      object cbOnDragStart: TCheckBox
        Left = 32
        Top = 168
        Width = 130
        Height = 17
        Caption = 'OnDragStart'
        TabOrder = 6
        OnClick = cbOnDragStartClick
      end
      object cbOnFlatChange: TCheckBox
        Left = 32
        Top = 193
        Width = 130
        Height = 17
        Caption = 'OnFlatChange'
        TabOrder = 7
        OnClick = cbOnFlatChangeClick
      end
      object cbOnIconChange: TCheckBox
        Left = 32
        Top = 216
        Width = 130
        Height = 17
        Caption = 'OnIconChange'
        TabOrder = 8
        OnClick = cbOnIconChangeClick
      end
      object cbOnRightClick: TCheckBox
        Left = 184
        Top = 72
        Width = 150
        Height = 17
        Caption = 'OnRightClick'
        TabOrder = 14
        OnClick = cbOnRightClickClick
      end
      object cbOnMouseDown: TCheckBox
        Left = 32
        Top = 240
        Width = 130
        Height = 17
        Caption = 'OnMouseDown'
        TabOrder = 9
        OnClick = cbOnMouseDownClick
      end
      object cbOnMouseOver: TCheckBox
        Left = 32
        Top = 287
        Width = 130
        Height = 17
        Caption = 'OnMouseOver'
        TabOrder = 11
        OnClick = cbOnMouseOverClick
      end
      object cbOnMouseOut: TCheckBox
        Left = 32
        Top = 263
        Width = 130
        Height = 17
        Caption = 'OnMouseOut'
        TabOrder = 10
        OnClick = cbOnMouseOutClick
      end
      object cbOnMouseUp: TCheckBox
        Left = 184
        Top = 24
        Width = 150
        Height = 17
        Caption = 'OnMouseUp'
        TabOrder = 12
        OnClick = cbOnMouseUpClick
      end
      object cbOnPositionChange: TCheckBox
        Left = 184
        Top = 48
        Width = 150
        Height = 17
        Caption = 'OnPositionChange'
        TabOrder = 13
        OnClick = cbOnPositionChangeClick
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
        Top = 168
        Width = 150
        Height = 17
        Caption = 'OnCloseClick'
        TabOrder = 17
        OnClick = cbOnCloseClickClick
      end
      object cbOnVisibleChange: TCheckBox
        Left = 184
        Top = 120
        Width = 150
        Height = 17
        Caption = 'OnVisibleChange'
        TabOrder = 16
        OnClick = cbOnVisibleChangeClick
      end
      object cbOnTitleChange: TCheckBox
        Left = 184
        Top = 96
        Width = 150
        Height = 17
        Caption = 'OnTitleChange'
        TabOrder = 15
        OnClick = cbOnTitleChangeClick
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
    end
    object tsLoadCSV: TTabSheet
      Caption = 'Load from CSV'
      ImageIndex = 3
      object bSearchFile: TSpeedButton
        Left = 319
        Top = 55
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = bSearchFileClick
      end
      object Label7: TLabel
        Left = 24
        Top = 40
        Width = 46
        Height = 13
        Caption = 'File Name'
      end
      object Label8: TLabel
        Left = 24
        Top = 112
        Width = 119
        Height = 13
        Caption = 'Columns start from 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 24
        Top = 139
        Width = 53
        Height = 13
        Caption = 'Lat Column'
      end
      object Label10: TLabel
        Left = 112
        Top = 139
        Width = 55
        Height = 13
        Caption = 'Lng Column'
      end
      object Label11: TLabel
        Left = 216
        Top = 139
        Width = 58
        Height = 13
        Caption = 'Title Column'
      end
      object Label12: TLabel
        Left = 24
        Top = 216
        Width = 41
        Height = 13
        Caption = 'Delimiter'
      end
      object eFileName: TEdit
        Left = 24
        Top = 56
        Width = 297
        Height = 21
        TabOrder = 0
      end
      object eLatColumn: TSpinEdit
        Left = 24
        Top = 158
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 3
        OnChange = ePixelOffsetHChange
      end
      object eLngColumn: TSpinEdit
        Left = 112
        Top = 158
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 2
        OnChange = ePixelOffsetHChange
      end
      object eTitleColumn: TSpinEdit
        Left = 216
        Top = 158
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = ePixelOffsetHChange
      end
      object eDelimiter: TEdit
        Left = 71
        Top = 213
        Width = 25
        Height = 21
        MaxLength = 1
        TabOrder = 4
        Text = ','
      end
      object cbDeleteBeforeLoad: TCheckBox
        Left = 24
        Top = 248
        Width = 119
        Height = 17
        Caption = 'Delete Before Load'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object cbWithRownTitle: TCheckBox
        Left = 176
        Top = 248
        Width = 97
        Height = 17
        Caption = 'With Rown Title'
        TabOrder = 6
      end
      object bLoadFromCSV: TButton
        Left = 24
        Top = 294
        Width = 97
        Height = 25
        Caption = 'Load from CSV'
        TabOrder = 7
        OnClick = bLoadFromCSVClick
      end
      object pbPoints: TProgressBar
        Left = 24
        Top = 325
        Width = 318
        Height = 17
        Step = 1
        TabOrder = 8
        Visible = False
      end
    end
    object tsColoredMarker: TTabSheet
      Caption = 'Colored Marker'
      ImageIndex = 4
      object Label14: TLabel
        Left = 64
        Top = 41
        Width = 28
        Height = 13
        Caption = 'Width'
      end
      object Label15: TLabel
        Left = 200
        Top = 41
        Width = 31
        Height = 13
        Caption = 'Height'
      end
      object Label16: TLabel
        Left = 64
        Top = 112
        Width = 58
        Height = 13
        Caption = 'CornerColor'
      end
      object Label17: TLabel
        Left = 64
        Top = 179
        Width = 61
        Height = 13
        Caption = 'PrimaryColor'
      end
      object Label18: TLabel
        Left = 64
        Top = 248
        Width = 56
        Height = 13
        Caption = 'StrokeColor'
      end
      object eColWidth: TSpinEdit
        Left = 64
        Top = 60
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
        OnChange = eColWidthChange
      end
      object eColHeight: TSpinEdit
        Left = 198
        Top = 56
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = eColHeightChange
      end
      object cbColCornerColor: TColorBox
        Left = 64
        Top = 131
        Width = 89
        Height = 22
        TabOrder = 2
        OnChange = cbColCornerColorChange
      end
      object cbColPrimaryColor: TColorBox
        Left = 64
        Top = 198
        Width = 89
        Height = 22
        TabOrder = 3
        OnChange = cbColPrimaryColorChange
      end
      object cbColStrokeColor: TColorBox
        Left = 64
        Top = 267
        Width = 89
        Height = 22
        TabOrder = 4
        OnChange = cbColStrokeColorChange
      end
    end
    object tsStyledMarker: TTabSheet
      Caption = 'Styled Marker'
      ImageIndex = 5
      object Label19: TLabel
        Left = 64
        Top = 93
        Width = 81
        Height = 13
        Caption = 'BackgroundColor'
      end
      object Label20: TLabel
        Left = 64
        Top = 160
        Width = 47
        Height = 13
        Caption = 'TextColor'
      end
      object Label21: TLabel
        Left = 64
        Top = 229
        Width = 45
        Height = 13
        Caption = 'StarColor'
      end
      object Label23: TLabel
        Left = 64
        Top = 32
        Width = 54
        Height = 13
        Caption = 'Styled Icon'
      end
      object cbSMBackColor: TColorBox
        Left = 64
        Top = 112
        Width = 89
        Height = 22
        TabOrder = 0
        OnChange = cbSMBackColorChange
      end
      object cbSMTextColor: TColorBox
        Left = 64
        Top = 179
        Width = 89
        Height = 22
        TabOrder = 1
        OnChange = cbSMTextColorChange
      end
      object cbSMStarColor: TColorBox
        Left = 64
        Top = 248
        Width = 89
        Height = 22
        TabOrder = 2
        OnChange = cbSMStarColorChange
      end
      object cbSMShowStar: TCheckBox
        Left = 184
        Top = 250
        Width = 97
        Height = 17
        Caption = 'ShowStar'
        TabOrder = 3
        OnClick = cbSMShowStarClick
      end
      object cbSMStyledIcon: TComboBox
        Left = 64
        Top = 51
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnChange = cbSMStyledIconChange
        Items.Strings = (
          'siMarker'
          'siBubble')
      end
    end
    object tsGeometry: TTabSheet
      Caption = 'Geometry'
      ImageIndex = 6
      object Label22: TLabel
        Left = 248
        Top = 17
        Width = 32
        Height = 13
        Caption = 'Radius'
      end
      object lComDist: TLabel
        Left = 248
        Top = 56
        Width = 3
        Height = 13
      end
      object lbTo: TListBox
        Left = 16
        Top = 38
        Width = 142
        Height = 252
        ItemHeight = 13
        TabOrder = 0
      end
      object bComDist: TButton
        Left = 168
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Com. Dist.'
        TabOrder = 1
        OnClick = bComDistClick
      end
      object bLoadMarkers: TButton
        Left = 16
        Top = 7
        Width = 75
        Height = 25
        Caption = 'Load Markers'
        TabOrder = 2
        OnClick = bLoadMarkersClick
      end
      object eRadius: TEdit
        Left = 286
        Top = 14
        Width = 64
        Height = 21
        TabOrder = 3
        Text = '-1'
      end
    end
  end
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 192
    Height = 393
    ActivePage = tsMarkers
    Align = alLeft
    TabOrder = 1
    object tsMarkers: TTabSheet
      Caption = 'tsMarkers'
      TabVisible = False
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 69
        Height = 13
        Caption = 'List of Markert'
      end
      object lbItems: TListBox
        Left = 8
        Top = 56
        Width = 142
        Height = 252
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
        Top = 314
        Width = 75
        Height = 25
        Caption = 'Center at...'
        TabOrder = 5
        OnClick = bCenterClick
      end
      object bZoomToAll: TButton
        Left = 8
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Zoom To All'
        TabOrder = 6
        OnClick = bZoomToAllClick
      end
      object bShowInfoW: TButton
        Left = 89
        Top = 314
        Width = 75
        Height = 25
        Caption = 'Show InfoW'
        TabOrder = 7
        OnClick = bShowInfoWClick
      end
      object bMaxZoom: TButton
        Left = 89
        Top = 344
        Width = 75
        Height = 25
        Caption = 'Max Zoom'
        TabOrder = 8
        OnClick = bMaxZoomClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.csv'
    Filter = 'csv File|*.csv'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Left = 136
    Top = 8
  end
end
