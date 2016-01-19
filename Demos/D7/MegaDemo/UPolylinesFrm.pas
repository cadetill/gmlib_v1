unit UPolylinesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, GMPolyline, ExtCtrls, GMMap, GMElevationVCL,
  TeEngine, Series, TeeProcs, Chart, GMLinkedComponents;

type
  TPolylinesFrm = class(TForm)
    PageControl2: TPageControl;
    tsMarkers: TTabSheet;
    Label1: TLabel;
    lbItems: TListBox;
    bUp: TButton;
    bDown: TButton;
    bNew: TButton;
    bDel: TButton;
    bCenter: TButton;
    pcMarker: TPageControl;
    tsGeneral: TTabSheet;
    tsInfoWin: TTabSheet;
    Label33: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbCloseOtherBeforeOpen: TCheckBox;
    cbDisableAutoPan: TCheckBox;
    eMaxWidth: TSpinEdit;
    ePixelOffsetH: TSpinEdit;
    ePixelOffsetW: TSpinEdit;
    mHTML: TMemo;
    tsEvents: TTabSheet;
    cbOnClick: TCheckBox;
    cbOnClickableChange: TCheckBox;
    cbOnDblClick: TCheckBox;
    cbOnEditableChange: TCheckBox;
    cbOnGeodesicChange: TCheckBox;
    cbOnMouseMove: TCheckBox;
    cbOnPathChange: TCheckBox;
    cbOnStrokeColorChange: TCheckBox;
    cbOnStrokeOpacityChange: TCheckBox;
    cbOnRightClick: TCheckBox;
    cbOnMouseDown: TCheckBox;
    cbOnMouseOver: TCheckBox;
    cbOnMouseOut: TCheckBox;
    cbOnMouseUp: TCheckBox;
    cbOnStrokeWeightChange: TCheckBox;
    cbOnDisableAutoPanChange: TCheckBox;
    cbOnCloseOtherBeforeOpenChange: TCheckBox;
    cbOnCloseClick: TCheckBox;
    cbOnVisibleChange: TCheckBox;
    cbOnHTMLContentChange: TCheckBox;
    cbOnMaxWidthChange: TCheckBox;
    cbOnPixelOffsetChange: TCheckBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbClickable: TCheckBox;
    cbGeodesic: TCheckBox;
    cbVisible: TCheckBox;
    cbEditable: TCheckBox;
    cbStrokeColor: TColorBox;
    eStrokeOpacity: TEdit;
    eStrokeWeight: TSpinEdit;
    cbAutoUpdatePath: TCheckBox;
    tsLinePoints: TTabSheet;
    Label2: TLabel;
    lbPoints: TListBox;
    bUpP: TButton;
    bDownP: TButton;
    bCenterP: TButton;
    bNewP: TButton;
    bDelP: TButton;
    eLat: TEdit;
    eLng: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    eText: TEdit;
    Label9: TLabel;
    tsIcon: TTabSheet;
    GroupBox1: TGroupBox;
    lRMeasure: TLabel;
    cbRMeasure: TComboBox;
    lRValue: TLabel;
    eRValue: TSpinEdit;
    GroupBox2: TGroupBox;
    lOMeasure: TLabel;
    lOValue: TLabel;
    cbOMeasure: TComboBox;
    eOValue: TSpinEdit;
    GroupBox3: TGroupBox;
    lIFillColor: TLabel;
    cbIFillColor: TColorBox;
    eIFillOpacity: TEdit;
    lIFillOpacity: TLabel;
    lIPath: TLabel;
    cbIPath: TComboBox;
    lIStrokeColor: TLabel;
    cbIStrokeColor: TColorBox;
    lIStrokeOpacity: TLabel;
    eIStrokeOpacity: TEdit;
    lIStrokeWeight: TLabel;
    eIStrokeWeight: TSpinEdit;
    tsElev: TTabSheet;
    Chart1: TChart;
    Panel1: TPanel;
    Series1: TAreaSeries;
    lbElevations: TListBox;
    rbAlongPath: TRadioButton;
    rbForLocation: TRadioButton;
    eSamples: TSpinEdit;
    Label100: TLabel;
    Shape1: TShape;
    tsGeometry: TTabSheet;
    eEncodePath: TEdit;
    bEncodePath: TButton;
    bDecodePath: TButton;
    Label14: TLabel;
    Label15: TLabel;
    eLatIsLoc: TEdit;
    eLngIsLoc: TEdit;
    bIsLoc: TButton;
    eTolerance: TEdit;
    Label16: TLabel;
    eRadius: TEdit;
    Label17: TLabel;
    bComArea: TButton;
    lComArea: TLabel;
    bZoomToAll: TButton;
    tsCurveLine: TTabSheet;
    cbCLActive: TCheckBox;
    cbCLHoriz: TCheckBox;
    eCLRes: TEdit;
    Label101: TLabel;
    eCLMulti: TSpinEdit;
    Label102: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbItemsClick(Sender: TObject);
    procedure lbPointsClick(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure bUpPClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bDownPClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bNewPClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bDelPClick(Sender: TObject);
    procedure bCenterClick(Sender: TObject);
    procedure bCenterPClick(Sender: TObject);
    procedure cbAutoUpdatePathClick(Sender: TObject);
    procedure cbClickableClick(Sender: TObject);
    procedure cbEditableClick(Sender: TObject);
    procedure cbGeodesicClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure eStrokeOpacityChange(Sender: TObject);
    procedure eStrokeWeightChange(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure eLatChange(Sender: TObject);
    procedure eLngChange(Sender: TObject);
    procedure cbCloseOtherBeforeOpenClick(Sender: TObject);
    procedure cbDisableAutoPanClick(Sender: TObject);
    procedure eMaxWidthChange(Sender: TObject);
    procedure ePixelOffsetHChange(Sender: TObject);
    procedure ePixelOffsetWChange(Sender: TObject);
    procedure mHTMLChange(Sender: TObject);
    procedure cbOnClickClick(Sender: TObject);
    procedure cbOnClickableChangeClick(Sender: TObject);
    procedure cbOnDblClickClick(Sender: TObject);
    procedure cbStrokeColorChange(Sender: TObject);
    procedure cbOnEditableChangeClick(Sender: TObject);
    procedure cbOnGeodesicChangeClick(Sender: TObject);
    procedure cbOnMouseDownClick(Sender: TObject);
    procedure cbOnMouseMoveClick(Sender: TObject);
    procedure cbOnMouseOutClick(Sender: TObject);
    procedure cbOnMouseOverClick(Sender: TObject);
    procedure cbOnMouseUpClick(Sender: TObject);
    procedure cbOnPathChangeClick(Sender: TObject);
    procedure cbOnRightClickClick(Sender: TObject);
    procedure cbOnStrokeColorChangeClick(Sender: TObject);
    procedure cbOnStrokeOpacityChangeClick(Sender: TObject);
    procedure cbOnStrokeWeightChangeClick(Sender: TObject);
    procedure cbOnVisibleChangeClick(Sender: TObject);
    procedure cbOnCloseClickClick(Sender: TObject);
    procedure cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
    procedure cbOnDisableAutoPanChangeClick(Sender: TObject);
    procedure cbOnHTMLContentChangeClick(Sender: TObject);
    procedure cbOnMaxWidthChangeClick(Sender: TObject);
    procedure cbOnPixelOffsetChangeClick(Sender: TObject);
    procedure cbRMeasureChange(Sender: TObject);
    procedure cbOMeasureChange(Sender: TObject);
    procedure eRValueChange(Sender: TObject);
    procedure eOValueChange(Sender: TObject);
    procedure eIStrokeWeightChange(Sender: TObject);
    procedure cbIPathChange(Sender: TObject);
    procedure cbIFillColorChange(Sender: TObject);
    procedure cbIStrokeColorChange(Sender: TObject);
    procedure eIFillOpacityChange(Sender: TObject);
    procedure eIStrokeOpacityChange(Sender: TObject);
    procedure rbForLocationClick(Sender: TObject);
    procedure rbAlongPathClick(Sender: TObject);
    procedure bEncodePathClick(Sender: TObject);
    procedure bDecodePathClick(Sender: TObject);
    procedure bIsLocClick(Sender: TObject);
    procedure bComAreaClick(Sender: TObject);
    procedure bZoomToAllClick(Sender: TObject);
    procedure cbCLActiveClick(Sender: TObject);
    procedure cbCLHorizClick(Sender: TObject);
    procedure eCLResChange(Sender: TObject);
    procedure eCLMultiChange(Sender: TObject);
  protected
    FGMPoly: TGMBasePolyline;
    FGMElev: TGMElevation;
    FGetInfo: Boolean;

    procedure GetInfo; virtual;
    procedure ShowElevation; virtual;
  public
    OnClick: TLatLngIdxEvent;
    OnClickableChange: TLinkedComponentChange;
    OnDblClick: TLatLngIdxEvent;
    OnEditableChange: TLinkedComponentChange;
    OnGeodesicChange: TLinkedComponentChange;
    OnMouseDown: TLatLngIdxEvent;
    OnMouseMove: TLatLngIdxEvent;
    OnMouseOut: TLatLngIdxEvent;
    OnMouseOver: TLatLngIdxEvent;
    OnMouseUp: TLatLngIdxEvent;
    OnPathChange: TLinkedComponentChange;
    OnRightClick: TLatLngIdxEvent;
    OnStrokeColorChange: TLinkedComponentChange;
    OnStrokeOpacityChange: TLinkedComponentChange;
    OnStrokeWeightChange: TLinkedComponentChange;
    OnVisibleChange: TLinkedComponentChange;

    OnCloseClick: TLinkedComponentChange;
    OnCloseOtherBeforeOpenChange: TLinkedComponentChange;
    OnDisableAutoPanChange: TLinkedComponentChange;
    OnHTMLContentChange: TLinkedComponentChange;
    OnMaxWidthChange: TLinkedComponentChange;
    OnPixelOffsetChange: TLinkedComponentChange;

    constructor Create(aOwner: TComponent; GMPoly: TGMBasePolyline; GMElev: TGMElevation); reintroduce; virtual;
  end;

var
  PolylinesFrm: TPolylinesFrm;

implementation

uses
  GMFunctionsVCL, GMConstants, GMClasses, GMPolylineVCL;

{$R *.dfm}

{ TPolylinesFrm }

procedure TPolylinesFrm.bCenterClick(Sender: TObject);
begin
  if lbItems.ItemIndex <> -1 then
    FGMPoly[lbItems.ItemIndex].CenterMapTo;
end;

procedure TPolylinesFrm.bDecodePathClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  if eEncodePath.Text <> '' then
  begin
    FGMPoly[lbItems.ItemIndex].DecodePath(eEncodePath.Text);
    GetInfo;
  end;
end;

procedure TPolylinesFrm.bDelClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  FGMPoly.Delete(lbItems.ItemIndex);
  lbItems.DeleteSelected;
end;

procedure TPolylinesFrm.bDownClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = lbItems.Count - 1 then Exit;

  FGMPoly.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
end;

procedure TPolylinesFrm.bNewClick(Sender: TObject);
var
  Poly: TPolyline;
begin
  Poly := TPolyline(FGMPoly.Add);
  lbItems.ItemIndex := lbItems.Items.Add(Poly.Text);

  GetInfo;
end;

procedure TPolylinesFrm.bUpClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = 0 then Exit;

  FGMPoly.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
end;

procedure TPolylinesFrm.bUpPClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = 0 then Exit;

  FGMPoly[lbItems.ItemIndex].MoveLinePoint(lbPoints.ItemIndex, lbPoints.ItemIndex-1);
  lbPoints.Items.Move(lbPoints.ItemIndex, lbPoints.ItemIndex-1);
end;

procedure TPolylinesFrm.bZoomToAllClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].ZoomToPoints;
end;

procedure TPolylinesFrm.cbAutoUpdatePathClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].AutoUpdatePath := cbAutoUpdatePath.Checked;
end;

