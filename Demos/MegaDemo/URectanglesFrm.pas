unit URectanglesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls,
  GMRectangleVCL, GMMapVCL, GMLinkedComponents;

type
  TRectanglesFrm = class(TForm)
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
    Label9: TLabel;
    cbClickable: TCheckBox;
    cbVisible: TCheckBox;
    cbEditable: TCheckBox;
    eText: TEdit;
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
    cbOnMouseMove: TCheckBox;
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
    cbStrokeColor: TColorBox;
    eStrokeOpacity: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    eStrokeWeight: TSpinEdit;
    eFillOpacity: TEdit;
    Label11: TLabel;
    cbFillColor: TColorBox;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    eNELng: TEdit;
    eNELat: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    eSWLng: TEdit;
    eSWLat: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cbOnFillOpacityChange: TCheckBox;
    cbOnFillColorChange: TCheckBox;
    cbOnBoundsChanged: TCheckBox;
    tsGeometry: TTabSheet;
    bComArea: TButton;
    lComArea: TLabel;
    eRadius: TEdit;
    Label2: TLabel;
    bZoomToAll: TButton;
    procedure bUpClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bCenterClick(Sender: TObject);
    procedure lbItemsClick(Sender: TObject);
    procedure cbClickableClick(Sender: TObject);
    procedure cbEditableClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure eNELatChange(Sender: TObject);
    procedure eNELngChange(Sender: TObject);
    procedure eSWLatChange(Sender: TObject);
    procedure eSWLngChange(Sender: TObject);
    procedure cbStrokeColorChange(Sender: TObject);
    procedure eStrokeOpacityChange(Sender: TObject);
    procedure eStrokeWeightChange(Sender: TObject);
    procedure cbFillColorChange(Sender: TObject);
    procedure eFillOpacityChange(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure cbCloseOtherBeforeOpenClick(Sender: TObject);
    procedure cbDisableAutoPanClick(Sender: TObject);
    procedure eMaxWidthChange(Sender: TObject);
    procedure ePixelOffsetHChange(Sender: TObject);
    procedure ePixelOffsetWChange(Sender: TObject);
    procedure mHTMLChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbOnBoundsChangedClick(Sender: TObject);
    procedure cbOnClickClick(Sender: TObject);
    procedure cbOnClickableChangeClick(Sender: TObject);
    procedure cbOnDblClickClick(Sender: TObject);
    procedure cbOnEditableChangeClick(Sender: TObject);
    procedure cbOnFillColorChangeClick(Sender: TObject);
    procedure cbOnFillOpacityChangeClick(Sender: TObject);
    procedure cbOnMouseDownClick(Sender: TObject);
    procedure cbOnMouseMoveClick(Sender: TObject);
    procedure cbOnMouseOutClick(Sender: TObject);
    procedure cbOnMouseOverClick(Sender: TObject);
    procedure cbOnMouseUpClick(Sender: TObject);
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
    procedure bComAreaClick(Sender: TObject);
    procedure bZoomToAllClick(Sender: TObject);
  private
    FGMRec: TGMRectangle;
    procedure GetInfo;
  public
    OnBoundsChanged: TLinkedComponentChange;
    OnClick: TLatLngIdxEvent;
    OnClickableChange: TLinkedComponentChange;
    OnDblClick: TLatLngIdxEvent;
    OnEditableChange: TLinkedComponentChange;
    OnFillColorChange: TLinkedComponentChange;
    OnFillOpacityChange: TLinkedComponentChange;
    OnMouseDown: TLatLngIdxEvent;
    OnMouseMove: TLatLngIdxEvent;
    OnMouseOut: TLatLngIdxEvent;
    OnMouseOver: TLatLngIdxEvent;
    OnMouseUp: TLatLngIdxEvent;
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

    constructor Create(aOwner: TComponent; GMRec: TGMRectangle); reintroduce; virtual;
  end;

var
  RectanglesFrm: TRectanglesFrm;

implementation

{$R *.dfm}

{ TRectanglesFrm }

procedure TRectanglesFrm.bCenterClick(Sender: TObject);
begin
  if lbItems.ItemIndex <> -1 then
    FGMRec[lbItems.ItemIndex].CenterMapTo;
end;

procedure TRectanglesFrm.bComAreaClick(Sender: TObject);
var
  Tmp: Double;
begin
  if lbItems.ItemIndex = -1 then Exit;

  if not TryStrToFloat(eRadius.Text, Tmp) then Exit;

  lComArea.Caption := FloatToStr(FGMRec[lbItems.ItemIndex].ComputeArea(Tmp));
end;

procedure TRectanglesFrm.bDelClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  FGMRec.Delete(lbItems.ItemIndex);
  lbItems.DeleteSelected;
end;

procedure TRectanglesFrm.bDownClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = lbItems.Count - 1 then Exit;

  FGMRec.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
end;

procedure TRectanglesFrm.bNewClick(Sender: TObject);
var
  Rec: TRectangle;
begin
  Rec := FGMRec.Add;
  lbItems.ItemIndex := lbItems.Items.Add(Rec.Text);

  GetInfo;
end;

procedure TRectanglesFrm.bUpClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = 0 then Exit;

  FGMRec.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
end;

procedure TRectanglesFrm.bZoomToAllClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].ZoomToPoints;
end;

