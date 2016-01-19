object GMInfoWinFrm: TGMInfoWinFrm
  Left = 0
  Top = 0
  Caption = 'GMLib Demo - GMInfoWindow'
  ClientHeight = 604
  ClientWidth = 831
  Color = 16767931
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 14
  object Splitter1: TSplitter
    Left = 555
    Top = 0
    Height = 585
    Align = alRight
    ExplicitLeft = 562
    ExplicitTop = -9
    ExplicitHeight = 613
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 585
    Width = 831
    Height = 19
    Panels = <
      item
        Text = 'Demo uso GMLib - GMInfoWindow'
        Width = 170
      end
      item
        Style = psOwnerDraw
        Text = 'www.cadetill.com'
        Width = 100
      end
      item
        Text = 'cadetill - 2010'
        Width = 50
      end>
    OnMouseMove = StatusBar1MouseMove
    OnMouseUp = StatusBar1MouseUp
    OnDrawPanel = StatusBar1DrawPanel
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 585
    Align = alClient
    Caption = ' '
    TabOrder = 1
    object Panel10: TPanel
      Left = 1
      Top = 426
      Width = 553
      Height = 158
      Align = alBottom
      Caption = ' '
      TabOrder = 0
      object mEvents: TMemo
        Left = 1
        Top = 24
        Width = 551
        Height = 133
        Align = alClient
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 551
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'Events fired'
        TabOrder = 1
        DesignSize = (
          551
          23)
        object Label32: TLabel
          Left = 152
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
        object lLatEvent: TLabel
          Left = 178
          Top = 4
          Width = 104
          Height = 14
          AutoSize = False
        end
        object lLngEvent: TLabel
          Left = 314
          Top = 4
          Width = 104
          Height = 14
          AutoSize = False
        end
        object Label34: TLabel
          Left = 288
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
        object bClearLog: TButton
          Left = 472
          Top = 1
          Width = 75
          Height = 21
          Anchors = [akTop, akRight]
          Caption = 'Clear Log'
          TabOrder = 0
          OnClick = bClearLogClick
        end
      end
    end
    object wbWeb: TWebBrowser
      Left = 1
      Top = 1
      Width = 553
      Height = 425
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 0
      ControlData = {
        4C00000027390000ED2B00000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        00000000000000000100000000000000000000000000000000000000}
    end
  end
  object pOptions: TPageControl
    Left = 558
    Top = 0
    Width = 273
    Height = 585
    ActivePage = TabSheet2
    Align = alRight
    TabOrder = 2
    OnChange = pOptionsChange
    object TabSheet6: TTabSheet
      Caption = 'General'
      object Panel17: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 556
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        Color = 16767931
        ParentBackground = False
        TabOrder = 0
        object GroupBox7: TGroupBox
          Left = 6
          Top = 17
          Width = 230
          Height = 224
          Caption = ' General configuration '
          TabOrder = 0
          object Label33: TLabel
            Left = 24
            Top = 72
            Width = 96
            Height = 14
            Caption = 'Interval Events (ms)'
          end
          object Label35: TLabel
            Left = 24
            Top = 112
            Width = 101
            Height = 14
            Caption = 'Language Messages'
          end
          object Label40: TLabel
            Left = 24
            Top = 184
            Width = 44
            Height = 14
            Caption = 'Precision'
          end
          object eInterval: TEdit
            Left = 126
            Top = 69
            Width = 65
            Height = 22
            TabOrder = 1
            Text = '0'
            OnChange = eIntervalChange
          end
          object cbLanguages: TComboBox
            Left = 24
            Top = 132
            Width = 121
            Height = 22
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 2
            Text = 'Espa'#241'ol'
            OnChange = cbLanguagesChange
            Items.Strings = (
              'Espa'#241'ol'
              'English')
          end
          object ePrecision: TSpinEdit
            Left = 74
            Top = 181
            Width = 63
            Height = 23
            MaxValue = 17
            MinValue = 0
            TabOrder = 3
            Value = 0
            OnChange = ePrecisionChange
          end
          object cbActive: TCheckBox
            Left = 24
            Top = 32
            Width = 97
            Height = 17
            Caption = 'Active'
            TabOrder = 0
            OnClick = cbActiveClick
          end
        end
        object bSave: TButton
          Left = 16
          Top = 312
          Width = 75
          Height = 25
          Caption = 'Save'
          TabOrder = 1
          OnClick = bSaveClick
        end
        object bPrint: TButton
          Left = 16
          Top = 280
          Width = 75
          Height = 25
          Caption = 'Print'
          TabOrder = 2
          OnClick = bPrintClick
        end
        object bPreview: TButton
          Left = 96
          Top = 280
          Width = 75
          Height = 25
          Caption = 'Preview'
          TabOrder = 3
          OnClick = bPreviewClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Config'
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 556
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        Color = 16767931
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          265
          556)
        object GroupBox1: TGroupBox
          Left = 6
          Top = 16
          Width = 250
          Height = 142
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Required Properties '
          TabOrder = 0
          DesignSize = (
            250
            142)
          object lLong: TLabel
            Left = 11
            Top = 29
            Width = 47
            Height = 14
            Caption = 'Longitude'
          end
          object lLat: TLabel
            Left = 11
            Top = 53
            Width = 38
            Height = 14
            Caption = 'Latitude'
          end
          object lTypMap: TLabel
            Left = 11
            Top = 77
            Width = 46
            Height = 14
            Caption = 'Map Type'
          end
          object lZoom: TLabel
            Left = 11
            Top = 104
            Width = 27
            Height = 14
            Caption = 'Zoom'
          end
          object eReqLng: TEdit
            Left = 66
            Top = 26
            Width = 170
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = '2,122715'
          end
          object eReqLat: TEdit
            Left = 66
            Top = 50
            Width = 170
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Text = '41,380908'
          end
          object cbTypMap: TComboBox
            Left = 66
            Top = 77
            Width = 170
            Height = 22
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemIndex = 1
            TabOrder = 2
            Text = 'mtROADMAP'
            Items.Strings = (
              'mtHYBRID'
              'mtROADMAP'
              'mtSATELLITE'
              'mtTERRAIN')
          end
          object tbZoom: TTrackBar
            Left = 66
            Top = 102
            Width = 170
            Height = 27
            Anchors = [akLeft, akTop, akRight]
            Max = 20
            Min = 1
            Position = 12
            TabOrder = 3
          end
        end
        object GroupBox2: TGroupBox
          Left = 6
          Top = 164
          Width = 250
          Height = 164
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Non Visuals Properties '
          TabOrder = 1
          DesignSize = (
            250
            164)
          object Label7: TLabel
            Left = 16
            Top = 106
            Width = 50
            Height = 14
            Caption = 'Max Zoom'
          end
          object Label8: TLabel
            Left = 134
            Top = 106
            Width = 46
            Height = 14
            Caption = 'Min Zoom'
          end
          object cbZoomClick: TCheckBox
            Left = 16
            Top = 26
            Width = 224
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Disable double click zoom'
            TabOrder = 0
          end
          object cbDraggable: TCheckBox
            Left = 16
            Top = 49
            Width = 75
            Height = 17
            Caption = 'Draggable'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbKeyboard: TCheckBox
            Left = 103
            Top = 49
            Width = 141
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Keyboard Shortcuts'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object cbNoClear: TCheckBox
            Left = 16
            Top = 72
            Width = 75
            Height = 17
            Caption = 'No Clear'
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object eMaxZoom: TEdit
            Left = 16
            Top = 124
            Width = 90
            Height = 22
            TabOrder = 4
            Text = '0'
          end
          object eMinZoom: TEdit
            Left = 134
            Top = 124
            Width = 110
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 5
            Text = '0'
          end
          object cbWheel: TCheckBox
            Left = 103
            Top = 72
            Width = 133
            Height = 17
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Scroll Wheel'
            Checked = True
            State = cbChecked
            TabOrder = 6
          end
        end
        object GroupBox3: TGroupBox
          Left = 6
          Top = 339
          Width = 250
          Height = 201
          Anchors = [akLeft, akTop, akRight]
          Caption = ' Visuales Properties '
          TabOrder = 2
          object pPages: TPageControl
            Left = 2
            Top = 16
            Width = 246
            Height = 183
            ActivePage = tsGeneral
            Align = alClient
            MultiLine = True
            TabOrder = 0
            object tsGeneral: TTabSheet
              Caption = 'General'
              object Panel2: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label16: TLabel
                  Left = 24
                  Top = 40
                  Width = 86
                  Height = 14
                  Caption = 'Background Color'
                end
                object cbBGColor: TColorBox
                  Left = 24
                  Top = 67
                  Width = 225
                  Height = 22
                  DefaultColorColor = clBtnShadow
                  Selected = clBtnFace
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
              end
            end
            object tsMapType: TTabSheet
              Caption = 'MapType'
              ImageIndex = 1
              object Panel3: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label11: TLabel
                  Left = 27
                  Top = 87
                  Width = 37
                  Height = 14
                  Caption = 'Position'
                end
                object Label12: TLabel
                  Left = 27
                  Top = 114
                  Width = 24
                  Height = 14
                  Caption = 'Style'
                end
                object Label13: TLabel
                  Left = 27
                  Top = 29
                  Width = 37
                  Height = 14
                  Caption = 'Map Ids'
                end
                object cbShowMapType: TCheckBox
                  Left = 14
                  Top = 6
                  Width = 224
                  Height = 17
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Show Map Type Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cbMapTypePos: TComboBox
                  Left = 70
                  Top = 79
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 11
                  TabOrder = 1
                  Text = 'cpTOP_RIGHT'
                  Items.Strings = (
                    'cpBOTTOM_CENTER'
                    'cpBOTTOM_LEFT'
                    'cpBOTTOM_RIGHT'
                    'cpLEFT_BOTTOM'
                    'cpLEFT_CENTER'
                    'cpLEFT_TOP'
                    'cpRIGHT_BOTTOM'
                    'cpRIGHT_CENTER'
                    'cpRIGHT_TOP'
                    'cpTOP_CENTER'
                    'cpTOP_LEFT'
                    'cpTOP_RIGHT')
                end
                object cbMapTypeStyle: TComboBox
                  Left = 70
                  Top = 106
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 0
                  TabOrder = 2
                  Text = 'mtcDEFAULT'
                  Items.Strings = (
                    'mtcDEFAULT'
                    'mtcDROPDOWN_MENU'
                    'mtcHORIZONTAL_BAR')
                end
                object cbMapType: TCheckListBox
                  Left = 70
                  Top = 29
                  Width = 160
                  Height = 41
                  Anchors = [akLeft, akTop, akRight]
                  ItemHeight = 14
                  Items.Strings = (
                    'mtHYBRID'
                    'mtROADMAP'
                    'mtSATELLITE'
                    'mtTERRAIN')
                  TabOrder = 3
                end
              end
            end
            object tsOverview: TTabSheet
              Caption = 'Overview'
              ImageIndex = 2
              object Panel4: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object cbShowOver: TCheckBox
                  Left = 27
                  Top = 25
                  Width = 177
                  Height = 17
                  Caption = 'Show Overview Map Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cbOverOpened: TCheckBox
                  Left = 70
                  Top = 58
                  Width = 122
                  Height = 17
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Opened'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
              end
            end
            object tsPan: TTabSheet
              Caption = 'Pan'
              ImageIndex = 3
              object Panel5: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label18: TLabel
                  Left = 27
                  Top = 85
                  Width = 37
                  Height = 14
                  Caption = 'Position'
                end
                object cbShowPan: TCheckBox
                  Left = 27
                  Top = 29
                  Width = 177
                  Height = 17
                  Caption = 'Show Pan Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cbPanPos: TComboBox
                  Left = 70
                  Top = 77
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 10
                  TabOrder = 1
                  Text = 'cpTOP_LEFT'
                  Items.Strings = (
                    'cpBOTTOM_CENTER'
                    'cpBOTTOM_LEFT'
                    'cpBOTTOM_RIGHT'
                    'cpLEFT_BOTTOM'
                    'cpLEFT_CENTER'
                    'cpLEFT_TOP'
                    'cpRIGHT_BOTTOM'
                    'cpRIGHT_CENTER'
                    'cpRIGHT_TOP'
                    'cpTOP_CENTER'
                    'cpTOP_LEFT'
                    'cpTOP_RIGHT')
                end
              end
            end
            object tsRotate: TTabSheet
              Caption = 'Rotate'
              ImageIndex = 4
              object Panel6: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label17: TLabel
                  Left = 27
                  Top = 85
                  Width = 37
                  Height = 14
                  Caption = 'Position'
                end
                object cbRoratePos: TComboBox
                  Left = 70
                  Top = 77
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 10
                  TabOrder = 0
                  Text = 'cpTOP_LEFT'
                  Items.Strings = (
                    'cpBOTTOM_CENTER'
                    'cpBOTTOM_LEFT'
                    'cpBOTTOM_RIGHT'
                    'cpLEFT_BOTTOM'
                    'cpLEFT_CENTER'
                    'cpLEFT_TOP'
                    'cpRIGHT_BOTTOM'
                    'cpRIGHT_CENTER'
                    'cpRIGHT_TOP'
                    'cpTOP_CENTER'
                    'cpTOP_LEFT'
                    'cpTOP_RIGHT')
                end
                object cbShowRotate: TCheckBox
                  Left = 27
                  Top = 29
                  Width = 177
                  Height = 17
                  Caption = 'Show Rotate Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
              end
            end
            object tsScale: TTabSheet
              Caption = 'Scale'
              ImageIndex = 5
              object Panel7: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label19: TLabel
                  Left = 27
                  Top = 71
                  Width = 37
                  Height = 14
                  Caption = 'Position'
                end
                object Label20: TLabel
                  Left = 27
                  Top = 98
                  Width = 24
                  Height = 14
                  Caption = 'Style'
                end
                object cbShowScale: TCheckBox
                  Left = 14
                  Top = 22
                  Width = 224
                  Height = 17
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Show Scale Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object cbScalePos: TComboBox
                  Left = 70
                  Top = 63
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 1
                  TabOrder = 1
                  Text = 'cpBOTTOM_LEFT'
                  Items.Strings = (
                    'cpBOTTOM_CENTER'
                    'cpBOTTOM_LEFT'
                    'cpBOTTOM_RIGHT'
                    'cpLEFT_BOTTOM'
                    'cpLEFT_CENTER'
                    'cpLEFT_TOP'
                    'cpRIGHT_BOTTOM'
                    'cpRIGHT_CENTER'
                    'cpRIGHT_TOP'
                    'cpTOP_CENTER'
                    'cpTOP_LEFT'
                    'cpTOP_RIGHT')
                end
                object cbScaleStyle: TComboBox
                  Left = 70
                  Top = 90
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 0
                  TabOrder = 2
                  Text = 'scDEFAULT'
                  Items.Strings = (
                    'scDEFAULT')
                end
              end
            end
            object tsStreetView: TTabSheet
              Caption = 'StreetView'
              ImageIndex = 6
              object Panel8: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label21: TLabel
                  Left = 27
                  Top = 85
                  Width = 37
                  Height = 14
                  Caption = 'Position'
                end
                object cbStreetViewPos: TComboBox
                  Left = 70
                  Top = 77
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 10
                  TabOrder = 0
                  Text = 'cpTOP_LEFT'
                  Items.Strings = (
                    'cpBOTTOM_CENTER'
                    'cpBOTTOM_LEFT'
                    'cpBOTTOM_RIGHT'
                    'cpLEFT_BOTTOM'
                    'cpLEFT_CENTER'
                    'cpLEFT_TOP'
                    'cpRIGHT_BOTTOM'
                    'cpRIGHT_CENTER'
                    'cpRIGHT_TOP'
                    'cpTOP_CENTER'
                    'cpTOP_LEFT'
                    'cpTOP_RIGHT')
                end
                object cbShowStreetView: TCheckBox
                  Left = 27
                  Top = 29
                  Width = 177
                  Height = 17
                  Caption = 'Show StreetView Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
              end
            end
            object tsZoom: TTabSheet
              Caption = 'Zoom'
              ImageIndex = 7
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 238
                Height = 135
                Align = alClient
                BevelOuter = bvNone
                Caption = ' '
                Color = 16767931
                Ctl3D = True
                ParentBackground = False
                ParentCtl3D = False
                TabOrder = 0
                DesignSize = (
                  238
                  135)
                object Label9: TLabel
                  Left = 27
                  Top = 71
                  Width = 37
                  Height = 14
                  Caption = 'Position'
                end
                object Label10: TLabel
                  Left = 27
                  Top = 98
                  Width = 24
                  Height = 14
                  Caption = 'Style'
                end
                object cbZoomPos: TComboBox
                  Left = 70
                  Top = 63
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 10
                  TabOrder = 0
                  Text = 'cpTOP_LEFT'
                  Items.Strings = (
                    'cpBOTTOM_CENTER'
                    'cpBOTTOM_LEFT'
                    'cpBOTTOM_RIGHT'
                    'cpLEFT_BOTTOM'
                    'cpLEFT_CENTER'
                    'cpLEFT_TOP'
                    'cpRIGHT_BOTTOM'
                    'cpRIGHT_CENTER'
                    'cpRIGHT_TOP'
                    'cpTOP_CENTER'
                    'cpTOP_LEFT'
                    'cpTOP_RIGHT')
                end
                object cbZoomStyle: TComboBox
                  Left = 70
                  Top = 90
                  Width = 160
                  Height = 22
                  Style = csDropDownList
                  Anchors = [akLeft, akTop, akRight]
                  ItemIndex = 0
                  TabOrder = 1
                  Text = 'zcDEFAULT'
                  Items.Strings = (
                    'zcDEFAULT'
                    'zcLARGE'
                    'zcSMALL')
                end
                object cbShowZoom: TCheckBox
                  Left = 14
                  Top = 22
                  Width = 224
                  Height = 17
                  Anchors = [akLeft, akTop, akRight]
                  Caption = 'Show Zoom Control'
                  Checked = True
                  State = cbChecked
                  TabOrder = 2
                end
              end
            end
          end
        end
        object bDoWeb: TButton
          Left = 181
          Top = 528
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Do Map'
          TabOrder = 3
          OnClick = bDoWebClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'LatLngBounds'
      ImageIndex = 1
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 556
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        Color = 16767931
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          265
          556)
        object Label22: TLabel
          Left = 6
          Top = 272
          Width = 272
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Write or Read LatLngBounds into/from LatLngBounds GroupBox'
          WordWrap = True
          ExplicitWidth = 233
        end
        object Label23: TLabel
          Left = 6
          Top = 344
          Width = 272
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 
            'Read LatLng GroupBox and write the LatLngBounds result into LatL' +
            'ngBounds GroupBox'
          WordWrap = True
          ExplicitWidth = 233
        end
        object Label24: TLabel
          Left = 6
          Top = 416
          Width = 272
          Height = 26
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Write or Read LatLng into/from LatLng GroupBox'
          WordWrap = True
          ExplicitWidth = 233
        end
        object Label25: TLabel
          Left = 8
          Top = 488
          Width = 270
          Height = 12
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'ShowMessage with the information'
          WordWrap = True
          ExplicitWidth = 231
        end
        object gbB1: TGroupBox
          Left = 8
          Top = 8
          Width = 231
          Height = 169
          Caption = ' LatLngBounds'
          TabOrder = 0
          object Label1: TLabel
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
          object Label2: TLabel
            Left = 32
            Top = 35
            Width = 32
            Height = 14
            Caption = 'Latitud'
          end
          object Label3: TLabel
            Left = 32
            Top = 62
            Width = 41
            Height = 14
            Caption = 'Longitud'
          end
          object Label4: TLabel
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
          object Label5: TLabel
            Left = 31
            Top = 115
            Width = 32
            Height = 14
            Caption = 'Latitud'
          end
          object Label6: TLabel
            Left = 31
            Top = 142
            Width = 41
            Height = 14
            Caption = 'Longitud'
          end
          object eLatASW: TEdit
            Left = 80
            Top = 32
            Width = 121
            Height = 22
            TabOrder = 0
            Text = '41,380785'
          end
          object eLngASW: TEdit
            Left = 79
            Top = 59
            Width = 121
            Height = 22
            TabOrder = 1
            Text = '2,122868'
          end
          object eLatANE: TEdit
            Left = 79
            Top = 112
            Width = 121
            Height = 22
            TabOrder = 2
            Text = '41,403149'
          end
          object eLngANE: TEdit
            Left = 78
            Top = 139
            Width = 121
            Height = 22
            TabOrder = 3
            Text = '2,173822'
          end
        end
        object gbLatLng: TGroupBox
          Left = 6
          Top = 183
          Width = 233
          Height = 84
          Caption = ' LatLng '
          TabOrder = 1
          object Label14: TLabel
            Left = 32
            Top = 27
            Width = 32
            Height = 14
            Caption = 'Latitud'
          end
          object Label15: TLabel
            Left = 32
            Top = 54
            Width = 41
            Height = 14
            Caption = 'Longitud'
          end
          object eLat: TEdit
            Left = 80
            Top = 24
            Width = 121
            Height = 22
            TabOrder = 0
            Text = '41,380785'
          end
          object eLng: TEdit
            Left = 79
            Top = 51
            Width = 121
            Height = 22
            TabOrder = 1
            Text = '2,122868'
          end
        end
        object Button1: TButton
          Left = 2
          Top = 304
          Width = 75
          Height = 25
          Caption = 'Get Bounds'
          TabOrder = 2
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 83
          Top = 304
          Width = 75
          Height = 25
          Caption = 'Set Bounds'
          TabOrder = 3
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 164
          Top = 304
          Width = 75
          Height = 25
          Caption = 'Contains'
          TabOrder = 4
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 6
          Top = 376
          Width = 75
          Height = 25
          Caption = 'Extend'
          TabOrder = 5
          OnClick = Button4Click
        end
        object Button5: TButton
          Left = 6
          Top = 448
          Width = 75
          Height = 25
          Caption = 'GetCenter'
          TabOrder = 6
          OnClick = Button5Click
        end
        object Button6: TButton
          Left = 87
          Top = 448
          Width = 75
          Height = 25
          Caption = 'ToSpan'
          TabOrder = 7
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 6
          Top = 506
          Width = 75
          Height = 25
          Caption = 'ToString'
          TabOrder = 8
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 87
          Top = 506
          Width = 75
          Height = 25
          Caption = 'ToUrlValue'
          TabOrder = 9
          OnClick = Button8Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Methods'
      ImageIndex = 2
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 556
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        Color = 16767931
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          265
          556)
        object Label29: TLabel
          Left = 6
          Top = 201
          Width = 51
          Height = 14
          Caption = 'MapTypeId'
        end
        object Label28: TLabel
          Left = 6
          Top = 224
          Width = 27
          Height = 14
          Caption = 'Zoom'
        end
        object GroupBox4: TGroupBox
          Left = 6
          Top = 15
          Width = 253
          Height = 84
          Anchors = [akLeft, akTop, akRight]
          Caption = ' LatLng '
          TabOrder = 0
          DesignSize = (
            253
            84)
          object Label26: TLabel
            Left = 32
            Top = 27
            Width = 32
            Height = 14
            Caption = 'Latitud'
          end
          object Label27: TLabel
            Left = 32
            Top = 54
            Width = 41
            Height = 14
            Caption = 'Longitud'
          end
          object eLatMethod: TEdit
            Left = 80
            Top = 24
            Width = 141
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            Text = '41,380785'
          end
          object eLngMethod: TEdit
            Left = 79
            Top = 51
            Width = 141
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Text = '2,122868'
          end
        end
        object Button9: TButton
          Left = 6
          Top = 105
          Width = 75
          Height = 25
          Caption = 'Get Center'
          TabOrder = 1
          OnClick = Button9Click
        end
        object Button12: TButton
          Left = 85
          Top = 105
          Width = 75
          Height = 25
          Caption = 'Set Center'
          TabOrder = 2
          OnClick = Button12Click
        end
        object Button16: TButton
          Left = 164
          Top = 105
          Width = 75
          Height = 25
          Caption = 'PanTo'
          TabOrder = 3
          OnClick = Button16Click
        end
        object tbZoomMet: TTrackBar
          Left = 65
          Top = 222
          Width = 117
          Height = 27
          Anchors = [akLeft, akTop, akRight]
          Max = 20
          Min = 1
          Position = 10
          TabOrder = 4
        end
        object cbMapTypeMet: TComboBox
          Left = 65
          Top = 193
          Width = 116
          Height = 22
          Style = csDropDownList
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 5
          Text = 'mtHYBRID'
          Items.Strings = (
            'mtHYBRID'
            'mtROADMAP'
            'mtSATELLITE'
            'mtTERRAIN')
        end
        object Button11: TButton
          Left = 189
          Top = 191
          Width = 32
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Get'
          TabOrder = 6
          OnClick = Button11Click
        end
        object Button10: TButton
          Left = 227
          Top = 191
          Width = 32
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Set'
          TabOrder = 7
          OnClick = Button10Click
        end
        object Button14: TButton
          Left = 227
          Top = 222
          Width = 32
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Set'
          TabOrder = 8
          OnClick = Button14Click
        end
        object Button13: TButton
          Left = 189
          Top = 222
          Width = 32
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Get'
          TabOrder = 9
          OnClick = Button13Click
        end
        object GroupBox5: TGroupBox
          Left = 6
          Top = 263
          Width = 253
          Height = 58
          Anchors = [akLeft, akTop, akRight]
          Caption = ' x and y '
          TabOrder = 10
          DesignSize = (
            253
            58)
          object Label30: TLabel
            Left = 40
            Top = 27
            Width = 7
            Height = 14
            Caption = 'X'
          end
          object Label31: TLabel
            Left = 128
            Top = 27
            Width = 8
            Height = 14
            Caption = 'Y'
          end
          object eXMet: TEdit
            Left = 52
            Top = 24
            Width = 53
            Height = 22
            TabOrder = 0
            Text = '5'
          end
          object eYMet: TEdit
            Left = 140
            Top = 24
            Width = 73
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            Text = '5'
          end
        end
        object Button15: TButton
          Left = 6
          Top = 327
          Width = 75
          Height = 25
          Caption = 'PanBy'
          TabOrder = 11
          OnClick = Button15Click
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Events'
      ImageIndex = 3
      object Panel15: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 556
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        Color = 16767931
        ParentBackground = False
        TabOrder = 0
        object GroupBox6: TGroupBox
          Left = 6
          Top = 17
          Width = 230
          Height = 352
          Caption = ' Events to fire '
          TabOrder = 0
          object cbBoundsChanged: TCheckBox
            Left = 16
            Top = 32
            Width = 185
            Height = 17
            Caption = 'OnBoundsChanged'
            TabOrder = 0
            OnClick = cbBoundsChangedClick
          end
          object cbCenterChanged: TCheckBox
            Left = 16
            Top = 55
            Width = 185
            Height = 17
            Caption = 'OnCenterChanged'
            TabOrder = 1
            OnClick = cbCenterChangedClick
          end
          object cbDblClick: TCheckBox
            Left = 16
            Top = 103
            Width = 185
            Height = 17
            Caption = 'OnDblClick'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = cbDblClickClick
          end
          object cbClick: TCheckBox
            Left = 16
            Top = 80
            Width = 185
            Height = 17
            Caption = 'OnClick'
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = cbClickClick
          end
          object cbMapTypeIdChanged: TCheckBox
            Left = 16
            Top = 199
            Width = 185
            Height = 17
            Caption = 'OnMapTypeIdChanged'
            Checked = True
            State = cbChecked
            TabOrder = 7
            OnClick = cbMapTypeIdChangedClick
          end
          object cbDragStart: TCheckBox
            Left = 16
            Top = 176
            Width = 185
            Height = 17
            Caption = 'OnDragStart'
            TabOrder = 6
            OnClick = cbDragStartClick
          end
          object cbDragEnd: TCheckBox
            Left = 16
            Top = 151
            Width = 185
            Height = 17
            Caption = 'OnDragEnd'
            Checked = True
            State = cbChecked
            TabOrder = 5
            OnClick = cbDragEndClick
          end
          object cbDrag: TCheckBox
            Left = 16
            Top = 128
            Width = 185
            Height = 17
            Caption = 'OnDrag'
            TabOrder = 4
            OnClick = cbDragClick
          end
          object cbZoomChanged: TCheckBox
            Left = 16
            Top = 319
            Width = 185
            Height = 17
            Caption = 'OnZoomChanged'
            Checked = True
            State = cbChecked
            TabOrder = 12
            OnClick = cbZoomChangedClick
          end
          object cbRightClick: TCheckBox
            Left = 16
            Top = 296
            Width = 185
            Height = 17
            Caption = 'OnRightClick'
            Checked = True
            State = cbChecked
            TabOrder = 11
            OnClick = cbRightClickClick
          end
          object cbMouseOver: TCheckBox
            Left = 16
            Top = 271
            Width = 185
            Height = 17
            Caption = 'OnMouseOver'
            Checked = True
            State = cbChecked
            TabOrder = 10
            OnClick = cbMouseOverClick
          end
          object cbMouseOut: TCheckBox
            Left = 16
            Top = 248
            Width = 185
            Height = 17
            Caption = 'OnMouseOut'
            Checked = True
            State = cbChecked
            TabOrder = 9
            OnClick = cbMouseOutClick
          end
          object cbMouseMove: TCheckBox
            Left = 16
            Top = 223
            Width = 185
            Height = 17
            Caption = 'OnMouseMove'
            TabOrder = 8
            OnClick = cbMouseMoveClick
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'InfoWindow'
      ImageIndex = 4
      object Panel16: TPanel
        Left = 0
        Top = 0
        Width = 265
        Height = 556
        Align = alClient
        BevelOuter = bvNone
        Caption = ' '
        Color = 16767931
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          265
          556)
        object Label36: TLabel
          Left = 19
          Top = 224
          Width = 47
          Height = 14
          Caption = 'Longitude'
        end
        object Label37: TLabel
          Left = 19
          Top = 200
          Width = 38
          Height = 14
          Caption = 'Latitude'
        end
        object Label39: TLabel
          Left = 19
          Top = 312
          Width = 33
          Height = 14
          Caption = 'ZIndex'
        end
        object lZIndex: TLabel
          Left = 72
          Top = 312
          Width = 44
          Height = 14
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label41: TLabel
          Left = 19
          Top = 90
          Width = 50
          Height = 14
          Caption = 'Max Width'
        end
        object Label42: TLabel
          Left = 19
          Top = 144
          Width = 30
          Height = 14
          Caption = 'Height'
        end
        object Label43: TLabel
          Left = 19
          Top = 168
          Width = 27
          Height = 14
          Caption = 'Width'
        end
        object Label44: TLabel
          Left = 19
          Top = 124
          Width = 56
          Height = 14
          Caption = 'Pixel Offset'
        end
        object Label38: TLabel
          Left = 19
          Top = 256
          Width = 67
          Height = 14
          Caption = 'HTML Content'
        end
        object cbCloseOtherBeforeOpen: TCheckBox
          Left = 16
          Top = 41
          Width = 189
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Close Other Before Open'
          TabOrder = 1
        end
        object cbDisableAutoPan: TCheckBox
          Left = 16
          Top = 64
          Width = 189
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Disable AutoPan'
          TabOrder = 2
        end
        object eInfoWinLat: TEdit
          Left = 72
          Top = 197
          Width = 134
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Text = '0'
        end
        object eInfoWinLng: TEdit
          Left = 72
          Top = 221
          Width = 134
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          Text = '0'
        end
        object bAddInfoWin: TBitBtn
          Left = 16
          Top = 364
          Width = 75
          Height = 25
          Caption = 'Add/Edit'
          TabOrder = 6
          OnClick = bAddInfoWinClick
        end
        object bDelInfoWin: TBitBtn
          Left = 106
          Top = 364
          Width = 75
          Height = 25
          Caption = 'Del'
          TabOrder = 7
          OnClick = bDelInfoWinClick
        end
        object lbInfoWindows: TListBox
          Left = 16
          Top = 395
          Width = 184
          Height = 113
          Anchors = [akLeft, akTop, akRight, akBottom]
          ItemHeight = 14
          TabOrder = 8
          OnClick = lbInfoWindowsClick
        end
        object bUp: TButton
          Left = 206
          Top = 424
          Width = 40
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Up'
          TabOrder = 9
          OnClick = bUpClick
        end
        object bDown: TButton
          Left = 206
          Top = 472
          Width = 40
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'Down'
          TabOrder = 10
          OnClick = bDownClick
        end
        object bNewMarker: TButton
          Left = 192
          Top = 16
          Width = 52
          Height = 25
          Anchors = [akTop, akRight]
          Caption = 'New'
          TabOrder = 11
          OnClick = bNewMarkerClick
        end
        object bCenterInfoWin: TButton
          Left = 16
          Top = 514
          Width = 89
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Center at InfoWin'
          TabOrder = 12
          OnClick = bCenterInfoWinClick
        end
        object eMaxWidth: TEdit
          Left = 72
          Top = 87
          Width = 74
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Text = '0'
        end
        object eWidth: TEdit
          Left = 72
          Top = 165
          Width = 74
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 13
          Text = '0'
        end
        object eHeight: TEdit
          Left = 72
          Top = 141
          Width = 74
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 14
          Text = '0'
        end
        object mHTMLContent: TMemo
          Left = 16
          Top = 272
          Width = 206
          Height = 84
          TabOrder = 15
        end
        object bOpenClose: TButton
          Left = 133
          Top = 514
          Width = 89
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Open/Close'
          TabOrder = 16
          OnClick = bOpenCloseClick
        end
        object cbAutoOpen: TCheckBox
          Left = 16
          Top = 17
          Width = 170
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = 'AutoOpen'
          TabOrder = 0
        end
      end
    end
  end
  object GMMap1: TGMMap
    Language = Espanol
    Active = True
    RequiredProp.MapType = mtHYBRID
    RequiredProp.Zoom = 12
    NonVisualProp.Options = [Draggable, KeyboardShortcuts, NoClear]
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
    VisualProp.BGColor = 15659247
    WebBrowser = wbWeb
    Left = 264
    Top = 216
  end
  object GMInfoWindow1: TGMInfoWindow
    Language = Espanol
    Map = GMMap1
    OnCloseClick = GMInfoWindow1CloseClick
    OnHTMLContentChange = GMInfoWindow1HTMLContentChange
    OnDisableAutoPanChange = GMInfoWindow1DisableAutoPanChange
    OnMaxWidthChange = GMInfoWindow1MaxWidthChange
    OnCloseOtherBeforeOpenChange = GMInfoWindow1CloseOtherBeforeOpenChange
    VisualObjects = <
      item
        HTMLContent = '<h3>Camp Nou</h3>'
        DisableAutoPan = True
        MaxWidth = 0
        CloseOtherBeforeOpen = False
        Position.Lat = 41.380866000000000000
        Position.Lng = 2.122579000000000000
        AutoOpen = True
      end
      item
        HTMLContent = '<h3>Templo Expiatorio de la Sagrada Familia</h3>'
        DisableAutoPan = True
        MaxWidth = 0
        CloseOtherBeforeOpen = False
        Position.Lat = 41.403185000000000000
        Position.Lng = 2.173725000000000000
        AutoOpen = True
      end
      item
        HTMLContent = 'another'
        DisableAutoPan = True
        MaxWidth = 0
        CloseOtherBeforeOpen = False
        Position.Lat = 41.300866000000000000
        Position.Lng = 2.222579000000000000
        AutoOpen = True
      end
      item
        HTMLContent = 'moooooore'
        DisableAutoPan = True
        MaxWidth = 0
        CloseOtherBeforeOpen = False
        Position.Lat = 41.453185000000000000
        Position.Lng = 2.103725000000000000
        AutoOpen = True
      end>
    OnPositionChange = GMInfoWindow1PositionChange
    Left = 352
    Top = 216
  end
  object GMMarker1: TGMMarker
    VisualObjects = <>
    Left = 408
    Top = 304
  end
end
