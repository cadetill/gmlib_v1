unit UMarkersFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Spin, Buttons,
  GMMarker, GMMarkerVCL, GMMap, GMLinkedComponents, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient;

type
  TMarkersFrm = class(TForm)
    pcMarker: TPageControl;
    tsGeneral: TTabSheet;
    PageControl2: TPageControl;
    tsMarkers: TTabSheet;
    Label1: TLabel;
    lbItems: TListBox;
    bUp: TButton;
    bDown: TButton;
    bNew: TButton;
    bDel: TButton;
    tsInfoWin: TTabSheet;
    cbBounce: TCheckBox;
    cbOnDrop: TCheckBox;
    cbClickable: TCheckBox;
    cbDraggable: TCheckBox;
    cbFlat: TCheckBox;
    cbOptimized: TCheckBox;
    cbRaiseOnDrag: TCheckBox;
    cbVisible: TCheckBox;
    Label37: TLabel;
    eLat: TEdit;
    eLng: TEdit;
    Label36: TLabel;
    eTitle: TEdit;
    Label38: TLabel;
    eIcon: TEdit;
    Label2: TLabel;
    cbCloseOtherBeforeOpen: TCheckBox;
    cbDisableAutoPan: TCheckBox;
    eMaxWidth: TSpinEdit;
    Label33: TLabel;
    ePixelOffsetH: TSpinEdit;
    Label3: TLabel;
    ePixelOffsetW: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    mHTML: TMemo;
    bCenter: TButton;
    tsEvents: TTabSheet;
    cbOnClick: TCheckBox;
    cbOnClickableChange: TCheckBox;
    cbOnDblClick: TCheckBox;
    cbOnDrag: TCheckBox;
    cbOnDraggableChange: TCheckBox;
    cbOnDragEnd: TCheckBox;
    cbOnDragStart: TCheckBox;
    cbOnFlatChange: TCheckBox;
    cbOnIconChange: TCheckBox;
    cbOnRightClick: TCheckBox;
    cbOnMouseDown: TCheckBox;
    cbOnMouseOver: TCheckBox;
    cbOnMouseOut: TCheckBox;
    cbOnMouseUp: TCheckBox;
    cbOnPositionChange: TCheckBox;
    cbOnDisableAutoPanChange: TCheckBox;
    cbOnCloseOtherBeforeOpenChange: TCheckBox;
    cbOnCloseClick: TCheckBox;
    cbOnVisibleChange: TCheckBox;
    cbOnTitleChange: TCheckBox;
    cbOnHTMLContentChange: TCheckBox;
    cbOnMaxWidthChange: TCheckBox;
    cbOnPixelOffsetChange: TCheckBox;
    OpenDialog1: TOpenDialog;
    tsLoadCSV: TTabSheet;
    eFileName: TEdit;
    bSearchFile: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    eLatColumn: TSpinEdit;
    Label9: TLabel;
    eLngColumn: TSpinEdit;
    Label10: TLabel;
    eTitleColumn: TSpinEdit;
    Label11: TLabel;
    eDelimiter: TEdit;
    Label12: TLabel;
    cbDeleteBeforeLoad: TCheckBox;
    cbWithRownTitle: TCheckBox;
    bLoadFromCSV: TButton;
    pbPoints: TProgressBar;
    tsColoredMarker: TTabSheet;
    Label13: TLabel;
    cbMarkerType: TComboBox;
    eColWidth: TSpinEdit;
    Label14: TLabel;
    eColHeight: TSpinEdit;
    Label15: TLabel;
    Label16: TLabel;
    cbColCornerColor: TColorBox;
    cbColPrimaryColor: TColorBox;
    Label17: TLabel;
    cbColStrokeColor: TColorBox;
    Label18: TLabel;
    tsStyledMarker: TTabSheet;
    cbSMBackColor: TColorBox;
    Label19: TLabel;
    Label20: TLabel;
    cbSMTextColor: TColorBox;
    Label21: TLabel;
    cbSMStarColor: TColorBox;
    cbSMShowStar: TCheckBox;
    cbSMStyledIcon: TComboBox;
    Label23: TLabel;
    cbShowIWMouseOver: TCheckBox;
    bZoomToAll: TButton;
    tsGeometry: TTabSheet;
    lbTo: TListBox;
    bComDist: TButton;
    bLoadMarkers: TButton;
    eRadius: TEdit;
    Label22: TLabel;
    lComDist: TLabel;
    bShowInfoW: TButton;
    bMaxZoom: TButton;
    tsLoadCDS: TTabSheet;
    bOpen: TButton;
    cdsMarkers: TClientDataSet;
    DBGrid1: TDBGrid;
    dsoMarkers: TDataSource;
    bLoad: TButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bDelClick(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure cbBounceClick(Sender: TObject);
    procedure cbOnDropClick(Sender: TObject);
    procedure cbClickableClick(Sender: TObject);
    procedure cbDraggableClick(Sender: TObject);
    procedure cbFlatClick(Sender: TObject);
    procedure cbOptimizedClick(Sender: TObject);
    procedure cbRaiseOnDragClick(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
    procedure eLatChange(Sender: TObject);
    procedure eLngChange(Sender: TObject);
    procedure eTitleChange(Sender: TObject);
    procedure eIconChange(Sender: TObject);
    procedure lbItemsClick(Sender: TObject);
    procedure bNewClick(Sender: TObject);
    procedure bCenterClick(Sender: TObject);
    procedure cbCloseOtherBeforeOpenClick(Sender: TObject);
    procedure cbDisableAutoPanClick(Sender: TObject);
    procedure eMaxWidthChange(Sender: TObject);
    procedure ePixelOffsetHChange(Sender: TObject);
    procedure ePixelOffsetWChange(Sender: TObject);
    procedure mHTMLChange(Sender: TObject);
    procedure cbOnPixelOffsetChangeClick(Sender: TObject);
    procedure cbOnClickClick(Sender: TObject);
    procedure cbOnClickableChangeClick(Sender: TObject);
    procedure cbOnDblClickClick(Sender: TObject);
    procedure cbOnDragClick(Sender: TObject);
    procedure cbOnDraggableChangeClick(Sender: TObject);
    procedure cbOnDragEndClick(Sender: TObject);
    procedure cbOnDragStartClick(Sender: TObject);
    procedure cbOnFlatChangeClick(Sender: TObject);
    procedure cbOnIconChangeClick(Sender: TObject);
    procedure cbOnMouseDownClick(Sender: TObject);
    procedure cbOnMouseOutClick(Sender: TObject);
    procedure cbOnMouseOverClick(Sender: TObject);
    procedure cbOnMouseUpClick(Sender: TObject);
    procedure cbOnPositionChangeClick(Sender: TObject);
    procedure cbOnRightClickClick(Sender: TObject);
    procedure cbOnTitleChangeClick(Sender: TObject);
    procedure cbOnVisibleChangeClick(Sender: TObject);
    procedure cbOnCloseClickClick(Sender: TObject);
    procedure cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
    procedure cbOnDisableAutoPanChangeClick(Sender: TObject);
    procedure cbOnHTMLContentChangeClick(Sender: TObject);
    procedure cbOnMaxWidthChangeClick(Sender: TObject);
    procedure bLoadFromCSVClick(Sender: TObject);
    procedure bSearchFileClick(Sender: TObject);
    procedure cbMarkerTypeChange(Sender: TObject);
    procedure eColWidthChange(Sender: TObject);
    procedure eColHeightChange(Sender: TObject);
    procedure cbColCornerColorChange(Sender: TObject);
    procedure cbColPrimaryColorChange(Sender: TObject);
    procedure cbColStrokeColorChange(Sender: TObject);
    procedure cbSMBackColorChange(Sender: TObject);
    procedure cbSMTextColorChange(Sender: TObject);
    procedure cbSMStarColorChange(Sender: TObject);
    procedure cbSMShowStarClick(Sender: TObject);
    procedure cbSMStyledIconChange(Sender: TObject);
    procedure cbShowIWMouseOverClick(Sender: TObject);
    procedure bZoomToAllClick(Sender: TObject);
    procedure bLoadMarkersClick(Sender: TObject);
    procedure bComDistClick(Sender: TObject);
    procedure bShowInfoWClick(Sender: TObject);
    procedure bMaxZoomClick(Sender: TObject);
    procedure bOpenClick(Sender: TObject);
    procedure bLoadClick(Sender: TObject);
  private
    FGMMarker: TGMMarker;
    FTime: TTime;

    procedure GetInfo;
    procedure OnLoadFile(Sender: TCustomGMMarker; Marker: TCustomMarker;
      Current, Count: Integer; var Stop: Boolean);
    procedure AfterLoadFile(Sender: TCustomGMMarker; Loaded, Count: Integer);
  public
    OnClick: TLatLngIdxEvent;
    OnClickableChange: TLinkedComponentChange;
    OnDblClick: TLatLngIdxEvent;
    OnDrag: TLatLngIdxEvent;
    OnDraggableChange: TLinkedComponentChange;
    OnDragEnd: TLatLngIdxEvent;
    OnDragStart: TLatLngIdxEvent;
    OnFlatChange: TLinkedComponentChange;
    OnIconChange: TLinkedComponentChange;
    OnMouseDown: TLatLngIdxEvent;
    OnMouseOut: TLatLngIdxEvent;
    OnMouseOver: TLatLngIdxEvent;
    OnMouseUp: TLatLngIdxEvent;
    OnPositionChange: TLatLngIdxEvent;
    OnRightClick: TLatLngIdxEvent;
    OnTitleChange: TLinkedComponentChange;
    OnVisibleChange: TLinkedComponentChange;

    OnCloseClick: TLinkedComponentChange;
    OnCloseOtherBeforeOpenChange: TLinkedComponentChange;
    OnDisableAutoPanChange: TLinkedComponentChange;
    OnHTMLContentChange: TLinkedComponentChange;
    OnMaxWidthChange: TLinkedComponentChange;
    OnPixelOffsetChange: TLinkedComponentChange;

    constructor Create(aOwner: TComponent; GMMarker: TGMMarker); reintroduce; virtual;
  end;

var
  MarkersFrm: TMarkersFrm;

implementation

uses
  GMFunctionsVCL;

{$R *.dfm}

procedure TMarkersFrm.AfterLoadFile(Sender: TCustomGMMarker; Loaded, Count: Integer);
begin
  FTime := Time - FTime;
  ShowMessage(Format('Loaded %d of %d in %s', [Loaded, Count,  TimeToStr(FTime)]));
end;

procedure TMarkersFrm.bCenterClick(Sender: TObject);
begin
  if lbItems.ItemIndex <> -1 then
    FGMMarker[lbItems.ItemIndex].CenterMapTo;
end;

procedure TMarkersFrm.bComDistClick(Sender: TObject);
var
  Tmp: Double;
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbTo.ItemIndex = -1 then Exit;

  if not TryStrToFloat(eRadius.Text, Tmp) then Exit;

  lComDist.Caption := FloatToStr(TGeometry.ComputeDistanceBetween(FGMMarker.Map, FGMMarker[lbItems.ItemIndex].Position, FGMMarker[lbTo.ItemIndex].Position, Tmp));
end;

procedure TMarkersFrm.bDelClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  FGMMarker.Delete(lbItems.ItemIndex);
  lbItems.DeleteSelected;
end;

procedure TMarkersFrm.bDownClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = lbItems.Count - 1 then Exit;

  FGMMarker.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex+1);
end;

procedure TMarkersFrm.bNewClick(Sender: TObject);
var
  Marker: TMarker;
begin
  Marker := FGMMarker.Add;
  lbItems.ItemIndex := lbItems.Items.Add(Marker.Title);

  GetInfo;
end;

procedure TMarkersFrm.bOpenClick(Sender: TObject);
begin
  if not FileExists('markers.xml') then
    ShowMessage('File "markers.xml" does not exist')
  else
    cdsMarkers.LoadFromFile('markers.xml');
end;

procedure TMarkersFrm.bUpClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if lbItems.ItemIndex = 0 then Exit;

  FGMMarker.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
  lbItems.Items.Move(lbItems.ItemIndex, lbItems.ItemIndex-1);
end;

procedure TMarkersFrm.bLoadClick(Sender: TObject);
begin
  FGMMarker.LoadFromDataSet(cdsMarkers, 'Lat', 'Lng', 'Title');
  FGMMarker.ZoomToPoints;
end;

procedure TMarkersFrm.bLoadFromCSVClick(Sender: TObject);
var
  i: Integer;
begin
  FGMMarker.OnLoadFile := OnLoadFile;
  FGMMarker.AfterLoadFile := AfterLoadFile;
  pbPoints.Visible := True;
  pbPoints.Position := 0;
  try
    if FileExists(eFileName.Text) then
    begin
      FTime := Time;
      FGMMarker.LoadFromCSV(eLatColumn.Value, eLngColumn.Value, eFileName.Text,
                    eTitleColumn.Value, eDelimiter.Text[1], cbDeleteBeforeLoad.Checked,
                    cbWithRownTitle.Checked);
    end;
  finally
    FGMMarker.OnLoadFile := nil;
    FGMMarker.AfterLoadFile := nil;
    pbPoints.Visible := False;
  end;

  lbItems.Clear;
  for i :=  0 to FGMMarker.Count - 1 do
    lbItems.Items.Add(FGMMarker[i].Title);
end;

procedure TMarkersFrm.bLoadMarkersClick(Sender: TObject);
var
  i: Integer;
begin
  lbTo.Clear;
  for i :=  0 to FGMMarker.Count - 1 do
    lbTo.Items.Add(FGMMarker[i].Title);
end;

procedure TMarkersFrm.bMaxZoomClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  ShowMessage(IntToStr(FGMMarker.Map.GetMaxZoom(FGMMarker[lbItems.ItemIndex].Position)));
end;

procedure TMarkersFrm.bZoomToAllClick(Sender: TObject);
begin
  FGMMarker.ZoomToPoints;
end;

procedure TMarkersFrm.cbBounceClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Animation.Bounce := cbBounce.Checked;
end;

procedure TMarkersFrm.cbClickableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Clickable := cbClickable.Checked;
end;

procedure TMarkersFrm.cbCloseOtherBeforeOpenClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen := cbCloseOtherBeforeOpen.Checked;
end;

procedure TMarkersFrm.cbColCornerColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  TColoredMarker(FGMMarker[lbItems.ItemIndex].ColoredMarker).CornerColor := cbColCornerColor.Selected;
end;

procedure TMarkersFrm.cbColPrimaryColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  TColoredMarker(FGMMarker[lbItems.ItemIndex].ColoredMarker).PrimaryColor := cbColPrimaryColor.Selected;
end;

procedure TMarkersFrm.cbColStrokeColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  TColoredMarker(FGMMarker[lbItems.ItemIndex].ColoredMarker).StrokeColor := cbColStrokeColor.Selected;
end;

procedure TMarkersFrm.cbDisableAutoPanClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].InfoWindow.DisableAutoPan := cbDisableAutoPan.Checked;
end;

