object MapFrm: TMapFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Map'
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
  object pcPages: TPageControl
    Left = 0
    Top = 0
    Width = 564
    Height = 393
    ActivePage = tsStreetView
    Align = alClient
    TabOrder = 0
    object tsGeneral: TTabSheet
      Caption = 'General Config.'
      object Label33: TLabel
        Left = 24
        Top = 104
        Width = 98
        Height = 13
        Caption = 'Interval Events (ms)'
      end
      object Label35: TLabel
        Left = 23
        Top = 160
        Width = 97
        Height = 13
        Caption = 'Language Messages'
      end
      object Label40: TLabel
        Left = 76
        Top = 216
        Width = 42
        Height = 13
        Caption = 'Precision'
      end
      object cbActive: TCheckBox
        Left = 126
        Top = 56
        Width = 97
        Height = 17
        Caption = 'Active'
        TabOrder = 0
        OnClick = cbActiveClick
      end
      object eInterval: TSpinEdit
        Left = 126
        Top = 101
        Width = 65
        Height = 22
        MaxValue = 500
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = eIntervalChange
      end
      object cbLanguages: TComboBox
        Left = 126
        Top = 157
        Width = 121
        Height = 21
        Style = csDropDownList
        TabOrder = 2
        OnChange = cbLanguagesChange
        Items.Strings = (
          'Espa'#241'ol'
          'English'
          'French'
          'PortuguesBR'
          'Danish'
          'German')
      end
      object ePrecision: TSpinEdit
        Left = 126
        Top = 213
        Width = 63
        Height = 22
        MaxValue = 17
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = ePrecisionChange
      end
    end
    object tsRequired: TTabSheet
      Caption = 'Required Prop.'
      ImageIndex = 1
      object lLong: TLabel
        Left = 35
        Top = 53
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object lLat: TLabel
        Left = 35
        Top = 85
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object lTypMap: TLabel
        Left = 35
        Top = 125
        Width = 47
        Height = 13
        Caption = 'Map Type'
      end
      object lZoom: TLabel
        Left = 35
        Top = 168
        Width = 26
        Height = 13
        Caption = 'Zoom'
      end
      object eReqLng: TEdit
        Left = 90
        Top = 50
        Width = 170
        Height = 21
        TabOrder = 0
        Text = '2,122715'
      end
      object eReqLat: TEdit
        Left = 90
        Top = 82
        Width = 170
        Height = 21
        TabOrder = 1
        Text = '41,380908'
      end
      object cbTypeMap: TComboBox
        Left = 90
        Top = 125
        Width = 170
        Height = 21
        Style = csDropDownList
        ItemIndex = 1
        TabOrder = 2
        Text = 'mtROADMAP'
        OnChange = cbTypeMapChange
        Items.Strings = (
          'mtHYBRID'
          'mtROADMAP'
          'mtSATELLITE'
          'mtTERRAIN')
      end
      object tbZoom: TTrackBar
        Left = 90
        Top = 168
        Width = 170
        Height = 27
        Max = 15
        Position = 10
        TabOrder = 3
        OnChange = tbZoomChange
      end
      object bSetCenter: TButton
        Left = 266
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Set Center'
        TabOrder = 4
        OnClick = bSetCenterClick
      end
    end
    object tsVisual: TTabSheet
      Caption = 'Visual Prop.'
      ImageIndex = 2
      object Label16: TLabel
        Left = 56
        Top = 25
        Width = 84
        Height = 13
        Caption = 'Background Color'
      end
      object Label13: TLabel
        Left = 315
        Top = 44
        Width = 38
        Height = 13
        Caption = 'Map Ids'
      end
      object Label11: TLabel
        Left = 315
        Top = 112
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label12: TLabel
        Left = 315
        Top = 138
        Width = 24
        Height = 13
        Caption = 'Style'
      end
      object Label18: TLabel
        Left = 67
        Top = 169
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label17: TLabel
        Left = 67
        Top = 225
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label19: TLabel
        Left = 315
        Top = 196
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label20: TLabel
        Left = 315
        Top = 222
        Width = 24
        Height = 13
        Caption = 'Style'
      end
      object Label21: TLabel
        Left = 315
        Top = 285
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label9: TLabel
        Left = 67
        Top = 288
        Width = 37
        Height = 13
        Caption = 'Position'
      end
      object Label10: TLabel
        Left = 67
        Top = 314
        Width = 24
        Height = 13
        Caption = 'Style'
      end
      object cbBGColor: TColorBox
        Left = 56
        Top = 44
        Width = 188
        Height = 22
        DefaultColorColor = clBtnShadow
        Selected = clBtnFace
        TabOrder = 0
        OnChange = cbBGColorChange
      end
      object cbShowMapType: TCheckBox
        Left = 302
        Top = 25
        Width = 216
        Height = 17
        Caption = 'Show Map Type Control'
        Checked = True
        State = cbChecked
        TabOrder = 9
        OnClick = cbShowMapTypeClick
      end
      object clbMapType: TCheckListBox
        Left = 358
        Top = 44
        Width = 160
        Height = 56
        OnClickCheck = clbMapTypeClickCheck
        ItemHeight = 13
        Items.Strings = (
          'mtHYBRID'
          'mtROADMAP'
          'mtSATELLITE'
          'mtTERRAIN')
        TabOrder = 10
      end
      object cbMapTypePos: TComboBox
        Left = 358
        Top = 104
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 11
        OnChange = cbMapTypePosChange
        Items.Strings = (
          'cpBOTTOM'
          'cpBOTTOM_LEFT'
          'cpBOTTOM_RIGHT'
          'cpLEFT'
          'cpRIGHT'
          'cpTOP'
          'cpTOP_LEFT'
          'cpTOP_RIGHT')
      end
      object cbMapTypeStyle: TComboBox
        Left = 358
        Top = 130
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 12
        OnChange = cbMapTypeStyleChange
        Items.Strings = (
          'mtcDEFAULT'
          'mtcDROPDOWN_MENU'
          'mtcHORIZONTAL_BAR')
      end
      object cbShowOver: TCheckBox
        Left = 56
        Top = 85
        Width = 177
        Height = 17
        Caption = 'Show Overview Map Control'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbShowOverClick
      end
      object cbOverOpened: TCheckBox
        Left = 75
        Top = 108
        Width = 122
        Height = 17
        Caption = 'Opened'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbOverOpenedClick
      end
      object cbShowPan: TCheckBox
        Left = 56
        Top = 142
        Width = 177
        Height = 17
        Caption = 'Show Pan Control'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = cbShowPanClick
      end
      object cbPanPos: TComboBox
        Left = 110
        Top = 161
        Width = 134
        Height = 21
        Style = csDropDownList
        TabOrder = 4
        OnChange = cbPanPosChange
        Items.Strings = (
          'cpBOTTOM'
          'cpBOTTOM_LEFT'
          'cpBOTTOM_RIGHT'
          'cpLEFT'
          'cpRIGHT'
          'cpTOP'
          'cpTOP_LEFT'
          'cpTOP_RIGHT')
      end
      object cbShowRotate: TCheckBox
        Left = 56
        Top = 198
        Width = 177
        Height = 17
        Caption = 'Show Rotate Control'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = cbShowRotateClick
      end
      object cbRoratePos: TComboBox
        Left = 110
        Top = 217
        Width = 134
        Height = 21
        Style = csDropDownList
        TabOrder = 6
        OnChange = cbRoratePosChange
        Items.Strings = (
          'cpBOTTOM'
          'cpBOTTOM_LEFT'
          'cpBOTTOM_RIGHT'
          'cpLEFT'
          'cpRIGHT'
          'cpTOP'
          'cpTOP_LEFT'
          'cpTOP_RIGHT')
      end
      object cbShowScale: TCheckBox
        Left = 302
        Top = 169
        Width = 216
        Height = 17
        Caption = 'Show Scale Control'
        Checked = True
        State = cbChecked
        TabOrder = 13
        OnClick = cbShowScaleClick
      end
      object cbScalePos: TComboBox
        Left = 358
        Top = 188
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 14
        OnChange = cbScalePosChange
        Items.Strings = (
          'cpBOTTOM'
          'cpBOTTOM_LEFT'
          'cpBOTTOM_RIGHT'
          'cpLEFT'
          'cpRIGHT'
          'cpTOP'
          'cpTOP_LEFT'
          'cpTOP_RIGHT')
      end
      object cbScaleStyle: TComboBox
        Left = 358
        Top = 214
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 15
        OnChange = cbScaleStyleChange
        Items.Strings = (
          'scDEFAULT')
      end
      object cbStreetViewPos: TComboBox
        Left = 358
        Top = 277
        Width = 160
        Height = 21
        Style = csDropDownList
        TabOrder = 8
        OnChange = cbStreetViewPosChange
        Items.Strings = (
          'cpBOTTOM'
          'cpBOTTOM_LEFT'
          'cpBOTTOM_RIGHT'
          'cpLEFT'
          'cpRIGHT'
          'cpTOP'
          'cpTOP_LEFT'
          'cpTOP_RIGHT')
      end
      object cbShowStreetView: TCheckBox
        Left = 301
        Top = 258
        Width = 217
        Height = 17
        Caption = 'Show StreetView Control'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object cbShowZoom: TCheckBox
        Left = 56
        Top = 261
        Width = 224
        Height = 17
        Caption = 'Show Zoom Control'
        Checked = True
        State = cbChecked
        TabOrder = 16
        OnClick = cbShowZoomClick
      end
      object cbZoomPos: TComboBox
        Left = 110
        Top = 280
        Width = 134
        Height = 21
        Style = csDropDownList
        TabOrder = 17
        OnChange = cbZoomPosChange
        Items.Strings = (
          'cpBOTTOM'
          'cpBOTTOM_LEFT'
          'cpBOTTOM_RIGHT'
          'cpLEFT'
          'cpRIGHT'
          'cpTOP'
          'cpTOP_LEFT'
          'cpTOP_RIGHT')
      end
      object cbZoomStyle: TComboBox
        Left = 110
        Top = 306
        Width = 134
        Height = 21
        Style = csDropDownList
        TabOrder = 18
        OnChange = cbZoomStyleChange
        Items.Strings = (
          'zcDEFAULT'
          'zcLARGE'
          'zcSMALL')
      end
      object bDoMapVP: TButton
        Left = 443
        Top = 323
        Width = 75
        Height = 25
        Caption = 'Do Map'
        TabOrder = 19
        OnClick = bDoMapVPClick
      end
    end
    object tsNonVisual: TTabSheet
      Caption = 'Non Visual Prop'
      ImageIndex = 3
      object Label7: TLabel
        Left = 56
        Top = 154
        Width = 49
        Height = 13
        Caption = 'Max Zoom'
      end
      object Label8: TLabel
        Left = 174
        Top = 154
        Width = 45
        Height = 13
        Caption = 'Min Zoom'
      end
      object cbZoomClick: TCheckBox
        Left = 56
        Top = 42
        Width = 224
        Height = 17
        Caption = 'Disable double click zoom'
        TabOrder = 0
        OnClick = cbZoomClickClick
      end
      object cbDraggable: TCheckBox
        Left = 56
        Top = 73
        Width = 75
        Height = 17
        Caption = 'Draggable'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbDraggableClick
      end
      object cbNoClear: TCheckBox
        Left = 56
        Top = 112
        Width = 75
        Height = 17
        Caption = 'No Clear'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbNoClearClick
      end
      object cbKeyboard: TCheckBox
        Left = 287
        Top = 42
        Width = 141
        Height = 17
        Caption = 'Keyboard Shortcuts'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = cbKeyboardClick
      end
      object cbWheel: TCheckBox
        Left = 287
        Top = 73
        Width = 133
        Height = 17
        Caption = 'Scroll Wheel'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = cbWheelClick
      end
      object eMaxZoom: TSpinEdit
        Left = 56
        Top = 172
        Width = 57
        Height = 22
        MaxValue = 15
        MinValue = 0
        TabOrder = 6
        Value = 0
        OnChange = eMaxZoomChange
      end
      object eMinZoom: TSpinEdit
        Left = 174
        Top = 172
        Width = 57
        Height = 22
        MaxValue = 15
        MinValue = 0
        TabOrder = 7
        Value = 0
        OnChange = eMinZoomChange
      end
      object bDoMapNVP: TButton
        Left = 443
        Top = 323
        Width = 75
        Height = 25
        Caption = 'Do Map'
        TabOrder = 8
        OnClick = bDoMapNVPClick
      end
      object cbMarker: TCheckBox
        Left = 287
        Top = 112
        Width = 133
        Height = 17
        Caption = 'MapMarker'
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = cbMarkerClick
      end
    end
    object tsLayers: TTabSheet
      Caption = 'Layers'
      ImageIndex = 5
      object cbBicycling: TCheckBox
        Left = 49
        Top = 42
        Width = 105
        Height = 17
        Caption = 'Show Bicycling'
        TabOrder = 0
        OnClick = cbBicyclingClick
      end
      object cbPano: TCheckBox
        Left = 33
        Top = 97
        Width = 105
        Height = 17
        Caption = 'Show Panoramio'
        TabOrder = 3
        OnClick = cbPanoClick
      end
      object cbTraffic: TCheckBox
        Left = 312
        Top = 42
        Width = 105
        Height = 17
        Caption = 'Show Traffic'
        TabOrder = 2
        OnClick = cbTrafficClick
      end
      object cbTransit: TCheckBox
        Left = 177
        Top = 42
        Width = 105
        Height = 17
        Caption = 'Show Transit'
        TabOrder = 1
        OnClick = cbTransitClick
      end
      object cbWeather: TCheckBox
        Left = 277
        Top = 97
        Width = 105
        Height = 17
        Caption = 'Show Weather'
        TabOrder = 4
        OnClick = cbWeatherClick
      end
      object GroupBox1: TGroupBox
        Left = 33
        Top = 128
        Width = 233
        Height = 201
        Caption = ' Panoramio Opt. '
        TabOrder = 5
        object Label1: TLabel
          Left = 24
          Top = 96
          Width = 45
          Height = 13
          Caption = 'Filter Tag'
        end
        object Label2: TLabel
          Left = 25
          Top = 144
          Width = 62
          Height = 13
          Caption = 'Filter User Id'
        end
        object cbPanoClickable: TCheckBox
          Left = 25
          Top = 34
          Width = 105
          Height = 17
          Caption = 'Clickable'
          TabOrder = 0
          OnClick = cbPanoClickableClick
        end
        object cbPanoFiltered: TCheckBox
          Left = 25
          Top = 65
          Width = 105
          Height = 17
          Caption = 'Filtered'
          TabOrder = 1
          OnClick = cbPanoFilteredClick
        end
        object ePanoFilterTag: TEdit
          Left = 24
          Top = 115
          Width = 169
          Height = 21
          TabOrder = 2
          Text = 'ePanoFilterTag'
          OnChange = ePanoFilterTagChange
        end
        object ePanoFilterUserId: TEdit
          Left = 25
          Top = 163
          Width = 169
          Height = 21
          TabOrder = 3
          Text = 'ePanoFilterTag'
          OnChange = ePanoFilterUserIdChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 280
        Top = 128
        Width = 249
        Height = 201
        Caption = ' Weather Opt. '
        TabOrder = 6
        object Label3: TLabel
          Left = 25
          Top = 97
          Width = 53
          Height = 13
          Caption = 'Label Color'
        end
        object Label4: TLabel
          Left = 119
          Top = 97
          Width = 84
          Height = 13
          Caption = 'Temperature Unit'
        end
        object Label5: TLabel
          Left = 23
          Top = 144
          Width = 79
          Height = 13
          Caption = 'Wind Speed Unit'
        end
        object cbWeatherSupInfoWin: TCheckBox
          Left = 25
          Top = 57
          Width = 144
          Height = 17
          Caption = 'SuppressInfoWindows'
          TabOrder = 0
          OnClick = cbWeatherSupInfoWinClick
        end
        object cbWeatherClickable: TCheckBox
          Left = 25
          Top = 34
          Width = 105
          Height = 17
          Caption = 'Clickable'
          TabOrder = 1
          OnClick = cbWeatherClickableClick
        end
        object cbWeatherLabCol: TComboBox
          Left = 25
          Top = 115
          Width = 88
          Height = 21
          Style = csDropDownList
          TabOrder = 2
          OnChange = cbWeatherLabColChange
          Items.Strings = (
            'lcBLACK'
            'lcWHITE')
        end
        object cbWeatherTempUnit: TComboBox
          Left = 119
          Top = 115
          Width = 114
          Height = 21
          Style = csDropDownList
          TabOrder = 3
          OnChange = cbWeatherTempUnitChange
          Items.Strings = (
            'tuCELSIUS'
            'tuFAHRENHEIT')
        end
        object cbWeatherWSUnit: TComboBox
          Left = 23
          Top = 163
          Width = 210
          Height = 21
          Style = csDropDownList
          TabOrder = 4
          OnChange = cbWeatherWSUnitChange
          Items.Strings = (
            'wsKILOMETERS_PER_HOUR'
            'wsMETERS_PER_SECOND'
            'wsMILES_PER_HOUR')
        end
      end
    end
    object tsEvents: TTabSheet
      Caption = 'Events Fired'
      ImageIndex = 4
      object cbOnBoundsChanged: TCheckBox
        Left = 64
        Top = 32
        Width = 180
        Height = 17
        Caption = 'OnBoundsChanged'
        TabOrder = 0
        OnClick = cbOnBoundsChangedClick
      end
      object cbOnCenterChanged: TCheckBox
        Left = 64
        Top = 72
        Width = 180
        Height = 17
        Caption = 'OnCenterChanged'
        TabOrder = 1
        OnClick = cbOnCenterChangedClick
      end
      object cbOnClick: TCheckBox
        Left = 64
        Top = 112
        Width = 180
        Height = 17
        Caption = 'OnClick'
        TabOrder = 2
        OnClick = cbOnClickClick
      end
      object cbOnDblClick: TCheckBox
        Left = 64
        Top = 152
        Width = 180
        Height = 17
        Caption = 'OnDblClick'
        TabOrder = 3
        OnClick = cbOnDblClickClick
      end
      object cbOnDrag: TCheckBox
        Left = 64
        Top = 192
        Width = 180
        Height = 17
        Caption = 'OnDrag'
        TabOrder = 4
        OnClick = cbOnDragClick
      end
      object cbOnDragEnd: TCheckBox
        Left = 64
        Top = 232
        Width = 180
        Height = 17
        Caption = 'OnDragEnd'
        TabOrder = 5
        OnClick = cbOnDragEndClick
      end
      object cbOnDragStart: TCheckBox
        Left = 64
        Top = 272
        Width = 180
        Height = 17
        Caption = 'OnDragStart'
        TabOrder = 6
        OnClick = cbOnDragStartClick
      end
      object cbOnMapTypeIdChanged: TCheckBox
        Left = 336
        Top = 32
        Width = 180
        Height = 17
        Caption = 'OnMapTypeIdChanged'
        TabOrder = 8
        OnClick = cbOnMapTypeIdChangedClick
      end
      object cbOnMouseMove: TCheckBox
        Left = 336
        Top = 72
        Width = 180
        Height = 17
        Caption = 'OnMouseMove'
        TabOrder = 9
        OnClick = cbOnMouseMoveClick
      end
      object cbOnMouseOut: TCheckBox
        Left = 336
        Top = 112
        Width = 180
        Height = 17
        Caption = 'OnMouseOut'
        TabOrder = 10
        OnClick = cbOnMouseOutClick
      end
      object cbOnMouseOver: TCheckBox
        Left = 336
        Top = 152
        Width = 180
        Height = 17
        Caption = 'OnMouseOver'
        TabOrder = 11
        OnClick = cbOnMouseOverClick
      end
      object cbOnRightClick: TCheckBox
        Left = 336
        Top = 232
        Width = 180
        Height = 17
        Caption = 'OnRightClick'
        TabOrder = 13
        OnClick = cbOnRightClickClick
      end
      object cbOnZoomChanged: TCheckBox
        Left = 336
        Top = 272
        Width = 180
        Height = 17
        Caption = 'OnZoomChanged'
        TabOrder = 14
        OnClick = cbOnZoomChangedClick
      end
      object cbOnIntervalEventsChange: TCheckBox
        Left = 64
        Top = 313
        Width = 180
        Height = 17
        Caption = 'OnIntervalEventsChange'
        TabOrder = 7
        OnClick = cbOnIntervalEventsChangeClick
      end
      object cbOnPrecisionChange: TCheckBox
        Left = 336
        Top = 192
        Width = 180
        Height = 17
        Caption = 'OnPrecisionChange'
        TabOrder = 12
        OnClick = cbOnPrecisionChangeClick
      end
    end
    object tsFunctions: TTabSheet
      Caption = 'Functions'
      ImageIndex = 6
      DesignSize = (
        556
        365)
      object Label27: TLabel
        Left = 262
        Top = 24
        Width = 291
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Write or Read LatLngBounds into/from LatLngBounds GroupBox'
        WordWrap = True
      end
      object Label28: TLabel
        Left = 258
        Top = 91
        Width = 272
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 
          'Read LatLng GroupBox and write the LatLngBounds result into LatL' +
          'ngBounds GroupBox'
        WordWrap = True
      end
      object Label29: TLabel
        Left = 258
        Top = 159
        Width = 287
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Write or Read LatLng into/from LatLng GroupBox (Bounds)'
        WordWrap = True
      end
      object Label30: TLabel
        Left = 260
        Top = 208
        Width = 270
        Height = 12
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'ShowMessage with the information'
        WordWrap = True
      end
      object Label34: TLabel
        Left = 260
        Top = 271
        Width = 285
        Height = 12
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Write or Read LatLng into/from LatLng GroupBox (LatLng)'
        WordWrap = True
      end
      object gbB1: TGroupBox
        Left = 8
        Top = 8
        Width = 231
        Height = 169
        Caption = ' LatLngBounds'
        TabOrder = 0
        object Label6: TLabel
          Left = 8
          Top = 16
          Width = 59
          Height = 13
          Caption = 'LatLng SW'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 32
          Top = 35
          Width = 33
          Height = 13
          Caption = 'Latitud'
        end
        object Label15: TLabel
          Left = 32
          Top = 62
          Width = 41
          Height = 13
          Caption = 'Longitud'
        end
        object Label22: TLabel
          Left = 7
          Top = 96
          Width = 54
          Height = 13
          Caption = 'LatLng NE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 31
          Top = 115
          Width = 33
          Height = 13
          Caption = 'Latitud'
        end
        object Label24: TLabel
          Left = 31
          Top = 142
          Width = 41
          Height = 13
          Caption = 'Longitud'
        end
        object eLatASW: TEdit
          Left = 80
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '41,380785'
        end
        object eLngASW: TEdit
          Left = 79
          Top = 59
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '2,122868'
        end
        object eLatANE: TEdit
          Left = 79
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 2
          Text = '41,403149'
        end
        object eLngANE: TEdit
          Left = 78
          Top = 139
          Width = 121
          Height = 21
          TabOrder = 3
          Text = '2,173822'
        end
      end
      object gbLatLng: TGroupBox
        Left = 8
        Top = 183
        Width = 231
        Height = 84
        Caption = ' LatLng '
        TabOrder = 1
        object Label25: TLabel
          Left = 32
          Top = 27
          Width = 33
          Height = 13
          Caption = 'Latitud'
        end
        object Label26: TLabel
          Left = 32
          Top = 54
          Width = 41
          Height = 13
          Caption = 'Longitud'
        end
        object eLat: TEdit
          Left = 80
          Top = 24
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '41,380785'
        end
        object eLng: TEdit
          Left = 79
          Top = 51
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '2,122868'
        end
      end
      object bContains: TButton
        Left = 420
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Contains'
        TabOrder = 2
        OnClick = bContainsClick
      end
      object bSetBounds: TButton
        Left = 339
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Set Bounds'
        TabOrder = 3
        OnClick = bSetBoundsClick
      end
      object bGetBounds: TButton
        Left = 258
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Get Bounds'
        TabOrder = 4
        OnClick = bGetBoundsClick
      end
      object bExtend: TButton
        Left = 258
        Top = 123
        Width = 75
        Height = 25
        Caption = 'Extend'
        TabOrder = 5
        OnClick = bExtendClick
      end
      object bGetCenter: TButton
        Left = 258
        Top = 175
        Width = 75
        Height = 25
        Caption = 'GetCenter'
        TabOrder = 6
        OnClick = bGetCenterClick
      end
      object bToSpan: TButton
        Left = 339
        Top = 175
        Width = 75
        Height = 25
        Caption = 'ToSpan'
        TabOrder = 7
        OnClick = bToSpanClick
      end
      object bToString: TButton
        Left = 258
        Top = 226
        Width = 75
        Height = 25
        Caption = 'ToString'
        TabOrder = 8
        OnClick = bToStringClick
      end
      object bToURL: TButton
        Left = 339
        Top = 226
        Width = 75
        Height = 25
        Caption = 'ToUrlValue'
        TabOrder = 9
        OnClick = bToURLClick
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 273
        Width = 231
        Height = 58
        Anchors = [akLeft, akTop, akRight]
        Caption = ' x and y '
        TabOrder = 10
        DesignSize = (
          231
          58)
        object Label31: TLabel
          Left = 24
          Top = 27
          Width = 6
          Height = 13
          Caption = 'X'
        end
        object Label32: TLabel
          Left = 112
          Top = 27
          Width = 6
          Height = 13
          Caption = 'Y'
        end
        object eXMet: TEdit
          Left = 36
          Top = 24
          Width = 53
          Height = 21
          TabOrder = 0
          Text = '5'
        end
        object eYMet: TEdit
          Left = 124
          Top = 24
          Width = 51
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = '5'
        end
      end
      object bGetCenterLL: TButton
        Left = 258
        Top = 290
        Width = 75
        Height = 25
        Caption = 'Get Center'
        TabOrder = 11
        OnClick = bGetCenterLLClick
      end
      object bPanTo: TButton
        Left = 420
        Top = 290
        Width = 75
        Height = 25
        Caption = 'PanTo'
        TabOrder = 12
        OnClick = bPanToClick
      end
      object bSetCenterLL: TButton
        Left = 339
        Top = 290
        Width = 75
        Height = 25
        Caption = 'Set Center'
        TabOrder = 13
        OnClick = bSetCenterLLClick
      end
      object Button15: TButton
        Left = 258
        Top = 321
        Width = 75
        Height = 25
        Caption = 'PanBy'
        TabOrder = 14
        OnClick = Button15Click
      end
    end
    object tsStreetView: TTabSheet
      Caption = 'StreetView'
      ImageIndex = 7
      object cbSVVisible: TCheckBox
        Left = 64
        Top = 32
        Width = 180
        Height = 17
        Caption = 'Visible'
        TabOrder = 0
        OnClick = cbSVVisibleClick
      end
    end
  end
end
