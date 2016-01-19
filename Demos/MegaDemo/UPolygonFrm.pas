unit UPolygonFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPolylinesFrm, StdCtrls, Spin, ExtCtrls, ComCtrls, GMMap, TeEngine,
  Series, TeeProcs, Chart,
  GMLinkedComponents;

type
  TPolygonFrm = class(TPolylinesFrm)
    Label10: TLabel;
    cbFillColor: TColorBox;
    eFillOpacity: TEdit;
    Label11: TLabel;
    cbOnFillOpacityChange: TCheckBox;
    cbOnFillColorChange: TCheckBox;
    eLatCont: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    eLngCont: TEdit;
    bContLoc: TButton;
    procedure cbFillColorChange(Sender: TObject);
    procedure eFillOpacityChange(Sender: TObject);
    procedure cbOnFillColorChangeClick(Sender: TObject);
    procedure cbOnFillOpacityChangeClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bContLocClick(Sender: TObject);
  private
  protected
    procedure GetInfo; override;
    procedure ShowElevation; override;
  public
    OnFillColorChange: TLinkedComponentChange;
    OnFillOpacityChange: TLinkedComponentChange;
  end;

var
  PolygonFrm: TPolygonFrm;

implementation

uses
  GMPolygonVCL, GMClasses;

{$R *.dfm}

procedure TPolygonFrm.bContLocClick(Sender: TObject);
var
  LatLng: TLatLng;
begin
  if lbItems.ItemIndex = -1 then Exit;

  LatLng := TLatLng.Create;
  try
    LatLng.Lat := LatLng.StringToReal(eLatCont.Text);
    LatLng.Lng := LatLng.StringToReal(eLngCont.Text);
    if TPolygon(FGMPoly[lbItems.ItemIndex]).ContainsLocation(LatLng) then
      ShowMessage('This polygon includes the specified point!')
    else
      ShowMessage('This polygon NOT includes the specified point!');
  finally
    FreeAndNil(LatLng);
  end;
end;

procedure TPolygonFrm.bNewClick(Sender: TObject);
var
  Poly: TPolygon;
begin
  Poly := TPolygon(FGMPoly.Add);
  lbItems.ItemIndex := lbItems.Items.Add(Poly.Text);

  GetInfo;
end;

procedure TPolygonFrm.cbFillColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  TPolygon(FGMPoly[lbItems.ItemIndex]).FillColor := cbFillColor.Selected;
end;

procedure TPolygonFrm.cbOnFillColorChangeClick(Sender: TObject);
begin
  TGMPolygon(FGMPoly).OnFillColorChange := nil;
  if cbOnFillColorChange.Checked then TGMPolygon(FGMPoly).OnFillColorChange := OnFillColorChange;
end;

procedure TPolygonFrm.cbOnFillOpacityChangeClick(Sender: TObject);
begin
  TGMPolygon(FGMPoly).OnFillOpacityChange := nil;
  if cbOnFillOpacityChange.Checked then TGMPolygon(FGMPoly).OnFillOpacityChange := OnFillOpacityChange;
end;

procedure TPolygonFrm.eFillOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eFillOpacity.Text, Tmp) then
    TPolygon(FGMPoly[lbItems.ItemIndex]).FillOpacity := Tmp;
end;

procedure TPolygonFrm.GetInfo;
begin
  cbOnFillColorChange.Checked := Assigned(TGMPolygon(FGMPoly).OnFillColorChange);
  cbOnFillOpacityChange.Checked := Assigned(TGMPolygon(FGMPoly).OnFillOpacityChange);

  inherited;

  if lbItems.ItemIndex = -1 then Exit;

  cbFillColor.Selected := TPolygon(FGMPoly[lbItems.ItemIndex]).FillColor;
  eFillOpacity.Text := FloatToStr(TPolygon(FGMPoly[lbItems.ItemIndex]).FillOpacity);
end;

procedure TPolygonFrm.ShowElevation;
begin
// do nothing
end;

end.

