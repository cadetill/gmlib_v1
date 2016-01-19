unit UGroundOverlayFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls,
  GMGroundOverlay, GMLinkedComponents;

type
  TGroundOverlayFrm = class(TForm)
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
    cbOnClickableChange: TCheckBox;
    cbOnDblClick: TCheckBox;
    cbOnUrlChange: TCheckBox;
    cbOnDisableAutoPanChange: TCheckBox;
    cbOnCloseOtherBeforeOpenChange: TCheckBox;
    cbOnCloseClick: TCheckBox;
    cbOnVisibleChange: TCheckBox;
    cbOnHTMLContentChange: TCheckBox;
    cbOnMaxWidthChange: TCheckBox;
    cbOnPixelOffsetChange: TCheckBox;
    cbOnOpacityChange: TCheckBox;
    cbOnBoundsChanged: TCheckBox;
    eOpacity: TEdit;
    Label11: TLabel;
    eUrl: TEdit;
    Label2: TLabel;
    cbOnClick: TCheckBox;
    procedure lbItemsClick(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bCenterClick(Sender: TObject);
    procedure cbClickableClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure eTextChange(Sender: TObject);
    procedure eOpacityChange(Sender: TObject);
    procedure eUrlChange(Sender: TObject);
    procedure eNELatChange(Sender: TObject);
    procedure eNELngChange(Sender: TObject);
    procedure eSWLatChange(Sender: TObject);
    procedure eSWLngChange(Sender: TObject);
    procedure cbCloseOtherBeforeOpenClick(Sender: TObject);
    procedure cbDisableAutoPanClick(Sender: TObject);
    procedure ePixelOffsetHChange(Sender: TObject);
    procedure ePixelOffsetWChange(Sender: TObject);
    procedure eMaxWidthChange(Sender: TObject);
    procedure mHTMLChange(Sender: TObject);
    procedure cbOnBoundsChangedClick(Sender: TObject);
    procedure cbOnClickClick(Sender: TObject);
    procedure cbOnClickableChangeClick(Sender: TObject);
    procedure cbOnDblClickClick(Sender: TObject);
    procedure cbOnOpacityChangeClick(Sender: TObject);
    procedure cbOnUrlChangeClick(Sender: TObject);
    procedure cbOnVisibleChangeClick(Sender: TObject);
    procedure cbOnCloseClickClick(Sender: TObject);
    procedure cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
    procedure cbOnDisableAutoPanChangeClick(Sender: TObject);
    procedure cbOnHTMLContentChangeClick(Sender: TObject);
    procedure cbOnMaxWidthChangeClick(Sender: TObject);
    procedure cbOnPixelOffsetChangeClick(Sender: TObject);
  private
    FGMGround: TGMGroundOverlay;
    procedure GetInfo;
  public
    OnBoundsChanged: TLinkedComponentChange;
    OnClick: TLatLngIdxEvent;
    OnClickableChange: TLinkedComponentChange;
    OnDblClick: TLatLngIdxEvent;
    OnOpacityChange: TLinkedComponentChange;
    OnUrlDown: TLinkedComponentChange;
    OnVisibleChange: TLinkedComponentChange;

    OnCloseClick: TLinkedComponentChange;
    OnCloseOtherBeforeOpenChange: TLinkedComponentChange;
    OnDisableAutoPanChange: TLinkedComponentChange;
    OnHTMLContentChange: TLinkedComponentChange;
    OnMaxWidthChange: TLinkedComponentChange;
    OnPixelOffsetChange: TLinkedComponentChange;

    constructor Create(aOwner: TComponent; GMGround: TGMGroundOverlay); reintroduce; virtual;
  end;

var
  GroundOverlayFrm: TGroundOverlayFrm;

implementation

{$R *.dfm}

{ TGroundOverlayFrm }

procedure TGroundOverlayFrm.bCenterClick(Sender: TObject);
begin
  if lbItems.ItemIndex <> -1 then
    FGMGround[lbItems.ItemIndex].CenterMapTo;
end;

procedure TGroundOverlayFrm.bDelClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  FGMGround.Delete(lbItems.ItemIndex);
  lbItems.DeleteSelected;
end;

procedure TGroundOverlayFrm.bDownClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = lbItems.Count - 1 then Exit;

  FGMGround.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
end;

procedure TGroundOverlayFrm.bNewClick(Sender: TObject);
var
  Ground: TGroundOverlay;
  Url: string;
begin
  Url := InputBox('Enter url image', 'Rul', '');
  if Url = '' then Exit;

  Ground := FGMGround.Add(Url);
  lbItems.ItemIndex := lbItems.Items.Add(Ground.Text);

  GetInfo;
end;

procedure TGroundOverlayFrm.bUpClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = 0 then Exit;

  FGMGround.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
end;

procedure TGroundOverlayFrm.cbClickableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Clickable := cbClickable.Checked;
end;

procedure TGroundOverlayFrm.cbCloseOtherBeforeOpenClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen := cbCloseOtherBeforeOpen.Checked;
end;

procedure TGroundOverlayFrm.cbDisableAutoPanClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].InfoWindow.DisableAutoPan := cbDisableAutoPan.Checked;
end;

