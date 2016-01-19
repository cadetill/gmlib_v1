unit UCirclesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls,
  GMCircleVCL, GMMapVCL, GMLinkedComponents;

type
  TCirclesFrm = class(TForm)
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
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    cbClickable: TCheckBox;
    cbVisible: TCheckBox;
    cbEditable: TCheckBox;
    eText: TEdit;
    cbStrokeColor: TColorBox;
    eStrokeOpacity: TEdit;
    eStrokeWeight: TSpinEdit;
    eFillOpacity: TEdit;
    cbFillColor: TColorBox;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    eLng: TEdit;
    eLat: TEdit;
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
    cbOnFillOpacityChange: TCheckBox;
    cbOnFillColorChange: TCheckBox;
    cbOnCenterChange: TCheckBox;
    Label2: TLabel;
    eRadius: TEdit;
    cbOnRadiusChange: TCheckBox;
    tsAutoResize: TTabSheet;
    cbCircular: TCheckBox;
    cbActive: TCheckBox;
    eIncrement: TSpinEdit;
    Label7: TLabel;
    eMax: TSpinEdit;
    Label8: TLabel;
    eMin: TSpinEdit;
    Label14: TLabel;
    eSpeed: TSpinEdit;
    Label15: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lbItemsClick(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bCenterClick(Sender: TObject);
    procedure cbClickableClick(Sender: TObject);
    procedure cbEditableClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure eLatChange(Sender: TObject);
    procedure eLngChange(Sender: TObject);
    procedure cbStrokeColorChange(Sender: TObject);
    procedure eStrokeOpacityChange(Sender: TObject);
    procedure eStrokeWeightChange(Sender: TObject);
    procedure cbFillColorChange(Sender: TObject);
    procedure eFillOpacityChange(Sender: TObject);
    procedure eRadiusChange(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure cbCloseOtherBeforeOpenClick(Sender: TObject);
    procedure cbDisableAutoPanClick(Sender: TObject);
    procedure eMaxWidthChange(Sender: TObject);
    procedure ePixelOffsetHChange(Sender: TObject);
    procedure ePixelOffsetWChange(Sender: TObject);
    procedure mHTMLChange(Sender: TObject);
    procedure cbOnCenterChangeClick(Sender: TObject);
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
    procedure cbOnRadiusChangeClick(Sender: TObject);
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
    procedure cbActiveClick(Sender: TObject);
    procedure cbCircularClick(Sender: TObject);
    procedure eIncrementChange(Sender: TObject);
    procedure eMaxChange(Sender: TObject);
    procedure eMinChange(Sender: TObject);
    procedure eSpeedChange(Sender: TObject);
  private
    FGMCircle: TGMCircle;
    procedure GetInfo;
  public
    OnCenterChange: TLatLngIdxEvent;
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
    OnRadiusChange: TLinkedComponentChange;
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

    constructor Create(aOwner: TComponent; GMRec: TGMCircle); reintroduce; virtual;
  end;

var
  CirclesFrm: TCirclesFrm;

implementation

{$R *.dfm}

{ TForm1 }

procedure TCirclesFrm.bCenterClick(Sender: TObject);
begin
  if lbItems.ItemIndex <> -1 then
    FGMCircle[lbItems.ItemIndex].CenterMapTo;
end;

procedure TCirclesFrm.bDelClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  FGMCircle.Delete(lbItems.ItemIndex);
  lbItems.DeleteSelected;
end;

procedure TCirclesFrm.bDownClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = lbItems.Count - 1 then Exit;

  FGMCircle.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
end;

procedure TCirclesFrm.bNewClick(Sender: TObject);
var
  Cir: TCircle;
begin
  Cir := FGMCircle.Add;
  lbItems.ItemIndex := lbItems.Items.Add(Cir.Text);

  GetInfo;
end;

procedure TCirclesFrm.bUpClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = 0 then Exit;

  FGMCircle.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
end;

procedure TCirclesFrm.cbActiveClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].AutoResize.Active := cbActive.Checked;
end;

procedure TCirclesFrm.cbCircularClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].AutoResize.Circular := cbCircular.Checked;
end;

