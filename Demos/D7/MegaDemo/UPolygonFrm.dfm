inherited PolygonFrm: TPolygonFrm
  Caption = 'Polygons'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl2: TPageControl
    inherited tsMarkers: TTabSheet
      inherited Label1: TLabel
        Width = 75
        Caption = 'List of Polygons'
        ExplicitWidth = 75
      end
    end
  end
  inherited pcMarker: TPageControl
    inherited tsGeneral: TTabSheet
      inherited Label36: TLabel
        Left = 32
        Top = 144
        ExplicitLeft = 32
        ExplicitTop = 144
      end
      inherited Label37: TLabel
        Left = 144
        Top = 144
        ExplicitLeft = 144
        ExplicitTop = 144
      end
      inherited Label38: TLabel
        Left = 271
        Top = 144
        ExplicitLeft = 271
        ExplicitTop = 144
      end
      object Label10: TLabel [4]
        Left = 32
        Top = 208
        Width = 37
        Height = 13
        Caption = 'FillColor'
      end
      object Label11: TLabel [5]
        Left = 144
        Top = 208
        Width = 88
        Height = 13
        Caption = 'FillOpacity (0 to 1)'
      end
      inherited cbStrokeColor: TColorBox
        Left = 32
        Top = 160
        ExplicitLeft = 32
        ExplicitTop = 160
      end
      inherited eStrokeOpacity: TEdit
        Left = 144
        Top = 161
        ExplicitLeft = 144
        ExplicitTop = 161
      end
      inherited eStrokeWeight: TSpinEdit
        Left = 271
        Top = 161
        ExplicitLeft = 271
        ExplicitTop = 161
      end
      object cbFillColor: TColorBox
        Left = 32
        Top = 224
        Width = 89
        Height = 22
        TabOrder = 9
        OnChange = cbFillColorChange
      end
      object eFillOpacity: TEdit
        Left = 144
        Top = 225
        Width = 57
        Height = 21
        TabOrder = 10
        Text = '0'
        OnChange = eFillOpacityChange
      end
    end
    inherited tsEvents: TTabSheet
      object cbOnFillOpacityChange: TCheckBox
        Left = 184
        Top = 145
        Width = 150
        Height = 17
        Caption = 'OnFillOpacityChange'
        TabOrder = 22
        OnClick = cbOnFillOpacityChangeClick
      end
      object cbOnFillColorChange: TCheckBox
        Left = 184
        Top = 121
        Width = 150
        Height = 17
        Caption = 'OnFillColorChange'
        TabOrder = 23
        OnClick = cbOnFillColorChangeClick
      end
    end
    inherited tsIcon: TTabSheet
      TabVisible = False
      inherited GroupBox3: TGroupBox
        inherited cbIFillColor: TColorBox
          OnChange = nil
        end
        inherited eIFillOpacity: TEdit
          OnChange = nil
        end
      end
    end
    inherited tsElev: TTabSheet
      TabVisible = False
      inherited Chart1: TChart
        PrintMargins = (
          15
          3
          15
          3)
        inherited Series1: TAreaSeries
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
    inherited tsGeometry: TTabSheet
      object Label12: TLabel [0]
        Left = 29
        Top = 296
        Width = 39
        Height = 13
        Caption = 'Latitude'
      end
      object Label13: TLabel [1]
        Left = 29
        Top = 320
        Width = 47
        Height = 13
        Caption = 'Longitude'
      end
      object eLatCont: TEdit [10]
        Left = 82
        Top = 293
        Width = 134
        Height = 21
        TabOrder = 3
        Text = '0'
        OnChange = eLatChange
      end
      object eLngCont: TEdit [11]
        Left = 82
        Top = 317
        Width = 134
        Height = 21
        TabOrder = 4
        Text = '0'
        OnChange = eLngChange
      end
      object bContLoc: TButton [12]
        Left = 224
        Top = 304
        Width = 75
        Height = 25
        Caption = 'Contains Loc.'
        TabOrder = 5
        OnClick = bContLocClick
      end
      inherited eLatIsLoc: TEdit
        TabOrder = 6
      end
      inherited eLngIsLoc: TEdit
        TabOrder = 7
      end
      inherited bIsLoc: TButton
        TabOrder = 8
      end
      inherited eTolerance: TEdit
        TabOrder = 9
      end
      inherited eRadius: TEdit
        TabOrder = 10
      end
      inherited bComArea: TButton
        TabOrder = 11
      end
    end
  end
end