procedure TGroundOverlayFrm.cbOnBoundsChangedClick(Sender: TObject);
begin
  FGMGround.OnBoundsChanged := nil;
  if cbOnBoundsChanged.Checked then FGMGround.OnBoundsChanged := OnBoundsChanged;
end;

procedure TGroundOverlayFrm.cbOnClickableChangeClick(Sender: TObject);
begin
  FGMGround.OnClickableChange := nil;
  if cbOnClickableChange.Checked then FGMGround.OnClickableChange := OnClickableChange;
end;

procedure TGroundOverlayFrm.cbOnClickClick(Sender: TObject);
begin
  FGMGround.OnClick := nil;
  if cbOnClick.Checked then FGMGround.OnClick := OnClick;
end;

procedure TGroundOverlayFrm.cbOnCloseClickClick(Sender: TObject);
begin
  FGMGround.OnCloseClick := nil;
  if cbOnCloseClick.Checked then FGMGround.OnCloseClick := OnCloseClick;
end;

procedure TGroundOverlayFrm.cbOnCloseOtherBeforeOpenChangeClick(
  Sender: TObject);
begin
  FGMGround.OnCloseOtherBeforeOpenChange := nil;
  if cbOnCloseOtherBeforeOpenChange.Checked then FGMGround.OnCloseOtherBeforeOpenChange := OnCloseOtherBeforeOpenChange;
end;

procedure TGroundOverlayFrm.cbOnDblClickClick(Sender: TObject);
begin
  FGMGround.OnDblClick := nil;
  if cbOnDblClick.Checked then FGMGround.OnDblClick := OnDblClick;
end;

procedure TGroundOverlayFrm.cbOnDisableAutoPanChangeClick(Sender: TObject);
begin
  FGMGround.OnDisableAutoPanChange := nil;
  if cbOnDisableAutoPanChange.Checked then FGMGround.OnDisableAutoPanChange := OnDisableAutoPanChange;
end;

procedure TGroundOverlayFrm.cbOnHTMLContentChangeClick(Sender: TObject);
begin
  FGMGround.OnHTMLContentChange := nil;
  if cbOnHTMLContentChange.Checked then FGMGround.OnHTMLContentChange := OnHTMLContentChange;
end;

procedure TGroundOverlayFrm.cbOnMaxWidthChangeClick(Sender: TObject);
begin
  FGMGround.OnMaxWidthChange := nil;
  if cbOnMaxWidthChange.Checked then FGMGround.OnMaxWidthChange := OnMaxWidthChange;
end;

procedure TGroundOverlayFrm.cbOnOpacityChangeClick(Sender: TObject);
begin
  FGMGround.OnOpacityChange := nil;
  if cbOnOpacityChange.Checked then FGMGround.OnOpacityChange := OnOpacityChange;
end;

procedure TGroundOverlayFrm.cbOnPixelOffsetChangeClick(Sender: TObject);
begin
  FGMGround.OnPixelOffsetChange := nil;
  if cbOnPixelOffsetChange.Checked then FGMGround.OnPixelOffsetChange := OnPixelOffsetChange;
end;

procedure TGroundOverlayFrm.cbOnUrlChangeClick(Sender: TObject);
begin
  FGMGround.OnUrlChange := nil;
  if cbOnUrlChange.Checked then FGMGround.OnUrlChange := OnUrlDown;
end;

procedure TGroundOverlayFrm.cbOnVisibleChangeClick(Sender: TObject);
begin
  FGMGround.OnVisibleChange := nil;
  if cbOnVisibleChange.Checked then FGMGround.OnVisibleChange := OnVisibleChange;
end;

procedure TGroundOverlayFrm.cbVisibleClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Visible := cbVisible.Checked;
end;

constructor TGroundOverlayFrm.Create(aOwner: TComponent;
  GMGround: TGMGroundOverlay);
var
  i: Integer;
begin
  inherited Create(aOwner);

  pcMarker.ActivePageIndex := 0;

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMGround := GMGround;

  lbItems.Clear;
  for i :=  0 to FGMGround.Count - 1 do
    lbItems.Items.Add(FGMGround[i].Text);
end;

procedure TGroundOverlayFrm.eMaxWidthChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if eMaxWidth.Value < 0 then eMaxWidth.Value := 0;

  FGMGround[lbItems.ItemIndex].InfoWindow.MaxWidth := eMaxWidth.Value;
end;

procedure TGroundOverlayFrm.eNELatChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Bounds.NE.Lat := FGMGround[lbItems.ItemIndex].Bounds.NE.StringToReal(eNELat.Text);
end;

