unit UMainGeoFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, GMClasses, GMMap, GMMapVCL,
  OleCtrls, SHDocVw, StdCtrls, ExtCtrls, GMPolyline, GMPolygonVCL,
  GMLinkedComponents, GMMarker, GMMarkerVCL;

type
  TMainGeoFrm = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    WebBrowser1: TWebBrowser;
    GMMap1: TGMMap;
    GMMarker1: TGMMarker;
    GMPolygon1: TGMPolygon;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    eEncodePath: TEdit;
    Label2: TLabel;
    eDecodePath: TEdit;
    Label3: TLabel;
    eContainsLocation0vs0: TEdit;
    Splitter1: TSplitter;
    Label4: TLabel;
    eContainsLocation0vs2: TEdit;
    eIsLocationOnEdge0vs1: TEdit;
    eIsLocationOnEdge0vs2: TEdit;
    Label5: TLabel;
    eOriginal: TEdit;
    Label6: TLabel;
    eComputeArea: TEdit;
    Label7: TLabel;
    eComputeDistanceBetween: TEdit;
    Label8: TLabel;
    eComputeHeading: TEdit;
    Label9: TLabel;
    eComputeLength: TEdit;
    eComputeOffset: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    eComputeOffsetOrigin: TEdit;
    Label12: TLabel;
    eComputeSignedArea: TEdit;
    Label13: TLabel;
    eInterpolate: TEdit;
    procedure GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
  private
    procedure DoDemo;
  public
  end;

var
  MainGeoFrm: TMainGeoFrm;

implementation

uses
  GMFunctionsVCL;

{$R *.dfm}

procedure TMainGeoFrm.DoDemo;
var
  i: Integer;
  s: string;
  LL: TLatLng;
begin
  s := '';
  for i := 0 to GMPolygon1[0].CountLinePoints - 1 do
    if s = '' then s := GMPolygon1[0][i].ToStr(GMMap1.Precision)
    else s := s + ' - ' + GMPolygon1[0][i].ToStr(GMMap1.Precision);
  eOriginal.Text := s;

  eEncodePath.Text := GMPolygon1[0].EncodePath;
  // you can do also:
  //     eEncodePath.Text := TGeometry.EncodePath(GMMap1, GMPolygon1[0].PolylineToStr);

  eDecodePath.Text := TGeometry.DecodePath(GMMap1, eEncodePath.Text);
  // you can do also:
  //     GMPolygon1[0].DecodePath(eEncodePath.Text, True or False);

  eContainsLocation0vs0.Text := BoolToStr(GMPolygon1[0].ContainsLocation(GMMarker1[0].Position), True);
  // you can do also:
  //     eContainsLocation0vs0.Text := BoolToStr(TGeometry.ContainsLocation(GMPolygon1, 0, GMMarker1[0].Position), True);
  eContainsLocation0vs2.Text := BoolToStr(GMPolygon1[0].ContainsLocation(GMMarker1[2].Position), True);
  // you can do also:
  //     eContainsLocation0vs2.Text := BoolToStr(TGeometry.ContainsLocation(GMPolygon1, 0, GMMarker1[2].Position), True);

  eIsLocationOnEdge0vs2.Text := BoolToStr(GMPolygon1[0].IsLocationOnEdge(GMMarker1[2].Position), True);
  // you can do also:
  //     eContainsLocation0vs0.Text := BoolToStr(TGeometry.IsLocationOnEdge(GMPolygon1, 0, GMMarker1[2].Position), True);
  eIsLocationOnEdge0vs1.Text := BoolToStr(GMPolygon1[0].IsLocationOnEdge(GMMarker1[1].Position), True);
  // you can do also:
  //     eContainsLocation0vs2.Text := BoolToStr(TGeometry.IsLocationOnEdge(GMPolygon1, 0, GMMarker1[1].Position), True);

  eComputeArea.Text := FloatToStr(GMPolygon1[0].ComputeArea);
  // you can do also:
  //     eComputeArea.Text := FloatToStr(TGeometry.ComputeArea(GMMap1, GMPolygon1[0].PolylineToStr));

  eComputeDistanceBetween.Text := FloatToStr(TGeometry.ComputeDistanceBetween(GMMap1, GMMarker1[0].Position, GMMarker1[1].Position));

  eComputeHeading.Text := FloatToStr(TGeometry.ComputeHeading(GMMap1, GMMarker1[0].Position, GMMarker1[1].Position));

  eComputeLength.Text := FloatToStr(TGeometry.ComputeLength(GMMap1, GMPolygon1[0].PolylineToStr));

  LL := TLatLng.Create;
  try
    TGeometry.ComputeOffset(GMMap1, GMMarker1[0].Position, 1000, 10, LL);
    eComputeOffset.Text := LL.ToStr(GMMap1.Precision);
  finally
    FreeAndNil(LL);
  end;

  LL := TLatLng.Create;
  try
    TGeometry.ComputeOffsetOrigin(GMMap1, GMMarker1[0].Position, 1000, 10, LL);
    eComputeOffsetOrigin.Text := LL.ToStr(GMMap1.Precision);
  finally
    FreeAndNil(LL);
  end;

  eComputeSignedArea.Text := FloatToStr(TGeometry.ComputeSignedArea(GMMap1, GMPolygon1[0].PolylineToStr));


  LL := TLatLng.Create;
  try
    TGeometry.Interpolate(GMMap1, GMMarker1[0].Position, GMMarker1[1].Position, 1000, LL);
    eInterpolate.Text := LL.ToStr(GMMap1.Precision);
  finally
    FreeAndNil(LL);
  end;
end;

procedure TMainGeoFrm.GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
  begin
    GMMap1.DoMap;
    DoDemo;
  end;
end;

end.