procedure TPolylinesFrm.cbCLActiveClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Active := cbCLActive.Checked;
end;

procedure TPolylinesFrm.cbCLHorizClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Horizontal := cbCLHoriz.Checked;
end;

procedure TPolylinesFrm.cbClickableClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].Clickable := cbClickable.Checked;
end;

procedure TPolylinesFrm.cbCloseOtherBeforeOpenClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen := cbCloseOtherBeforeOpen.Checked;
end;

procedure TPolylinesFrm.cbDisableAutoPanClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].InfoWindow.DisableAutoPan := cbDisableAutoPan.Checked;
end;

procedure TPolylinesFrm.cbEditableClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].Editable := cbEditable.Checked;
end;

procedure TPolylinesFrm.cbGeodesicClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].Geodesic := cbGeodesic.Checked;
end;

procedure TPolylinesFrm.cbIFillColorChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TSymbol(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon).FillColor := cbIFillColor.Selected;
end;

procedure TPolylinesFrm.cbIPathChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.Path := TTransform.StrToSymbolPath(cbIPath.Text);
end;

procedure TPolylinesFrm.cbIStrokeColorChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TSymbol(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon).StrokeColor := cbIStrokeColor.Selected;
end;

procedure TPolylinesFrm.cbOMeasureChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.OffSet.Measure := TTransform.StrToMeasure(cbOMeasure.Text);
end;