procedure TCirclesFrm.cbClickableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].Clickable := cbClickable.Checked;
end;

procedure TCirclesFrm.cbCloseOtherBeforeOpenClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen := cbCloseOtherBeforeOpen.Checked;
end;

procedure TCirclesFrm.cbDisableAutoPanClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].InfoWindow.DisableAutoPan := cbDisableAutoPan.Checked;
end;

procedure TCirclesFrm.cbEditableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].Editable := cbEditable.Checked;
end;

procedure TCirclesFrm.cbFillColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].FillColor := cbFillColor.Selected;
end;

procedure TCirclesFrm.cbOnCenterChangeClick(Sender: TObject);
begin
  FGMCircle.OnCenterChange := nil;
  if cbOnCenterChange.Checked then FGMCircle.OnCenterChange := OnCenterChange;
end;

procedure TCirclesFrm.cbOnClickableChangeClick(Sender: TObject);
begin
  FGMCircle.OnClickableChange := nil;
  if cbOnClickableChange.Checked then FGMCircle.OnClickableChange := OnClickableChange;
end;

procedure TCirclesFrm.cbOnClickClick(Sender: TObject);
begin
  FGMCircle.OnClick := nil;
  if cbOnClick.Checked then FGMCircle.OnClick := OnClick;
end;

procedure TCirclesFrm.cbOnCloseClickClick(Sender: TObject);
begin
  FGMCircle.OnCloseClick := nil;
  if cbOnCloseClick.Checked then FGMCircle.OnCloseClick := OnCloseClick;
end;

procedure TCirclesFrm.cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
begin
  FGMCircle.OnCloseOtherBeforeOpenChange := nil;
  if cbOnCloseOtherBeforeOpenChange.Checked then FGMCircle.OnCloseOtherBeforeOpenChange := OnCloseOtherBeforeOpenChange;
end;

procedure TCirclesFrm.cbOnDblClickClick(Sender: TObject);
begin
  FGMCircle.OnDblClick := nil;
  if cbOnDblClick.Checked then FGMCircle.OnDblClick := OnDblClick;
end;

procedure TCirclesFrm.cbOnDisableAutoPanChangeClick(Sender: TObject);
begin
  FGMCircle.OnDisableAutoPanChange := nil;
  if cbOnDisableAutoPanChange.Checked then FGMCircle.OnDisableAutoPanChange := OnDisableAutoPanChange;
end;

procedure TCirclesFrm.cbOnEditableChangeClick(Sender: TObject);
begin
  FGMCircle.OnEditableChange := nil;
  if cbOnEditableChange.Checked then FGMCircle.OnEditableChange := OnEditableChange;
end;

procedure TCirclesFrm.cbOnFillColorChangeClick(Sender: TObject);
begin
  FGMCircle.OnFillColorChange := nil;
  if cbOnFillColorChange.Checked then FGMCircle.OnFillColorChange := OnFillColorChange;
end;

procedure TCirclesFrm.cbOnFillOpacityChangeClick(Sender: TObject);
begin
  FGMCircle.OnFillOpacityChange := nil;
  if cbOnFillOpacityChange.Checked then FGMCircle.OnFillOpacityChange := OnFillOpacityChange;
end;

procedure TCirclesFrm.cbOnHTMLContentChangeClick(Sender: TObject);
begin
  FGMCircle.OnHTMLContentChange := nil;
  if cbOnHTMLContentChange.Checked then FGMCircle.OnHTMLContentChange := OnHTMLContentChange;
end;

procedure TCirclesFrm.cbOnMaxWidthChangeClick(Sender: TObject);
begin
  FGMCircle.OnMaxWidthChange := nil;
  if cbOnMaxWidthChange.Checked then FGMCircle.OnMaxWidthChange := OnMaxWidthChange;
