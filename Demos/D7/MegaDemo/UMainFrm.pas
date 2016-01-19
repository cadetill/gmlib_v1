unit UMainFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, OleCtrls, SHDocVw, StdCtrls, TeEngine,
  TeeProcs, Chart, GMElevation, GMMarker, GMMarkerVCL, GMDirection,
  GMDirectionVCL, GMGeoCode, GMPolylineVCL, GMCircle, GMCircleVCL, GMRectangle,
  GMRectangleVCL, GMPolyline, GMPolygonVCL, GMMap, GMLinkedComponents,
  GMInfoWindow, GMClasses, GMMapVCL, GMConstants, GMElevationVCL,
  GMGroundOverlay;

type
  TMainFrm = class(TForm)
    sbStatus: TStatusBar;
    WebBrowser1: TWebBrowser;
    MainMenu1: TMainMenu;
    Map1: TMenuItem;
    Markers1: TMenuItem;
    Polylines1: TMenuItem;
    Polygons1: TMenuItem;
    Rectangles1: TMenuItem;
    Circles1: TMenuItem;
    InfoWindows1: TMenuItem;
    Figures1: TMenuItem;
    Exit1: TMenuItem;
    Services1: TMenuItem;
    GeoCoding1: TMenuItem;
    Directions1: TMenuItem;
    Elevation1: TMenuItem;
    GMMap1: TGMMap;
    GMInfoWindow1: TGMInfoWindow;
    GMRectangle1: TGMRectangle;
    GMCircle1: TGMCircle;
    GMPolyline1: TGMPolyline;
    GMGeoCode1: TGMGeoCode;
    GMDirection1: TGMDirection;
    GMMarker1: TGMMarker;
    GMPolygon1: TGMPolygon;
    Splitter1: TSplitter;
    Panel1: TPanel;
    mEvents: TMemo;
    Label32: TLabel;
    Label34: TLabel;
    lLat: TLabel;
    lLng: TLabel;
    bClearLog: TButton;
    Label1: TLabel;
    lX: TLabel;
    Label3: TLabel;
    lY: TLabel;
    GMElevation1: TGMElevation;
    GMGroundOverlay1: TGMGroundOverlay;
    N6GroundOverlay1: TMenuItem;
    N1MapProperties1: TMenuItem;
    N2PrintMap1: TMenuItem;
    N3SaveMap1: TMenuItem;
    SaveDialog1: TSaveDialog;
    procedure FormResize(Sender: TObject);
    procedure sbStatusDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure sbStatusMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure sbStatusMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Exit1Click(Sender: TObject);
    procedure GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
    procedure GMMap1ActiveChange(Sender: TObject);
    procedure GMMap1IntervalEventsChange(Sender: TObject);
    procedure GMMap1PrecisionChange(Sender: TObject);
    procedure GMMap1ZoomChanged(Sender: TObject; NewZoom: Integer);
    procedure GMMap1MapTypeIdChanged(Sender: TObject; NewMapTypeId: TMapTypeId);
    procedure GMMap1MouseMove(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1Click(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1DblClick(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1Drag(Sender: TObject);
    procedure GMMap1DragEnd(Sender: TObject);
    procedure GMMap1DragStart(Sender: TObject);
    procedure GMMap1MouseOut(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1MouseOver(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1RightClick(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1BoundsChanged(Sender: TObject; NewBounds: TLatLngBounds);
    procedure Markers1Click(Sender: TObject);
    procedure GMMarker1Click(Sender: TObject; LatLng: TLatLng; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1ClickableChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1CloseClick(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1CloseOtherBeforeOpenChange(Sender: TObject;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1DblClick(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1DisableAutoPanChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1Drag(Sender: TObject; LatLng: TLatLng; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1DragableChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1DragEnd(Sender: TObject; LatLng: TLatLng; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1DragStart(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1FlatChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1HTMLContentChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1IconChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1MaxWidthChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1MouseDown(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1MouseOut(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1MouseOver(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1MouseUp(Sender: TObject; LatLng: TLatLng; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1PixelOffsetChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1PositionChange(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1RightClick(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMMarker1TitleChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMMarker1VisibleChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure Polylines1Click(Sender: TObject);
    procedure GMPolyline1EditableChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMPolyline1GeodesicChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMPolyline1MouseMove(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMPolyline1PathChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMPolyline1StrokeColorChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMPolyline1StrokeOpacityChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMPolyline1StrokeWeightChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure Polygons1Click(Sender: TObject);
    procedure GMPolygon1FillColorChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMPolygon1FillOpacityChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure Rectangles1Click(Sender: TObject);
    procedure GMRectangle1BoundsChanged(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure Circles1Click(Sender: TObject);
    procedure GMCircle1CenterChange(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMCircle1RadiusChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GeoCoding1Click(Sender: TObject);
    procedure Directions1Click(Sender: TObject);
    procedure GMMap1WeatherClick(Sender: TObject; LatLng: TLatLng;
      FeatureDetails: TWeatherFeature);
    procedure GMMap1PanoramioClick(Sender: TObject; LatLng: TLatLng;
      PanoramioFeature: TPanoramioFeature);
    procedure GMMap1CenterChanged(Sender: TObject; LatLng: TLatLng;
      X, Y: Double);
    procedure GMDirection1DirectionsChanged(Sender: TObject);
    procedure Elevation1Click(Sender: TObject);
    procedure bClearLogClick(Sender: TObject);
    procedure N6GroundOverlay1Click(Sender: TObject);
    procedure GMGroundOverlay1OpacityChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMGroundOverlay1UrlChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure N1MapProperties1Click(Sender: TObject);
    procedure N2PrintMap1Click(Sender: TObject);
    procedure N3SaveMap1Click(Sender: TObject);
  private
  public
    constructor Create(aOwner: TComponent); override;
  end;

var
  MainFrm: TMainFrm;

implementation

uses
  UMapFrm, UMarkersFrm, UPolylinesFrm, UPolygonFrm, URectanglesFrm, UCirclesFrm,
  UGeoCodeFrm, UDirectionsFrm, UGroundOverlayFrm, GMFunctionsVCL,
  ShellAPI, Types;

{$R *.dfm}

function GetStatusBarPanelXY(StatusBar : TStatusBar; X, Y: Integer) : Integer;
var
  i: Integer;
  R: TRect;
begin
  Result := -1;

  // Buscamos panel a panel hasta encontrar en cual está XY
  with StatusBar do
    for i := 0 to Panels.Count - 1 do
    begin
      // Obtenemos las dimensiones del panel
      SendMessage(Handle, WM_USER + 10, i, Integer(@R));
      if PtInRect(R, Point(x,y)) then
      begin
        Result := i;
        Break;
      end;
    end;
end;

procedure TMainFrm.bClearLogClick(Sender: TObject);
begin
  mEvents.Clear;
end;

procedure TMainFrm.Circles1Click(Sender: TObject);
var
  CF: TCirclesFrm;
  i: Integer;
begin
  CF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TCirclesFrm.ClassName then
      CF := TCirclesFrm(Screen.Forms[i]);

  if not Assigned(CF) then
  begin
    CF := TCirclesFrm.Create(Self, GMCircle1);

    CF.OnCenterChange := GMCircle1CenterChange;
    CF.OnClick := GMMarker1Click;
    CF.OnClickableChange := GMMarker1ClickableChange;
    CF.OnDblClick := GMMarker1DblClick;
    CF.OnEditableChange := GMPolyline1EditableChange;
    CF.OnFillColorChange := GMPolygon1FillColorChange;
    CF.OnFillOpacityChange := GMPolygon1FillOpacityChange;
    CF.OnMouseDown := GMMarker1MouseDown;
    CF.OnMouseMove := GMPolyline1MouseMove;
    CF.OnMouseOut := GMMarker1MouseOut;
    CF.OnMouseOver := GMMarker1MouseOver;
    CF.OnMouseUp := GMMarker1MouseUp;
    CF.OnRadiusChange := GMCircle1RadiusChange;
    CF.OnRightClick := GMMarker1RightClick;
    CF.OnStrokeColorChange := GMPolyline1StrokeColorChange;
    CF.OnStrokeOpacityChange := GMPolyline1StrokeOpacityChange;
    CF.OnStrokeWeightChange := GMPolyline1StrokeWeightChange;
    CF.OnVisibleChange := GMMarker1VisibleChange;

    CF.OnCloseClick := GMMarker1CloseClick;
    CF.OnCloseOtherBeforeOpenChange := GMMarker1CloseOtherBeforeOpenChange;
    CF.OnDisableAutoPanChange := GMMarker1DisableAutoPanChange;
    CF.OnHTMLContentChange := GMMarker1HTMLContentChange;
    CF.OnMaxWidthChange := GMMarker1MaxWidthChange;
    CF.OnPixelOffsetChange := GMMarker1PixelOffsetChange;
  end;

  CF.Show;
end;

constructor TMainFrm.Create(aOwner: TComponent);
begin
  inherited;

  GMMap1.Active := True;
end;

procedure TMainFrm.Elevation1Click(Sender: TObject);
begin
  ShowMessage('See Figures->Polylines or Services->Directions for an example of use');
end;

procedure TMainFrm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TMainFrm.FormResize(Sender: TObject);
var
  i: Integer;
  Tmp: Integer;
begin
  Tmp := 0;
  for i := 1 to sbStatus.Panels.Count - 1 do
    Tmp := Tmp + sbStatus.Panels[i].Width;
  sbStatus.Panels[0].Width := sbStatus.Width - Tmp;
end;

procedure TMainFrm.GeoCoding1Click(Sender: TObject);
var
  GF: TGeoCodeFrm;
  i: Integer;
begin
  GF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TGeoCodeFrm.ClassName then
      GF := TGeoCodeFrm(Screen.Forms[i]);

  if not Assigned(GF) then
  begin
    GF := TGeoCodeFrm.Create(Self, GMGeoCode1);
  end;

  GF.Show;
end;

procedure TMainFrm.GMCircle1CenterChange(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnCenter fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMCircle1RadiusChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnRadiusChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMDirection1DirectionsChanged(Sender: TObject);
begin
  sbStatus.Panels[0].Text := 'Directions OnChanged';
  mEvents.Lines.Add('Directions OnChanged');
end;

procedure TMainFrm.GMGroundOverlay1OpacityChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnOpacityChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMGroundOverlay1UrlChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnUrlChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMap1ActiveChange(Sender: TObject);
const
  Txt = 'Map OnActiveChange fired: %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [BoolToStr(GMMap1.Active, True)]);
  mEvents.Lines.Add(Format(Txt, [BoolToStr(GMMap1.Active, True)]));
end;

procedure TMainFrm.GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
  begin
    sbStatus.Panels[0].Text := 'First Page Loaded';
    mEvents.Lines.Add('First Page Loaded');
    GMMap1.DoMap;
  end;{
  else
    sbStatus.Panels[0].Text := 'All Tiles Loadeds';}
end;

procedure TMainFrm.GMMap1BoundsChanged(Sender: TObject;
  NewBounds: TLatLngBounds);
const
  Txt = 'Map OnClick fired: %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [NewBounds.ToUrlValue(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [NewBounds.ToUrlValue(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1CenterChanged(Sender: TObject; LatLng: TLatLng;
  X, Y: Double);
const
  Txt = 'Map OnCenterChange fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1Click(Sender: TObject; LatLng: TLatLng; X, Y: Double);
const
  Txt = 'Map OnClick fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1DblClick(Sender: TObject; LatLng: TLatLng;
  X, Y: Double);
const
  Txt = 'Map OnDblClick fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1Drag(Sender: TObject);
begin
  sbStatus.Panels[0].Text := 'Map OnDrag fired';
  mEvents.Lines.Add('Map OnDrag fired');
end;

procedure TMainFrm.GMMap1DragEnd(Sender: TObject);
begin
  sbStatus.Panels[0].Text := 'Map OnDragEnd fired';
  mEvents.Lines.Add('Map OnDragEnd fired');
end;

procedure TMainFrm.GMMap1DragStart(Sender: TObject);
begin
  sbStatus.Panels[0].Text := 'Map OnDragStart fired';
  mEvents.Lines.Add('Map OnDragStart fired');
end;

procedure TMainFrm.GMMap1IntervalEventsChange(Sender: TObject);
const
  Txt = 'Map OnIntervalEventsChange fired: %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [IntToStr(GMMap1.IntervalEvents)]);
  mEvents.Lines.Add(Format(Txt, [IntToStr(GMMap1.IntervalEvents)]));
end;

procedure TMainFrm.GMMap1MapTypeIdChanged(Sender: TObject;
  NewMapTypeId: TMapTypeId);
const
  Txt = 'Map OnMapTypeIdChange fired: %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TTransform.MapTypeIdToStr(NewMapTypeId)]);
  mEvents.Lines.Add(Format(Txt, [TTransform.MapTypeIdToStr(NewMapTypeId)]));
end;

procedure TMainFrm.GMMap1MouseMove(Sender: TObject; LatLng: TLatLng;
  X, Y: Double);
begin
  sbStatus.Panels[1].Text := 'Lat: ' + LatLng.LatToStr(GMMap1.Precision);
  sbStatus.Panels[2].Text := 'Lng: ' + LatLng.LngToStr(GMMap1.Precision);;
  lLat.Caption := LatLng.LatToStr(GMMap1.Precision);
  lLng.Caption := LatLng.LngToStr(GMMap1.Precision);
  lX.Caption := FloatToStr(X);
  lY.Caption := FloatToStr(Y);
end;

procedure TMainFrm.GMMap1MouseOut(Sender: TObject; LatLng: TLatLng;
  X, Y: Double);
const
  Txt = 'Map OnMouseOut fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1MouseOver(Sender: TObject; LatLng: TLatLng;
  X, Y: Double);
const
  Txt = 'Map OnMouseOver fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1PanoramioClick(Sender: TObject; LatLng: TLatLng;
  PanoramioFeature: TPanoramioFeature);
const
  Txt = 'Map OnPanoramioClick fired: lat %s - lng %s';
  Txt1 = '%s'#13#13'Author: %s'#13'PhotoId: %s'#13'Url: %s'#13'UserId: %s';
begin
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  ShowMessage(Format(Txt1, [PanoramioFeature.Title,
                            PanoramioFeature.Author,
                            PanoramioFeature.PhotoId,
                            PanoramioFeature.Url,
                            PanoramioFeature.UserId
                           ]));
end;

procedure TMainFrm.GMMap1PrecisionChange(Sender: TObject);
const
  Txt = 'Map OnPrecisionChange fired: %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [IntToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [IntToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1RightClick(Sender: TObject; LatLng: TLatLng;
  X, Y: Double);
const
  Txt = 'Map OnRightClick fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TMainFrm.GMMap1WeatherClick(Sender: TObject; LatLng: TLatLng;
  FeatureDetails: TWeatherFeature);
const
  Txt = 'Map OnWeatherClick fired: lat %s - lng %s';
  Txt1 = '%s'#13#13'Day: %s'#13'Desc.: %s'#13'Max/Min Temp: %dº%s/%dº%s'#13'Wind: %s to %d %s';
var
  Tmp: string;
  Wsp: string;
begin
  sbStatus.Panels[0].Text := Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
  mEvents.Lines.Add(Format(Txt, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));

  if FeatureDetails.TemperatureUnit = tuCELSIUS then Tmp := 'C'
  else Tmp := 'F';
  case FeatureDetails.WindSpeedUnit of
    wsKILOMETERS_PER_HOUR: Wsp := 'km/h';
    wsMETERS_PER_SECOND: Wsp := 'm/s';
    else Wsp := 'mph'
  end;

  if GMMap1.Layers.Weather.SuppressInfoWindows then
    ShowMessage(Format(Txt1, [FeatureDetails.Location,
                              FeatureDetails.Current.Day,
                              FeatureDetails.Current.Description,
                              FeatureDetails.Current.High, Tmp,
                              FeatureDetails.Current.Low, Tmp,
                              FeatureDetails.Current.WindDirection,
                              FeatureDetails.Current.WindSpeed, Wsp
                             ]));
end;

procedure TMainFrm.GMMap1ZoomChanged(Sender: TObject; NewZoom: Integer);
const
  Txt = 'Map OnZoomChange fired: %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [IntToStr(GMMap1.RequiredProp.Zoom)]);
  mEvents.Lines.Add(Format(Txt, [IntToStr(GMMap1.RequiredProp.Zoom)]));
end;

procedure TMainFrm.GMMarker1Click(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnClick fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1ClickableChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnClickableChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1CloseClick(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = 'InfoWin (%s) OnCloseClick fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1CloseOtherBeforeOpenChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = 'InfoWin (%s) OnCloseOtherBeforeOpenChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1DblClick(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnDblClick fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1DisableAutoPanChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = 'InfoWin (%s) OnDisableAutoPanChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1Drag(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnDrag fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1DragableChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnDraggableChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1DragEnd(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnDragEnd fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1DragStart(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnDragStart fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1FlatChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnFlat fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1HTMLContentChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = 'InfoWin (%s) OnHTMLContentChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1IconChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnIconChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1MaxWidthChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = 'InfoWin (%s) OnMaxWidthChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1MouseDown(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnMouseDown fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1MouseOut(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnMouseOut fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1MouseOver(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnMouseOver fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1MouseUp(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnMouseUp fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1PixelOffsetChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = 'InfoWin (%s) OnPixelOffetChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1PositionChange(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnPositionChange fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1RightClick(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnRightClick fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMMarker1TitleChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnTitleChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMMarker1VisibleChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnVisible fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolygon1FillColorChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnFillColorChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolygon1FillOpacityChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnFillOpacityChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolyline1EditableChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnEditableChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolyline1GeodesicChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnGeodesicChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolyline1MouseMove(Sender: TObject; LatLng: TLatLng;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnMouseMove fired: lat %s - lng %s';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name, LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]);
end;

procedure TMainFrm.GMPolyline1PathChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnPathChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolyline1StrokeColorChange(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnStrokeColorChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolyline1StrokeOpacityChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnStrokeOpacityChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMPolyline1StrokeWeightChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnStrokeWeightChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.GMRectangle1BoundsChanged(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Txt = '%s OnBoundsChange fired';
begin
  sbStatus.Panels[0].Text := Format(Txt, [TGMLinkedComponent(Sender).Name]);
end;

procedure TMainFrm.Markers1Click(Sender: TObject);
var
  MF: TMarkersFrm;
  i: Integer;
begin
  MF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TMarkersFrm.ClassName then
      MF := TMarkersFrm(Screen.Forms[i]);

  if not Assigned(MF) then
  begin
    MF := TMarkersFrm.Create(Self, GMMarker1);

    MF.OnClick := GMMarker1Click;
    MF.OnClickableChange := GMMarker1ClickableChange;
    MF.OnDblClick := GMMarker1DblClick;
    MF.OnDrag := GMMarker1Drag;
    MF.OnDraggableChange := GMMarker1DragableChange;
    MF.OnDragEnd := GMMarker1DragEnd;
    MF.OnDragStart := GMMarker1DragStart;
    MF.OnFlatChange := GMMarker1FlatChange;
    MF.OnIconChange := GMMarker1IconChange;
    MF.OnMouseDown := GMMarker1MouseDown;
    MF.OnMouseOut := GMMarker1MouseOut;
    MF.OnMouseOver := GMMarker1MouseOver;
    MF.OnMouseUp := GMMarker1MouseUp;
    MF.OnPositionChange := GMMarker1PositionChange;
    MF.OnRightClick := GMMarker1RightClick;
    MF.OnTitleChange := GMMarker1TitleChange;
    MF.OnVisibleChange := GMMarker1VisibleChange;
    MF.OnCloseClick := GMMarker1CloseClick;
    MF.OnCloseOtherBeforeOpenChange := GMMarker1CloseOtherBeforeOpenChange;
    MF.OnDisableAutoPanChange := GMMarker1DisableAutoPanChange;
    MF.OnHTMLContentChange := GMMarker1HTMLContentChange;
    MF.OnMaxWidthChange := GMMarker1MaxWidthChange;
    MF.OnPixelOffsetChange := GMMarker1PixelOffsetChange;
  end;

  MF.Show;
end;

procedure TMainFrm.N1MapProperties1Click(Sender: TObject);
var
  MF: TMapFrm;
  i: Integer;
begin
  MF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TMapFrm.ClassName then
      MF := TMapFrm(Screen.Forms[i]);

  if not Assigned(MF) then
  begin
    MF := TMapFrm.Create(Self, GMMap1);

    MF.OnBoundsChanged := GMMap1BoundsChanged;
    MF.OnCenterChanged := GMMap1CenterChanged;
    MF.OnClick := GMMap1Click;
    MF.OnDblClick := GMMap1DblClick;
    MF.OnDrag := GMMap1Drag;
    MF.OnDragEnd := GMMap1DragEnd;
    MF.OnDragStart := GMMap1DragStart;
    MF.OnMapTypeIdChanged := GMMap1MapTypeIdChanged;
    MF.OnMouseMove := GMMap1MouseMove;
    MF.OnMouseOut := GMMap1MouseOut;
    MF.OnMouseOver := GMMap1MouseOver;
    MF.OnRightClick := GMMap1RightClick;
    MF.OnZoomChanged := GMMap1ZoomChanged;
    MF.OnIntervalEventsChange := GMMap1IntervalEventsChange;
    MF.OnPrecisionChange := GMMap1PrecisionChange;
  end;

  MF.Show;
end;

procedure TMainFrm.N2PrintMap1Click(Sender: TObject);
begin
  GMMap1.PrintWithDialog;
end;

procedure TMainFrm.N3SaveMap1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    GMMap1.SaveToJPGFile(SaveDialog1.FileName);
end;

procedure TMainFrm.N6GroundOverlay1Click(Sender: TObject);
var
  GF: TGroundOverlayFrm;
  i: Integer;
begin
  GF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TGroundOverlayFrm.ClassName then
      GF := TGroundOverlayFrm(Screen.Forms[i]);

  if not Assigned(GF) then
  begin
    GF := TGroundOverlayFrm.Create(Self, GMGroundOverlay1);

    GF.OnBoundsChanged := GMRectangle1BoundsChanged;
    GF.OnClick := GMMarker1Click;
    GF.OnClickableChange := GMMarker1ClickableChange;
    GF.OnDblClick := GMMarker1DblClick;
    GF.OnVisibleChange := GMMarker1VisibleChange;
    GF.OnUrlDown := GMGroundOverlay1UrlChange;
    GF.OnOpacityChange := GMGroundOverlay1OpacityChange;

    GF.OnCloseClick := GMMarker1CloseClick;
    GF.OnCloseOtherBeforeOpenChange := GMMarker1CloseOtherBeforeOpenChange;
    GF.OnDisableAutoPanChange := GMMarker1DisableAutoPanChange;
    GF.OnHTMLContentChange := GMMarker1HTMLContentChange;
    GF.OnMaxWidthChange := GMMarker1MaxWidthChange;
    GF.OnPixelOffsetChange := GMMarker1PixelOffsetChange;
  end;

  GF.Show;
end;

procedure TMainFrm.Polygons1Click(Sender: TObject);
var
  PF: TPolygonFrm;
  i: Integer;
begin
  PF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TPolygonFrm.ClassName then
      PF := TPolygonFrm(Screen.Forms[i]);

  if not Assigned(PF) then
  begin
    PF := TPolygonFrm.Create(Self, GMPolygon1, GMElevation1);

    PF.OnClick := GMMarker1Click;
    PF.OnClickableChange := GMMarker1ClickableChange;
    PF.OnDblClick := GMMarker1DblClick;
    PF.OnEditableChange := GMPolyline1EditableChange;
    PF.OnGeodesicChange := GMPolyline1GeodesicChange;
    PF.OnMouseDown := GMMarker1MouseDown;
    PF.OnMouseMove := GMPolyline1MouseMove;
    PF.OnMouseOut := GMMarker1MouseOut;
    PF.OnMouseOver := GMMarker1MouseOver;
    PF.OnMouseUp := GMMarker1MouseUp;
    PF.OnPathChange := GMPolyline1PathChange;
    PF.OnRightClick := GMMarker1RightClick;
    PF.OnStrokeColorChange := GMPolyline1StrokeColorChange;
    PF.OnStrokeOpacityChange := GMPolyline1StrokeOpacityChange;
    PF.OnStrokeWeightChange := GMPolyline1StrokeWeightChange;
    PF.OnVisibleChange := GMMarker1VisibleChange;
    PF.OnFillColorChange := GMPolygon1FillColorChange;
    PF.OnFillOpacityChange := GMPolygon1FillOpacityChange;

    PF.OnCloseClick := GMMarker1CloseClick;
    PF.OnCloseOtherBeforeOpenChange := GMMarker1CloseOtherBeforeOpenChange;
    PF.OnDisableAutoPanChange := GMMarker1DisableAutoPanChange;
    PF.OnHTMLContentChange := GMMarker1HTMLContentChange;
    PF.OnMaxWidthChange := GMMarker1MaxWidthChange;
    PF.OnPixelOffsetChange := GMMarker1PixelOffsetChange;
  end;

  PF.Show;
end;

procedure TMainFrm.Polylines1Click(Sender: TObject);
var
  PF: TPolylinesFrm;
  i: Integer;
begin
  PF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TPolylinesFrm.ClassName then
      PF := TPolylinesFrm(Screen.Forms[i]);

  if not Assigned(PF) then
  begin
    PF := TPolylinesFrm.Create(Self, GMPolyline1, GMElevation1);

    PF.OnClick := GMMarker1Click;
    PF.OnClickableChange := GMMarker1ClickableChange;
    PF.OnDblClick := GMMarker1DblClick;
    PF.OnEditableChange := GMPolyline1EditableChange;
    PF.OnGeodesicChange := GMPolyline1GeodesicChange;
    PF.OnMouseDown := GMMarker1MouseDown;
    PF.OnMouseMove := GMPolyline1MouseMove;
    PF.OnMouseOut := GMMarker1MouseOut;
    PF.OnMouseOver := GMMarker1MouseOver;
    PF.OnMouseUp := GMMarker1MouseUp;
    PF.OnPathChange := GMPolyline1PathChange;
    PF.OnRightClick := GMMarker1RightClick;
    PF.OnStrokeColorChange := GMPolyline1StrokeColorChange;
    PF.OnStrokeOpacityChange := GMPolyline1StrokeOpacityChange;
    PF.OnStrokeWeightChange := GMPolyline1StrokeWeightChange;
    PF.OnVisibleChange := GMMarker1VisibleChange;

    PF.OnCloseClick := GMMarker1CloseClick;
    PF.OnCloseOtherBeforeOpenChange := GMMarker1CloseOtherBeforeOpenChange;
    PF.OnDisableAutoPanChange := GMMarker1DisableAutoPanChange;
    PF.OnHTMLContentChange := GMMarker1HTMLContentChange;
    PF.OnMaxWidthChange := GMMarker1MaxWidthChange;
    PF.OnPixelOffsetChange := GMMarker1PixelOffsetChange;
  end;

  PF.Show;
end;

procedure TMainFrm.Rectangles1Click(Sender: TObject);
var
  RF: TRectanglesFrm;
  i: Integer;
begin
  RF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TRectanglesFrm.ClassName then
      RF := TRectanglesFrm(Screen.Forms[i]);

  if not Assigned(RF) then
  begin
    RF := TRectanglesFrm.Create(Self, GMRectangle1);

    RF.OnBoundsChanged := GMRectangle1BoundsChanged;
    RF.OnClick := GMMarker1Click;
    RF.OnClickableChange := GMMarker1ClickableChange;
    RF.OnDblClick := GMMarker1DblClick;
    RF.OnEditableChange := GMPolyline1EditableChange;
    RF.OnFillColorChange := GMPolygon1FillColorChange;
    RF.OnFillOpacityChange := GMPolygon1FillOpacityChange;
    RF.OnMouseDown := GMMarker1MouseDown;
    RF.OnMouseMove := GMPolyline1MouseMove;
    RF.OnMouseOut := GMMarker1MouseOut;
    RF.OnMouseOver := GMMarker1MouseOver;
    RF.OnMouseUp := GMMarker1MouseUp;
    RF.OnRightClick := GMMarker1RightClick;
    RF.OnStrokeColorChange := GMPolyline1StrokeColorChange;
    RF.OnStrokeOpacityChange := GMPolyline1StrokeOpacityChange;
    RF.OnStrokeWeightChange := GMPolyline1StrokeWeightChange;
    RF.OnVisibleChange := GMMarker1VisibleChange;

    RF.OnCloseClick := GMMarker1CloseClick;
    RF.OnCloseOtherBeforeOpenChange := GMMarker1CloseOtherBeforeOpenChange;
    RF.OnDisableAutoPanChange := GMMarker1DisableAutoPanChange;
    RF.OnHTMLContentChange := GMMarker1HTMLContentChange;
    RF.OnMaxWidthChange := GMMarker1MaxWidthChange;
    RF.OnPixelOffsetChange := GMMarker1PixelOffsetChange;
  end;

  RF.Show;
end;

procedure TMainFrm.Directions1Click(Sender: TObject);
var
  DF: TDirectionsFrm;
  i: Integer;
begin
  DF := nil;

  for i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i].ClassName = TDirectionsFrm.ClassName then
      DF := TDirectionsFrm(Screen.Forms[i]);

  if not Assigned(DF) then
  begin
    DF := TDirectionsFrm.Create(Self, GMDirection1, GMElevation1);
  end;

  DF.Show;
end;

procedure TMainFrm.sbStatusDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
  StatusBar.Canvas.Font.Color := clBlue;
  Statusbar.Canvas.TextRect(Rect, Rect.Left, Rect.Top, Panel.Text);
end;

procedure TMainFrm.sbStatusMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if GetStatusBarPanelXY(sbStatus, X, Y) = 3 then
    sbStatus.Cursor := crHandPoint
  else
    sbStatus.Cursor := crDefault;
end;

procedure TMainFrm.sbStatusMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (GetStatusBarPanelXY(sbStatus, X, Y) = 3) and (Button = mbLeft) then
    ShellExecute(Handle, 'open', 'http://www.cadetill.com', nil, nil, SW_SHOW);
end;

end.