procedure TPolylinesFrm.cbOnClickableChangeClick(Sender: TObject);
begin
  FGMPoly.OnClickableChange := nil;
  if cbOnClickableChange.Checked then FGMPoly.OnClickableChange := OnClickableChange;
end;

procedure TPolylinesFrm.cbOnClickClick(Sender: TObject);
begin
  FGMPoly.OnClick := nil;
  if cbOnClick.Checked then FGMPoly.OnClick := OnClick;
end;

procedure TPolylinesFrm.cbOnCloseClickClick(Sender: TObject);
begin
  FGMPoly.OnCloseClick := nil;
  if cbOnCloseClick.Checked then FGMPoly.OnCloseClick := OnCloseClick;
end;

procedure TPolylinesFrm.cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
begin
  FGMPoly.OnCloseOtherBeforeOpenChange := nil;
  if cbOnCloseOtherBeforeOpenChange.Checked then FGMPoly.OnCloseOtherBeforeOpenChange := OnCloseOtherBeforeOpenChange;
end;

procedure TPolylinesFrm.cbOnDblClickClick(Sender: TObject);
begin
  FGMPoly.OnDblClick := nil;
  if cbOnDblClick.Checked then FGMPoly.OnDblClick := OnDblClick;
end;

procedure TPolylinesFrm.cbOnDisableAutoPanChangeClick(Sender: TObject);
begin
  FGMPoly.OnDisableAutoPanChange := nil;
  if cbOnDisableAutoPanChange.Checked then FGMPoly.OnDisableAutoPanChange := OnDisableAutoPanChange;