procedure TRectanglesFrm.cbClickableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Clickable := cbClickable.Checked;
end;

procedure TRectanglesFrm.cbCloseOtherBeforeOpenClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen := cbCloseOtherBeforeOpen.Checked;
end;

procedure TRectanglesFrm.cbDisableAutoPanClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].InfoWindow.DisableAutoPan := cbDisableAutoPan.Checked;
end;

procedure TRectanglesFrm.cbEditableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Editable := cbEditable.Checked;
end;

procedure TRectanglesFrm.cbFillColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].FillColor := cbFillColor.Selected;
end;

procedure TRectanglesFrm.cbOnBoundsChangedClick(Sender: TObject);
begin
  FGMRec.OnBoundsChanged := nil;
  if cbOnBoundsChanged.Checked then FGMRec.OnBoundsChanged := OnBoundsChanged;
end;

procedure TRectanglesFrm.cbOnClickableChangeClick(Sender: TObject);
begin
  FGMRec.OnClickableChange := nil;
  if cbOnClickableChange.Checked then FGMRec.OnClickableChange := OnClickableChange;
end;

procedure TRectanglesFrm.cbOnClickClick(Sender: TObject);
begin
  FGMRec.OnClick := nil;
  if cbOnClick.Checked then FGMRec.OnClick := OnClick;
end;

procedure TRectanglesFrm.cbOnCloseClickClick(Sender: TObject);
begin
  FGMRec.OnCloseClick := nil;
  if cbOnCloseClick.Checked then FGMRec.OnCloseClick := OnCloseClick;
end;

procedure TRectanglesFrm.cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
begin
  FGMRec.OnCloseOtherBeforeOpenChange := nil;
  if cbOnCloseOtherBeforeOpenChange.Checked then FGMRec.OnCloseOtherBeforeOpenChange := OnCloseOtherBeforeOpenChange;
end;

procedure TRectanglesFrm.cbOnDblClickClick(Sender: TObject);
begin
  FGMRec.OnDblClick := nil;
  if cbOnDblClick.Checked then FGMRec.OnDblClick := OnDblClick;
end;

procedure TRectanglesFrm.cbOnDisableAutoPanChangeClick(Sender: TObject);
begin
  FGMRec.OnDisableAutoPanChange := nil;
  if cbOnDisableAutoPanChange.Checked then FGMRec.OnDisableAutoPanChange := OnDisableAutoPanChange;
end;

procedure TRectanglesFrm.cbOnEditableChangeClick(Sender: TObject);
begin
  FGMRec.OnEditableChange := nil;
  if cbOnEditableChange.Checked then FGMRec.OnEditableChange := OnEditableChange;
