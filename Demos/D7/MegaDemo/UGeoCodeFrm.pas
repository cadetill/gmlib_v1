unit UGeoCodeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls,
  GMGeoCode;

type
  TGeoCodeFrm = class(TForm)
    PageControl2: TPageControl;
    tsMarkers: TTabSheet;
    Label1: TLabel;
    eGeocode: TEdit;
    bGoAddress: TSpeedButton;
    pcMarker: TPageControl;
    tsGeneral: TTabSheet;
    Label9: TLabel;
    eText: TEdit;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    eNELng: TEdit;
    eNELat: TEdit;
    eSWLng: TEdit;
    eSWLat: TEdit;
    eIcon: TEdit;
    Label2: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    eLat: TEdit;
    eLng: TEdit;
    bGoLatLng: TSpeedButton;
    tsResults: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    cbLangCode: TComboBox;
    cbRegion: TComboBox;
    tsEvents: TTabSheet;
    Label5: TLabel;
    eGeoStatus: TEdit;
    Label6: TLabel;
    tsXMLResult: TTabSheet;
    mXML: TMemo;
    tvItems: TTreeView;
    cbPaintMarkerFound: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure bGoAddressClick(Sender: TObject);
    procedure bGoLatLngClick(Sender: TObject);
    procedure eIconChange(Sender: TObject);
    procedure cbLangCodeChange(Sender: TObject);
    procedure cbRegionChange(Sender: TObject);
    procedure eNELatChange(Sender: TObject);
    procedure eNELngChange(Sender: TObject);
    procedure eSWLatChange(Sender: TObject);
    procedure eSWLngChange(Sender: TObject);
    procedure cbPaintMarkerFoundClick(Sender: TObject);
  private
    FGMGeo: TGMGeoCode;
    procedure GetInfo;
    procedure GetResults;
  public
    constructor Create(aOwner: TComponent; GMGeo: TGMGeoCode); reintroduce; virtual;
  end;

var
  GeoCodeFrm: TGeoCodeFrm;

implementation

uses
  GMConstants, GMFunctionsVCL;

{$R *.dfm}

procedure TGeoCodeFrm.bGoAddressClick(Sender: TObject);
begin
  pcMarker.ActivePage := tsResults;
  FGMGeo.Geocode(eGeocode.Text);
  GetResults;
end;

procedure TGeoCodeFrm.bGoLatLngClick(Sender: TObject);
var
  Lat, Lng: Real;
begin
  pcMarker.ActivePage := tsResults;
  Lat := StrToFloat(eLat.Text);
  Lng := StrToFloat(eLng.Text);
  FGMGeo.Geocode(Lat, Lng);
  GetResults;
end;

procedure TGeoCodeFrm.cbLangCodeChange(Sender: TObject);
begin
  FGMGeo.LangCode := TTransform.StrToLangCode2(cbLangCode.Text);
end;

procedure TGeoCodeFrm.cbPaintMarkerFoundClick(Sender: TObject);
begin
  FGMGeo.PaintMarkerFound := cbPaintMarkerFound.Checked;
end;

procedure TGeoCodeFrm.cbRegionChange(Sender: TObject);
begin
  FGMGeo.Region := TTransform.StrToRegion2(cbRegion.Text);
end;

constructor TGeoCodeFrm.Create(aOwner: TComponent; GMGeo: TGMGeoCode);
begin
  inherited Create(aOwner);

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  pcMarker.ActivePageIndex := 0;

  FGMGeo := GMGeo;
end;

procedure TGeoCodeFrm.eIconChange(Sender: TObject);
begin
  FGMGeo.Icon := eIcon.Text;
end;

procedure TGeoCodeFrm.eNELatChange(Sender: TObject);
begin
  FGMGeo.Bounds.NE.Lat := FGMGeo.Bounds.NE.StringToReal(eNELat.Text);
end;