end;

procedure TPolylinesFrm.cbOnEditableChangeClick(Sender: TObject);
begin
  FGMPoly.OnEditableChange := nil;
  if cbOnEditableChange.Checked then FGMPoly.OnEditableChange := OnEditableChange;
end;

procedure TPolylinesFrm.cbOnGeodesicChangeClick(Sender: TObject);
begin
  FGMPoly.OnGeodesicChange := nil;
  if cbOnGeodesicChange.Checked then FGMPoly.OnGeodesicChange := OnGeodesicChange;
end;

procedure TPolylinesFrm.cbOnHTMLContentChangeClick(Sender: TObject);
begin
  FGMPoly.OnHTMLContentChange := nil;
  if cbOnHTMLContentChange.Checked then FGMPoly.OnHTMLContentChange := OnHTMLContentChange;
end;

procedure TPolylinesFrm.cbOnMaxWidthChangeClick(Sender: TObject);
begin
  FGMPoly.OnMaxWidthChange := nil;
  if cbOnMaxWidthChange.Checked then FGMPoly.OnMaxWidthChange := OnMaxWidthChange;
end;

procedure TPolylinesFrm.cbOnMouseDownClick(Sender: TObject);
begin
  FGMPoly.OnMouseDown := nil;
  if cbOnMouseDown.Checked then FGMPoly.OnMouseDown := OnMouseDown;
end;