end;

procedure TRectanglesFrm.cbOnFillColorChangeClick(Sender: TObject);
begin
  FGMRec.OnFillColorChange := nil;
  if cbOnFillColorChange.Checked then FGMRec.OnFillColorChange := OnFillColorChange;
end;

procedure TRectanglesFrm.cbOnFillOpacityChangeClick(Sender: TObject);
begin
  FGMRec.OnFillOpacityChange := nil;
  if cbOnFillOpacityChange.Checked then FGMRec.OnFillOpacityChange := OnFillOpacityChange;
end;

procedure TRectanglesFrm.cbOnHTMLContentChangeClick(Sender: TObject);
begin
  FGMRec.OnHTMLContentChange := nil;
  if cbOnHTMLContentChange.Checked then FGMRec.OnHTMLContentChange := OnHTMLContentChange;
end;

procedure TRectanglesFrm.cbOnMaxWidthChangeClick(Sender: TObject);
begin
  FGMRec.OnMaxWidthChange := nil;
  if cbOnMaxWidthChange.Checked then FGMRec.OnMaxWidthChange := OnMaxWidthChange;
end;

procedure TRectanglesFrm.cbOnMouseDownClick(Sender: TObject);
begin
  FGMRec.OnMouseDown := nil;
  if cbOnMouseDown.Checked then FGMRec.OnMouseDown := OnMouseDown;
end;

procedure TRectanglesFrm.cbOnMouseMoveClick(Sender: TObject);
begin
  FGMRec.OnMouseMove := nil;
  if cbOnMouseMove.Checked then FGMRec.OnMouseMove := OnMouseMove;
end;

procedure TRectanglesFrm.cbOnMouseOutClick(Sender: TObject);
begin
  FGMRec.OnMouseOut := nil;
  if cbOnMouseOut.Checked then FGMRec.OnMouseOut := OnMouseOut;
end;

procedure TRectanglesFrm.cbOnMouseOverClick(Sender: TObject);
begin
  FGMRec.OnMouseOver := nil;
  if cbOnMouseOver.Checked then FGMRec.OnMouseOver := OnMouseOver;
end;

procedure TRectanglesFrm.cbOnMouseUpClick(Sender: TObject);
begin
  FGMRec.OnMouseUp := nil;
  if cbOnMouseUp.Checked then FGMRec.OnMouseUp := OnMouseUp;
end;

procedure TRectanglesFrm.cbOnPixelOffsetChangeClick(Sender: TObject);
begin
  FGMRec.OnPixelOffsetChange := nil;
  if cbOnPixelOffsetChange.Checked then FGMRec.OnPixelOffsetChange := OnPixelOffsetChange;
end;

procedure TRectanglesFrm.cbOnRightClickClick(Sender: TObject);
begin
  FGMRec.OnRightClick := nil;
  if cbOnRightClick.Checked then FGMRec.OnRightClick := OnRightClick;
end;

procedure TRectanglesFrm.cbOnStrokeColorChangeClick(Sender: TObject);
begin
  FGMRec.OnStrokeColorChange := nil;
  if cbOnStrokeColorChange.Checked then FGMRec.OnStrokeColorChange := OnStrokeColorChange;
end;

procedure TRectanglesFrm.cbOnStrokeOpacityChangeClick(Sender: TObject);
begin
  FGMRec.OnStrokeOpacityChange := nil;
  if cbOnStrokeOpacityChange.Checked then FGMRec.OnStrokeOpacityChange := OnStrokeOpacityChange;
end;

procedure TRectanglesFrm.cbOnStrokeWeightChangeClick(Sender: TObject);
begin
  FGMRec.OnStrokeWeightChange := nil;
  if cbOnStrokeWeightChange.Checked then FGMRec.OnStrokeWeightChange := OnStrokeWeightChange;
end;