procedure TMarkersFrm.cbDraggableClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Draggable := cbDraggable.Checked;
end;

procedure TMarkersFrm.cbFlatClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Flat := cbFlat.Checked;
end;

procedure TMarkersFrm.cbMarkerTypeChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].MarkerType := TTransform.StrToMarkerType(cbMarkerType.Text);
end;

procedure TMarkersFrm.cbOnClickableChangeClick(Sender: TObject);
begin
  FGMMarker.OnClickableChange := nil;
  if cbOnClickableChange.Checked then FGMMarker.OnClickableChange := OnClickableChange;
end;

procedure TMarkersFrm.cbOnClickClick(Sender: TObject);
begin
  FGMMarker.OnClick := nil;
  if cbOnClick.Checked then FGMMarker.OnClick := OnClick;
end;

procedure TMarkersFrm.cbOnCloseClickClick(Sender: TObject);
begin
  FGMMarker.OnCloseClick := nil;
  if cbOnCloseClick.Checked then FGMMarker.OnCloseClick := OnCloseClick;
end;

procedure TMarkersFrm.cbOnCloseOtherBeforeOpenChangeClick(Sender: TObject);
begin
  FGMMarker.OnCloseOtherBeforeOpenChange := nil;
  if cbOnCloseOtherBeforeOpenChange.Checked then FGMMarker.OnCloseOtherBeforeOpenChange := OnCloseOtherBeforeOpenChange;