procedure TPolylinesFrm.cbOnMouseMoveClick(Sender: TObject);
begin
  FGMPoly.OnMouseMove := nil;
  if cbOnMouseMove.Checked then FGMPoly.OnMouseMove := OnMouseMove;
end;

procedure TPolylinesFrm.cbOnMouseOutClick(Sender: TObject);
begin
  FGMPoly.OnMouseOut := nil;
  if cbOnMouseOut.Checked then FGMPoly.OnMouseOut := OnMouseOut;
end;

procedure TPolylinesFrm.cbOnMouseOverClick(Sender: TObject);
begin
  FGMPoly.OnMouseOver := nil;
  if cbOnMouseOver.Checked then FGMPoly.OnMouseOver := OnMouseOver;
end;

procedure TPolylinesFrm.cbOnMouseUpClick(Sender: TObject);
begin
  FGMPoly.OnMouseUp := nil;
  if cbOnMouseUp.Checked then FGMPoly.OnMouseUp := OnMouseUp;
end;

procedure TPolylinesFrm.cbOnPathChangeClick(Sender: TObject);
begin
  FGMPoly.OnPathChange := nil;
  if cbOnPathChange.Checked then FGMPoly.OnPathChange := OnPathChange;
end;

procedure TPolylinesFrm.cbOnPixelOffsetChangeClick(Sender: TObject);
begin
  FGMPoly.OnPixelOffsetChange := nil;
  if cbOnPixelOffsetChange.Checked then FGMPoly.OnPixelOffsetChange := OnPixelOffsetChange;
end;

procedure TPolylinesFrm.cbOnRightClickClick(Sender: TObject);
begin
  FGMPoly.OnRightClick := nil;
  if cbOnRightClick.Checked then FGMPoly.OnRightClick := OnRightClick;
end;

procedure TPolylinesFrm.cbOnStrokeColorChangeClick(Sender: TObject);
begin
  FGMPoly.OnStrokeColorChange := nil;
  if cbOnStrokeColorChange.Checked then FGMPoly.OnStrokeColorChange := OnStrokeColorChange;
end;

procedure TPolylinesFrm.cbOnStrokeOpacityChangeClick(Sender: TObject);
begin
  FGMPoly.OnStrokeOpacityChange := nil;
  if cbOnStrokeOpacityChange.Checked then FGMPoly.OnStrokeOpacityChange := OnStrokeOpacityChange;
end;

procedure TPolylinesFrm.cbOnStrokeWeightChangeClick(Sender: TObject);
begin
  FGMPoly.OnStrokeWeightChange := nil;
  if cbOnStrokeWeightChange.Checked then FGMPoly.OnStrokeWeightChange := OnStrokeWeightChange;
end;

procedure TPolylinesFrm.cbOnVisibleChangeClick(Sender: TObject);
begin
  FGMPoly.OnVisibleChange := nil;
  if cbOnVisibleChange.Checked then FGMPoly.OnVisibleChange := OnVisibleChange;
end;

procedure TPolylinesFrm.cbRMeasureChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.DistRepeat.Measure := TTransform.StrToMeasure(cbRMeasure.Text);
end;

procedure TPolylinesFrm.cbStrokeColorChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).StrokeColor := cbStrokeColor.Selected;
end;

procedure TPolylinesFrm.cbVisibleClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].Visible := cbVisible.Checked;
end;

procedure TPolylinesFrm.bDownPClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = lbPoints.Count - 1 then Exit;

  FGMPoly[lbItems.ItemIndex].MoveLinePoint(lbPoints.ItemIndex, lbPoints.ItemIndex+1);
  lbPoints.Items.Move(lbPoints.ItemIndex, lbPoints.ItemIndex+1);
end;

procedure TPolylinesFrm.bEncodePathClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  eEncodePath.Text := FGMPoly[lbItems.ItemIndex].EncodePath;
end;

procedure TPolylinesFrm.bIsLocClick(Sender: TObject);
var
  LatLng: TLatLng;
  Tol: Integer;