procedure TGeoCodeFrm.eNELngChange(Sender: TObject);
begin
  FGMGeo.Bounds.NE.Lng := FGMGeo.Bounds.NE.StringToReal(eNELng.Text);
end;

procedure TGeoCodeFrm.eSWLatChange(Sender: TObject);
begin
  FGMGeo.Bounds.SW.Lat := FGMGeo.Bounds.SW.StringToReal(eSWLat.Text);
end;

procedure TGeoCodeFrm.eSWLngChange(Sender: TObject);
begin
  FGMGeo.Bounds.SW.Lng := FGMGeo.Bounds.SW.StringToReal(eSWLng.Text);
end;

procedure TGeoCodeFrm.FormActivate(Sender: TObject);
begin
  GetInfo;
end;

procedure TGeoCodeFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TGeoCodeFrm.GetInfo;
begin
  cbPaintMarkerFound.Checked := FGMGeo.PaintMarkerFound;
  eIcon.Text := FGMGeo.Icon;
  eNELat.Text := FGMGeo.Bounds.NE.LatToStr(0);
  eNELng.Text := FGMGeo.Bounds.NE.LngToStr(0);
  eSWLat.Text := FGMGeo.Bounds.SW.LatToStr(0);
  eSWLng.Text := FGMGeo.Bounds.SW.LngToStr(0);
  cbLangCode.ItemIndex := cbLangCode.Items.IndexOf(TTransform.LangCodeToStr2(FGMGeo.LangCode));
  cbRegion.ItemIndex := cbRegion.Items.IndexOf(TTransform.RegionToStr2(FGMGeo.Region));

  GetResults;
end;

procedure TGeoCodeFrm.GetResults;
var
  i, j: Integer;
  Node1, Node2, Node3: TTreeNode;
begin
  if FGMGeo.GeoStatus = gsWithoutState then Exit;

  eGeoStatus.Text := TTransform.GeocoderStatusToStr(FGMGeo.GeoStatus);
  mXML.Lines.Text := FGMGeo.XMLData.Text;

  tvItems.Items.Clear;
  for i := 0 to FGMGeo.Count - 1 do
  begin
    Node1 := tvItems.Items.AddChild(nil, 'Result ' + IntToStr(i+1));

    tvItems.Items.AddChild(Node1, 'Type(s): ' + FGMGeo[i].TypeList.CommaText);
    tvItems.Items.AddChild(Node1, 'FormatedAddr: ' + FGMGeo[i].FormatedAddr);

    Node2 := tvItems.Items.AddChild(Node1, 'Geometry');
    tvItems.Items.AddChild(Node2, 'Location: ' + FGMGeo[i].Geometry.Location.ToStr(0));
    tvItems.Items.AddChild(Node2, 'LocationType: ' + TTransform.GeocoderLocationTypeToStr(FGMGeo[i].Geometry.LocationType));
    tvItems.Items.AddChild(Node2, 'ViewPort: ' + FGMGeo[i].Geometry.Viewport.ToStr(0));
    tvItems.Items.AddChild(Node2, 'Bounds: ' + FGMGeo[i].Geometry.Bounds.ToStr(0));

    Node2 := tvItems.Items.AddChild(Node1, 'Address Component List');
    for j := 0 to FGMGeo[i].AddrCompList.Count - 1 do
    begin
      Node3 := tvItems.Items.AddChild(Node2, 'Address Component ' + IntToStr(j+1));

      tvItems.Items.AddChild(Node3, 'ShortName: ' + FGMGeo[i].AddrCompList[j].ShortName);
      tvItems.Items.AddChild(Node3, 'LongName: ' + FGMGeo[i].AddrCompList[j].LongName);
      tvItems.Items.AddChild(Node3, 'Type(s): ' + FGMGeo[i].AddrCompList[j].AddrCompTypeList.CommaText);
    end;
  end;

  if tvItems.Items.Count > 0 then tvItems.Items[0].Expand(True);
end;

end.