end;

procedure TMarkersFrm.cbOnDblClickClick(Sender: TObject);
begin
  FGMMarker.OnDblClick := nil;
  if cbOnDblClick.Checked then FGMMarker.OnDblClick := OnDblClick;
end;

procedure TMarkersFrm.cbOnDisableAutoPanChangeClick(Sender: TObject);
begin
  FGMMarker.OnDisableAutoPanChange := nil;
  if cbOnDisableAutoPanChange.Checked then FGMMarker.OnDisableAutoPanChange := OnDisableAutoPanChange;
end;

procedure TMarkersFrm.cbOnDraggableChangeClick(Sender: TObject);
begin
  FGMMarker.OnDraggableChange := nil;
  if cbOnDraggableChange.Checked then FGMMarker.OnDraggableChange := OnDraggableChange;
end;

procedure TMarkersFrm.cbOnDragClick(Sender: TObject);
begin
  FGMMarker.OnDrag := nil;
  if cbOnDrag.Checked then FGMMarker.OnDrag := OnDrag;
end;

procedure TMarkersFrm.cbOnDragEndClick(Sender: TObject);
begin
  FGMMarker.OnDragEnd := nil;
  if cbOnDragEnd.Checked then FGMMarker.OnDragEnd := OnDragEnd;
end;

