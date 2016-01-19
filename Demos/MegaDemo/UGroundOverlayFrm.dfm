object GroundOverlayFrm: TGroundOverlayFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'GroundOverlay'
  ClientHeight = 393
  ClientWidth = 564
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 8
        Top = 32
        Width = 105
        Height = 13
        Caption = 'List of GroundOverlay'
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
    end
  end
  object pcMarker: TPageControl
    Left = 192
    Top = 0
    Width = 372
    Height = 393
    ActivePage = tsGeneral
    Align = alClient
    TabOrder = 1
    object tsGeneral: TTabSheet
      Caption = 'General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label9: TLabel
        Left = 32
        Top = 245
        Width = 22
        Height = 13
        Caption = 'Text'
      end
      object Label11: TLabel
        Left = 224
        Top = 247
        Width = 76
        Height = 13
        Caption = 'Opacity (0 to 1)'
      end
      object Label2: TLabel
        Left = 32
        Top = 75
        Width = 13
        Height = 13
        Caption = 'Url'
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
      object eText: TEdit
        Left = 32
        Top = 264
        Width = 134
        Height = 21
        TabOrder = 2
        OnChange = eTextChange
      end
      object GroupBox1: TGroupBox
        Left = 32
        Top = 120
        Width = 304
        Height = 102
        Caption = ' Bounds '
        TabOrder = 3
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
      object eOpacity: TEdit
        Left = 224
        Top = 264
        Width = 57
        Height = 21
        TabOrder = 4
        Text = '0'
        OnChange = eOpacityChange
      end
      object eUrl: TEdit
        Left = 49
        Top = 72
        Width = 287
        Height = 21
        TabOrder = 5
        OnChange = eUrlChange
      end
    end
    object tsInfoWin: TTabSheet
      Caption = 'InfoWin'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      object cbOnUrlChange: TCheckBox
        Left = 32
        Top = 144
        Width = 150
        Height = 17
        Caption = 'OnUrlChange'
        TabOrder = 5
        OnClick = cbOnUrlChangeClick
      end
      object cbOnDisableAutoPanChange: TCheckBox
        Left = 32
        Top = 249
        Width = 150
        Height = 17
        Caption = 'OnDisableAutoPanChange'
        TabOrder = 9
        OnClick = cbOnDisableAutoPanChangeClick
      end
      object cbOnCloseOtherBeforeOpenChange: TCheckBox
        Left = 32
        Top = 224
        Width = 180
        Height = 17
        Caption = 'OnCloseOtherBeforeOpenChange'
        TabOrder = 8
        OnClick = cbOnCloseOtherBeforeOpenChangeClick
      end
      object cbOnCloseClick: TCheckBox
        Left = 32
        Top = 199
        Width = 150
        Height = 17
        Caption = 'OnCloseClick'
        TabOrder = 7
        OnClick = cbOnCloseClickClick
      end
      object cbOnVisibleChange: TCheckBox
        Left = 32
        Top = 169
        Width = 150
        Height = 17
        Caption = 'OnVisibleChange'
        TabOrder = 6
        OnClick = cbOnVisibleChangeClick
      end
      object cbOnHTMLContentChange: TCheckBox
        Left = 32
        Top = 272
        Width = 150
        Height = 17
        Caption = 'OnHTMLContentChange'
        TabOrder = 10
        OnClick = cbOnHTMLContentChangeClick
      end
      object cbOnMaxWidthChange: TCheckBox
        Left = 32
        Top = 296
        Width = 150
        Height = 17
        Caption = 'OnMaxWidthChange'
        TabOrder = 11
        OnClick = cbOnMaxWidthChangeClick
      end
      object cbOnPixelOffsetChange: TCheckBox
        Left = 32
        Top = 319
        Width = 150
        Height = 17
        Caption = 'OnPixelOffsetChange'
        TabOrder = 12
        OnClick = cbOnPixelOffsetChangeClick
      end
      object cbOnOpacityChange: TCheckBox
        Left = 32
        Top = 119
        Width = 130
        Height = 17
        Caption = 'OnOpacityChange'
        TabOrder = 4
        OnClick = cbOnOpacityChangeClick
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
      object cbOnClick: TCheckBox
        Left = 32
        Top = 48
        Width = 130
        Height = 17
        Caption = 'OnClick'
        TabOrder = 1
        OnClick = cbOnClickClick
      end
    end
  end
end
