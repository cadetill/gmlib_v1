object DirectionsFrm: TDirectionsFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Direction'
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
  object pcData: TPageControl
    Left = 0
    Top = 0
    Width = 564
    Height = 393
    ActivePage = tsRequest
    Align = alClient
    TabOrder = 0
    object tsDirection: TTabSheet
      Caption = 'Direction'
      object cbAutoShow: TCheckBox
        Left = 56
        Top = 72
        Width = 97
        Height = 17
        Caption = 'AutoShow'
        TabOrder = 0
        OnClick = cbAutoShowClick
      end
      object cbDeleteOthers: TCheckBox
        Left = 56
        Top = 112
        Width = 97
        Height = 17
        Caption = 'HiddeOthers'
        TabOrder = 1
        OnClick = cbDeleteOthersClick
      end
      object bSearch: TButton
        Left = 56
        Top = 304
        Width = 97
        Height = 25
        Caption = 'Search Direction'
        TabOrder = 2
        OnClick = bSearchClick
      end
    end
    object tsRequest: TTabSheet
      Caption = 'Request Opt.'
      ImageIndex = 2
      object Label5: TLabel
        Left = 16
        Top = 256
        Width = 33
        Height = 13
        Caption = 'Region'
      end
      object Label6: TLabel
        Left = 16
        Top = 304
        Width = 56
        Height = 13
        Caption = 'TravelMode'
      end
      object Label7: TLabel
        Left = 136
        Top = 304
        Width = 54
        Height = 13
        Caption = 'UnitSystem'
      end
      object Label8: TLabel
        Left = 344
        Top = 55
        Width = 51
        Height = 13
        Caption = 'Waypoints'
      end
      object Label9: TLabel
        Left = 312
        Top = 256
        Width = 79
        Height = 13
        Caption = 'Arrival DateTime'
      end
      object Label10: TLabel
        Left = 312
        Top = 304
        Width = 99
        Height = 13
        Caption = 'Departurel DateTime'
      end
      object cbAvoidTolls: TCheckBox
        Left = 136
        Top = 24
        Width = 82
        Height = 17
        Caption = 'AvoidTolls'
        TabOrder = 0
        OnClick = cbAvoidTollsClick
      end
      object cbAvoidHighways: TCheckBox
        Left = 16
        Top = 24
        Width = 97
        Height = 17
        Caption = 'AvoidHighways'
        TabOrder = 1
        OnClick = cbAvoidHighwaysClick
      end
      object cbProvideRouteAlt: TCheckBox
        Left = 406
        Top = 24
        Width = 105
        Height = 17
        Caption = 'ProvideRouteAlt'
        TabOrder = 2
        OnClick = cbProvideRouteAltClick
      end
      object cbOptimizeWaypoints: TCheckBox
        Left = 247
        Top = 24
        Width = 113
        Height = 17
        Caption = 'OptimizeWaypoints'
        TabOrder = 3
        OnClick = cbOptimizeWaypointsClick
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 55
        Width = 304
        Height = 89
        Caption = ' Origin '
        TabOrder = 4
        object Label1: TLabel
          Left = 16
          Top = 27
          Width = 39
          Height = 13
          Caption = 'Address'
        end
        object Label37: TLabel
          Left = 16
          Top = 58
          Width = 15
          Height = 13
          Caption = 'Lat'
        end
        object Label36: TLabel
          Left = 159
          Top = 58
          Width = 17
          Height = 13
          Caption = 'Lng'
        end
        object eOAddress: TEdit
          Left = 61
          Top = 24
          Width = 231
          Height = 21
          TabOrder = 0
          OnChange = eOAddressChange
        end
        object eOLat: TEdit
          Left = 37
          Top = 55
          Width = 110
          Height = 21
          TabOrder = 1
          Text = '0'
          OnChange = eOLatChange
        end
        object eOLng: TEdit
          Left = 182
          Top = 55
          Width = 110
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = eOLngChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 16
        Top = 159
        Width = 304
        Height = 89
        Caption = ' Destination '
        TabOrder = 5
        object Label2: TLabel
          Left = 16
          Top = 27
          Width = 39
          Height = 13
          Caption = 'Address'
        end
        object Label3: TLabel
          Left = 18
          Top = 58
          Width = 15
          Height = 13
          Caption = 'Lat'
        end
        object Label4: TLabel
          Left = 159
          Top = 58
          Width = 17
          Height = 13
          Caption = 'Lng'
        end
        object eDAddress: TEdit
          Left = 61
          Top = 24
          Width = 231
          Height = 21
          TabOrder = 0
          OnChange = eDAddressChange
        end
        object eDLat: TEdit
          Left = 37
          Top = 55
          Width = 110
          Height = 21
          TabOrder = 1
          Text = '0'
          OnChange = eDLatChange
        end
        object eDLng: TEdit
          Left = 182
          Top = 55
          Width = 110
          Height = 21
          TabOrder = 2
          Text = '0'
          OnChange = eDLngChange
        end
      end
      object cbRegion: TComboBox
        Left = 16
        Top = 275
        Width = 229
        Height = 21
        Style = csDropDownList
        DropDownCount = 15
        ItemIndex = 0
        TabOrder = 6
        Text = 'r_NO_REGION'
        OnChange = cbRegionChange
        Items.Strings = (
          'r_NO_REGION'
          'rAFGHANISTAN'
          'rALAND'
          'rALBANIA'
          'rALGERIA'
          'rAMERICAN_SAMOA'
          'rANDORRA'
          'rANGOLA'
          'rANGUILLA'
          'rANTARCTICA'
          'rANTIGUA_AND_BARBUDA'
          'rARGENTINA'
          'rARMENIA'
          'rARUBA'
          'rASCENSION_ISLAND'
          'rAUSTRALIA'
          'rAUSTRIA'
          'rAZERBAIJAN'
          'rBAHAMAS'
          'rBAHRAIN'
          'rBANGLADESH'
          'rBARBADOS'
          'rBELARUS'
          'rBELGIUM'
          'rBELIZE'
          'rBENIN'
          'rBERMUDA'
          'rBHUTAN'
          'rBOLIVIA'
          'rBOSNIA_AND_HERZEGOVINA'
          'rBOTSWANA'
          'rBRAZIL'
          'rBRITISH_INDIAN_OCEAN_TERRITORY'
          'rBRITISH_VIRGIN_ISLANDS'
          'rBRUNEI'
          'rBULGARIA'
          'rBURKINA_FASO'
          'rBURUNDI'
          'rCAMBODIA'
          'rCAMEROON'
          'rCANADA'
          'rCAPE_VERDE'
          'rCAYMAN_ISLANDS'
          'rCENTRAL_AFRICAN_REPUBLIC'
          'rCHAD'
          'rCHILE'
          'rCHRISTMAS_ISLAND'
          'rCOCOS_KEELING_ISLANDS'
          'rCOLOMBIA'
          'rCOMOROS'
          'rCOOK_ISLANDS'
          'rCOSTA_RICA'
          'rCOTE_D_IVOIRE'
          'rCROATIA'
          'rCUBA'
          'rCYPRUS'
          'rCZECH_REPUBLIC'
          'rDEMOCRATIC_PEOPLE_S_REPUBLIC_OF_KOREA'
          'rDEMOCRATIC_REPUBLIC_OF_THE_CONGO'
          'rDENMARK'
          'rDJIBOUTI'
          'rDOMINICA'
          'rDOMINICAN_REPUBLIC'
          'rEAST_TIMOR'
          'rECUADOR'
          'rEGYPT'
          'rEL_SALVADOR'
          'rEQUATORIAL_GUINEA'
          'rERITREA'
          'rESTONIA'
          'rETHIOPIA'
          'rEUROPEAN_UNION'
          'rFALKLAND_ISLANDS'
          'rFAROE_ISLANDS'
          'rFEDERATED_STATES_OF_MICRONESIA'
          'rFIJI'
          'rFINLAND'
          'rFRANCE'
          'rFRENCH_GUIANA'
          'rFRENCH_POLYNESIA'
          'rFRENCH_SOUTHERN_AND_ANTARCTIC_LANDS'
          'rGABON'
          'rGEORGIA'
          'rGERMANY'
          'rGHANA'
          'rGIBRALTAR'
          'rGREECE'
          'rGREENLAND'
          'rGRENADA'
          'rGUADELOUPE'
          'rGUAM'
          'rGUATEMALA'
          'rGUERNSEY'
          'rGUINEA'
          'rGUINEA_BISSAU'
          'rGUYANA'
          'rHAITI'
          'rHEARD_ISLAND_AND_MCDONALD_ISLANDS'
          'rHONDURAS'
          'rHONG_KONG'
          'rHUNGARY'
          'rICELAND'
          'rINDIA'
          'rINDONESIA'
          'rIRAN'
          'rIRAQ'
          'rISLE_OF_MAN'
          'rISRAEL'
          'rITALY'
          'rJAMAICA'
          'rJAPAN'
          'rJERSEY'
          'rJORDAN'
          'rKAZAKHSTAN'
          'rKENYA'
          'rKIRIBATI'
          'rKUWAIT'
          'rKYRGYZSTAN'
          'rLAOS'
          'rLATVIA'
          'rLEBANON'
          'rLESOTHO'
          'rLIBERIA'
          'rLIBYA'
          'rLIECHTENSTEIN'
          'rLITHUANIA'
          'rLUXEMBOURG'
          'rMACAU'
          'rMACEDONIA'
          'rMADAGASCAR'
          'rMALAWI'
          'rMALAYSIA'
          'rMALDIVES'
          'rMALI'
          'rMALTA'
          'rMARSHALL_ISLANDS'
          'rMARTINIQUE'
          'rMAURITANIA'
          'rMAURITIUS'
          'rMAYOTTE'
          'rMEXICO'
          'rMOLDOVA'
          'rMONACO'
          'rMONGOLIA'
          'rMONTENEGRO'
          'rMONTSERRAT'
          'rMOROCCO'
          'rMOZAMBIQUE'
          'rMYANMAR'
          'rNAMIBIA'
          'rNAURU'
          'rNEPAL'
          'rNETHERLANDS'
          'rNETHERLANDS_ANTILLES'
          'rNEW_CALEDONIA'
          'rNEW_ZEALAND'
          'rNICARAGUA'
          'rNIGER'
          'rNIGERIA'
          'rNIUE'
          'rNORFOLK_ISLAND'
          'rNORTHERN_MARIANA_ISLANDS'
          'rNORWAY'
          'rOMAN'
          'rPAKISTAN'
          'rPALAU'
          'rPALESTINIAN_TERRITORIES'
          'rPANAMA'
          'rPAPUA_NEW_GUINEA'
          'rPARAGUAY'
          'rPEOPLE_S_REPUBLIC_OF_CHINA'
          'rPERU'
          'rPHILIPPINES'
          'rPITCAIRN_ISLANDS'
          'rPOLAND'
          'rPORTUGAL'
          'rPUERTO_RICO'
          'rQATAR'
          'rREPUBLIC_OF_IRELAND_AND_NORTHERN_IRELAND'
          'rREPUBLIC_OF_KOREA'
          'rREPUBLIC_OF_THE_CONGO'
          'rREUNION'
          'rROMANIA'
          'rRUSSIA'
          'rRWANDA'
          'rSAINT_HELENA'
          'rSAINT_KITTS_AND_NEVIS'
          'rSAINT_LUCIA'
          'rSAINT_VINCENT_AND_THE_GRENADINES'
          'rSAINT_PIERRE_AND_MIQUELON'
          'rSAMOA'
          'rSAN_MARINO'
          'rSAO_TOME_AND_PRINCIPE'
          'rSAUDI_ARABIA'
          'rSENEGAL'
          'rSERBIA'
          'rSEYCHELLES'
          'rSIERRA_LEONE'
          'rSINGAPORE'
          'rSLOVAKIA'
          'rSLOVENIA'
          'rSOLOMON_ISLANDS'
          'rSOMALIA'
          'rSOUTH_AFRICA'
          'rSOUTH_GEORGIA_AND_THE_SOUTH_SANDWICH_ISLANDS'
          'rSOUTH_SUDAN'
          'rSPAIN'
          'rSRI_LANKA'
          'rSUDAN'
          'rSURINAME'
          'rSWAZILAND'
          'rSWEDEN'
          'rSWITZERLAND'
          'rSYRIA'
          'rTAIWAN'
          'rTAJIKISTAN'
          'rTANZANIA'
          'rTHAILAND'
          'rTHE_GAMBIA'
          'rTOGO'
          'rTOKELAU'
          'rTONGA'
          'rTRINIDAD_AND_TOBAGO'
          'rTUNISIA'
          'rTURKEY'
          'rTURKMENISTAN'
          'rTURKS_AND_CAICOS_ISLANDS'
          'rTUVALU'
          'rUGANDA'
          'rUKRAINE'
          'rUNITED_ARAB_EMIRATES'
          'rUNITED_KINGDOM'
          'rUNITED_STATES_OF_AMERICA'
          'rUNITED_STATES_VIRGIN_ISLANDS'
          'rURUGUAY'
          'rUZBEKISTAN'
          'rVANUATU'
          'rVATICAN_CITY'
          'rVENEZUELA'
          'rVIETNAM'
          'rWALLIS_AND_FUTUNA'
          'rWESTERN_SAHARA'
          'rYEMEN'
          'rZAMBIA'
          'rZIMBABWE')
      end
      object cbTravelMode: TComboBox
        Left = 16
        Top = 323
        Width = 100
        Height = 21
        Style = csDropDownList
        DropDownCount = 15
        ItemIndex = 1
        TabOrder = 7
        Text = 'tmDRIVING'
        OnChange = cbTravelModeChange
        Items.Strings = (
          'tmBICYCLING'
          'tmDRIVING'
          'tmTRANSIT'
          'tmWALKING')
      end
      object cbUnitSystem: TComboBox
        Left = 136
        Top = 323
        Width = 100
        Height = 21
        Style = csDropDownList
        DropDownCount = 15
        ItemIndex = 1
        TabOrder = 8
        Text = 'usMETRIC'
        OnChange = cbUnitSystemChange
        Items.Strings = (
          'usIMPERIAL'
          'usMETRIC')
      end
      object lbWaypoints: TListBox
        Left = 344
        Top = 74
        Width = 177
        Height = 174
        ItemHeight = 13
        TabOrder = 9
      end
      object eArrDate: TDateTimePicker
        Left = 312
        Top = 275
        Width = 97
        Height = 21
        Date = 41109.893627997680000000
        Time = 41109.893627997680000000
        TabOrder = 10
        OnChange = eArrDateChange
      end
      object eArrTime: TDateTimePicker
        Left = 424
        Top = 275
        Width = 97
        Height = 21
        Date = 41109.893627997680000000
        Time = 41109.893627997680000000
        Kind = dtkTime
        TabOrder = 11
        OnChange = eArrTimeChange
      end
      object eDepTime: TDateTimePicker
        Left = 424
        Top = 323
        Width = 97
        Height = 21
        Date = 41109.893627997680000000
        Time = 41109.893627997680000000
        Kind = dtkTime
        TabOrder = 12
        OnChange = eDepTimeChange
      end
      object eDepDate: TDateTimePicker
        Left = 312
        Top = 323
        Width = 97
        Height = 21
        Date = 41109.893627997680000000
        Time = 41109.893627997680000000
        TabOrder = 13
        OnChange = eDepDateChange
      end
      object bUp: TButton
        Left = 522
        Top = 74
        Width = 35
        Height = 25
        Caption = 'Up'
        TabOrder = 14
        OnClick = bUpClick
      end
      object bDown: TButton
        Left = 522
        Top = 106
        Width = 35
        Height = 25
        Caption = 'Down'
        TabOrder = 15
        OnClick = bDownClick
      end
      object bNew: TButton
        Left = 522
        Top = 191
        Width = 35
        Height = 25
        Caption = 'New'
        TabOrder = 16
        OnClick = bNewClick
      end
      object bDel: TButton
        Left = 522
        Top = 222
        Width = 35
        Height = 25
        Caption = 'Del'
        TabOrder = 17
        OnClick = bDelClick
      end
    end
    object tsRenderer: TTabSheet
      Caption = 'Renderer Opt.'
      ImageIndex = 3
      object cbDraggable: TCheckBox
        Left = 32
        Top = 40
        Width = 135
        Height = 17
        Caption = 'Draggable'
        TabOrder = 0
        OnClick = cbDraggableClick
      end
      object cbPreserveViewport: TCheckBox
        Left = 208
        Top = 40
        Width = 135
        Height = 17
        Caption = 'PreserveViewport'
        TabOrder = 1
        OnClick = cbPreserveViewportClick
      end
      object cbSuppressBicyclingLayer: TCheckBox
        Left = 375
        Top = 40
        Width = 135
        Height = 17
        Caption = 'SuppressBicyclingLayer'
        TabOrder = 2
        OnClick = cbSuppressBicyclingLayerClick
      end
      object cbSuppressInfoWindows: TCheckBox
        Left = 32
        Top = 63
        Width = 135
        Height = 17
        Caption = 'SuppressInfoWindows'
        TabOrder = 3
        OnClick = cbSuppressInfoWindowsClick
      end
      object cbSuppressMarkers: TCheckBox
        Left = 208
        Top = 63
        Width = 135
        Height = 17
        Caption = 'SuppressMarkers'
        TabOrder = 4
        OnClick = cbSuppressMarkersClick
      end
      object cbSuppressPolylines: TCheckBox
        Left = 375
        Top = 63
        Width = 135
        Height = 17
        Caption = 'SuppressPolylines'
        TabOrder = 5
        OnClick = cbSuppressPolylinesClick
      end
      object GroupBox3: TGroupBox
        Left = 32
        Top = 103
        Width = 478
        Height = 106
        Caption = ' MarkerOptions '
        TabOrder = 6
        object Label11: TLabel
          Left = 16
          Top = 35
          Width = 21
          Height = 13
          Caption = 'Icon'
        end
        object eIcon: TEdit
          Left = 43
          Top = 32
          Width = 406
          Height = 21
          TabOrder = 0
          OnChange = eIconChange
        end
        object cbMClickable: TCheckBox
          Left = 35
          Top = 72
          Width = 118
          Height = 17
          Caption = 'Clickable'
          TabOrder = 1
          OnClick = cbMClickableClick
        end
        object cbMDraggable: TCheckBox
          Left = 176
          Top = 72
          Width = 135
          Height = 17
          Caption = 'Draggable'
          TabOrder = 2
          OnClick = cbMDraggableClick
        end
        object cbMFlat: TCheckBox
          Left = 327
          Top = 72
          Width = 135
          Height = 17
          Caption = 'Flat'
          TabOrder = 3
          OnClick = cbMFlatClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 32
        Top = 223
        Width = 478
        Height = 114
        Caption = ' PolylineOptions '
        TabOrder = 7
        object Label38: TLabel
          Left = 328
          Top = 28
          Width = 65
          Height = 13
          Caption = 'StrokeWeight'
        end
        object Label12: TLabel
          Left = 189
          Top = 28
          Width = 107
          Height = 13
          Caption = 'StrokeOpacity (0 to 1)'
        end
        object Label13: TLabel
          Left = 43
          Top = 28
          Width = 56
          Height = 13
          Caption = 'StrokeColor'
        end
        object cbPClickable: TCheckBox
          Left = 43
          Top = 80
          Width = 118
          Height = 17
          Caption = 'Clickable'
          TabOrder = 0
          OnClick = cbPClickableClick
        end
        object cbPGeodesic: TCheckBox
          Left = 328
          Top = 80
          Width = 106
          Height = 17
          Caption = 'Geodesic'
          TabOrder = 1
          OnClick = cbPGeodesicClick
        end
        object eStrokeWeight: TSpinEdit
          Left = 328
          Top = 44
          Width = 57
          Height = 22
          MaxValue = 10
          MinValue = 1
          TabOrder = 2
          Value = 1
          OnChange = eStrokeWeightChange
        end
        object eStrokeOpacity: TEdit
          Left = 189
          Top = 45
          Width = 57
          Height = 21
          TabOrder = 3
          Text = '0'
          OnChange = eStrokeOpacityChange
        end
        object cbStrokeColor: TColorBox
          Left = 43
          Top = 44
          Width = 89
          Height = 22
          TabOrder = 4
          OnChange = cbStrokeColorChange
        end
      end
    end
    object tsResults: TTabSheet
      Caption = 'Results'
      ImageIndex = 1
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 169
        Height = 365
        ActivePage = TabSheet1
        Align = alLeft
        TabOrder = 0
        object TabSheet1: TTabSheet
          Caption = 'TabSheet1'
          TabVisible = False
          object Label14: TLabel
            Left = 7
            Top = 16
            Width = 35
            Height = 13
            Caption = 'Results'
          end
          object lbResults: TListBox
            Left = 0
            Top = 32
            Width = 158
            Height = 265
            ItemHeight = 13
            TabOrder = 0
            OnClick = lbResultsClick
          end
          object bDelResult: TButton
            Left = 0
            Top = 303
            Width = 49
            Height = 25
            Caption = 'Del'
            TabOrder = 1
            OnClick = bDelResultClick
          end
        end
      end
      object pcResult: TPageControl
        Left = 169
        Top = 0
        Width = 387
        Height = 365
        ActivePage = tsGeneral
        Align = alClient
        TabOrder = 1
        object tsGeneral: TTabSheet
          Caption = 'General'
          object Label15: TLabel
            Left = 16
            Top = 19
            Width = 31
            Height = 13
            Caption = 'Status'
          end
          object Label16: TLabel
            Left = 189
            Top = 19
            Width = 62
            Height = 13
            Caption = 'N'#186' of Routes'
          end
          object Label17: TLabel
            Left = 16
            Top = 48
            Width = 34
            Height = 13
            Caption = 'Routes'
          end
          object lIndex: TLabel
            Left = 189
            Top = 41
            Width = 28
            Height = 13
            Caption = 'Index'
          end
          object eStatus: TEdit
            Left = 56
            Top = 16
            Width = 121
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object eRoutes: TEdit
            Left = 256
            Top = 16
            Width = 41
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
          object tvItems: TTreeView
            Left = 16
            Top = 64
            Width = 345
            Height = 247
            Indent = 19
            TabOrder = 2
            OnChange = tvItemsChange
          end
          object eIndex: TEdit
            Left = 256
            Top = 38
            Width = 41
            Height = 21
            ReadOnly = True
            TabOrder = 3
          end
          object cbHidde: TCheckBox
            Left = 16
            Top = 317
            Width = 97
            Height = 17
            Caption = 'HiddeOthers'
            TabOrder = 4
            OnClick = cbDeleteOthersClick
          end
        end
        object tsXML: TTabSheet
          Caption = 'XMLData'
          ImageIndex = 1
          object mXMLData: TMemo
            Left = 0
            Top = 0
            Width = 379
            Height = 337
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object tsOptions: TTabSheet
          Caption = 'Render Opt.'
          ImageIndex = 2
          object cbResDraggable: TCheckBox
            Left = 16
            Top = 14
            Width = 135
            Height = 17
            Caption = 'Draggable'
            TabOrder = 0
            OnClick = cbResDraggableClick
          end
          object cbResSuppressInfoWindows: TCheckBox
            Left = 16
            Top = 37
            Width = 135
            Height = 17
            Caption = 'SuppressInfoWindows'
            TabOrder = 2
            OnClick = cbResSuppressInfoWindowsClick
          end
          object cbResSuppressMarkers: TCheckBox
            Left = 180
            Top = 40
            Width = 135
            Height = 17
            Caption = 'SuppressMarkers'
            TabOrder = 3
            OnClick = cbResSuppressMarkersClick
          end
          object cbResPreserveViewport: TCheckBox
            Left = 180
            Top = 17
            Width = 135
            Height = 17
            Caption = 'PreserveViewport'
            TabOrder = 1
            OnClick = cbResPreserveViewportClick
          end
          object cbResSuppressBicyclingLayer: TCheckBox
            Left = 16
            Top = 63
            Width = 135
            Height = 17
            Caption = 'SuppressBicyclingLayer'
            TabOrder = 4
            OnClick = cbResSuppressBicyclingLayerClick
          end
          object cbResSuppressPolylines: TCheckBox
            Left = 180
            Top = 63
            Width = 135
            Height = 17
            Caption = 'SuppressPolylines'
            TabOrder = 5
            OnClick = cbResSuppressPolylinesClick
          end
          object GroupBox5: TGroupBox
            Left = 16
            Top = 103
            Width = 344
            Height = 94
            Caption = ' MarkerOptions '
            TabOrder = 6
            object Label18: TLabel
              Left = 16
              Top = 35
              Width = 21
              Height = 13
              Caption = 'Icon'
            end
            object eResIcon: TEdit
              Left = 43
              Top = 32
              Width = 268
              Height = 21
              TabOrder = 0
              OnChange = eResIconChange
            end
            object cbResMClickable: TCheckBox
              Left = 16
              Top = 66
              Width = 89
              Height = 17
              Caption = 'Clickable'
              TabOrder = 1
              OnClick = cbResMClickableClick
            end
            object cbResMDraggable: TCheckBox
              Left = 136
              Top = 66
              Width = 89
              Height = 17
              Caption = 'Draggable'
              TabOrder = 2
              OnClick = cbResMDraggableClick
            end
            object cbResMFlat: TCheckBox
              Left = 247
              Top = 66
              Width = 66
              Height = 17
              Caption = 'Flat'
              TabOrder = 3
              OnClick = cbResMFlatClick
            end
          end
          object GroupBox6: TGroupBox
            Left = 16
            Top = 203
            Width = 344
            Height = 106
            Caption = ' PolylineOptions '
            TabOrder = 7
            object Label19: TLabel
              Left = 248
              Top = 28
              Width = 65
              Height = 13
              Caption = 'StrokeWeight'
            end
            object Label20: TLabel
              Left = 125
              Top = 28
              Width = 107
              Height = 13
              Caption = 'StrokeOpacity (0 to 1)'
            end
            object Label21: TLabel
              Left = 16
              Top = 28
              Width = 56
              Height = 13
              Caption = 'StrokeColor'
            end
            object cbResPClickable: TCheckBox
              Left = 16
              Top = 76
              Width = 118
              Height = 17
              Caption = 'Clickable'
              TabOrder = 0
              OnClick = cbResPClickableClick
            end
            object cbResPGeodesic: TCheckBox
              Left = 248
              Top = 76
              Width = 73
              Height = 17
              Caption = 'Geodesic'
              TabOrder = 1
              OnClick = cbResPGeodesicClick
            end
            object eResStrokeWeight: TSpinEdit
              Left = 248
              Top = 44
              Width = 57
              Height = 22
              MaxValue = 10
              MinValue = 1
              TabOrder = 2
              Value = 1
              OnChange = eResStrokeWeightChange
            end
            object eResStrokeOpacity: TEdit
              Left = 125
              Top = 45
              Width = 57
              Height = 21
              TabOrder = 3
              Text = '0'
              OnChange = eResStrokeOpacityChange
            end
            object cbResStrokeColor: TColorBox
              Left = 16
              Top = 44
              Width = 89
              Height = 22
              TabOrder = 4
              OnChange = cbResStrokeColorChange
            end
          end
        end
        object tsElevation: TTabSheet
          Caption = 'Elevation'
          ImageIndex = 3
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 379
            Height = 153
            Align = alTop
            Caption = ' '
            TabOrder = 0
            object Shape1: TShape
              Left = 24
              Top = 3
              Width = 196
              Height = 32
            end
            object Label22: TLabel
              Left = 108
              Top = 11
              Width = 39
              Height = 13
              Caption = 'Samples'
            end
            object lbElevations: TListBox
              Left = 24
              Top = 40
              Width = 297
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
            end
            object rbForLocation: TRadioButton
              Left = 256
              Top = 10
              Width = 81
              Height = 17
              Caption = 'For Location'
              TabOrder = 2
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
            object Button1: TButton
              Left = 327
              Top = 112
              Width = 43
              Height = 25
              Caption = 'Show'
              TabOrder = 4
              OnClick = Button1Click
            end
          end
          object Chart1: TChart
            Left = 0
            Top = 153
            Width = 379
            Height = 184
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
            TabOrder = 1
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
        end
      end
    end
  end
end
