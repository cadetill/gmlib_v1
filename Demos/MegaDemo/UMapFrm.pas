unit UMapFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ComCtrls, GMMap, GMMapVCL, CheckLst, ExtCtrls;

type
  TMapFrm = class(TForm)
    pcPages: TPageControl;
    tsGeneral: TTabSheet;
    tsRequired: TTabSheet;
    tsVisual: TTabSheet;
    cbActive: TCheckBox;
    Label33: TLabel;
    eInterval: TSpinEdit;
    Label35: TLabel;
    cbLanguages: TComboBox;
    Label40: TLabel;
    ePrecision: TSpinEdit;
    eReqLng: TEdit;
    lLong: TLabel;
    lLat: TLabel;
    eReqLat: TEdit;
    cbTypeMap: TComboBox;
    lTypMap: TLabel;
    lZoom: TLabel;
    tbZoom: TTrackBar;
    bSetCenter: TButton;
    tsNonVisual: TTabSheet;
    Label16: TLabel;
    cbBGColor: TColorBox;
    cbShowMapType: TCheckBox;
    Label13: TLabel;
    clbMapType: TCheckListBox;
    Label11: TLabel;
    cbMapTypePos: TComboBox;
    cbMapTypeStyle: TComboBox;
    Label12: TLabel;
    cbShowOver: TCheckBox;
    cbOverOpened: TCheckBox;
    cbShowPan: TCheckBox;
    cbPanPos: TComboBox;
    Label18: TLabel;
    cbShowRotate: TCheckBox;
    cbRoratePos: TComboBox;
    Label17: TLabel;
    cbShowScale: TCheckBox;
    cbScalePos: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    cbScaleStyle: TComboBox;
    cbStreetViewPos: TComboBox;
    Label21: TLabel;
    cbShowStreetView: TCheckBox;
    cbShowZoom: TCheckBox;
    Label9: TLabel;
    cbZoomPos: TComboBox;
    cbZoomStyle: TComboBox;
    Label10: TLabel;
    cbZoomClick: TCheckBox;
    cbDraggable: TCheckBox;
    cbNoClear: TCheckBox;
    cbKeyboard: TCheckBox;
    cbWheel: TCheckBox;
    Label7: TLabel;
    eMaxZoom: TSpinEdit;
    eMinZoom: TSpinEdit;
    Label8: TLabel;
    bDoMapVP: TButton;
    bDoMapNVP: TButton;
    tsEvents: TTabSheet;
    cbOnBoundsChanged: TCheckBox;
    cbOnCenterChanged: TCheckBox;
    cbOnClick: TCheckBox;
    cbOnDblClick: TCheckBox;
    cbOnDrag: TCheckBox;
    cbOnDragEnd: TCheckBox;
    cbOnDragStart: TCheckBox;
    cbOnMapTypeIdChanged: TCheckBox;
    cbOnMouseMove: TCheckBox;
    cbOnMouseOut: TCheckBox;
    cbOnMouseOver: TCheckBox;
    cbOnRightClick: TCheckBox;
    cbOnZoomChanged: TCheckBox;
    cbOnIntervalEventsChange: TCheckBox;
    cbOnPrecisionChange: TCheckBox;
    tsLayers: TTabSheet;
    cbBicycling: TCheckBox;
    cbPano: TCheckBox;
    cbTraffic: TCheckBox;
    cbTransit: TCheckBox;
    cbWeather: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    cbPanoClickable: TCheckBox;
    cbPanoFiltered: TCheckBox;
    ePanoFilterTag: TEdit;
    Label1: TLabel;
    ePanoFilterUserId: TEdit;
    Label2: TLabel;
    cbWeatherSupInfoWin: TCheckBox;
    cbWeatherClickable: TCheckBox;
    cbWeatherLabCol: TComboBox;
    Label3: TLabel;
    cbWeatherTempUnit: TComboBox;
    Label4: TLabel;
    cbWeatherWSUnit: TComboBox;
    Label5: TLabel;
    cbMarker: TCheckBox;
    tsFunctions: TTabSheet;
    gbB1: TGroupBox;
    Label6: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    eLatASW: TEdit;
    eLngASW: TEdit;
    eLatANE: TEdit;
    eLngANE: TEdit;
    gbLatLng: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    eLat: TEdit;
    eLng: TEdit;
    Label27: TLabel;
    bContains: TButton;
    bSetBounds: TButton;
    bGetBounds: TButton;
    Label28: TLabel;
    bExtend: TButton;
    Label29: TLabel;
    bGetCenter: TButton;
    bToSpan: TButton;
    Label30: TLabel;
    bToString: TButton;
    bToURL: TButton;
    GroupBox5: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    eXMet: TEdit;
    eYMet: TEdit;
    bGetCenterLL: TButton;
    bPanTo: TButton;
    bSetCenterLL: TButton;
    Label34: TLabel;
    Button15: TButton;
    tsStreetView: TTabSheet;
    cbSVVisible: TCheckBox;
    cbKml: TCheckBox;
    GroupBox3: TGroupBox;
    Label37: TLabel;
    cbKmlClic: TCheckBox;
    cbKmlPreserve: TCheckBox;
    eKmlUrl: TEdit;
    cbKmlScreenOver: TCheckBox;
    cbKmlSupInfWin: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbActiveClick(Sender: TObject);
    procedure eIntervalChange(Sender: TObject);
    procedure ePrecisionChange(Sender: TObject);
    procedure cbLanguagesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bSetCenterClick(Sender: TObject);
    procedure cbTypeMapChange(Sender: TObject);
    procedure tbZoomChange(Sender: TObject);
    procedure cbBGColorChange(Sender: TObject);
    procedure bDoMapVPClick(Sender: TObject);
    procedure bDoMapNVPClick(Sender: TObject);
    procedure cbShowOverClick(Sender: TObject);
    procedure cbOverOpenedClick(Sender: TObject);
    procedure cbShowPanClick(Sender: TObject);
    procedure cbPanPosChange(Sender: TObject);
    procedure cbShowRotateClick(Sender: TObject);
    procedure cbRoratePosChange(Sender: TObject);
    procedure cbShowZoomClick(Sender: TObject);
    procedure cbZoomPosChange(Sender: TObject);
    procedure cbZoomStyleChange(Sender: TObject);
    procedure cbShowMapTypeClick(Sender: TObject);
    procedure clbMapTypeClickCheck(Sender: TObject);
    procedure cbMapTypePosChange(Sender: TObject);
    procedure cbMapTypeStyleChange(Sender: TObject);
    procedure cbShowScaleClick(Sender: TObject);
    procedure cbZoomClickClick(Sender: TObject);
    procedure cbDraggableClick(Sender: TObject);
    procedure cbNoClearClick(Sender: TObject);
    procedure cbKeyboardClick(Sender: TObject);
    procedure cbWheelClick(Sender: TObject);
    procedure eMaxZoomChange(Sender: TObject);
    procedure eMinZoomChange(Sender: TObject);
    procedure cbOnBoundsChangedClick(Sender: TObject);
    procedure cbOnCenterChangedClick(Sender: TObject);
    procedure cbOnClickClick(Sender: TObject);
    procedure cbOnDblClickClick(Sender: TObject);
    procedure cbOnDragClick(Sender: TObject);
    procedure cbOnDragEndClick(Sender: TObject);
    procedure cbOnDragStartClick(Sender: TObject);
    procedure cbOnIntervalEventsChangeClick(Sender: TObject);
    procedure cbOnMapTypeIdChangedClick(Sender: TObject);
    procedure cbOnMouseMoveClick(Sender: TObject);
    procedure cbOnMouseOutClick(Sender: TObject);
    procedure cbOnMouseOverClick(Sender: TObject);
    procedure cbOnPrecisionChangeClick(Sender: TObject);
    procedure cbOnRightClickClick(Sender: TObject);
    procedure cbOnZoomChangedClick(Sender: TObject);
    procedure cbStreetViewPosChange(Sender: TObject);
    procedure cbScalePosChange(Sender: TObject);
    procedure cbScaleStyleChange(Sender: TObject);
    procedure cbBicyclingClick(Sender: TObject);
    procedure cbPanoClick(Sender: TObject);
    procedure cbTrafficClick(Sender: TObject);
    procedure cbWeatherClick(Sender: TObject);
    procedure cbTransitClick(Sender: TObject);
    procedure cbPanoClickableClick(Sender: TObject);
    procedure cbPanoFilteredClick(Sender: TObject);
    procedure cbWeatherClickableClick(Sender: TObject);
    procedure cbWeatherSupInfoWinClick(Sender: TObject);
    procedure ePanoFilterTagChange(Sender: TObject);
    procedure ePanoFilterUserIdChange(Sender: TObject);
    procedure cbWeatherLabColChange(Sender: TObject);
    procedure cbWeatherTempUnitChange(Sender: TObject);
    procedure cbWeatherWSUnitChange(Sender: TObject);
    procedure cbMarkerClick(Sender: TObject);
    procedure bGetBoundsClick(Sender: TObject);
    procedure bSetBoundsClick(Sender: TObject);
    procedure bContainsClick(Sender: TObject);
    procedure bExtendClick(Sender: TObject);
    procedure bGetCenterClick(Sender: TObject);
    procedure bToSpanClick(Sender: TObject);
    procedure bToStringClick(Sender: TObject);
    procedure bToURLClick(Sender: TObject);
    procedure bGetCenterLLClick(Sender: TObject);
    procedure bSetCenterLLClick(Sender: TObject);
    procedure bPanToClick(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure cbSVVisibleClick(Sender: TObject);
    procedure cbKmlClick(Sender: TObject);
    procedure cbKmlClicClick(Sender: TObject);
    procedure cbKmlPreserveClick(Sender: TObject);
    procedure cbKmlScreenOverClick(Sender: TObject);
    procedure cbKmlSupInfWinClick(Sender: TObject);
    procedure eKmlUrlChange(Sender: TObject);
  private
    FGMMap: TGMMap;

    procedure GetInfo;
  public
    OnBoundsChanged: TBoundsChanged;
    OnCenterChanged: TLatLngEvent;
    OnClick: TLatLngEvent;
    OnDblClick: TLatLngEvent;
    OnDrag: TNotifyEvent;
    OnDragEnd: TNotifyEvent;
    OnDragStart: TNotifyEvent;
    OnMapTypeIdChanged: TMapTypeIdChanged;
    OnMouseMove: TLatLngEvent;
    OnMouseOut: TLatLngEvent;
    OnMouseOver: TLatLngEvent;
    OnRightClick: TLatLngEvent;
    OnZoomChanged: TZoomChanged;
    OnIntervalEventsChange: TNotifyEvent;
    OnPrecisionChange: TNotifyEvent;

    constructor Create(aOwner: TComponent; GMMap: TGMMap); reintroduce; virtual;
  end;

var
  MapFrm: TMapFrm;

implementation

uses
  GMConstants, GMFunctionsVCL, GMClasses;

{$R *.dfm}

procedure TMapFrm.bDoMapNVPClick(Sender: TObject);
begin
  FGMMap.DoMap;
end;

procedure TMapFrm.bDoMapVPClick(Sender: TObject);
begin
  FGMMap.DoMap;
end;

procedure TMapFrm.bExtendClick(Sender: TObject);
var
  Bounds: TLatLngBounds;
begin
  Bounds := TLatLngBounds.Create;
  try
    FGMMap.LatLngBoundsExtend(
                          FGMMap.RequiredProp.Center.StringToReal(eLat.Text),
                          FGMMap.RequiredProp.Center.StringToReal(eLng.Text),
                          Bounds
                             );

    eLatASW.Text := Bounds.SW.LatToStr(FGMMap.Precision);
    eLngASW.Text := Bounds.SW.LngToStr(FGMMap.Precision);
    eLatANE.Text := Bounds.NE.LatToStr(FGMMap.Precision);
    eLngANE.Text := Bounds.NE.LngToStr(FGMMap.Precision);
  finally
    FreeAndNil(Bounds);
  end;
end;

procedure TMapFrm.bSetCenterClick(Sender: TObject);
begin
  FGMMap.RequiredProp.Center.Lat := FGMMap.RequiredProp.Center.StringToReal(eReqLat.Text);
  FGMMap.RequiredProp.Center.Lng := FGMMap.RequiredProp.Center.StringToReal(eReqLng.Text);
end;

procedure TMapFrm.bSetCenterLLClick(Sender: TObject);
begin
  FGMMap.SetCenter(FGMMap.RequiredProp.Center.StringToReal(eLat.Text),
                   FGMMap.RequiredProp.Center.StringToReal(eLng.Text));
end;

procedure TMapFrm.bToSpanClick(Sender: TObject);
var
  LL: TLatLng;
begin
  LL := TLatLng.Create;
  try
    FGMMap.LatLngBoundsToSpan(LL);
    eLat.Text := LL.LatToStr(FGMMap.Precision);
    eLng.Text := LL.LngToStr(FGMMap.Precision);
  finally
    FreeAndNil(LL);
  end;
end;

procedure TMapFrm.bToStringClick(Sender: TObject);
var
  Bounds: TLatLngBounds;
begin
  Bounds := TLatLngBounds.Create;
  try
    FGMMap.LatLngBoundsGetBounds(Bounds);
    ShowMessage(Bounds.ToStr(FGMMap.Precision));
  finally
    FreeAndNil(Bounds);
  end;
end;

procedure TMapFrm.bToURLClick(Sender: TObject);
var
  Bounds: TLatLngBounds;
begin
  Bounds := TLatLngBounds.Create;
  try
    FGMMap.LatLngBoundsGetBounds(Bounds);
    ShowMessage(Bounds.ToUrlValue(FGMMap.Precision));
  finally
    FreeAndNil(Bounds);
  end;
end;

procedure TMapFrm.Button15Click(Sender: TObject);
begin
  FGMMap.PanBy(StrToInt(eXMet.Text), StrToInt(eYMet.Text));
end;

procedure TMapFrm.bGetCenterLLClick(Sender: TObject);
var
  LL: TLatLng;
begin
  LL := TLatLng.Create;
  try
    FGMMap.GetCenter(LL);
    eLat.Text := LL.LatToStr(FGMMap.Precision);
    eLng.Text := LL.LngToStr(FGMMap.Precision);
  finally
    FreeAndNil(LL);
  end;
end;

procedure TMapFrm.bPanToClick(Sender: TObject);
begin
  FGMMap.PanTo(FGMMap.RequiredProp.Center.StringToReal(eLat.Text),
               FGMMap.RequiredProp.Center.StringToReal(eLng.Text));
end;

procedure TMapFrm.bGetBoundsClick(Sender: TObject);
var
  Bounds: TLatLngBounds;
begin
  Bounds := TLatLngBounds.Create;
  try
    FGMMap.LatLngBoundsGetBounds(Bounds);
    eLatASW.Text := Bounds.SW.LatToStr(FGMMap.Precision);
    eLngASW.Text := Bounds.SW.LngToStr(FGMMap.Precision);
    eLatANE.Text := Bounds.NE.LatToStr(FGMMap.Precision);
    eLngANE.Text := Bounds.NE.LngToStr(FGMMap.Precision);
  finally
    FreeAndNil(Bounds);
  end;
end;

procedure TMapFrm.bGetCenterClick(Sender: TObject);
var
  LL: TLatLng;
  LLB: TLatLngBounds;
begin
  LL := TLatLng.Create;
  LLB := TLatLngBounds.Create;
  try
    FGMMap.LatLngBoundsGetBounds(LLB);
    FGMMap.LatLngBoundsGetCenter(LLB, LL);
    eLat.Text := LL.LatToStr(FGMMap.Precision);
    eLng.Text := LL.LngToStr(FGMMap.Precision);
  finally
    FreeAndNil(LLB);
    FreeAndNil(LL);
  end;
end;

procedure TMapFrm.bSetBoundsClick(Sender: TObject);
begin
  FGMMap.LatLngBoundsSetBounds(
                          FGMMap.RequiredProp.Center.StringToReal(eLatASW.Text),
                          FGMMap.RequiredProp.Center.StringToReal(eLngASW.Text),
                          FGMMap.RequiredProp.Center.StringToReal(eLatANE.Text),
                          FGMMap.RequiredProp.Center.StringToReal(eLngANE.Text)
                              );
end;

procedure TMapFrm.bContainsClick(Sender: TObject);
var
  Cont: Boolean;
  LL: TLatLng;
begin
  LL := TLatLng.Create;
  try
    LL.Lat := LL.StringToReal(eLat.Text);
    LL.Lng := LL.StringToReal(eLng.Text);
    Cont := FGMMap.MapLatLngBoundsContains(LL);
  finally
    FreeAndNil(LL);
  end;
  ShowMessage(BoolToStr(Cont, True));
end;

procedure TMapFrm.cbActiveClick(Sender: TObject);
begin
  FGMMap.Active := cbActive.Checked;
end;

procedure TMapFrm.cbBGColorChange(Sender: TObject);
begin
  TVisualProp(FGMMap.VisualProp).BGColor := cbBGColor.Selected;
end;

procedure TMapFrm.cbBicyclingClick(Sender: TObject);
begin
  FGMMap.Layers.Bicycling.Show := cbBicycling.Checked;
end;

procedure TMapFrm.cbDraggableClick(Sender: TObject);
begin
  if cbDraggable.Checked then
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options + [Draggable]
  else
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options - [Draggable];
end;

procedure TMapFrm.cbKeyboardClick(Sender: TObject);
begin
  if cbKeyboard.Checked then
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options + [KeyboardShortcuts]
  else
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options - [KeyboardShortcuts];
end;

procedure TMapFrm.cbKmlClicClick(Sender: TObject);
begin
  FGMMap.Layers.Kml.Clickable := cbKmlClic.Checked;
end;

procedure TMapFrm.cbKmlClick(Sender: TObject);
begin
  FGMMap.Layers.Kml.Show := cbKml.Checked;
end;

procedure TMapFrm.cbKmlPreserveClick(Sender: TObject);
begin
  FGMMap.Layers.Kml.PreserveViewport := cbKmlPreserve.Checked;
end;

procedure TMapFrm.cbKmlScreenOverClick(Sender: TObject);
begin
  FGMMap.Layers.Kml.ScreenOverlays := cbKmlScreenOver.Checked;
end;

procedure TMapFrm.cbKmlSupInfWinClick(Sender: TObject);
begin
  FGMMap.Layers.Kml.SuppressInfoWindows := cbKmlSupInfWin.Checked;
end;

procedure TMapFrm.cbLanguagesChange(Sender: TObject);
begin
  case cbLanguages.ItemIndex of
    0: FGMMap.Language := Espanol;
    1: FGMMap.Language := English;
    2: FGMMap.Language := French;
    3: FGMMap.Language := PortuguesBR;
    4: FGMMap.Language := Danish;
    5: FGMMap.Language := German;
  end;
end;

procedure TMapFrm.cbMapTypePosChange(Sender: TObject);
begin
  FGMMap.VisualProp.MapTypeCtrl.Position := TTransform.StrToPosition(cbMapTypePos.Text);
end;

procedure TMapFrm.cbMapTypeStyleChange(Sender: TObject);
begin
  FGMMap.VisualProp.MapTypeCtrl.Style := TTransform.StrToMapTypeControlStyle(cbMapTypeStyle.Text);
end;

procedure TMapFrm.cbMarkerClick(Sender: TObject);
begin
  FGMMap.NonVisualProp.MapMaker := cbMarker.Checked;
end;

procedure TMapFrm.cbNoClearClick(Sender: TObject);
begin
  if cbNoClear.Checked then
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options + [NoClear]
  else
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options - [NoClear];
end;

procedure TMapFrm.cbOnBoundsChangedClick(Sender: TObject);
begin
  FGMMap.OnBoundsChanged := nil;
  if cbOnBoundsChanged.Checked then FGMMap.OnBoundsChanged := OnBoundsChanged;
end;

procedure TMapFrm.cbOnCenterChangedClick(Sender: TObject);
begin
  FGMMap.OnCenterChanged := nil;
  if cbOnCenterChanged.Checked then FGMMap.OnCenterChanged := OnCenterChanged;
end;

procedure TMapFrm.cbOnClickClick(Sender: TObject);
begin
  FGMMap.OnClick := nil;
  if cbOnClick.Checked then FGMMap.OnClick := OnClick;
end;

procedure TMapFrm.cbOnDblClickClick(Sender: TObject);
begin
  FGMMap.OnDblClick := nil;
  if cbOnDblClick.Checked then FGMMap.OnDblClick := OnDblClick;
end;

procedure TMapFrm.cbOnDragClick(Sender: TObject);
begin
  FGMMap.OnDrag := nil;
  if cbOnDrag.Checked then FGMMap.OnDrag := OnDrag;
end;

procedure TMapFrm.cbOnDragEndClick(Sender: TObject);
begin
  FGMMap.OnDragEnd := nil;
  if cbOnDragEnd.Checked then FGMMap.OnDragEnd := OnDragEnd;
end;

procedure TMapFrm.cbOnDragStartClick(Sender: TObject);
begin
  FGMMap.OnDragStart := nil;
  if cbOnDragStart.Checked then FGMMap.OnDragStart := OnDragStart;
end;

procedure TMapFrm.cbOnIntervalEventsChangeClick(Sender: TObject);
begin
  FGMMap.OnIntervalEventsChange := nil;
  if cbOnIntervalEventsChange.Checked then FGMMap.OnIntervalEventsChange := OnIntervalEventsChange;
end;

procedure TMapFrm.cbOnMapTypeIdChangedClick(Sender: TObject);
begin
  FGMMap.OnMapTypeIdChanged := nil;
  if cbOnMapTypeIdChanged.Checked then FGMMap.OnMapTypeIdChanged := OnMapTypeIdChanged;
end;

procedure TMapFrm.cbOnMouseMoveClick(Sender: TObject);
begin
  FGMMap.OnMouseMove := nil;
  if cbOnMouseMove.Checked then FGMMap.OnMouseMove := OnMouseMove;
end;

procedure TMapFrm.cbOnMouseOutClick(Sender: TObject);
begin
  FGMMap.OnMouseOut := nil;
  if cbOnMouseOut.Checked then FGMMap.OnMouseOut := OnMouseOut;
end;

procedure TMapFrm.cbOnMouseOverClick(Sender: TObject);
begin
  FGMMap.OnMouseOver := nil;
  if cbOnMouseOver.Checked then FGMMap.OnMouseOver := OnMouseOver;
end;

procedure TMapFrm.cbOnPrecisionChangeClick(Sender: TObject);
begin
  FGMMap.OnPrecisionChange := nil;
  if cbOnPrecisionChange.Checked then FGMMap.OnPrecisionChange := OnPrecisionChange;
end;

procedure TMapFrm.cbOnRightClickClick(Sender: TObject);
begin
  FGMMap.OnRightClick := nil;
  if cbOnRightClick.Checked then FGMMap.OnRightClick := OnRightClick;
end;

procedure TMapFrm.cbOnZoomChangedClick(Sender: TObject);
begin
  FGMMap.OnZoomChanged := nil;
  if cbOnZoomChanged.Checked then FGMMap.OnZoomChanged := OnZoomChanged;
end;

procedure TMapFrm.cbOverOpenedClick(Sender: TObject);
begin
  FGMMap.VisualProp.OverviewMapCtrl.Opened := cbOverOpened.Checked;
end;

procedure TMapFrm.cbPanoClick(Sender: TObject);
begin
  FGMMap.Layers.Panoramio.Show := cbPano.Checked;
end;

procedure TMapFrm.cbPanoClickableClick(Sender: TObject);
begin
  FGMMap.Layers.Panoramio.Clickable := cbPanoClickable.Checked;
end;

procedure TMapFrm.cbPanoFilteredClick(Sender: TObject);
begin
  FGMMap.Layers.Panoramio.Filtered := cbPanoFiltered.Checked;
end;

procedure TMapFrm.cbPanPosChange(Sender: TObject);
begin
  FGMMap.VisualProp.PanCtrl.Position := TTransform.StrToPosition(cbPanPos.Text);
end;

procedure TMapFrm.cbRoratePosChange(Sender: TObject);
begin
  FGMMap.VisualProp.RotateCtrl.Position := TTransform.StrToPosition(cbRoratePos.Text);
end;

procedure TMapFrm.cbScalePosChange(Sender: TObject);
begin
  FGMMap.VisualProp.ScaleCtrl.Position := TTransform.StrToPosition(cbScalePos.Text);
end;

procedure TMapFrm.cbScaleStyleChange(Sender: TObject);
begin
  FGMMap.VisualProp.ScaleCtrl.Style := TTransform.StrToScaleControlStyle(cbScaleStyle.Text);
end;

procedure TMapFrm.cbShowMapTypeClick(Sender: TObject);
begin
  FGMMap.VisualProp.MapTypeCtrl.Show := cbShowMapType.Checked;
end;

procedure TMapFrm.cbShowOverClick(Sender: TObject);
begin
  FGMMap.VisualProp.OverviewMapCtrl.Show := cbShowOver.Checked;
end;

procedure TMapFrm.cbShowPanClick(Sender: TObject);
begin
  FGMMap.VisualProp.PanCtrl.Show := cbShowPan.Checked;
end;

procedure TMapFrm.cbShowRotateClick(Sender: TObject);
begin
  FGMMap.VisualProp.RotateCtrl.Show := cbShowRotate.Checked;
end;

procedure TMapFrm.cbShowScaleClick(Sender: TObject);
begin
  FGMMap.VisualProp.ScaleCtrl.Show := cbShowScale.Checked;
end;

procedure TMapFrm.cbShowZoomClick(Sender: TObject);
begin
  FGMMap.VisualProp.ZoomCtrl.Show := cbShowZoom.Checked;
end;

procedure TMapFrm.cbStreetViewPosChange(Sender: TObject);
begin
  FGMMap.VisualProp.StreetViewCtrl.Position := TTransform.StrToPosition(cbStreetViewPos.Text);
end;

procedure TMapFrm.cbSVVisibleClick(Sender: TObject);
begin
  FGMMap.StreetView.Visible := cbSVVisible.Checked;
end;

procedure TMapFrm.cbTrafficClick(Sender: TObject);
begin
  FGMMap.Layers.Traffic.Show := cbTraffic.Checked;
end;

procedure TMapFrm.cbTransitClick(Sender: TObject);
begin
  FGMMap.Layers.Transit.Show := cbTransit.Checked;
end;

procedure TMapFrm.cbTypeMapChange(Sender: TObject);
begin
  FGMMap.RequiredProp.MapType := TTransform.StrToMapTypeId(cbTypeMap.Text);
end;

procedure TMapFrm.cbWeatherClick(Sender: TObject);
begin
  FGMMap.Layers.Weather.Show := cbWeather.Checked;
end;

procedure TMapFrm.cbWeatherClickableClick(Sender: TObject);
begin
  FGMMap.Layers.Weather.Clickable := cbWeatherClickable.Checked;
end;

procedure TMapFrm.cbWeatherLabColChange(Sender: TObject);
begin
  FGMMap.Layers.Weather.LabelColor := TTransform.StrToLabelColor(cbWeatherLabCol.Text);
end;

procedure TMapFrm.cbWeatherSupInfoWinClick(Sender: TObject);
begin
  FGMMap.Layers.Weather.SuppressInfoWindows := cbWeatherSupInfoWin.Checked;
end;

procedure TMapFrm.cbWeatherTempUnitChange(Sender: TObject);
begin
  FGMMap.Layers.Weather.TemperatureUnit := TTransform.StrToTemperatureUnit(cbWeatherTempUnit.Text);
end;

procedure TMapFrm.cbWeatherWSUnitChange(Sender: TObject);
begin
  FGMMap.Layers.Weather.WindSpeedUnit := TTransform.StrToWindSpeedUnit(cbWeatherWSUnit.Text);
end;

procedure TMapFrm.cbWheelClick(Sender: TObject);
begin
  if cbWheel.Checked then
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options + [ScrollWheel]
  else
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options - [ScrollWheel];
end;

procedure TMapFrm.cbZoomClickClick(Sender: TObject);
begin
  if cbZoomClick.Checked then
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options + [DisableDoubleClickZoom]
  else
    FGMMap.NonVisualProp.Options := FGMMap.NonVisualProp.Options - [DisableDoubleClickZoom];
end;

procedure TMapFrm.cbZoomPosChange(Sender: TObject);
begin
  FGMMap.VisualProp.ZoomCtrl.Position := TTransform.StrToPosition(cbZoomPos.Text);
end;

procedure TMapFrm.cbZoomStyleChange(Sender: TObject);
begin
  FGMMap.VisualProp.ZoomCtrl.Style := TTransform.StrToZoomControlStyle(cbZoomStyle.Text);
end;

procedure TMapFrm.clbMapTypeClickCheck(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to clbMapType.Count - 1 do
    if clbMapType.Checked[i] then
      FGMMap.VisualProp.MapTypeCtrl.MapTypeIds := FGMMap.VisualProp.MapTypeCtrl.MapTypeIds + [TTransform.StrToMapTypeId(clbMapType.Items[i])]
    else
      FGMMap.VisualProp.MapTypeCtrl.MapTypeIds := FGMMap.VisualProp.MapTypeCtrl.MapTypeIds - [TTransform.StrToMapTypeId(clbMapType.Items[i])];
end;

constructor TMapFrm.Create(aOwner: TComponent; GMMap: TGMMap);
begin
  inherited Create(aOwner);

  pcPages.ActivePageIndex := 0;

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMMap := GMMap;
end;

procedure TMapFrm.eIntervalChange(Sender: TObject);
begin
  FGMMap.IntervalEvents := eInterval.Value;;
end;

procedure TMapFrm.eKmlUrlChange(Sender: TObject);
begin
  FGMMap.Layers.Kml.Url := eKmlUrl.Text;
end;

procedure TMapFrm.eMaxZoomChange(Sender: TObject);
begin
  FGMMap.NonVisualProp.MaxZoom := eMaxZoom.Value;;
end;

procedure TMapFrm.eMinZoomChange(Sender: TObject);
begin
  FGMMap.NonVisualProp.MinZoom := eMinZoom.Value;;
end;

procedure TMapFrm.ePanoFilterTagChange(Sender: TObject);
begin
  FGMMap.Layers.Panoramio.FilterTag := ePanoFilterTag.Text;
end;

procedure TMapFrm.ePanoFilterUserIdChange(Sender: TObject);
begin
  FGMMap.Layers.Panoramio.FilterUserId := ePanoFilterUserId.Text;
end;

procedure TMapFrm.ePrecisionChange(Sender: TObject);
begin
  FGMMap.Precision := ePrecision.Value;
end;

procedure TMapFrm.FormActivate(Sender: TObject);
begin
  GetInfo;
end;

procedure TMapFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMapFrm.GetInfo;
var
  i: Integer;
begin
  // General configuration
  cbActive.Checked := FGMMap.Active;
  eInterval.Value := FGMMap.IntervalEvents;
  case FGMMap.Language of
    Espanol: cbLanguages.ItemIndex := 0;
    English: cbLanguages.ItemIndex := 1;
    French: cbLanguages.ItemIndex := 2;
    PortuguesBR: cbLanguages.ItemIndex := 3;
    Danish: cbLanguages.ItemIndex := 4;
    German: cbLanguages.ItemIndex := 5;
  end;
  ePrecision.Value := FGMMap.Precision;

  // Required properties
  cbTypeMap.ItemIndex := cbTypeMap.Items.IndexOf(TTransform.MapTypeIdToStr(FGMMap.RequiredProp.MapType));
  tbZoom.Position := FGMMap.RequiredProp.Zoom;
  eReqLat.Text := FGMMap.RequiredProp.Center.LatToStr(FGMMap.Precision);
  eReqLng.Text := FGMMap.RequiredProp.Center.LngToStr(FGMMap.Precision);

  // Visual properties
  cbBGColor.Selected := TVisualProp(FGMMap.VisualProp).BGColor;
  cbShowOver.Checked := FGMMap.VisualProp.OverviewMapCtrl.Show;
  cbOverOpened.Checked := FGMMap.VisualProp.OverviewMapCtrl.Opened;
  cbShowPan.Checked := FGMMap.VisualProp.PanCtrl.Show;
  cbPanPos.ItemIndex := cbPanPos.Items.IndexOf(TTransform.PositionToStr(FGMMap.VisualProp.PanCtrl.Position));
  cbShowRotate.Checked := FGMMap.VisualProp.RotateCtrl.Show;
  cbRoratePos.ItemIndex := cbRoratePos.Items.IndexOf(TTransform.PositionToStr(FGMMap.VisualProp.RotateCtrl.Position));
  cbShowStreetView.Checked := FGMMap.VisualProp.StreetViewCtrl.Show;
  cbStreetViewPos.ItemIndex := cbStreetViewPos.Items.IndexOf(TTransform.PositionToStr(FGMMap.VisualProp.StreetViewCtrl.Position));
  cbShowMapType.Checked := FGMMap.VisualProp.MapTypeCtrl.Show;
  cbMapTypePos.ItemIndex := cbMapTypePos.Items.IndexOf(TTransform.PositionToStr(FGMMap.VisualProp.MapTypeCtrl.Position));
  cbMapTypeStyle.ItemIndex := cbMapTypeStyle.Items.IndexOf(TTransform.MapTypeControlStyleToStr(FGMMap.VisualProp.MapTypeCtrl.Style));
  for i := 0 to clbMapType.Count - 1 do
    clbMapType.Checked[i] := TTransform.StrToMapTypeId(clbMapType.Items[i]) in FGMMap.VisualProp.MapTypeCtrl.MapTypeIds;
  cbShowScale.Checked := FGMMap.VisualProp.ScaleCtrl.Show;
  cbScalePos.ItemIndex := cbScalePos.Items.IndexOf(TTransform.PositionToStr(FGMMap.VisualProp.ScaleCtrl.Position));
  cbScaleStyle.ItemIndex := cbScaleStyle.Items.IndexOf(TTransform.ScaleControlStyleToStr(FGMMap.VisualProp.ScaleCtrl.Style));
  cbShowZoom.Checked := FGMMap.VisualProp.ZoomCtrl.Show;
  cbZoomPos.ItemIndex := cbZoomPos.Items.IndexOf(TTransform.PositionToStr(FGMMap.VisualProp.ZoomCtrl.Position));
  cbZoomStyle.ItemIndex := cbZoomStyle.Items.IndexOf(TTransform.ZoomControlStyleToStr(FGMMap.VisualProp.ZoomCtrl.Style));

  // Non visual properties
  cbZoomClick.Checked := DisableDoubleClickZoom in FGMMap.NonVisualProp.Options;
  cbDraggable.Checked := Draggable in FGMMap.NonVisualProp.Options;
  cbNoClear.Checked := NoClear in FGMMap.NonVisualProp.Options;
  cbKeyboard.Checked := KeyboardShortcuts in FGMMap.NonVisualProp.Options;
  cbWheel.Checked := ScrollWheel in FGMMap.NonVisualProp.Options;
  cbMarker.Checked := FGMMap.NonVisualProp.MapMaker;
  eMaxZoom.Value := FGMMap.NonVisualProp.MaxZoom;
  eMinZoom.Value := FGMMap.NonVisualProp.MinZoom;

  // Layers
  cbBicycling.Checked := FGMMap.Layers.Bicycling.Show;
  cbPano.Checked := FGMMap.Layers.Panoramio.Show;
  cbTraffic.Checked := FGMMap.Layers.Traffic.Show;
  cbTransit.Checked := FGMMap.Layers.Transit.Show;
  cbWeather.Checked := FGMMap.Layers.Weather.Show;
  cbPanoClickable.Checked := FGMMap.Layers.Panoramio.Clickable;
  cbPanoFiltered.Checked := FGMMap.Layers.Panoramio.Filtered;
  ePanoFilterTag.Text := FGMMap.Layers.Panoramio.FilterTag;
  ePanoFilterUserId.Text := FGMMap.Layers.Panoramio.FilterUserId;
  cbWeatherSupInfoWin.Checked := FGMMap.Layers.Weather.SuppressInfoWindows;
  cbWeatherClickable.Checked := FGMMap.Layers.Weather.Clickable;
  cbWeatherLabCol.ItemIndex := cbWeatherLabCol.Items.IndexOf(TTransform.LabelColorToStr(FGMMap.Layers.Weather.LabelColor));
  cbWeatherTempUnit.ItemIndex := cbWeatherTempUnit.Items.IndexOf(TTransform.TemperatureUnitToStr(FGMMap.Layers.Weather.TemperatureUnit));
  cbWeatherWSUnit.ItemIndex := cbWeatherWSUnit.Items.IndexOf(TTransform.WindSpeedUnitToStr(FGMMap.Layers.Weather.WindSpeedUnit));
  cbKml.Checked := FGMMap.Layers.Kml.Show;
  cbKmlClic.Checked := FGMMap.Layers.Kml.Clickable;
  cbKmlPreserve.Checked := FGMMap.Layers.Kml.PreserveViewport;
  cbKmlScreenOver.Checked := FGMMap.Layers.Kml.ScreenOverlays;
  cbKmlSupInfWin.Checked := FGMMap.Layers.Kml.SuppressInfoWindows;
  eKmlUrl.Text := FGMMap.Layers.Kml.Url;

  // StreetView
  cbSVVisible.Checked := FGMMap.StreetView.Visible;

  // Events
  cbOnBoundsChanged.Checked := Assigned(FGMMap.OnBoundsChanged);
  cbOnCenterChanged.Checked := Assigned(FGMMap.OnCenterChanged);
  cbOnClick.Checked := Assigned(FGMMap.OnClick);
  cbOnDblClick.Checked := Assigned(FGMMap.OnDblClick);
  cbOnDrag.Checked := Assigned(FGMMap.OnDrag);
  cbOnDragEnd.Checked := Assigned(FGMMap.OnDragEnd);
  cbOnDragStart.Checked := Assigned(FGMMap.OnDragStart);
  cbOnIntervalEventsChange.Checked := Assigned(FGMMap.OnIntervalEventsChange);
  cbOnMapTypeIdChanged.Checked := Assigned(FGMMap.OnMapTypeIdChanged);
  cbOnMouseMove.Checked := Assigned(FGMMap.OnMouseMove);
  cbOnMouseOut.Checked := Assigned(FGMMap.OnMouseOut);
  cbOnMouseOver.Checked := Assigned(FGMMap.OnMouseOver);
  cbOnPrecisionChange.Checked := Assigned(FGMMap.OnPrecisionChange);
  cbOnRightClick.Checked := Assigned(FGMMap.OnRightClick);
  cbOnZoomChanged.Checked := Assigned(FGMMap.OnZoomChanged);
end;

procedure TMapFrm.tbZoomChange(Sender: TObject);
begin
  FGMMap.RequiredProp.Zoom := tbZoom.Position;
end;

end.