procedure TMarkersFrm.cbOnDragStartClick(Sender: TObject);
begin
  FGMMarker.OnDragStart := nil;
  if cbOnDragStart.Checked then FGMMarker.OnDragStart := OnDragStart;
end;

procedure TMarkersFrm.cbOnDropClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Animation.OnDrop := cbOnDrop.Checked;
end;

procedure TMarkersFrm.cbOnFlatChangeClick(Sender: TObject);
begin
  FGMMarker.OnFlatChange := nil;
  if cbOnFlatChange.Checked then FGMMarker.OnFlatChange := OnFlatChange;
end;

procedure TMarkersFrm.cbOnHTMLContentChangeClick(Sender: TObject);
begin
  FGMMarker.OnHTMLContentChange := nil;
  if cbOnHTMLContentChange.Checked then FGMMarker.OnHTMLContentChange := OnHTMLContentChange;
end;

procedure TMarkersFrm.cbOnIconChangeClick(Sender: TObject);
begin
  FGMMarker.OnIconChange := nil;
  if cbOnIconChange.Checked then FGMMarker.OnIconChange := OnIconChange;
end;

procedure TMarkersFrm.cbOnMaxWidthChangeClick(Sender: TObject);
begin
  FGMMarker.OnMaxWidthChange := nil;
  if cbOnMaxWidthChange.Checked then FGMMarker.OnMaxWidthChange := OnMaxWidthChange;
