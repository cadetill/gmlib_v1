program MegaDemo;

uses
  Forms,
  UMainFrm in 'UMainFrm.pas' {MainFrm},
  UMapFrm in 'UMapFrm.pas' {MapFrm},
  UMarkersFrm in 'UMarkersFrm.pas' {MarkersFrm},
  UPolylinesFrm in 'UPolylinesFrm.pas' {PolylinesFrm},
  UPolygonFrm in 'UPolygonFrm.pas' {PolygonFrm},
  URectanglesFrm in 'URectanglesFrm.pas' {RectanglesFrm},
  UCirclesFrm in 'UCirclesFrm.pas' {CirclesFrm},
  UGeoCodeFrm in 'UGeoCodeFrm.pas' {GeoCodeFrm},
  UDirectionsFrm in 'UDirectionsFrm.pas' {DirectionsFrm},
  UWaypointFrm in 'UWaypointFrm.pas' {WaypointFrm},
  UGroundOverlayFrm in 'UGroundOverlayFrm.pas' {GroundOverlayFrm};

{$R *.res}

begin
//  {$WARN SYMBOL_PLATFORM OFF}
//  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