end;

procedure TCirclesFrm.cbOnMouseDownClick(Sender: TObject);
begin
  FGMCircle.OnMouseDown := nil;
  if cbOnMouseDown.Checked then FGMCircle.OnMouseDown := OnMouseDown;
end;

procedure TCirclesFrm.cbOnMouseMoveClick(Sender: TObject);
begin
  FGMCircle.OnMouseMove := nil;
  if cbOnMouseMove.Checked then FGMCircle.OnMouseMove := OnMouseMove;
end;

procedure TCirclesFrm.cbOnMouseOutClick(Sender: TObject);
begin
  FGMCircle.OnMouseOut := nil;
  if cbOnMouseOut.Checked then FGMCircle.OnMouseOut := OnMouseOut;
end;

procedure TCirclesFrm.cbOnMouseOverClick(Sender: TObject);
begin
  FGMCircle.OnMouseOver := nil;
  if cbOnMouseOver.Checked then FGMCircle.OnMouseOver := OnMouseOver;
end;

procedure TCirclesFrm.cbOnMouseUpClick(Sender: TObject);
begin
  FGMCircle.OnMouseUp := nil;
  if cbOnMouseUp.Checked then FGMCircle.OnMouseUp := OnMouseUp;
end;

procedure TCirclesFrm.cbOnPixelOffsetChangeClick(Sender: TObject);
begin
  FGMCircle.OnPixelOffsetChange := nil;
  if cbOnPixelOffsetChange.Checked then FGMCircle.OnPixelOffsetChange := OnPixelOffsetChange;
end;

procedure TCirclesFrm.cbOnRadiusChangeClick(Sender: TObject);
begin
  FGMCircle.OnRadiusChange := nil;
  if cbOnRadiusChange.Checked then FGMCircle.OnRadiusChange := OnRadiusChange;
end;

procedure TCirclesFrm.cbOnRightClickClick(Sender: TObject);
begin
  FGMCircle.OnRightClick := nil;
  if cbOnRightClick.Checked then FGMCircle.OnRightClick := OnRightClick;
end;

procedure TCirclesFrm.cbOnStrokeColorChangeClick(Sender: TObject);
begin
  FGMCircle.OnStrokeColorChange := nil;
  if cbOnStrokeColorChange.Checked then FGMCircle.OnStrokeColorChange := OnStrokeColorChange;
end;

procedure TCirclesFrm.cbOnStrokeOpacityChangeClick(Sender: TObject);
begin
  FGMCircle.OnStrokeOpacityChange := nil;
  if cbOnStrokeOpacityChange.Checked then FGMCircle.OnStrokeOpacityChange := OnStrokeOpacityChange;
end;

procedure TCirclesFrm.cbOnStrokeWeightChangeClick(Sender: TObject);
begin
  FGMCircle.OnStrokeWeightChange := nil;
  if cbOnStrokeWeightChange.Checked then FGMCircle.OnStrokeWeightChange := OnStrokeWeightChange;
end;

procedure TCirclesFrm.cbOnVisibleChangeClick(Sender: TObject);
begin
  FGMCircle.OnVisibleChange := nil;
  if cbOnVisibleChange.Checked then FGMCircle.OnVisibleChange := OnVisibleChange;
end;

procedure TCirclesFrm.cbStrokeColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].StrokeColor := cbStrokeColor.Selected;
end;

procedure TCirclesFrm.cbVisibleClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].Visible := cbVisible.Checked;
end;

constructor TCirclesFrm.Create(aOwner: TComponent; GMRec: TGMCircle);
var
  i: Integer;
begin
  inherited Create(aOwner);

  pcMarker.ActivePageIndex := 0;

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMCircle := GMRec;

  lbItems.Clear;
  for i :=  0 to FGMCircle.Count - 1 do
    lbItems.Items.Add(FGMCircle[i].Text);
end;