end;

procedure TMarkersFrm.cbOnMouseDownClick(Sender: TObject);
begin
  FGMMarker.OnMouseDown := nil;
  if cbOnMouseDown.Checked then FGMMarker.OnMouseDown := OnMouseDown;
end;

procedure TMarkersFrm.cbOnMouseOutClick(Sender: TObject);
begin
  FGMMarker.OnMouseOut := nil;
  if cbOnMouseOut.Checked then FGMMarker.OnMouseOut := OnMouseOut;
end;

procedure TMarkersFrm.cbOnMouseOverClick(Sender: TObject);
begin
  FGMMarker.OnMouseOver := nil;
  if cbOnMouseOver.Checked then FGMMarker.OnMouseOver := OnMouseOver;
end;

procedure TMarkersFrm.cbOnMouseUpClick(Sender: TObject);
begin
  FGMMarker.OnMouseUp := nil;
  if cbOnMouseUp.Checked then FGMMarker.OnMouseUp := OnMouseUp;
end;

procedure TMarkersFrm.cbOnPixelOffsetChangeClick(Sender: TObject);
begin
  FGMMarker.OnPixelOffsetChange := nil;
  if cbOnPixelOffsetChange.Checked then FGMMarker.OnPixelOffsetChange := OnPixelOffsetChange;