procedure TRectanglesFrm.cbOnVisibleChangeClick(Sender: TObject);
begin
  FGMRec.OnVisibleChange := nil;
  if cbOnVisibleChange.Checked then FGMRec.OnVisibleChange := OnVisibleChange;
end;

procedure TRectanglesFrm.cbStrokeColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].StrokeColor := cbStrokeColor.Selected;
end;

procedure TRectanglesFrm.cbVisibleClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Visible := cbVisible.Checked;
end;

constructor TRectanglesFrm.Create(aOwner: TComponent; GMRec: TGMRectangle);
var
  i: Integer;
begin
  inherited Create(aOwner);

  pcMarker.ActivePageIndex := 0;

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMRec := GMRec;

  lbItems.Clear;
  for i :=  0 to FGMRec.Count - 1 do
    lbItems.Items.Add(FGMRec[i].Text);
end;

procedure TRectanglesFrm.eFillOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eFillOpacity.Text, Tmp) then
    FGMRec[lbItems.ItemIndex].FillOpacity := Tmp;
end;

procedure TRectanglesFrm.eMaxWidthChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if eMaxWidth.Value < 0 then eMaxWidth.Value := 0;

  FGMRec[lbItems.ItemIndex].InfoWindow.MaxWidth := eMaxWidth.Value;
end;

procedure TRectanglesFrm.eNELatChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Bounds.NE.Lat := FGMRec[lbItems.ItemIndex].Bounds.NE.StringToReal(eNELat.Text);
end;

procedure TRectanglesFrm.eNELngChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Bounds.NE.Lng := FGMRec[lbItems.ItemIndex].Bounds.NE.StringToReal(eNELng.Text);
end;

procedure TRectanglesFrm.ePixelOffsetHChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetH.Value < 0 then ePixelOffsetH.Value := 0;

  FGMRec[lbItems.ItemIndex].InfoWindow.PixelOffset.Height := ePixelOffsetH.Value;
end;

procedure TRectanglesFrm.ePixelOffsetWChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetW.Value < 0 then ePixelOffsetW.Value := 0;

  FGMRec[lbItems.ItemIndex].InfoWindow.PixelOffset.Width := ePixelOffsetW.Value;
end;

procedure TRectanglesFrm.eStrokeOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eStrokeOpacity.Text, Tmp) then
    FGMRec[lbItems.ItemIndex].StrokeOpacity := Tmp;
end;

procedure TRectanglesFrm.eStrokeWeightChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].StrokeWeight := eStrokeWeight.Value;
end;

procedure TRectanglesFrm.eSWLatChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Bounds.SW.Lat := FGMRec[lbItems.ItemIndex].Bounds.SW.StringToReal(eSWLat.Text);
end;

procedure TRectanglesFrm.eSWLngChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Bounds.SW.Lng := FGMRec[lbItems.ItemIndex].Bounds.SW.StringToReal(eSWLng.Text);
end;

procedure TRectanglesFrm.eTextChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].Text := eText.Text;
  lbItems.Items[lbItems.ItemIndex] := eText.Text;
end;

procedure TRectanglesFrm.FormActivate(Sender: TObject);
begin
  GetInfo;
end;