procedure TCirclesFrm.eFillOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eFillOpacity.Text, Tmp) then
    FGMCircle[lbItems.ItemIndex].FillOpacity := Tmp;
end;

procedure TCirclesFrm.eIncrementChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].AutoResize.Increment := eIncrement.Value;
end;

procedure TCirclesFrm.eLatChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].Center.Lat := FGMCircle[lbItems.ItemIndex].Center.StringToReal(eLat.Text);
end;

procedure TCirclesFrm.eLngChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].Center.Lng := FGMCircle[lbItems.ItemIndex].Center.StringToReal(eLng.Text);
end;

procedure TCirclesFrm.eMaxChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].AutoResize.Max := eMax.Value;
end;

procedure TCirclesFrm.eMaxWidthChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if eMaxWidth.Value < 0 then eMaxWidth.Value := 0;

  FGMCircle[lbItems.ItemIndex].InfoWindow.MaxWidth := eMaxWidth.Value;
end;

procedure TCirclesFrm.eMinChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].AutoResize.Min := eMin.Value;
end;

procedure TCirclesFrm.ePixelOffsetHChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetH.Value < 0 then ePixelOffsetH.Value := 0;

  FGMCircle[lbItems.ItemIndex].InfoWindow.PixelOffset.Height := ePixelOffsetH.Value;
end;

procedure TCirclesFrm.ePixelOffsetWChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetW.Value < 0 then ePixelOffsetW.Value := 0;

  FGMCircle[lbItems.ItemIndex].InfoWindow.PixelOffset.Width := ePixelOffsetW.Value;
end;

procedure TCirclesFrm.eRadiusChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eRadius.Text, Tmp) then
    FGMCircle[lbItems.ItemIndex].Radius := Tmp;
end;

procedure TCirclesFrm.eSpeedChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].AutoResize.Speed := eSpeed.Value;
end;

procedure TCirclesFrm.eStrokeOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eStrokeOpacity.Text, Tmp) then
    FGMCircle[lbItems.ItemIndex].StrokeOpacity := Tmp;
end;

procedure TCirclesFrm.eStrokeWeightChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].StrokeWeight := eStrokeWeight.Value;
end;

procedure TCirclesFrm.eTextChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].Text := eText.Text;
  lbItems.Items[lbItems.ItemIndex] := eText.Text;
end;

procedure TCirclesFrm.FormActivate(Sender: TObject);
begin
  GetInfo;
end;