end;

procedure TMarkersFrm.cbOnPositionChangeClick(Sender: TObject);
begin
  FGMMarker.OnPositionChange := nil;
  if cbOnPositionChange.Checked then FGMMarker.OnPositionChange := OnPositionChange;
end;

procedure TMarkersFrm.cbOnRightClickClick(Sender: TObject);
begin
  FGMMarker.OnRightClick := nil;
  if cbOnRightClick.Checked then FGMMarker.OnRightClick := OnRightClick;
end;

procedure TMarkersFrm.cbOnTitleChangeClick(Sender: TObject);
begin
  FGMMarker.OnTitleChange := nil;
  if cbOnTitleChange.Checked then FGMMarker.OnTitleChange := OnTitleChange;
end;

procedure TMarkersFrm.cbOnVisibleChangeClick(Sender: TObject);
begin
  FGMMarker.OnVisibleChange := nil;
  if cbOnVisibleChange.Checked then FGMMarker.OnVisibleChange := OnVisibleChange;
end;

procedure TMarkersFrm.cbOptimizedClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Optimized := cbOptimized.Checked;
end;

procedure TMarkersFrm.cbRaiseOnDragClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].RaiseOnDrag := cbRaiseOnDrag.Checked;
end;

procedure TMarkersFrm.cbShowIWMouseOverClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].ShowInfoWinMouseOver := cbShowIWMouseOver.Checked;
end;

procedure TMarkersFrm.cbSMBackColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  TStyledMarker(FGMMarker[lbItems.ItemIndex].StyledMarker).BackgroundColor := cbSMBackColor.Selected;
end;

procedure TMarkersFrm.cbSMShowStarClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].StyledMarker.ShowStar := cbSMShowStar.Checked;
end;

procedure TMarkersFrm.cbSMStarColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  TStyledMarker(FGMMarker[lbItems.ItemIndex].StyledMarker).StarColor := cbSMStarColor.Selected;
end;

procedure TMarkersFrm.cbSMStyledIconChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].StyledMarker.StyledIcon := TTransform.StrToStyledIcon(cbSMStyledIcon.Text);
end;

procedure TMarkersFrm.cbSMTextColorChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;

  TStyledMarker(FGMMarker[lbItems.ItemIndex].StyledMarker).TextColor := cbSMTextColor.Selected;
end;

procedure TMarkersFrm.cbVisibleClick(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Visible := cbVisible.Checked;
end;

constructor TMarkersFrm.Create(aOwner: TComponent; GMMarker: TGMMarker);
var
  i: Integer;
begin
  inherited Create(aOwner);

  pcMarker.ActivePageIndex := 0;

  Left := TForm(Owner).ClientWidth - Width;
  Top := TForm(Owner).Height - TForm(Owner).ClientHeight;

  FGMMarker := GMMarker;

  lbItems.Clear;
  for i :=  0 to FGMMarker.Count - 1 do
    lbItems.Items.Add(FGMMarker[i].Title);
end;

procedure TMarkersFrm.eColHeightChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if eColHeight.Value < 0 then eColHeight.Value := 0;

  FGMMarker[lbItems.ItemIndex].ColoredMarker.Height := eColHeight.Value;
end;

procedure TMarkersFrm.eColWidthChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if eColWidth.Value < 0 then eColWidth.Value := 0;

  FGMMarker[lbItems.ItemIndex].ColoredMarker.Width := eColWidth.Value;
end;

procedure TMarkersFrm.eIconChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Icon := eIcon.Text;
end;

procedure TMarkersFrm.eLatChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Position.Lat := FGMMarker[lbItems.ItemIndex].Position.StringToReal(eLat.Text);
end;

procedure TMarkersFrm.eLngChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Position.Lng := FGMMarker[lbItems.ItemIndex].Position.StringToReal(eLng.Text);
end;

procedure TMarkersFrm.eMaxWidthChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if eMaxWidth.Value < 0 then eMaxWidth.Value := 0;

  FGMMarker[lbItems.ItemIndex].InfoWindow.MaxWidth := eMaxWidth.Value;
end;

procedure TMarkersFrm.ePixelOffsetHChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetH.Value < 0 then ePixelOffsetH.Value := 0;

  FGMMarker[lbItems.ItemIndex].InfoWindow.PixelOffset.Height := ePixelOffsetH.Value;
end;

procedure TMarkersFrm.ePixelOffsetWChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  if ePixelOffsetW.Value < 0 then ePixelOffsetW.Value := 0;

  FGMMarker[lbItems.ItemIndex].InfoWindow.PixelOffset.Width := ePixelOffsetW.Value;
end;

procedure TMarkersFrm.eTitleChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].Title := eTitle.Text;
end;