procedure TGroundOverlayFrm.eNELngChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Bounds.NE.Lng := FGMGround[lbItems.ItemIndex].Bounds.NE.StringToReal(eNELng.Text);
end;

procedure TGroundOverlayFrm.eOpacityChange(Sender: TObject);
var
  Tmp: Extended;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if TryStrToFloat(eOpacity.Text, Tmp) then
    FGMGround[lbItems.ItemIndex].Opacity := Tmp;
end;

procedure TGroundOverlayFrm.ePixelOffsetHChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetH.Value < 0 then ePixelOffsetH.Value := 0;

  FGMGround[lbItems.ItemIndex].InfoWindow.PixelOffset.Height := ePixelOffsetH.Value;
end;

procedure TGroundOverlayFrm.ePixelOffsetWChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetW.Value < 0 then ePixelOffsetW.Value := 0;

  FGMGround[lbItems.ItemIndex].InfoWindow.PixelOffset.Width := ePixelOffsetW.Value;
end;

procedure TGroundOverlayFrm.eSWLatChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Bounds.SW.Lat := FGMGround[lbItems.ItemIndex].Bounds.SW.StringToReal(eSWLat.Text);
end;

procedure TGroundOverlayFrm.eSWLngChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Bounds.SW.Lng := FGMGround[lbItems.ItemIndex].Bounds.SW.StringToReal(eSWLng.Text);
end;

procedure TGroundOverlayFrm.eTextChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Text := eText.Text;
  lbItems.Items[lbItems.ItemIndex] := eText.Text;
end;

procedure TGroundOverlayFrm.eUrlChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].Url := eUrl.Text;
end;

procedure TGroundOverlayFrm.GetInfo;
begin
  cbOnBoundsChanged.Checked := Assigned(FGMGround.OnBoundsChanged);
  cbOnClick.Checked := Assigned(FGMGround.OnClick);
  cbOnClickableChange.Checked := Assigned(FGMGround.OnClickableChange);
  cbOnDblClick.Checked := Assigned(FGMGround.OnDblClick);
  cbOnOpacityChange.Checked := Assigned(FGMGround.OnOpacityChange);
  cbOnUrlChange.Checked := Assigned(FGMGround.OnUrlChange);
  cbOnVisibleChange.Checked := Assigned(FGMGround.OnVisibleChange);
  cbOnCloseClick.Checked := Assigned(FGMGround.OnCloseClick);
  cbOnCloseOtherBeforeOpenChange.Checked := Assigned(FGMGround.OnCloseOtherBeforeOpenChange);
  cbOnDisableAutoPanChange.Checked := Assigned(FGMGround.OnDisableAutoPanChange);
  cbOnHTMLContentChange.Checked := Assigned(FGMGround.OnHTMLContentChange);
  cbOnMaxWidthChange.Checked := Assigned(FGMGround.OnMaxWidthChange);
  cbOnPixelOffsetChange.Checked := Assigned(FGMGround.OnPixelOffsetChange);

  if lbItems.ItemIndex = -1 then Exit;

  cbClickable.Checked := FGMGround[lbItems.ItemIndex].Clickable;
  cbVisible.Checked := FGMGround[lbItems.ItemIndex].Visible;
  eUrl.Text := FGMGround[lbItems.ItemIndex].Url;
  eText.Text := FGMGround[lbItems.ItemIndex].Text;
  eOpacity.Text := FloatToStr(FGMGround[lbItems.ItemIndex].Opacity);
  eNELat.Text := FGMGround[lbItems.ItemIndex].Bounds.NE.LatToStr(FGMGround.Map.Precision);
  eNELng.Text := FGMGround[lbItems.ItemIndex].Bounds.NE.LngToStr(FGMGround.Map.Precision);
  eSWLat.Text := FGMGround[lbItems.ItemIndex].Bounds.SW.LatToStr(FGMGround.Map.Precision);
  eSWLng.Text := FGMGround[lbItems.ItemIndex].Bounds.SW.LngToStr(FGMGround.Map.Precision);

  cbCloseOtherBeforeOpen.Checked := FGMGround[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen;
  cbDisableAutoPan.Checked := FGMGround[lbItems.ItemIndex].InfoWindow.DisableAutoPan;
  eMaxWidth.Value := FGMGround[lbItems.ItemIndex].InfoWindow.MaxWidth;
  ePixelOffsetH.Value := FGMGround[lbItems.ItemIndex].InfoWindow.PixelOffset.Height;
  ePixelOffsetW.Value := FGMGround[lbItems.ItemIndex].InfoWindow.PixelOffset.Width;
  mHTML.Lines.Text := FGMGround[lbItems.ItemIndex].InfoWindow.HTMLContent;
end;

procedure TGroundOverlayFrm.lbItemsClick(Sender: TObject);
begin
  GetInfo;
end;

procedure TGroundOverlayFrm.mHTMLChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMGround[lbItems.ItemIndex].InfoWindow.HTMLContent := mHTML.Lines.Text;
end;

end.