begin
  if lbItems.ItemIndex = -1 then Exit;

  if not TryStrToInt(eTolerance.Text, Tol) then Exit;

  LatLng := TLatLng.Create;
  try
    LatLng.Lat := LatLng.StringToReal(eLatIsLoc.Text);
    LatLng.Lng := LatLng.StringToReal(eLngIsLoc.Text);
    if FGMPoly[lbItems.ItemIndex].IsLocationOnEdge(LatLng, Tol) then
      ShowMessage('This point lies or is near the polyline!')
    else
      ShowMessage('This point NOT lies or is NOT near the polyline!');
  finally
    FreeAndNil(LatLng);
  end;
end;

procedure TPolylinesFrm.bCenterPClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex <> -1 then
    FGMPoly.Map.SetCenter(FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].Lat,
                          FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].Lng);
end;

procedure TPolylinesFrm.bComAreaClick(Sender: TObject);
var
  Tmp: Double;
begin
  if lbItems.ItemIndex = -1 then Exit;

  if not TryStrToFloat(eRadius.Text, Tmp) then Exit;

  lComArea.Caption := FloatToStr(FGMPoly[lbItems.ItemIndex].ComputeArea(Tmp));
end;

procedure TPolylinesFrm.bNewPClick(Sender: TObject);
var
  Point: TLinePoint;
begin
  if lbItems.ItemIndex = -1 then Exit;
  Point := FGMPoly[lbItems.ItemIndex].AddLinePoint;
  lbItems.ItemIndex := lbPoints.Items.Add(Point.ToStr(FGMPoly.Map.Precision));
end;

procedure TPolylinesFrm.bDelPClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = -1 then Exit;

  FGMPoly[lbItems.ItemIndex].DeleteLinePoint(lbPoints.ItemIndex);
  lbPoints.DeleteSelected;
end;

constructor TPolylinesFrm.Create(aOwner: TComponent; GMPoly: TGMBasePolyline;
  GMElev: TGMElevation);
var
  i: Integer;
begin
  inherited Create(aOwner);

  pcMarker.ActivePageIndex := 0;

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMPoly := GMPoly;
  FGMElev := GMElev;

  lbItems.Clear;
  for i :=  0 to FGMPoly.Count - 1 do
    lbItems.Items.Add(FGMPoly[i].Text);

  Series1.Clear;
  eEncodePath.Text := '';
end;

procedure TPolylinesFrm.eCLMultiChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Multiplier := eCLMulti.Value;
end;

procedure TPolylinesFrm.eCLResChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eCLRes.Text, Tmp) then
    TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Resolution := Tmp;
end;

procedure TPolylinesFrm.eIFillOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eIFillOpacity.Text, Tmp) then
    TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.FillOpacity := Tmp;
end;

procedure TPolylinesFrm.eIStrokeOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eIStrokeOpacity.Text, Tmp) then
    TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.StrokeOpacity := Tmp;
end;

procedure TPolylinesFrm.eIStrokeWeightChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.StrokeWeight := eIStrokeWeight.Value;
end;

procedure TPolylinesFrm.eLatChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].Lat := FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].StringToReal(eLat.Text);
  lbPoints.Items[lbPoints.ItemIndex] := FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].ToStr(FGMPoly.Map.Precision);
end;

procedure TPolylinesFrm.eLngChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].Lng := FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].StringToReal(eLng.Text);
  lbPoints.Items[lbPoints.ItemIndex] := FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].ToStr(FGMPoly.Map.Precision);
end;

procedure TPolylinesFrm.eMaxWidthChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if eMaxWidth.Value < 0 then eMaxWidth.Value := 0;

  FGMPoly[lbItems.ItemIndex].InfoWindow.MaxWidth := eMaxWidth.Value;
end;

procedure TPolylinesFrm.eOValueChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.OffSet.Value := eOValue.Value;
end;

procedure TPolylinesFrm.ePixelOffsetHChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetH.Value < 0 then ePixelOffsetH.Value := 0;

  FGMPoly[lbItems.ItemIndex].InfoWindow.PixelOffset.Height := ePixelOffsetH.Value;
end;

procedure TPolylinesFrm.ePixelOffsetWChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetW.Value < 0 then ePixelOffsetW.Value := 0;

  FGMPoly[lbItems.ItemIndex].InfoWindow.PixelOffset.Width := ePixelOffsetW.Value;
end;