procedure TMarkersFrm.FormActivate(Sender: TObject);
begin
  GetInfo;
end;

procedure TMarkersFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TMarkersFrm.GetInfo;
begin
  cbOnClick.Checked := Assigned(FGMMarker.OnClick);
  cbOnClickableChange.Checked := Assigned(FGMMarker.OnClickableChange);
  cbOnDblClick.Checked := Assigned(FGMMarker.OnDblClick);
  cbOnDrag.Checked := Assigned(FGMMarker.OnDrag);
  cbOnDraggableChange.Checked := Assigned(FGMMarker.OnDraggableChange);
  cbOnDragEnd.Checked := Assigned(FGMMarker.OnDragEnd);
  cbOnDragStart.Checked := Assigned(FGMMarker.OnDragStart);
  cbOnFlatChange.Checked := Assigned(FGMMarker.OnFlatChange);
  cbOnIconChange.Checked := Assigned(FGMMarker.OnIconChange);
  cbOnMouseDown.Checked := Assigned(FGMMarker.OnMouseDown);
  cbOnMouseOut.Checked := Assigned(FGMMarker.OnMouseOut);
  cbOnMouseOver.Checked := Assigned(FGMMarker.OnMouseOver);
  cbOnMouseUp.Checked := Assigned(FGMMarker.OnMouseUp);
  cbOnPositionChange.Checked := Assigned(FGMMarker.OnPositionChange);
  cbOnRightClick.Checked := Assigned(FGMMarker.OnRightClick);
  cbOnTitleChange.Checked := Assigned(FGMMarker.OnTitleChange);
  cbOnVisibleChange.Checked := Assigned(FGMMarker.OnVisibleChange);
  cbOnCloseClick.Checked := Assigned(FGMMarker.OnCloseClick);
  cbOnCloseOtherBeforeOpenChange.Checked := Assigned(FGMMarker.OnCloseOtherBeforeOpenChange);
  cbOnDisableAutoPanChange.Checked := Assigned(FGMMarker.OnDisableAutoPanChange);
  cbOnHTMLContentChange.Checked := Assigned(FGMMarker.OnHTMLContentChange);
  cbOnMaxWidthChange.Checked := Assigned(FGMMarker.OnMaxWidthChange);
  cbOnPixelOffsetChange.Checked := Assigned(FGMMarker.OnPixelOffsetChange);

  if lbItems.ItemIndex = -1 then Exit;

  cbBounce.Checked := FGMMarker[lbItems.ItemIndex].Animation.Bounce;
  cbOnDrop.Checked := FGMMarker[lbItems.ItemIndex].Animation.OnDrop;
  cbBounce.Checked := FGMMarker[lbItems.ItemIndex].Animation.Bounce;
  cbClickable.Checked := FGMMarker[lbItems.ItemIndex].Clickable;
  cbDraggable.Checked := FGMMarker[lbItems.ItemIndex].Draggable;
  cbFlat.Checked := FGMMarker[lbItems.ItemIndex].Flat;
  cbOptimized.Checked := FGMMarker[lbItems.ItemIndex].Optimized;
  cbRaiseOnDrag.Checked := FGMMarker[lbItems.ItemIndex].RaiseOnDrag;
  cbVisible.Checked := FGMMarker[lbItems.ItemIndex].Visible;
  cbShowIWMouseOver.Checked := FGMMarker[lbItems.ItemIndex].ShowInfoWinMouseOver;
  eLat.Text := FGMMarker[lbItems.ItemIndex].Position.LatToStr(FGMMarker.Map.Precision);
  eLng.Text := FGMMarker[lbItems.ItemIndex].Position.LngToStr(FGMMarker.Map.Precision);
  eTitle.Text := FGMMarker[lbItems.ItemIndex].Title;
  eIcon.Text := FGMMarker[lbItems.ItemIndex].Icon;
  cbMarkerType.ItemIndex := cbMarkerType.Items.IndexOf(TTransform.MarkerTypeToStr(FGMMarker[lbItems.ItemIndex].MarkerType));

  cbCloseOtherBeforeOpen.Checked := FGMMarker[lbItems.ItemIndex].InfoWindow.CloseOtherBeforeOpen;
  cbDisableAutoPan.Checked := FGMMarker[lbItems.ItemIndex].InfoWindow.DisableAutoPan;
  eMaxWidth.Value := FGMMarker[lbItems.ItemIndex].InfoWindow.MaxWidth;
  ePixelOffsetH.Value := FGMMarker[lbItems.ItemIndex].InfoWindow.PixelOffset.Height;
  ePixelOffsetW.Value := FGMMarker[lbItems.ItemIndex].InfoWindow.PixelOffset.Width;
  mHTML.Lines.Text := FGMMarker[lbItems.ItemIndex].InfoWindow.HTMLContent;

  eColWidth.Value := FGMMarker[lbItems.ItemIndex].ColoredMarker.Width;
  eColHeight.Value := FGMMarker[lbItems.ItemIndex].ColoredMarker.Height;
  cbColCornerColor.Selected := TColoredMarker(FGMMarker[lbItems.ItemIndex].ColoredMarker).CornerColor;
  cbColPrimaryColor.Selected := TColoredMarker(FGMMarker[lbItems.ItemIndex].ColoredMarker).PrimaryColor;
  cbColStrokeColor.Selected := TColoredMarker(FGMMarker[lbItems.ItemIndex].ColoredMarker).StrokeColor;

  cbSMBackColor.Selected := TStyledMarker(FGMMarker[lbItems.ItemIndex].StyledMarker).BackgroundColor;
  cbSMTextColor.Selected := TStyledMarker(FGMMarker[lbItems.ItemIndex].StyledMarker).TextColor;
  cbSMStarColor.Selected := TStyledMarker(FGMMarker[lbItems.ItemIndex].StyledMarker).StarColor;
  cbSMShowStar.Checked := FGMMarker[lbItems.ItemIndex].StyledMarker.ShowStar;
  cbSMStyledIcon.ItemIndex := cbSMStyledIcon.Items.IndexOf(TTransform.StyledIconToStr(FGMMarker[lbItems.ItemIndex].StyledMarker.StyledIcon));
end;

procedure TMarkersFrm.lbItemsClick(Sender: TObject);
begin
  GetInfo;
end;

procedure TMarkersFrm.mHTMLChange(Sender: TObject);
begin
  if lbItems.ItemIndex = -1 then Exit;
  FGMMarker[lbItems.ItemIndex].InfoWindow.HTMLContent := mHTML.Lines.Text;
end;

procedure TMarkersFrm.OnLoadFile(Sender: TCustomGMMarker; Marker: TCustomMarker;
  Current, Count: Integer; var Stop: Boolean);
begin
  pbPoints.Max := Count;
  pbPoints.StepIt;
end;

procedure TMarkersFrm.bSearchFileClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    eFileName.Text := OpenDialog1.FileName;
end;

procedure TMarkersFrm.bShowInfoWClick(Sender: TObject);
begin
  if lbItems.ItemIndex <> -1 then
    FGMMarker[lbItems.ItemIndex].OpenCloseInfoWin;
end;

end.
