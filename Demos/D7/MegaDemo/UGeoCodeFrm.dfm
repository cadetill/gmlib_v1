object GeoCodeFrm: TGeoCodeFrm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Geocode'
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
    Width = 564
    Height = 81
    ActivePage = tsMarkers
    Align = alTop
    TabOrder = 0
    object tsMarkers: TTabSheet
      Caption = 'tsMarkers'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 97
        Height = 13
        Caption = 'Address to Geocode'
      end
      object bGoAddress: TSpeedButton
        Left = 504
        Top = 8
        Width = 23
        Height = 21
        Caption = 'Go'
        OnClick = bGoAddressClick
      end
      object Label36: TLabel
        Left = 243
        Top = 42
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object Label37: TLabel
        Left = 18
        Top = 42
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object bGoLatLng: TSpeedButton
        Left = 436
        Top = 39
        Width = 23
        Height = 21
        Caption = 'Go'
        OnClick = bGoLatLngClick
      end
      object eGeocode: TEdit
        Left = 119
        Top = 8
        Width = 378
        Height = 21
        TabOrder = 0
      end
      object eLat: TEdit
        Left = 71
        Top = 39
        Width = 134
        Height = 21
        TabOrder = 1
        Text = '0'
      end
      object eLng: TEdit
        Left = 296
        Top = 39
        Width = 134
        Height = 21
        TabOrder = 2
        Text = '0'
      end
    end
  end
  object pcMarker: TPageControl
    Left = 0
    Top = 81
    Width = 564
    Height = 312
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
        Left = 48
        Top = 325
        Width = 22
        Height = 13
        Caption = 'Text'
      end
      object Label2: TLabel
        Left = 36
        Top = 32
        Width = 21
        Height = 13
        Caption = 'Icon'
      end
      object Label3: TLabel
        Left = 36
        Top = 192
        Width = 75
        Height = 13
        Caption = 'Language Code'
      end
      object Label4: TLabel
        Left = 287
        Top = 192
        Width = 33
        Height = 13
        Caption = 'Region'
      end
      object eText: TEdit
        Left = 76
        Top = 322
        Width = 134
        Height = 21
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 32
        Top = 72
        Width = 304
        Height = 102
        Caption = ' Bounds '
        TabOrder = 1
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
      object eIcon: TEdit
        Left = 65
        Top = 29
        Width = 271
        Height = 21
        TabOrder = 2
        OnChange = eIconChange
      end
      object cbLangCode: TComboBox
        Left = 36
        Top = 211
        Width = 229
        Height = 21
        Style = csDropDownList
        DropDownCount = 15
        TabOrder = 3
        OnChange = cbLangCodeChange
        Items.Strings = (
          'lc_NOT_DEFINED'
          'lcARABIC'
          'lcBASQUE'
          'lcBENGALI'
          'lcBULGARIAN'
          'lcCATALAN'
          'lcCHINESE_SIMPLIFIED'
          'lcCHINESE_TRADITIONAL'
          'lcCROATIAN'
          'lcCZECH'
          'lcDANISH'
          'lcDUTCH'
          'lcENGLISH'
          'lcENGLISH_AUSTRALIAN'
          'lcENGLISH_GREAT_BRITAIN'
          'lcFARSI'
          'lcFILIPINO'
          'lcFINNISH'
          'lcFRENCH'
          'lcGALICIAN'
          'lcGERMAN'
          'lcGREEK'
          'lcGUJARATI'
          'lcHEBREW'
          'lcHINDI'
          'lcHUNGARIAN'
          'lcINDONESIAN'
          'lcITALIAN'
          'lcJAPANESE'
          'lcKANNADA'
          'lcKOREAN'
          'lcLATVIAN'
          'lcLITHUANIAN'
          'lcMALAYALAM'
          'lcMARATHI'
          'lcNORWEGIAN'
          'lcPOLISH'
          'lcPORTUGUESE'
          'lcPORTUGUESE_BRAZIL'
          'lcPORTUGUESE_PORTUGAL'
          'lcROMANIAN'
          'lcRUSSIAN'
          'lcSERBIAN'
          'lcSLOVAK'
          'lcSLOVENIAN'
          'lcSPANISH'
          'lcSWEDISH'
          'lcTAGALOG'
          'lcTAMIL'
          'lcTELUGU'
          'lcTHAI'
          'lcTURKISH'
          'lcUKRAINIAN'
          'lcVIETNAMESE')
      end
      object cbRegion: TComboBox
        Left = 287
        Top = 211
        Width = 229
        Height = 21
        Style = csDropDownList
        DropDownCount = 15
        ItemIndex = 0
        TabOrder = 4
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
      object cbPaintMarkerFound: TCheckBox
        Left = 36
        Top = 248
        Width = 136
        Height = 17
        Caption = 'PaintMarkerFound'
        TabOrder = 5
        OnClick = cbPaintMarkerFoundClick
      end
    end
    object tsEvents: TTabSheet
      Caption = 'Events'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object tsResults: TTabSheet
      Caption = 'Results'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label5: TLabel
        Left = 18
        Top = 19
        Width = 50
        Height = 13
        Caption = 'GeoStatus'
      end
      object Label6: TLabel
        Left = 18
        Top = 53
        Width = 54
        Height = 13
        Caption = 'GeoResults'
      end
      object eGeoStatus: TEdit
        Left = 74
        Top = 16
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object tvItems: TTreeView
        Left = 18
        Top = 72
        Width = 519
        Height = 209
        Indent = 19
        ReadOnly = True
        TabOrder = 1
      end
    end
    object tsXMLResult: TTabSheet
      Caption = 'XML'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object mXML: TMemo
        Left = 0
        Top = 0
        Width = 556
        Height = 284
        Align = alClient
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
