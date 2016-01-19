unit UDirectionsFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Spin, TeEngine, Series, TeeProcs, Chart,
  GMDirectionVCL, GMElevationVCL;

type
  TDirectionsFrm = class(TForm)
    pcData: TPageControl;
    tsDirection: TTabSheet;
    tsResults: TTabSheet;
    tsRequest: TTabSheet;
    tsRenderer: TTabSheet;
    cbAutoShow: TCheckBox;
    cbDeleteOthers: TCheckBox;
    cbAvoidTolls: TCheckBox;
    cbAvoidHighways: TCheckBox;
    cbProvideRouteAlt: TCheckBox;
    cbOptimizeWaypoints: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label37: TLabel;
    Label36: TLabel;
    eOAddress: TEdit;
    eOLat: TEdit;
    eOLng: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    eDAddress: TEdit;
    eDLat: TEdit;
    eDLng: TEdit;
    Label5: TLabel;
    cbRegion: TComboBox;
    cbTravelMode: TComboBox;
    Label6: TLabel;
    cbUnitSystem: TComboBox;
    Label7: TLabel;
    lbWaypoints: TListBox;
    Label8: TLabel;
    eArrDate: TDateTimePicker;
    eArrTime: TDateTimePicker;
    Label9: TLabel;
    eDepTime: TDateTimePicker;
    eDepDate: TDateTimePicker;
    Label10: TLabel;
    bUp: TButton;
    bDown: TButton;
    bNew: TButton;
    bDel: TButton;
    bSearch: TButton;
    cbDraggable: TCheckBox;
    cbPreserveViewport: TCheckBox;
    cbSuppressBicyclingLayer: TCheckBox;
    cbSuppressInfoWindows: TCheckBox;
    cbSuppressMarkers: TCheckBox;
    cbSuppressPolylines: TCheckBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    eIcon: TEdit;
    cbMClickable: TCheckBox;
    cbMDraggable: TCheckBox;
    cbMFlat: TCheckBox;
    GroupBox4: TGroupBox;
    cbPClickable: TCheckBox;
    cbPGeodesic: TCheckBox;
    eStrokeWeight: TSpinEdit;
    Label38: TLabel;
    eStrokeOpacity: TEdit;
    Label12: TLabel;
    cbStrokeColor: TColorBox;
    Label13: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label14: TLabel;
    lbResults: TListBox;
    pcResult: TPageControl;
    tsGeneral: TTabSheet;
    tsXML: TTabSheet;
    mXMLData: TMemo;
    Label15: TLabel;
    eStatus: TEdit;
    Label16: TLabel;
    eRoutes: TEdit;
    tvItems: TTreeView;
    Label17: TLabel;
    eIndex: TEdit;
    lIndex: TLabel;
    cbHidde: TCheckBox;
    bDelResult: TButton;
    tsOptions: TTabSheet;
    cbResDraggable: TCheckBox;
    cbResSuppressInfoWindows: TCheckBox;
    cbResSuppressMarkers: TCheckBox;
    cbResPreserveViewport: TCheckBox;
    cbResSuppressBicyclingLayer: TCheckBox;
    cbResSuppressPolylines: TCheckBox;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    eResIcon: TEdit;
    cbResMClickable: TCheckBox;
    cbResMDraggable: TCheckBox;
    cbResMFlat: TCheckBox;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cbResPClickable: TCheckBox;
    cbResPGeodesic: TCheckBox;
    eResStrokeWeight: TSpinEdit;
    eResStrokeOpacity: TEdit;
    cbResStrokeColor: TColorBox;
    tsElevation: TTabSheet;
    Panel1: TPanel;
    Shape1: TShape;
    Label22: TLabel;
    lbElevations: TListBox;
    rbAlongPath: TRadioButton;
    rbForLocation: TRadioButton;
    eSamples: TSpinEdit;
    Chart1: TChart;
    Series1: TAreaSeries;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bSearchClick(Sender: TObject);
    procedure cbAutoShowClick(Sender: TObject);
    procedure cbDeleteOthersClick(Sender: TObject);
    procedure cbAvoidHighwaysClick(Sender: TObject);
    procedure cbAvoidTollsClick(Sender: TObject);
    procedure cbOptimizeWaypointsClick(Sender: TObject);
    procedure cbProvideRouteAltClick(Sender: TObject);
    procedure eOAddressChange(Sender: TObject);
    procedure eDAddressChange(Sender: TObject);
    procedure eOLatChange(Sender: TObject);
    procedure eOLngChange(Sender: TObject);
    procedure eDLatChange(Sender: TObject);
    procedure eDLngChange(Sender: TObject);
    procedure eArrDateChange(Sender: TObject);
    procedure eDepDateChange(Sender: TObject);
    procedure eArrTimeChange(Sender: TObject);
    procedure eDepTimeChange(Sender: TObject);
    procedure cbUnitSystemChange(Sender: TObject);
    procedure cbTravelModeChange(Sender: TObject);
    procedure cbRegionChange(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure cbDraggableClick(Sender: TObject);
    procedure cbPreserveViewportClick(Sender: TObject);
    procedure cbSuppressBicyclingLayerClick(Sender: TObject);
    procedure cbSuppressInfoWindowsClick(Sender: TObject);
    procedure cbSuppressMarkersClick(Sender: TObject);
    procedure cbSuppressPolylinesClick(Sender: TObject);
    procedure cbMClickableClick(Sender: TObject);
    procedure cbMDraggableClick(Sender: TObject);
    procedure cbMFlatClick(Sender: TObject);
    procedure eIconChange(Sender: TObject);
    procedure cbPClickableClick(Sender: TObject);
    procedure cbPGeodesicClick(Sender: TObject);
    procedure cbStrokeColorChange(Sender: TObject);
    procedure eStrokeOpacityChange(Sender: TObject);
    procedure eStrokeWeightChange(Sender: TObject);
    procedure lbResultsClick(Sender: TObject);
    procedure tvItemsChange(Sender: TObject; Node: TTreeNode);
    procedure bDelResultClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure cbResDraggableClick(Sender: TObject);
    procedure cbResSuppressInfoWindowsClick(Sender: TObject);
    procedure cbResSuppressBicyclingLayerClick(Sender: TObject);
    procedure cbResPreserveViewportClick(Sender: TObject);
    procedure cbResSuppressMarkersClick(Sender: TObject);
    procedure cbResSuppressPolylinesClick(Sender: TObject);
    procedure cbResMClickableClick(Sender: TObject);
    procedure cbResMDraggableClick(Sender: TObject);
    procedure cbResMFlatClick(Sender: TObject);
    procedure cbResPClickableClick(Sender: TObject);
    procedure cbResPGeodesicClick(Sender: TObject);
    procedure eResIconChange(Sender: TObject);
    procedure cbResStrokeColorChange(Sender: TObject);
    procedure eResStrokeOpacityChange(Sender: TObject);
    procedure eResStrokeWeightChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FGMDir: TGMDirection;
    FGMElev: TGMElevation;
    procedure GetInfo;
    procedure FillResults;
  public
    constructor Create(aOwner: TComponent; GMDir: TGMDirection; GMElev: TGMElevation); reintroduce; virtual;
  end;

var
  DirectionsFrm: TDirectionsFrm;

implementation

uses
  {IOUtils, }ExtActns,
  GMFunctionsVCL, UWaypointFrm, GMConstants, GMDirection;

{$R *.dfm}

procedure TDirectionsFrm.bDelClick(Sender: TObject);
begin
  if lbWaypoints.ItemIndex = -1 then Exit;

  FGMDir.DirectionsRequest.WaypointsList.Delete(lbWaypoints.ItemIndex);
  lbWaypoints.DeleteSelected;
end;

procedure TDirectionsFrm.bDelResultClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;
  FGMDir.Delete(lbResults.ItemIndex);
  lbResults.DeleteSelected;
  tvItems.Items.Clear;
  eStatus.Text := '';
  eRoutes.Text := '';
  eIndex.Text := '';
end;

procedure TDirectionsFrm.bDownClick(Sender: TObject);
begin
  if lbWaypoints.ItemIndex = -1 then Exit;
  if lbWaypoints.ItemIndex = lbWaypoints.Count - 1 then Exit;

  FGMDir.DirectionsRequest.WaypointsList.Move(lbWaypoints.ItemIndex, lbWaypoints.ItemIndex+1);
  lbWaypoints.Items.Move(lbWaypoints.ItemIndex, lbWaypoints.ItemIndex+1);
end;

procedure TDirectionsFrm.bNewClick(Sender: TObject);
var
  WPF: TWaypointFrm;
  WP: TWaypoint;
begin
  WPF := TWaypointFrm.Create(nil);
  try
    if WPF.ShowModal = mrOk then
    begin
      WP := FGMDir.AddWaypoint;
      WP.Location.Address := WPF.eAddress.Text;
      WP.Location.LatLng.Lat := WP.Location.LatLng.StringToReal(WPF.eLat.Text);
      WP.Location.LatLng.Lng := WP.Location.LatLng.StringToReal(WPF.eLng.Text);
      WP.StopOver := WPF.cbStopOver.Checked;
      WP.Title := WPF.eTitle.Text;

      lbWaypoints.ItemIndex := lbWaypoints.Items.Add(WP.Title);
    end;
  finally
    FreeAndNil(WPF);
  end;
end;

procedure TDirectionsFrm.bSearchClick(Sender: TObject);
begin
  FGMDir.Execute;
  FillResults;
  pcData.ActivePage := tsResults;
end;

procedure TDirectionsFrm.bUpClick(Sender: TObject);
begin
  if lbWaypoints.ItemIndex = -1 then Exit;
  if lbWaypoints.ItemIndex = 0 then Exit;

  FGMDir.DirectionsRequest.WaypointsList.Move(lbWaypoints.ItemIndex, lbWaypoints.ItemIndex-1);
  lbWaypoints.Items.Move(lbWaypoints.ItemIndex, lbWaypoints.ItemIndex-1);
end;

procedure TDirectionsFrm.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  if not Assigned(tvItems.Selected) then
  begin
    ShowMessage('You need to select a route');
    pcResult.ActivePage := tsGeneral;
    Exit;
  end;

  if tvItems.Selected.Level = 0 then
  begin
    FGMElev.Clear;
    for i := 0 to FGMDir[lbResults.ItemIndex].Routes[tvItems.Selected.Index].CountOverviewPath - 1 do
      FGMElev.AddLatLng(FGMDir[lbResults.ItemIndex].Routes[tvItems.Selected.Index].OverviewPath[i]);
    if rbAlongPath.Checked then FGMElev.ElevationType := etAlongPath;
    if rbForLocation.Checked then FGMElev.ElevationType := etForLocations;
    FGMElev.Samples := eSamples.Value;
    FGMElev.Execute;

    lbElevations.Clear;
    Series1.Clear;
    for i := 0 to FGMElev.ElevationResult.Count - 1 do
    begin
      lbElevations.Items.Add(FGMElev.ElevationResult[i].Location.ToStr(FGMElev.Map.Precision) + ' => ' + FormatFloat('#,##0.####', FGMElev.ElevationResult[i].Elevation));
      Series1.Add(FGMElev.ElevationResult[i].Elevation, '', clBlack);
    end;
  end
  else
  begin
    ShowMessage('You need to select a Node level 0 on TreeView of Routes');
    pcResult.ActivePage := tsGeneral;
  end;
end;

procedure TDirectionsFrm.cbAutoShowClick(Sender: TObject);
begin
  FGMDir.AutoShow := cbAutoShow.Checked;
end;

procedure TDirectionsFrm.cbAvoidHighwaysClick(Sender: TObject);
begin
  FGMDir.DirectionsRequest.AvoidHighways := cbAvoidHighways.Checked;
end;

procedure TDirectionsFrm.cbAvoidTollsClick(Sender: TObject);
begin
  FGMDir.DirectionsRequest.AvoidTolls := cbAvoidTolls.Checked;
end;

procedure TDirectionsFrm.cbDeleteOthersClick(Sender: TObject);
begin
  FGMDir.HiddeOthers := cbDeleteOthers.Checked;
end;

procedure TDirectionsFrm.cbDraggableClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.Draggable := cbDraggable.Checked;
end;

procedure TDirectionsFrm.cbMClickableClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.MarkerOptions.Clickable := cbMClickable.Checked;
end;

procedure TDirectionsFrm.cbMDraggableClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.MarkerOptions.Draggable := cbMDraggable.Checked;
end;

procedure TDirectionsFrm.cbMFlatClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.MarkerOptions.Flat := cbMFlat.Checked;
end;

procedure TDirectionsFrm.cbOptimizeWaypointsClick(Sender: TObject);
begin
  FGMDir.DirectionsRequest.OptimizeWaypoints := cbOptimizeWaypoints.Checked;
end;

procedure TDirectionsFrm.cbPClickableClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.PolylineOptions.Clickable := cbPClickable.Checked;
end;

procedure TDirectionsFrm.cbPGeodesicClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.PolylineOptions.Geodesic := cbPGeodesic.Checked;
end;

procedure TDirectionsFrm.cbPreserveViewportClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.PreserveViewport := cbPreserveViewport.Checked;
end;

procedure TDirectionsFrm.cbProvideRouteAltClick(Sender: TObject);
begin
  FGMDir.DirectionsRequest.ProvideRouteAlt := cbProvideRouteAlt.Checked;
end;

procedure TDirectionsFrm.cbRegionChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Region := TTransform.StrToRegion2(cbRegion.Text);
end;

procedure TDirectionsFrm.cbResDraggableClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.Draggable := cbResDraggable.Checked;
end;

procedure TDirectionsFrm.cbResMClickableClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.MarkerOptions.Clickable := cbResMClickable.Checked;
end;

procedure TDirectionsFrm.cbResMDraggableClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.MarkerOptions.Draggable := cbResMDraggable.Checked;
end;

procedure TDirectionsFrm.cbResMFlatClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.MarkerOptions.Flat := cbResMFlat.Checked;
end;

procedure TDirectionsFrm.cbResPClickableClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.PolylineOptions.Clickable := cbResPClickable.Checked;
end;

procedure TDirectionsFrm.cbResPGeodesicClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.PolylineOptions.Geodesic := cbResPGeodesic.Checked;
end;

procedure TDirectionsFrm.cbResPreserveViewportClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.PreserveViewport := cbResPreserveViewport.Checked;
end;

procedure TDirectionsFrm.cbResStrokeColorChange(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  TPolylineOptions(FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.PolylineOptions).StrokeColor := cbResStrokeColor.Selected;
end;

procedure TDirectionsFrm.cbResSuppressBicyclingLayerClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.SuppressBicyclingLayer := cbResSuppressBicyclingLayer.Checked;
end;

procedure TDirectionsFrm.cbResSuppressInfoWindowsClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.SuppressInfoWindows := cbResSuppressInfoWindows.Checked;
end;

procedure TDirectionsFrm.cbResSuppressMarkersClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.SuppressMarkers := cbResSuppressMarkers.Checked;
end;

procedure TDirectionsFrm.cbResSuppressPolylinesClick(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.SuppressPolylines := cbResSuppressPolylines.Checked;
end;

procedure TDirectionsFrm.cbStrokeColorChange(Sender: TObject);
begin
  TPolylineOptions(FGMDir.DirectionsRender.PolylineOptions).StrokeColor := cbStrokeColor.Selected;
end;

procedure TDirectionsFrm.cbSuppressBicyclingLayerClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.SuppressBicyclingLayer := cbSuppressBicyclingLayer.Checked;
end;

procedure TDirectionsFrm.cbSuppressInfoWindowsClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.SuppressInfoWindows := cbSuppressInfoWindows.Checked;
end;

procedure TDirectionsFrm.cbSuppressMarkersClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.SuppressMarkers := cbSuppressMarkers.Checked;
end;

procedure TDirectionsFrm.cbSuppressPolylinesClick(Sender: TObject);
begin
  FGMDir.DirectionsRender.SuppressPolylines := cbSuppressPolylines.Checked;
end;

procedure TDirectionsFrm.cbTravelModeChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.TravelMode := TTransform.StrToTravelMode(cbTravelMode.Text);
end;

procedure TDirectionsFrm.cbUnitSystemChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.UnitSystem := TTransform.StrToUnitSystem(cbUnitSystem.Text);
end;

constructor TDirectionsFrm.Create(aOwner: TComponent; GMDir: TGMDirection;
  GMElev: TGMElevation);
begin
  inherited Create(aOwner);

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMDir := GMDir;
  FGMElev := GMElev;

  pcData.ActivePageIndex := 0;
  Series1.Clear;
end;

procedure TDirectionsFrm.eArrDateChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.TransitOpt.ArrivalDate := eArrDate.Date;
end;

procedure TDirectionsFrm.eArrTimeChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.TransitOpt.ArrivalTime := eArrTime.Time;
end;

procedure TDirectionsFrm.eDAddressChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Destination.Address := eDAddress.Text;
end;

procedure TDirectionsFrm.eDepDateChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.TransitOpt.DepartureDate := eDepDate.Date;
end;

procedure TDirectionsFrm.eDepTimeChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.TransitOpt.DepartureTime := eDepTime.Time;
end;

procedure TDirectionsFrm.eDLatChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Destination.LatLng.Lat := FGMDir.DirectionsRequest.Destination.LatLng.StringToReal(eDLat.Text);
end;

procedure TDirectionsFrm.eDLngChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Destination.LatLng.Lng := FGMDir.DirectionsRequest.Destination.LatLng.StringToReal(eDLng.Text);
end;

procedure TDirectionsFrm.eIconChange(Sender: TObject);
begin
  FGMDir.DirectionsRender.MarkerOptions.Icon := eIcon.Text;
end;

procedure TDirectionsFrm.eOAddressChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Origin.Address := eOAddress.Text;
end;

procedure TDirectionsFrm.eOLatChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Origin.LatLng.Lat := FGMDir.DirectionsRequest.Origin.LatLng.StringToReal(eOLat.Text);
end;

procedure TDirectionsFrm.eOLngChange(Sender: TObject);
begin
  FGMDir.DirectionsRequest.Origin.LatLng.Lng := FGMDir.DirectionsRequest.Origin.LatLng.StringToReal(eOLng.Text);
end;

procedure TDirectionsFrm.eResIconChange(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.MarkerOptions.Icon := eResIcon.Text;
end;

procedure TDirectionsFrm.eResStrokeOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbResults.ItemIndex = -1 then Exit;

  if TryStrToFloat(eStrokeOpacity.Text, Tmp) then
    FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.PolylineOptions.StrokeOpacity := Tmp;
end;

procedure TDirectionsFrm.eResStrokeWeightChange(Sender: TObject);
begin
  if lbResults.ItemIndex = -1 then Exit;

  FGMDir.DirectionsResult[lbResults.ItemIndex].DirectionsRender.PolylineOptions.StrokeWeight := eResStrokeWeight.Value;
end;

procedure TDirectionsFrm.eStrokeOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if TryStrToFloat(eStrokeOpacity.Text, Tmp) then
    FGMDir.DirectionsRender.PolylineOptions.StrokeOpacity := Tmp;
end;

procedure TDirectionsFrm.eStrokeWeightChange(Sender: TObject);
begin
  FGMDir.DirectionsRender.PolylineOptions.StrokeWeight := eStrokeWeight.Value;
end;

procedure TDirectionsFrm.FillResults;
var
  i: Integer;
begin
  lbResults.Clear;
  for i := 0 to FGMDir.Count - 1 do
    lbResults.Items.Add(FGMDir.DirectionsResult[i].FromTo);

  if lbResults.Items.Count > 0 then
    lbResults.ItemIndex := 0;
  if tvItems.Items.Count > 0 then
    tvItems.Select(tvItems.Items[0]);
end;

procedure TDirectionsFrm.FormActivate(Sender: TObject);
begin
  GetInfo;
end;

procedure TDirectionsFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TDirectionsFrm.GetInfo;
var
  i: Integer;
begin
  cbAutoShow.Checked := FGMDir.AutoShow;
  cbDeleteOthers.Checked := FGMDir.HiddeOthers;

  cbAvoidTolls.Checked := FGMDir.DirectionsRequest.AvoidTolls;
  cbAvoidHighways.Checked := FGMDir.DirectionsRequest.AvoidHighways;
  cbOptimizeWaypoints.Checked := FGMDir.DirectionsRequest.OptimizeWaypoints;
  cbProvideRouteAlt.Checked := FGMDir.DirectionsRequest.ProvideRouteAlt;
  eOAddress.Text := FGMDir.DirectionsRequest.Origin.Address;
  eOLat.Text := FGMDir.DirectionsRequest.Origin.LatLng.LatToStr(FGMDir.Map.Precision);
  eOLng.Text := FGMDir.DirectionsRequest.Origin.LatLng.LngToStr(FGMDir.Map.Precision);
  eDAddress.Text := FGMDir.DirectionsRequest.Destination.Address;
  eDLat.Text := FGMDir.DirectionsRequest.Destination.LatLng.LatToStr(FGMDir.Map.Precision);
  eDLng.Text := FGMDir.DirectionsRequest.Destination.LatLng.LngToStr(FGMDir.Map.Precision);
  eArrDate.Date := FGMDir.DirectionsRequest.TransitOpt.ArrivalDate;
  eArrTime.Time := FGMDir.DirectionsRequest.TransitOpt.ArrivalTime;
  eDepDate.Date := FGMDir.DirectionsRequest.TransitOpt.DepartureDate;
  eDepTime.Time := FGMDir.DirectionsRequest.TransitOpt.DepartureTime;
  cbTravelMode.ItemIndex := cbTravelMode.Items.IndexOf(TTransform.TravelModeToStr(FGMDir.DirectionsRequest.TravelMode));
  cbUnitSystem.ItemIndex := cbUnitSystem.Items.IndexOf(TTransform.UnitSystemToStr(FGMDir.DirectionsRequest.UnitSystem));
  cbRegion.ItemIndex := cbRegion.Items.IndexOf(TTransform.RegionToStr2(FGMDir.DirectionsRequest.Region));
  lbWaypoints.Clear;
  for i := 0 to FGMDir.DirectionsRequest.Count - 1 do
    lbWaypoints.Items.Add(FGMDir.DirectionsRequest[i].Title);

  cbDraggable.Checked := FGMDir.DirectionsRender.Draggable;
  cbPreserveViewport.Checked := FGMDir.DirectionsRender.PreserveViewport;
  cbSuppressBicyclingLayer.Checked := FGMDir.DirectionsRender.SuppressBicyclingLayer;
  cbSuppressInfoWindows.Checked := FGMDir.DirectionsRender.SuppressInfoWindows;
  cbSuppressMarkers.Checked := FGMDir.DirectionsRender.SuppressMarkers;
  cbSuppressPolylines.Checked := FGMDir.DirectionsRender.SuppressPolylines;
  eIcon.Text := FGMDir.DirectionsRender.MarkerOptions.Icon;
  cbMClickable.Checked := FGMDir.DirectionsRender.MarkerOptions.Clickable;
  cbMDraggable.Checked := FGMDir.DirectionsRender.MarkerOptions.Draggable;
  cbMFlat.Checked := FGMDir.DirectionsRender.MarkerOptions.Flat;
  cbStrokeColor.Selected := TPolylineOptions(FGMDir.DirectionsRender.PolylineOptions).StrokeColor;
  eStrokeOpacity.Text := FloatToStr(FGMDir.DirectionsRender.PolylineOptions.StrokeOpacity);
  eStrokeWeight.Value := FGMDir.DirectionsRender.PolylineOptions.StrokeWeight;
  cbPClickable.Checked := FGMDir.DirectionsRender.PolylineOptions.Clickable;
  cbPGeodesic.Checked := FGMDir.DirectionsRender.PolylineOptions.Geodesic;

  FillResults;
end;

procedure TDirectionsFrm.lbResultsClick(Sender: TObject);
var
  i, j, k: Integer;
  Node1, Node2,
  Node3, Node4,
  Node5, Node6: TTreeNode;
  Sec: TTime;
  Met: Integer;
  MetStr: string;
begin
  if lbResults.ItemIndex = -1 then Exit;

//  ShowMessage(FGMDir.DirectionsResult[0].Routes[0].Sumary + ' - ' + FGMDir.DirectionsResult[lbResults.ItemIndex].Routes[0].Sumary);
  with FGMDir.DirectionsResult[lbResults.ItemIndex] do
  begin
    // general properties
    mXMLData.Lines.Text := XMLData.Text;
    eStatus.Text := TTransform.DirectionsStatusToStr(Status);
    eRoutes.Text := IntToStr(Count);
    eIndex.Text := IntToStr(Index);

    // rendered properties
    cbResDraggable.Checked := DirectionsRender.Draggable;
    cbResPreserveViewport.Checked := DirectionsRender.PreserveViewport;
    cbResSuppressInfoWindows.Checked := DirectionsRender.SuppressInfoWindows;
    cbResSuppressMarkers.Checked := DirectionsRender.SuppressMarkers;
    cbResSuppressBicyclingLayer.Checked := DirectionsRender.SuppressBicyclingLayer;
    cbResSuppressPolylines.Checked := DirectionsRender.SuppressPolylines;
    eResIcon.Text := DirectionsRender.MarkerOptions.Icon;
    cbResMClickable.Checked := DirectionsRender.MarkerOptions.Clickable;
    cbResMDraggable.Checked := DirectionsRender.MarkerOptions.Draggable;
    cbResMFlat.Checked := DirectionsRender.MarkerOptions.Flat;
    cbResStrokeColor.Selected := TPolylineOptions(DirectionsRender.PolylineOptions).StrokeColor;
    eResStrokeOpacity.Text := FloatToStr(DirectionsRender.PolylineOptions.StrokeOpacity);
    eResStrokeWeight.Value := DirectionsRender.PolylineOptions.StrokeWeight;
    cbResPClickable.Checked := DirectionsRender.PolylineOptions.Clickable;
    cbResPGeodesic.Checked := DirectionsRender.PolylineOptions.Geodesic;

    // routes
    tvItems.Items.Clear;
    for i := 0 to Count - 1 do
    begin
      Sec := 0;
      Met := 0;
      for j := 0 to Routes[i].CountLeg - 1 do
      begin
        Sec := Sec + Trunc(Routes[i].Leg[j].Duration.Value);
        Met := Met + Routes[i].Leg[j].Distance.Value;
      end;
      MetStr := IntToStr((Trunc(Sec / 60 / 60))) + 'h';
      MetStr := MetStr + IntToStr(Trunc(((Sec / 60 / 60) - Trunc(Sec / 60 / 60)) * 60)) + 'm';
      Node1 := tvItems.Items.AddChild(nil, 'Route ' + IntToStr(i+1) + ': ' + Routes[i].Sumary + ' (' + FormatFloat('0.## km', Met / 1000) + ' - ' + MetStr + ')');

      tvItems.Items.AddChild(Node1, 'Bounds: ' + Routes[i].Bounds.ToStr(FGMDir.Map.Precision));
      tvItems.Items.AddChild(Node1, 'Copyrights: ' + Routes[i].Copyrights);
      for j := 0 to Routes[i].CountWarning - 1 do
        tvItems.Items.AddChild(Node1, 'Warning: ' + Routes[i].Warning[j]);
      for j := 0 to Routes[i].CountWaypointOrder - 1 do
        tvItems.Items.AddChild(Node1, 'WaypointOrder: ' + IntToStr(Routes[i].WaypointOrder[j]));

      Node2 := tvItems.Items.AddChild(Node1, 'OverviewPath (' + IntToStr(Routes[i].CountOverviewPath) + ')');
      for j := 0 to Routes[i].CountOverviewPath - 1 do
        tvItems.Items.AddChild(Node2, 'OverviewPath: ' + Routes[i].OverviewPath[j].ToStr(FGMDir.Map.Precision));

      Node2 := tvItems.Items.AddChild(Node1, 'Leg (' + IntToStr(Routes[i].CountLeg) + ')');
      for j := 0 to Routes[i].CountLeg - 1 do
      begin
        tvItems.Items.AddChild(Node2, 'ArrivalTime: ' + Routes[i].Leg[j].ArrivalTime.Text + ' - ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Routes[i].Leg[j].ArrivalTime.Value) + 's');
        tvItems.Items.AddChild(Node2, 'DepartureTime: ' + Routes[i].Leg[j].DepartureTime.Text + ' - ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Routes[i].Leg[j].DepartureTime.Value) + 's');
        tvItems.Items.AddChild(Node2, 'Distance: ' + Routes[i].Leg[j].Distance.Text + ' - ' + IntToStr(Routes[i].Leg[j].Distance.Value) + 'm');
        tvItems.Items.AddChild(Node2, 'Duration: ' + Routes[i].Leg[j].Duration.Text + ' - ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Routes[i].Leg[j].Duration.Value) + 's');
        tvItems.Items.AddChild(Node2, 'EndAddress: ' + Routes[i].Leg[j].EndAddress);
        tvItems.Items.AddChild(Node2, 'StartAddress: ' + Routes[i].Leg[j].StartAddress);
        tvItems.Items.AddChild(Node2, 'EndLocation: ' + Routes[i].Leg[j].EndLocation.ToStr(FGMDir.Map.Precision));
        tvItems.Items.AddChild(Node2, 'StartLocation: ' + Routes[i].Leg[j].StartLocation.ToStr(FGMDir.Map.Precision));
        if Routes[i].Leg[j].CountViaWaypoints > 0 then
        begin
          Node3 := tvItems.Items.AddChild(Node2, 'ViaWaypoints');
          for k := 0 to Routes[i].Leg[j].CountViaWaypoints - 1 do
            tvItems.Items.AddChild(Node3, 'ViaWaypoints: ' + Routes[i].Leg[j].ViaWaypoints[k].ToStr(FGMDir.Map.Precision));
        end;
        Node3 := tvItems.Items.AddChild(Node2, 'Steps');
        for k := 0 to Routes[i].Leg[j].CountStep - 1 do
        begin
          Node4 := tvItems.Items.AddChild(Node3, 'Step ' + IntToStr(k) + ': ' + Routes[i].Leg[j].Step[k].Instructions);
          tvItems.Items.AddChild(Node4, 'TravelMode: ' + TTransform.TravelModeToStr(Routes[i].Leg[j].Step[k].TravelMode));
          tvItems.Items.AddChild(Node4, 'Distance: ' + Routes[i].Leg[j].Step[k].Distance.Text + ' - ' + IntToStr(Routes[i].Leg[j].Step[k].Distance.Value) + 's');
          tvItems.Items.AddChild(Node4, 'Duration: ' + Routes[i].Leg[j].Step[k].Duration.Text + ' - ' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Routes[i].Leg[j].Step[k].Duration.Value) + 's');
          tvItems.Items.AddChild(Node4, 'EndLocation: ' + Routes[i].Leg[j].Step[k].EndLocation.ToStr(FGMDir.Map.Precision));
          tvItems.Items.AddChild(Node4, 'StartLocation: ' + Routes[i].Leg[j].Step[k].StartLocation.ToStr(FGMDir.Map.Precision));
          Node5 := tvItems.Items.AddChild(Node4, 'TransitDetails');
          tvItems.Items.AddChild(Node5, 'ArribalStop: ' + Routes[i].Leg[j].Step[k].Transit.ArribalStop.Location.ToStr(FGMDir.Map.Precision) + ' - ' + Routes[i].Leg[j].Step[k].Transit.ArribalStop.Name);
          tvItems.Items.AddChild(Node5, 'ArribalTime: ' + Routes[i].Leg[j].Step[k].Transit.ArribalTime.Text);
          tvItems.Items.AddChild(Node5, 'DepartureStop: ' + Routes[i].Leg[j].Step[k].Transit.DepartureStop.Location.ToStr(FGMDir.Map.Precision) + ' - ' + Routes[i].Leg[j].Step[k].Transit.DepartureStop.Name);
          tvItems.Items.AddChild(Node5, 'DepartureTime: ' + Routes[i].Leg[j].Step[k].Transit.DepartureTime.Text);
          tvItems.Items.AddChild(Node5, 'Headsign: ' + Routes[i].Leg[j].Step[k].Transit.Headsign);
          tvItems.Items.AddChild(Node5, 'Headway: ' + IntToStr(Routes[i].Leg[j].Step[k].Transit.Headway));
          tvItems.Items.AddChild(Node5, 'NumStops: ' + IntToStr(Routes[i].Leg[j].Step[k].Transit.NumStops));
          Node6 := tvItems.Items.AddChild(Node5, 'TransitLine');
          tvItems.Items.AddChild(Node6, 'Name: ' + Routes[i].Leg[j].Step[k].Transit.Line.Name);
          tvItems.Items.AddChild(Node6, 'ShortName: ' + Routes[i].Leg[j].Step[k].Transit.Line.ShortName);
          tvItems.Items.AddChild(Node6, 'TextColor: ' + Routes[i].Leg[j].Step[k].Transit.Line.TextColor);
          tvItems.Items.AddChild(Node6, 'Url: ' + Routes[i].Leg[j].Step[k].Transit.Line.Url);
          tvItems.Items.AddChild(Node6, 'Vehicle: ' + Routes[i].Leg[j].Step[k].Transit.Line.Vehicle.Name + ' - ' + TTransform.VehicleTypeToStr(Routes[i].Leg[j].Step[k].Transit.Line.Vehicle.VehicleType));
          tvItems.Items.AddChild(Node6, 'CountAgencie: ' + IntToStr(Routes[i].Leg[j].Step[k].Transit.Line.CountAgencie));
        end;
      end;
    end;
  end;
end;

procedure TDirectionsFrm.tvItemsChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.Level = 0 then
  begin
    Series1.Clear;
    lbElevations.Clear;
    FGMDir.ShowRoute(lbResults.ItemIndex, Node.Index, cbHidde.Checked);
  end;
end;

end.