procedure TPolylinesFrm.eRValueChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.DistRepeat.Value := eRValue.Value;
end;

procedure TPolylinesFrm.eStrokeOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eStrokeOpacity.Text, Tmp) then
    FGMPoly[lbItems.ItemIndex].StrokeOpacity := Tmp;
end;

procedure TPolylinesFrm.eStrokeWeightChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].StrokeWeight := eStrokeWeight.Value;
  ShowElevation;
end;

procedure TPolylinesFrm.eTextChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].Text := eText.Text;
  lbItems.Items[lbItems.ItemIndex] := eText.Text;
end;

procedure TPolylinesFrm.FormActivate(Sender: TObject);
begin
//  GetInfo;
end;

procedure TPolylinesFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TPolylinesFrm.GetInfo;
var
  i: Integer;
begin
  cbOnClick.Checked := Assigned(FGMPoly.OnClick);
  cbOnClickableChange.Checked := Assigned(FGMPoly.OnClickableChange);
  cbOnDblClick.Checked := Assigned(FGMPoly.OnDblClick);
  cbOnEditableChange.Checked := Assigned(FGMPoly.OnEditableChange);
  cbOnGeodesicChange.Checked := Assigned(FGMPoly.OnGeodesicChange);
  cbOnMouseDown.Checked := Assigned(FGMPoly.OnMouseDown);
  cbOnMouseMove.Checked := Assigned(FGMPoly.OnMouseMove);
  cbOnMouseOut.Checked := Assigned(FGMPoly.OnMouseOut);
  cbOnMouseOver.Checked := Assigned(FGMPoly.OnMouseOver);
  cbOnMouseUp.Checked := Assigned(FGMPoly.OnMouseUp);
  cbOnPathChange.Checked := Assigned(FGMPoly.OnPathChange);
  cbOnRightClick.Checked := Assigned(FGMPoly.OnRightClick);
  cbOnStrokeColorChange.Checked := Assigned(FGMPoly.OnStrokeColorChange);
  cbOnStrokeOpacityChange.Checked := Assigned(FGMPoly.OnStrokeOpacityChange);
  cbOnStrokeWeightChange.Checked := Assigned(FGMPoly.OnStrokeWeightChange);
  cbOnVisibleChange.Checked := Assigned(FGMPoly.OnVisibleChange);
  cbOnCloseClick.Checked := Assigned(FGMPoly.OnCloseClick);
  cbOnCloseOtherBeforeOpenChange.Checked := Assigned(FGMPoly.OnCloseOtherBeforeOpenChange);
  cbOnDisableAutoPanChange.Checked := Assigned(FGMPoly.OnDisableAutoPanChange);
  cbOnHTMLContentChange.Checked := Assigned(FGMPoly.OnHTMLContentChange);
  cbOnMaxWidthChange.Checked := Assigned(FGMPoly.OnMaxWidthChange);
  cbOnPixelOffsetChange.Checked := Assigned(FGMPoly.OnPixelOffsetChange);

  if lbItems.ItemIndex = -1 then Exit;

  FGetInfo := True;
  cbAutoUpdatePath.Checked := FGMPoly[lbItems.ItemIndex].AutoUpdatePath;
  cbClickable.Checked := FGMPoly[lbItems.ItemIndex].Clickable;
  cbEditable.Checked := FGMPoly[lbItems.ItemIndex].Editable;
  cbGeodesic.Checked := FGMPoly[lbItems.ItemIndex].Geodesic;
  cbVisible.Checked := FGMPoly[lbItems.ItemIndex].Visible;
  cbStrokeColor.Selected := TPolyline(FGMPoly[lbItems.ItemIndex]).StrokeColor;
  eStrokeOpacity.Text := FloatToStr(FGMPoly[lbItems.ItemIndex].StrokeOpacity);
  eStrokeWeight.Value := FGMPoly[lbItems.ItemIndex].StrokeWeight;
  eText.Text := FGMPoly[lbItems.ItemIndex].Text;
  if FGMPoly[lbItems.ItemIndex] is TPolyline then
  begin
    cbCLActive.Checked := TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Active;
    cbCLHoriz.Checked := TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Horizontal;
    eCLRes.Text := FloatToStr(TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Resolution);
    eCLMulti.Value := TPolyline(FGMPoly[lbItems.ItemIndex]).CurveLine.Multiplier;
  end;

  lbPoints.Clear;
  for i := 0 to FGMPoly[lbItems.ItemIndex].CountLinePoints - 1 do
    lbPoints.Items.Add(FGMPoly[lbItems.ItemIndex][i].ToStr(FGMPoly.Map.Precision));

  cbCloseOtherBeforeOpen.Checked := FGMPoly[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen;
  cbDisableAutoPan.Checked := FGMPoly[lbItems.ItemIndex].InfoWindow.DisableAutoPan;
  eMaxWidth.Value := FGMPoly[lbItems.ItemIndex].InfoWindow.MaxWidth;
  ePixelOffsetH.Value := FGMPoly[lbItems.ItemIndex].InfoWindow.PixelOffset.Height;
  ePixelOffsetW.Value := FGMPoly[lbItems.ItemIndex].InfoWindow.PixelOffset.Width;
  mHTML.Lines.Text := FGMPoly[lbItems.ItemIndex].InfoWindow.HTMLContent;

  if FGMPoly is TGMPolyline then
  begin
    cbRMeasure.ItemIndex := cbRMeasure.Items.IndexOf(TTransform.MeasureToStr(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.DistRepeat.Measure));
    cbOMeasure.ItemIndex := cbOMeasure.Items.IndexOf(TTransform.MeasureToStr(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.OffSet.Measure));
    eRValue.Value := TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.DistRepeat.Value;
    eOValue.Value := TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.OffSet.Value;
    cbIFillColor.Selected := TSymbol(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon).FillColor;
    cbIStrokeColor.Selected := TSymbol(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon).StrokeColor;
    cbIPath.ItemIndex := cbIPath.Items.IndexOf(TTransform.SymbolPathToStr(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.Path));
    eIStrokeWeight.Value := TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.StrokeWeight;
    eIStrokeOpacity.Text := FloatToStr(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.StrokeOpacity);
    eIFillOpacity.Text := FloatToStr(TPolyline(FGMPoly[lbItems.ItemIndex]).Icon.Icon.FillOpacity);
  end;

  FGetInfo := False;

  ShowElevation;
end;

procedure TPolylinesFrm.lbItemsClick(Sender: TObject);
begin
  GetInfo;
end;

procedure TPolylinesFrm.lbPointsClick(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  if lbPoints.ItemIndex = -1 then Exit;

  eLat.Text := FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].LatToStr(FGMPoly.Map.Precision);
  eLng.Text := FGMPoly[lbItems.ItemIndex][lbPoints.ItemIndex].LngToStr(FGMPoly.Map.Precision);
end;

procedure TPolylinesFrm.mHTMLChange(Sender: TObject);
begin
  if FGetInfo then Exit;
  if lbItems.ItemIndex = -1 then Exit;
  FGMPoly[lbItems.ItemIndex].InfoWindow.HTMLContent := mHTML.Lines.Text;
end;

procedure TPolylinesFrm.rbAlongPathClick(Sender: TObject);
begin
  ShowElevation;
end;

procedure TPolylinesFrm.rbForLocationClick(Sender: TObject);
begin
  ShowElevation;
end;

procedure TPolylinesFrm.ShowElevation;
var
  i: Integer;
begin
  FGMElev.Clear;
  FGMElev.AddLatLngFromPoly(FGMPoly[lbItems.ItemIndex], True);
  if rbAlongPath.Checked then FGMElev.ElevationType := etAlongPath;
  if rbForLocation.Checked then FGMElev.ElevationType := etForLocations;
  FGMElev.Samples := eSamples.Value;
  FGMElev.Execute;

  lbElevations.Clear;
  Series1.Clear;
  for i := 0 to FGMElev.ElevationResult.Count - 1 do
  begin
    lbElevations.Items.Add(FGMElev.ElevationResult[i].Location.ToStr(FGMElev.Map.Precision) + ' => ' + FormatFloat('#,##0.#', FGMElev.ElevationResult[i].Elevation));
    Series1.Add(FGMElev.ElevationResult[i].Elevation, '', clBlack);
  end;
end;

end.