procedure TRectanglesFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TRectanglesFrm.GetInfo;
begin
  cbOnBoundsChanged.Checked := Assigned(FGMRec.OnBoundsChanged);
  cbOnClick.Checked := Assigned(FGMRec.OnClick);
  cbOnClickableChange.Checked := Assigned(FGMRec.OnClickableChange);
  cbOnDblClick.Checked := Assigned(FGMRec.OnDblClick);
  cbOnEditableChange.Checked := Assigned(FGMRec.OnEditableChange);
  cbOnFillColorChange.Checked := Assigned(FGMRec.OnFillColorChange);
  cbOnFillOpacityChange.Checked := Assigned(FGMRec.OnFillOpacityChange);
  cbOnMouseDown.Checked := Assigned(FGMRec.OnMouseDown);
  cbOnMouseMove.Checked := Assigned(FGMRec.OnMouseMove);
  cbOnMouseOut.Checked := Assigned(FGMRec.OnMouseOut);
  cbOnMouseOver.Checked := Assigned(FGMRec.OnMouseOver);
  cbOnMouseUp.Checked := Assigned(FGMRec.OnMouseUp);
  cbOnRightClick.Checked := Assigned(FGMRec.OnRightClick);
  cbOnStrokeColorChange.Checked := Assigned(FGMRec.OnStrokeColorChange);
  cbOnStrokeOpacityChange.Checked := Assigned(FGMRec.OnStrokeOpacityChange);
  cbOnStrokeWeightChange.Checked := Assigned(FGMRec.OnStrokeWeightChange);
  cbOnVisibleChange.Checked := Assigned(FGMRec.OnVisibleChange);
  cbOnCloseClick.Checked := Assigned(FGMRec.OnCloseClick);
  cbOnCloseOtherBeforeOpenChange.Checked := Assigned(FGMRec.OnCloseOtherBeforeOpenChange);
  cbOnDisableAutoPanChange.Checked := Assigned(FGMRec.OnDisableAutoPanChange);
  cbOnHTMLContentChange.Checked := Assigned(FGMRec.OnHTMLContentChange);
  cbOnMaxWidthChange.Checked := Assigned(FGMRec.OnMaxWidthChange);
  cbOnPixelOffsetChange.Checked := Assigned(FGMRec.OnPixelOffsetChange);

  if lbItems.ItemIndex = -1 then Exit;

  cbClickable.Checked := FGMRec[lbItems.ItemIndex].Clickable;
  cbEditable.Checked := FGMRec[lbItems.ItemIndex].Editable;
  cbVisible.Checked := FGMRec[lbItems.ItemIndex].Visible;
  cbStrokeColor.Selected := FGMRec[lbItems.ItemIndex].StrokeColor;
  cbFillColor.Selected := FGMRec[lbItems.ItemIndex].FillColor;
  eFillOpacity.Text := FloatToStr(FGMRec[lbItems.ItemIndex].FillOpacity);
  eStrokeOpacity.Text := FloatToStr(FGMRec[lbItems.ItemIndex].StrokeOpacity);
  eStrokeWeight.Value := FGMRec[lbItems.ItemIndex].StrokeWeight;
  eText.Text := FGMRec[lbItems.ItemIndex].Text;
  eNELat.Text := FGMRec[lbItems.ItemIndex].Bounds.NE.LatToStr(FGMRec.Map.Precision);
  eNELng.Text := FGMRec[lbItems.ItemIndex].Bounds.NE.LngToStr(FGMRec.Map.Precision);
  eSWLat.Text := FGMRec[lbItems.ItemIndex].Bounds.SW.LatToStr(FGMRec.Map.Precision);
  eSWLng.Text := FGMRec[lbItems.ItemIndex].Bounds.SW.LngToStr(FGMRec.Map.Precision);

  cbCloseOtherBeforeOpen.Checked := FGMRec[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen;
  cbDisableAutoPan.Checked := FGMRec[lbItems.ItemIndex].InfoWindow.DisableAutoPan;
  eMaxWidth.Value := FGMRec[lbItems.ItemIndex].InfoWindow.MaxWidth;
  ePixelOffsetH.Value := FGMRec[lbItems.ItemIndex].InfoWindow.PixelOffset.Height;
  ePixelOffsetW.Value := FGMRec[lbItems.ItemIndex].InfoWindow.PixelOffset.Width;
  mHTML.Lines.Text := FGMRec[lbItems.ItemIndex].InfoWindow.HTMLContent;
end;

procedure TRectanglesFrm.lbItemsClick(Sender: TObject);
begin
  GetInfo;
end;

procedure TRectanglesFrm.mHTMLChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMRec[lbItems.ItemIndex].InfoWindow.HTMLContent := mHTML.Lines.Text;
end;

end.