procedure TCirclesFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TCirclesFrm.GetInfo;
begin
  cbOnCenterChange.Checked := Assigned(FGMCircle.OnCenterChange);
  cbOnClick.Checked := Assigned(FGMCircle.OnClick);
  cbOnClickableChange.Checked := Assigned(FGMCircle.OnClickableChange);
  cbOnDblClick.Checked := Assigned(FGMCircle.OnDblClick);
  cbOnEditableChange.Checked := Assigned(FGMCircle.OnEditableChange);
  cbOnFillColorChange.Checked := Assigned(FGMCircle.OnFillColorChange);
  cbOnFillOpacityChange.Checked := Assigned(FGMCircle.OnFillOpacityChange);
  cbOnMouseDown.Checked := Assigned(FGMCircle.OnMouseDown);
  cbOnMouseMove.Checked := Assigned(FGMCircle.OnMouseMove);
  cbOnMouseOut.Checked := Assigned(FGMCircle.OnMouseOut);
  cbOnMouseOver.Checked := Assigned(FGMCircle.OnMouseOver);
  cbOnMouseUp.Checked := Assigned(FGMCircle.OnMouseUp);
  cbOnRadiusChange.Checked := Assigned(FGMCircle.OnRadiusChange);
  cbOnRightClick.Checked := Assigned(FGMCircle.OnRightClick);
  cbOnStrokeColorChange.Checked := Assigned(FGMCircle.OnStrokeColorChange);
  cbOnStrokeOpacityChange.Checked := Assigned(FGMCircle.OnStrokeOpacityChange);
  cbOnStrokeWeightChange.Checked := Assigned(FGMCircle.OnStrokeWeightChange);
  cbOnVisibleChange.Checked := Assigned(FGMCircle.OnVisibleChange);
  cbOnCloseClick.Checked := Assigned(FGMCircle.OnCloseClick);
  cbOnCloseOtherBeforeOpenChange.Checked := Assigned(FGMCircle.OnCloseOtherBeforeOpenChange);
  cbOnDisableAutoPanChange.Checked := Assigned(FGMCircle.OnDisableAutoPanChange);
  cbOnHTMLContentChange.Checked := Assigned(FGMCircle.OnHTMLContentChange);
  cbOnMaxWidthChange.Checked := Assigned(FGMCircle.OnMaxWidthChange);
  cbOnPixelOffsetChange.Checked := Assigned(FGMCircle.OnPixelOffsetChange);

  if lbItems.ItemIndex = -1 then Exit;

  FGMCircle.OnCenterChange := nil;
  eLat.Text := FGMCircle[lbItems.ItemIndex].Center.LatToStr(FGMCircle.Map.Precision);
  eLng.Text := FGMCircle[lbItems.ItemIndex].Center.LngToStr(FGMCircle.Map.Precision);
  cbOnCenterChangeClick(nil);
  cbClickable.Checked := FGMCircle[lbItems.ItemIndex].Clickable;
  cbEditable.Checked := FGMCircle[lbItems.ItemIndex].Editable;
  cbVisible.Checked := FGMCircle[lbItems.ItemIndex].Visible;
  cbFillColor.Selected := FGMCircle[lbItems.ItemIndex].FillColor;
  eFillOpacity.Text := FloatToStr(FGMCircle[lbItems.ItemIndex].FillOpacity);
  cbStrokeColor.Selected := FGMCircle[lbItems.ItemIndex].StrokeColor;
  eStrokeOpacity.Text := FloatToStr(FGMCircle[lbItems.ItemIndex].StrokeOpacity);
  eStrokeWeight.Value := FGMCircle[lbItems.ItemIndex].StrokeWeight;
  eRadius.Text := FloatToStr(FGMCircle[lbItems.ItemIndex].Radius);
  eText.Text := FGMCircle[lbItems.ItemIndex].Text;

  cbActive.Checked := FGMCircle[lbItems.ItemIndex].AutoResize.Active;
  cbCircular.Checked := FGMCircle[lbItems.ItemIndex].AutoResize.Circular;
  eIncrement.Value := FGMCircle[lbItems.ItemIndex].AutoResize.Increment;
  eMax.Value := FGMCircle[lbItems.ItemIndex].AutoResize.Max;
  eMin.Value := FGMCircle[lbItems.ItemIndex].AutoResize.Min;
  eSpeed.Value := FGMCircle[lbItems.ItemIndex].AutoResize.Speed;

  cbCloseOtherBeforeOpen.Checked := FGMCircle[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen;
  cbDisableAutoPan.Checked := FGMCircle[lbItems.ItemIndex].InfoWindow.DisableAutoPan;
  eMaxWidth.Value := FGMCircle[lbItems.ItemIndex].InfoWindow.MaxWidth;
  ePixelOffsetH.Value := FGMCircle[lbItems.ItemIndex].InfoWindow.PixelOffset.Height;
  ePixelOffsetW.Value := FGMCircle[lbItems.ItemIndex].InfoWindow.PixelOffset.Width;
  mHTML.Lines.Text := FGMCircle[lbItems.ItemIndex].InfoWindow.HTMLContent;
end;

procedure TCirclesFrm.lbItemsClick(Sender: TObject);
begin
  GetInfo;
end;

procedure TCirclesFrm.mHTMLChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMCircle[lbItems.ItemIndex].InfoWindow.HTMLContent := mHTML.Lines.Text;
end;

end.
