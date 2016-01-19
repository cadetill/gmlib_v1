{
TGMInfoWindow demo program

  ES: programa de demostración de uso del componente TGMInfoWindow
  EN: demo program use of component TGMInfoWindow

=========================================================================
History:

ver 0.1:
  ES- primera versión
  EN- first version
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================

Copyright (©) 2012, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
unit UGMInfoWinFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GMMap, GMLinkedComponents, GMInfoWindow, GMClasses,
  GMMapVCL, Vcl.Buttons, Vcl.CheckLst, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Samples.Spin, Vcl.OleCtrls, SHDocVw, GMConstants, GMMarker, GMMarkerVCL;

type
  TGMInfoWinFrm = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel10: TPanel;
    mEvents: TMemo;
    Panel11: TPanel;
    wbWeb: TWebBrowser;
    Splitter1: TSplitter;
    GMMap1: TGMMap;
    bClearLog: TButton;
    pOptions: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    lLong: TLabel;
    lLat: TLabel;
    lTypMap: TLabel;
    lZoom: TLabel;
    eReqLng: TEdit;
    eReqLat: TEdit;
    cbTypMap: TComboBox;
    tbZoom: TTrackBar;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    cbZoomClick: TCheckBox;
    cbDraggable: TCheckBox;
    cbKeyboard: TCheckBox;
    cbNoClear: TCheckBox;
    eMaxZoom: TEdit;
    eMinZoom: TEdit;
    cbWheel: TCheckBox;
    GroupBox3: TGroupBox;
    pPages: TPageControl;
    tsGeneral: TTabSheet;
    Panel2: TPanel;
    Label16: TLabel;
    cbBGColor: TColorBox;
    tsMapType: TTabSheet;
    Panel3: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cbShowMapType: TCheckBox;
    cbMapTypePos: TComboBox;
    cbMapTypeStyle: TComboBox;
    cbMapType: TCheckListBox;
    tsOverview: TTabSheet;
    Panel4: TPanel;
    cbShowOver: TCheckBox;
    cbOverOpened: TCheckBox;
    tsPan: TTabSheet;
    Panel5: TPanel;
    Label18: TLabel;
    cbShowPan: TCheckBox;
    cbPanPos: TComboBox;
    tsRotate: TTabSheet;
    Panel6: TPanel;
    Label17: TLabel;
    cbRoratePos: TComboBox;
    cbShowRotate: TCheckBox;
    tsScale: TTabSheet;
    Panel7: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    cbShowScale: TCheckBox;
    cbScalePos: TComboBox;
    cbScaleStyle: TComboBox;
    tsStreetView: TTabSheet;
    Panel8: TPanel;
    Label21: TLabel;
    cbStreetViewPos: TComboBox;
    cbShowStreetView: TCheckBox;
    tsZoom: TTabSheet;
    Panel9: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    cbZoomPos: TComboBox;
    cbZoomStyle: TComboBox;
    cbShowZoom: TCheckBox;
    bDoWeb: TButton;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    gbB1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eLatASW: TEdit;
    eLngASW: TEdit;
    eLatANE: TEdit;
    eLngANE: TEdit;
    gbLatLng: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    eLat: TEdit;
    eLng: TEdit;
    Label22: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label23: TLabel;
    Button4: TButton;
    Label24: TLabel;
    Button5: TButton;
    Button6: TButton;
    Label25: TLabel;
    Button7: TButton;
    Button8: TButton;
    GroupBox4: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    eLatMethod: TEdit;
    eLngMethod: TEdit;
    Button9: TButton;
    Button12: TButton;
    Button16: TButton;
    Label29: TLabel;
    Label28: TLabel;
    tbZoomMet: TTrackBar;
    cbMapTypeMet: TComboBox;
    Button11: TButton;
    Button10: TButton;
    Button14: TButton;
    Button13: TButton;
    GroupBox5: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    eXMet: TEdit;
    eYMet: TEdit;
    Button15: TButton;
    GroupBox6: TGroupBox;
    cbBoundsChanged: TCheckBox;
    cbCenterChanged: TCheckBox;
    cbDblClick: TCheckBox;
    cbClick: TCheckBox;
    cbMapTypeIdChanged: TCheckBox;
    cbDragStart: TCheckBox;
    cbDragEnd: TCheckBox;
    cbDrag: TCheckBox;
    cbZoomChanged: TCheckBox;
    cbRightClick: TCheckBox;
    cbMouseOver: TCheckBox;
    cbMouseOut: TCheckBox;
    cbMouseMove: TCheckBox;
    TabSheet5: TTabSheet;
    Panel16: TPanel;
    Label32: TLabel;
    lLatEvent: TLabel;
    lLngEvent: TLabel;
    Label34: TLabel;
    TabSheet6: TTabSheet;
    Panel17: TPanel;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    Label35: TLabel;
    eInterval: TEdit;
    cbLanguages: TComboBox;
    cbCloseOtherBeforeOpen: TCheckBox;
    cbDisableAutoPan: TCheckBox;
    Label36: TLabel;
    Label37: TLabel;
    eInfoWinLat: TEdit;
    eInfoWinLng: TEdit;
    bAddInfoWin: TBitBtn;
    bDelInfoWin: TBitBtn;
    lbInfoWindows: TListBox;
    bUp: TButton;
    bDown: TButton;
    Label39: TLabel;
    lZIndex: TLabel;
    bNewMarker: TButton;
    bCenterInfoWin: TButton;
    Label40: TLabel;
    ePrecision: TSpinEdit;
    cbActive: TCheckBox;
    GMInfoWindow1: TGMInfoWindow;
    eMaxWidth: TEdit;
    Label41: TLabel;
    eWidth: TEdit;
    eHeight: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label38: TLabel;
    mHTMLContent: TMemo;
    bOpenClose: TButton;
    cbAutoOpen: TCheckBox;
    bSave: TButton;
    bPrint: TButton;
    bPreview: TButton;
    GMMarker1: TGMMarker;
    procedure bDoWebClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatusBar1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure GMMap1BoundsChanged(Sender: TObject; NewBounds: TLatLngBounds);
    procedure GMMap1CenterChanged(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1Click(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1DblClick(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1Drag(Sender: TObject);
    procedure GMMap1DragEnd(Sender: TObject);
    procedure GMMap1DragStart(Sender: TObject);
    procedure GMMap1MapTypeIdChanged(Sender: TObject; NewMapTypeId: TMapTypeId);
    procedure GMMap1MouseMove(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1MouseOut(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1MouseOver(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1RightClick(Sender: TObject; LatLng: TLatLng; X, Y: Double);
    procedure GMMap1ZoomChanged(Sender: TObject; NewZoom: Integer);
    procedure cbBoundsChangedClick(Sender: TObject);
    procedure cbCenterChangedClick(Sender: TObject);
    procedure cbClickClick(Sender: TObject);
    procedure cbDblClickClick(Sender: TObject);
    procedure cbDragClick(Sender: TObject);
    procedure cbDragEndClick(Sender: TObject);
    procedure cbDragStartClick(Sender: TObject);
    procedure cbMapTypeIdChangedClick(Sender: TObject);
    procedure cbMouseMoveClick(Sender: TObject);
    procedure cbMouseOutClick(Sender: TObject);
    procedure cbMouseOverClick(Sender: TObject);
    procedure cbRightClickClick(Sender: TObject);
    procedure cbZoomChangedClick(Sender: TObject);
    procedure bClearLogClick(Sender: TObject);
    procedure eIntervalChange(Sender: TObject);
    procedure cbLanguagesChange(Sender: TObject);
    procedure lbInfoWindowsClick(Sender: TObject);
    procedure bNewMarkerClick(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bAddInfoWinClick(Sender: TObject);
    procedure pOptionsChange(Sender: TObject);
    procedure bDelInfoWinClick(Sender: TObject);
    procedure bCenterInfoWinClick(Sender: TObject);
    procedure ePrecisionChange(Sender: TObject);
    procedure cbActiveClick(Sender: TObject);
    procedure GMInfoWindow1CloseOtherBeforeOpenChange(Sender: TObject;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure GMInfoWindow1DisableAutoPanChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMInfoWindow1HTMLContentChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure GMInfoWindow1MaxWidthChange(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
    procedure bOpenCloseClick(Sender: TObject);
    procedure GMInfoWindow1PositionChange(Sender: TObject; LatLng: TLatLng;
      Index: Integer; LinkedComponent: TLinkedComponent);
    procedure bPrintClick(Sender: TObject);
    procedure bPreviewClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure GMInfoWindow1CloseClick(Sender: TObject; Index: Integer;
      LinkedComponent: TLinkedComponent);
  private
    procedure AddNewInfoWin;
    procedure DoMap;
  public
    constructor Create(aOwner: TComponent); override;
  end;

var
  GMInfoWinFrm: TGMInfoWinFrm;

implementation

uses
  ShellAPI, Types, GMFunctionsVCL;

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

{$R *.dfm}

procedure TGMInfoWinFrm.bAddInfoWinClick(Sender: TObject);
var
  InfoWin: TInfoWindow;
begin
  if lbInfoWindows.ItemIndex = -1 then
  begin
    InfoWin := GMInfoWindow1.Add;
    lbInfoWindows.Items.Add(mHTMLContent.Lines.Text);
  end
  else
    InfoWin := GMInfoWindow1[lbInfoWindows.ItemIndex];

  InfoWin.AutoOpen := cbAutoOpen.Checked;
  InfoWin.CloseOtherBeforeOpen := cbCloseOtherBeforeOpen.Checked;
  InfoWin.DisableAutoPan := cbDisableAutoPan.Checked;
  InfoWin.HTMLContent := mHTMLContent.Lines.Text;
  InfoWin.MaxWidth := StrToInt(eMaxWidth.Text);
  InfoWin.PixelOffset.Height := StrToInt(eHeight.Text);
  InfoWin.PixelOffset.Width := StrToInt(eWidth.Text);
  InfoWin.Position.Lat := StrToFloat(StringReplace(eInfoWinLat.Text, '.', ',', [rfReplaceAll]));
  InfoWin.Position.Lng := StrToFloat(StringReplace(eInfoWinLng.Text, '.', ',', [rfReplaceAll]));
end;

procedure TGMInfoWinFrm.bCenterInfoWinClick(Sender: TObject);
begin
  if lbInfoWindows.ItemIndex = -1 then Exit;

  GMInfoWindow1[lbInfoWindows.ItemIndex].CenterMapTo;
end;

procedure TGMInfoWinFrm.bClearLogClick(Sender: TObject);
begin
  mEvents.Clear;
end;

procedure TGMInfoWinFrm.bDelInfoWinClick(Sender: TObject);
begin
  if lbInfoWindows.ItemIndex = -1 then Exit;

  GMInfoWindow1.Delete(lbInfoWindows.ItemIndex);
  lbInfoWindows.DeleteSelected;
end;

procedure TGMInfoWinFrm.bDoWebClick(Sender: TObject);
begin
  DoMap;
end;

procedure TGMInfoWinFrm.bDownClick(Sender: TObject);
begin
  if lbInfoWindows.ItemIndex = -1 then Exit;
  if lbInfoWindows.ItemIndex = lbInfoWindows.Count - 1 then Exit;

  GMInfoWindow1.Move(lbInfoWindows.ItemIndex, lbInfoWindows.ItemIndex+1);
  lbInfoWindows.Items.Move(lbInfoWindows.ItemIndex, lbInfoWindows.ItemIndex+1);
end;

procedure TGMInfoWinFrm.bNewMarkerClick(Sender: TObject);
begin
  AddNewInfoWin;
end;

procedure TGMInfoWinFrm.bOpenCloseClick(Sender: TObject);
begin
  if lbInfoWindows.ItemIndex = -1 then Exit;

  GMInfoWindow1[lbInfoWindows.ItemIndex].OpenClose;
end;

procedure TGMInfoWinFrm.bPreviewClick(Sender: TObject);
begin
  GMMap1.PrintPreview;
end;

procedure TGMInfoWinFrm.bPrintClick(Sender: TObject);
begin
  GMMap1.PrintWithDialog;
end;

procedure TGMInfoWinFrm.bSaveClick(Sender: TObject);
begin
  GMMap1.SaveToJPGFile;
end;

procedure TGMInfoWinFrm.bUpClick(Sender: TObject);
begin
  if lbInfoWindows.ItemIndex = -1 then Exit;
  if lbInfoWindows.ItemIndex = 0 then Exit;

  GMInfoWindow1.Move(lbInfoWindows.ItemIndex, lbInfoWindows.ItemIndex-1);
  lbInfoWindows.Items.Move(lbInfoWindows.ItemIndex, lbInfoWindows.ItemIndex-1);
end;

procedure TGMInfoWinFrm.Button10Click(Sender: TObject);
begin
  GMMap1.RequiredProp.MapType := TTransform.StrToMapTypeId(cbMapTypeMet.Text);
end;

procedure TGMInfoWinFrm.Button11Click(Sender: TObject);
begin
  cbMapTypeMet.ItemIndex := cbMapTypeMet.Items.IndexOf(TTransform.MapTypeIdToStr(GMMap1.GetMapTypeId));
end;

procedure TGMInfoWinFrm.Button12Click(Sender: TObject);
begin
  GMMap1.SetCenter(StrToFloat(StringReplace(eLatMethod.Text, '.', ',', [rfReplaceAll])),
                   StrToFloat(StringReplace(eLngMethod.Text, '.', ',', [rfReplaceAll])));
end;

procedure TGMInfoWinFrm.Button13Click(Sender: TObject);
begin
  tbZoomMet.Position := GMMap1.GetZoom;
end;

procedure TGMInfoWinFrm.Button14Click(Sender: TObject);
begin
  GMMap1.RequiredProp.Zoom := tbZoomMet.Position;
end;

procedure TGMInfoWinFrm.Button15Click(Sender: TObject);
begin
  GMMap1.PanBy(StrToInt(eXMet.Text), StrToInt(eYMet.Text));
end;

procedure TGMInfoWinFrm.Button16Click(Sender: TObject);
begin
  GMMap1.PanTo(StrToFloat(StringReplace(eLatMethod.Text, '.', ',', [rfReplaceAll])),
               StrToFloat(StringReplace(eLngMethod.Text, '.', ',', [rfReplaceAll])));
end;

procedure TGMInfoWinFrm.Button1Click(Sender: TObject);
var
  Bounds: TLatLngBounds;
begin
  Bounds := TLatLngBounds.Create;
  try
    GMMap1.LatLngBoundsGetBounds(Bounds);
    eLatASW.Text := Bounds.SW.LatToStr(GMMap1.Precision);
    eLngASW.Text := Bounds.SW.LngToStr(GMMap1.Precision);
    eLatANE.Text := Bounds.NE.LatToStr(GMMap1.Precision);
    eLngANE.Text := Bounds.NE.LngToStr(GMMap1.Precision);
  finally
    FreeAndNil(Bounds);
  end;
end;

procedure TGMInfoWinFrm.Button2Click(Sender: TObject);
begin
  GMMap1.LatLngBoundsSetBounds(
                    StrToFloat(StringReplace(eLatASW.Text, '.', ',', [rfReplaceAll])),
                    StrToFloat(StringReplace(eLngASW.Text, '.', ',', [rfReplaceAll])),
                    StrToFloat(StringReplace(eLatANE.Text, '.', ',', [rfReplaceAll])),
                    StrToFloat(StringReplace(eLngANE.Text, '.', ',', [rfReplaceAll])));
end;

procedure TGMInfoWinFrm.Button3Click(Sender: TObject);
var
  LL: TLatLng;
begin
  LL := TLatLng.Create(StrToFloat(StringReplace(eLat.Text, '.', ',', [rfReplaceAll])), StrToFloat(StringReplace(eLng.Text, '.', ',', [rfReplaceAll])));
  try
    ShowMessage(BoolToStr(GMMap1.MapLatLngBoundsContains(LL), True));
  finally
    FreeAndNil(LL);
  end;
end;

procedure TGMInfoWinFrm.Button4Click(Sender: TObject);
var
  Bounds: TLatLngBounds;
begin
  Bounds := TLatLngBounds.Create;
  try
    GMMap1.LatLngBoundsExtend(
                    StrToFloat(StringReplace(eLat.Text, '.', ',', [rfReplaceAll])),
                    StrToFloat(StringReplace(eLng.Text, '.', ',', [rfReplaceAll])),
                    Bounds);

    eLatASW.Text := Bounds.SW.LatToStr(GMMap1.Precision);
    eLngASW.Text := Bounds.SW.LngToStr(GMMap1.Precision);
    eLatANE.Text := Bounds.NE.LatToStr(GMMap1.Precision);
    eLngANE.Text := Bounds.NE.LngToStr(GMMap1.Precision);
  finally
    FreeAndNil(Bounds);
  end;
end;

procedure TGMInfoWinFrm.Button5Click(Sender: TObject);
var
  LL: TLatLng;
  LLB: TLatLngBounds;
begin
  LL := TLatLng.Create;
  LLB := TLatLngBounds.Create;
  try
    GMMap1.LatLngBoundsGetBounds(LLB);
    GMMap1.LatLngBoundsGetCenter(LLB, LL);
    eLat.Text := LL.LatToStr(GMMap1.Precision);
    eLng.Text := LL.LngToStr(GMMap1.Precision);
  finally
    FreeAndNil(LLB);
    FreeAndNil(LL);
  end;
end;

procedure TGMInfoWinFrm.Button6Click(Sender: TObject);
var
  LL: TLatLng;
begin
  LL := TLatLng.Create;
  try
    GMMap1.LatLngBoundsToSpan(LL);
    eLat.Text := LL.LatToStr(GMMap1.Precision);
    eLng.Text := LL.LngToStr(GMMap1.Precision);
  finally
    FreeAndNil(LL);
  end;
end;

procedure TGMInfoWinFrm.Button7Click(Sender: TObject);
var
  LLB: TLatLngBounds;
begin
  try
    GMMap1.LatLngBoundsGetBounds(LLB);
    ShowMessage(LLB.ToStr(GMMap1.Precision));
  finally
    FreeAndNil(LLB);
  end;
end;

procedure TGMInfoWinFrm.Button8Click(Sender: TObject);
var
  LLB: TLatLngBounds;
begin
  try
    GMMap1.LatLngBoundsGetBounds(LLB);
    ShowMessage(LLB.ToUrlValue(GMMap1.Precision));
  finally
    FreeAndNil(LLB);
  end;
end;

procedure TGMInfoWinFrm.Button9Click(Sender: TObject);
var
  LL: TLatLng;
begin
  LL := TLatLng.Create;
  try
    GMMap1.GetCenter(LL);
    eLatMethod.Text := LL.LatToStr(GMMap1.Precision);
    eLngMethod.Text := LL.LngToStr(GMMap1.Precision);
  finally
    FreeAndNil(LL);
  end;
end;

procedure TGMInfoWinFrm.cbActiveClick(Sender: TObject);
begin
  GMMap1.Active := cbActive.Checked;
end;

procedure TGMInfoWinFrm.cbBoundsChangedClick(Sender: TObject);
begin
  GMMap1.OnBoundsChanged := nil;
  if cbBoundsChanged.Checked then
    GMMap1.OnBoundsChanged := GMMap1BoundsChanged;
end;

procedure TGMInfoWinFrm.cbCenterChangedClick(Sender: TObject);
begin
  GMMap1.OnCenterChanged := nil;
  if cbCenterChanged.Checked then
    GMMap1.OnCenterChanged := GMMap1CenterChanged;
end;

procedure TGMInfoWinFrm.cbClickClick(Sender: TObject);
begin
  GMMap1.OnClick := nil;
  if cbClick.Checked then
    GMMap1.OnClick := GMMap1Click;
end;

procedure TGMInfoWinFrm.cbDblClickClick(Sender: TObject);
begin
  GMMap1.OnDblClick := nil;
  if cbDblClick.Checked then
    GMMap1.OnDblClick := GMMap1DblClick;
end;

procedure TGMInfoWinFrm.cbDragClick(Sender: TObject);
begin
  GMMap1.OnDrag := nil;
  if cbDrag.Checked then
    GMMap1.OnDrag := GMMap1Drag;
end;

procedure TGMInfoWinFrm.cbDragEndClick(Sender: TObject);
begin
  GMMap1.OnDragEnd := nil;
  if cbDragEnd.Checked then
    GMMap1.OnDragEnd := GMMap1DragEnd;
end;

procedure TGMInfoWinFrm.cbDragStartClick(Sender: TObject);
begin
  GMMap1.OnDragStart := nil;
  if cbDragStart.Checked then
    GMMap1.OnDragStart := GMMap1DragStart;
end;

procedure TGMInfoWinFrm.cbLanguagesChange(Sender: TObject);
begin
  case cbLanguages.ItemIndex of
    0: GMMap1.Language := Espanol;
    1: GMMap1.Language := English;
  end;
end;

procedure TGMInfoWinFrm.cbMapTypeIdChangedClick(Sender: TObject);
begin
  GMMap1.OnMapTypeIdChanged := nil;
  if cbMapTypeIdChanged.Checked then
    GMMap1.OnMapTypeIdChanged := GMMap1MapTypeIdChanged;
end;

procedure TGMInfoWinFrm.cbMouseMoveClick(Sender: TObject);
begin
  GMMap1.OnMouseMove := nil;
  if cbMouseMove.Checked then
    GMMap1.OnMouseMove := GMMap1MouseMove;
end;

procedure TGMInfoWinFrm.cbMouseOutClick(Sender: TObject);
begin
  GMMap1.OnMouseOut := nil;
  if cbMouseOut.Checked then
    GMMap1.OnMouseOut := GMMap1MouseOut;
end;

procedure TGMInfoWinFrm.cbMouseOverClick(Sender: TObject);
begin
  GMMap1.OnMouseOver := nil;
  if cbMouseOver.Checked then
    GMMap1.OnMouseOver := GMMap1MouseOver;
end;

procedure TGMInfoWinFrm.cbRightClickClick(Sender: TObject);
begin
  GMMap1.OnRightClick := nil;
  if cbRightClick.Checked then
    GMMap1.OnRightClick := GMMap1RightClick;
end;

procedure TGMInfoWinFrm.cbZoomChangedClick(Sender: TObject);
begin
  GMMap1.OnZoomChanged := nil;
  if cbZoomChanged.Checked then
    GMMap1.OnZoomChanged := GMMap1ZoomChanged;
end;

constructor TGMInfoWinFrm.Create(aOwner: TComponent);
var
  i: Integer;
begin
  inherited;

  for i := 0 to GMInfoWindow1.VisualObjects.Count - 1 do
    lbInfoWindows.Items.Add(GMInfoWindow1[i].HTMLContent);

  case GMMap1.Language of
    Espanol: cbLanguages.ItemIndex := 0;
    English: cbLanguages.ItemIndex := 1;
  end;
  eInterval.Text := IntToStr(GMMap1.IntervalEvents);
  bDoWeb.Enabled := False;
  pPages.ActivePageIndex := 0;
  pOptions.ActivePageIndex := 0;
  ePrecision.Value := GMMap1.Precision;
  cbMapType.CheckAll(cbChecked);
  mEvents.Clear;
  cbActive.Checked := GMMap1.Active;
end;

procedure TGMInfoWinFrm.DoMap;
begin
  // required properties
  GMMap1.RequiredProp.Center.Lat := StrToFloat(StringReplace(eReqLat.Text, '.', ',', [rfReplaceAll]));
  GMMap1.RequiredProp.Center.Lng := StrToFloat(StringReplace(eReqLng.Text, '.', ',', [rfReplaceAll]));
  GMMap1.RequiredProp.MapType := TTransform.StrToMapTypeId(cbTypMap.Text);
  GMMap1.RequiredProp.Zoom := tbZoom.Position;
  // non visual properties
  with GMMap1.NonVisualProp do
  begin
    MaxZoom := StrToInt(eMaxZoom.Text);
    MinZoom := StrToInt(eMinZoom.Text);
    Options := [];
    if cbZoomClick.Checked then
      Options := Options + [DisableDoubleClickZoom];
    if cbDraggable.Checked then
      Options := Options + [Draggable];
    if cbKeyboard.Checked then
      Options := Options + [KeyboardShortcuts];
    if cbNoClear.Checked then
      Options := Options + [NoClear];
    if cbWheel.Checked then
      Options := Options + [ScrollWheel];
  end;
  // visual properties
  with GMMap1.VisualProp do
  begin
    BGColor := cbBGColor.Selected;
    MapTypeCtrl.Show := cbShowMapType.Checked;
    MapTypeCtrl.Position := TTransform.StrToPosition(cbMapTypePos.Text);
    MapTypeCtrl.Style := TTransform.StrToMapTypeControlStyle(cbMapTypeStyle.Text);
    MapTypeCtrl.MapTypeIds := [];
    if cbMapType.Checked[0] then
      MapTypeCtrl.MapTypeIds := MapTypeCtrl.MapTypeIds + [mtHYBRID];
    if cbMapType.Checked[1] then
      MapTypeCtrl.MapTypeIds := MapTypeCtrl.MapTypeIds + [mtROADMAP];
    if cbMapType.Checked[2] then
      MapTypeCtrl.MapTypeIds := MapTypeCtrl.MapTypeIds + [mtSATELLITE];
    if cbMapType.Checked[3] then
      MapTypeCtrl.MapTypeIds := MapTypeCtrl.MapTypeIds + [mtTERRAIN];
    OverviewMapCtrl.Show := cbShowOver.Checked;
    OverviewMapCtrl.Opened := cbOverOpened.Checked;
    PanCtrl.Show := cbShowPan.Checked;
    PanCtrl.Position := TTransform.StrToPosition(cbPanPos.Text);
    RotateCtrl.Show := cbShowRotate.Checked;
    RotateCtrl.Position := TTransform.StrToPosition(cbRoratePos.Text);
    ScaleCtrl.Show := cbShowScale.Checked;
    ScaleCtrl.Position := TTransform.StrToPosition(cbScalePos.Text);
    ScaleCtrl.Style := TTransform.StrToScaleControlStyle(cbScaleStyle.Text);
    StreetViewCtrl.Show := cbShowStreetView.Checked;
    StreetViewCtrl.Position := TTransform.StrToPosition(cbStreetViewPos.Text);
    ZoomCtrl.Show := cbShowZoom.Checked;
    ZoomCtrl.Position := TTransform.StrToPosition(cbZoomPos.Text);
    ZoomCtrl.Style := TTransform.StrToZoomControlStyle(cbZoomStyle.Text);
  end;
  // do map
  GMMap1.DoMap;
end;

procedure TGMInfoWinFrm.AddNewInfoWin;
begin
  cbAutoOpen.Checked := True;
  cbCloseOtherBeforeOpen.Checked := False;
  cbDisableAutoPan.Checked := False;
  eMaxWidth.Text := '0';
  eHeight.Text := '0';
  eWidth.Text := '0';
  eInfoWinLat.Text := '0';
  eInfoWinLng.Text := '0';
  mHTMLContent.Lines.Text := 'New InfoWindow';
  lZIndex.Caption := '';
  lbInfoWindows.ItemIndex := -1;
end;

procedure TGMInfoWinFrm.eIntervalChange(Sender: TObject);
var
  Temp: Integer;
begin
  if TryStrToInt(eInterval.Text, Temp) then
    GMMap1.IntervalEvents := Temp;
end;

procedure TGMInfoWinFrm.GMInfoWindow1CloseClick(Sender: TObject; Index: Integer;
  LinkedComponent: TLinkedComponent);
const
  Str = 'OnCloseClick fired - Content: %s';
begin
  mEvents.Lines.Add(Format(Str, [TInfoWindow(LinkedComponent).HTMLContent]));
end;

procedure TGMInfoWinFrm.GMInfoWindow1CloseOtherBeforeOpenChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Str = 'OnCloseOtherBeforeOpenChange fired - Content: %s';
begin
  mEvents.Lines.Add(Format(Str, [TInfoWindow(LinkedComponent).HTMLContent]));
end;

procedure TGMInfoWinFrm.GMInfoWindow1DisableAutoPanChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Str = 'OnDisableAutoPanChange fired - Content: %s';
begin
  mEvents.Lines.Add(Format(Str, [TInfoWindow(LinkedComponent).HTMLContent]));
end;

procedure TGMInfoWinFrm.GMInfoWindow1HTMLContentChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Str = 'OnHTMLContentChange fired - Content: %s';
begin
  mEvents.Lines.Add(Format(Str, [TInfoWindow(LinkedComponent).HTMLContent]));
end;

procedure TGMInfoWinFrm.GMInfoWindow1MaxWidthChange(Sender: TObject;
  Index: Integer; LinkedComponent: TLinkedComponent);
const
  Str = 'OnMaxWidthChange fired - Content: %s';
begin
  mEvents.Lines.Add(Format(Str, [TInfoWindow(LinkedComponent).HTMLContent]));
end;

procedure TGMInfoWinFrm.GMInfoWindow1PositionChange(Sender: TObject;
  LatLng: TLatLng; Index: Integer; LinkedComponent: TLinkedComponent);
const
  Str = 'OnPositionChange fired - Lat: %s, Lng: %s - Content: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision), TInfoWindow(LinkedComponent).HTMLContent]));
end;

procedure TGMInfoWinFrm.GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  bDoWeb.Enabled := True;
  if First then
  begin
    mEvents.Lines.Add('AfterPageLoaded fired - first page loaded');
    DoMap;
  end
  else
    mEvents.Lines.Add('AfterPageLoaded fired - all tiles loaded');
end;

procedure TGMInfoWinFrm.GMMap1BoundsChanged(Sender: TObject;
  NewBounds: TLatLngBounds);
const
  Str = 'OnBoundChanged fired - SW.Lat: %s, SW.Lng: %s, NE.Lat: %s, NE.Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [
        NewBounds.SW.LatToStr(GMMap1.Precision),
        NewBounds.SW.LngToStr(GMMap1.Precision),
        NewBounds.NE.LatToStr(GMMap1.Precision),
        NewBounds.NE.LngToStr(GMMap1.Precision)
        ]))
end;

procedure TGMInfoWinFrm.GMMap1CenterChanged(Sender: TObject; LatLng: TLatLng; X, Y: Double);
const
  Str = 'OnCenterChanged fired - Lat: %s, Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TGMInfoWinFrm.GMMap1Click(Sender: TObject; LatLng: TLatLng; X, Y: Double);
const
  Str = 'OnClick fired - Lat: %s, Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TGMInfoWinFrm.GMMap1DblClick(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
const
  Str = 'OnDblClick fired - Lat: %s, Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TGMInfoWinFrm.GMMap1Drag(Sender: TObject);
begin
  mEvents.Lines.Add('OnDrag fired');
end;

procedure TGMInfoWinFrm.GMMap1DragEnd(Sender: TObject);
begin
  mEvents.Lines.Add('OnDragEnd fired');
end;

procedure TGMInfoWinFrm.GMMap1DragStart(Sender: TObject);
begin
  mEvents.Lines.Add('OnDragStart fired');
end;

procedure TGMInfoWinFrm.GMMap1MapTypeIdChanged(Sender: TObject;
  NewMapTypeId: TMapTypeId);
const
  Str = 'OnMapeTypeIdChanged fired - New MapTypeId: %s';
var
  Strg: string;
begin
  Strg := TTransform.MapTypeIdToStr(NewMapTypeId);
  mEvents.Lines.Add(Format(Str, [Strg]));
  cbMapTypeMet.ItemIndex := cbMapTypeMet.Items.IndexOf(Strg);
  cbTypMap.ItemIndex := cbTypMap.Items.IndexOf(Strg);
end;

procedure TGMInfoWinFrm.GMMap1MouseMove(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
begin
  lLatEvent.Caption := LatLng.LatToStr(GMMap1.Precision);
  lLngEvent.Caption := LatLng.LngToStr(GMMap1.Precision);
end;

procedure TGMInfoWinFrm.GMMap1MouseOut(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
const
  Str = 'OnMouseOut fired - Lat: %s, Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TGMInfoWinFrm.GMMap1MouseOver(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
const
  Str = 'OnMouseOver fired - Lat: %s, Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TGMInfoWinFrm.GMMap1RightClick(Sender: TObject; LatLng: TLatLng; X,
  Y: Double);
const
  Str = 'OnRightClick fired - Lat: %s, Lng: %s';
begin
  mEvents.Lines.Add(Format(Str, [LatLng.LatToStr(GMMap1.Precision), LatLng.LngToStr(GMMap1.Precision)]));
end;

procedure TGMInfoWinFrm.GMMap1ZoomChanged(Sender: TObject; NewZoom: Integer);
const
  Str = 'OnZoomChanged fired - New zoom: %d';
begin
  mEvents.Lines.Add(Format(Str, [NewZoom]));
  tbZoom.Position := NewZoom;
  tbZoomMet.Position := NewZoom;
end;

procedure TGMInfoWinFrm.lbInfoWindowsClick(Sender: TObject);
begin
  if lbInfoWindows.ItemIndex = -1 then Exit;

  cbDisableAutoPan.Checked := GMInfoWindow1[lbInfoWindows.ItemIndex].DisableAutoPan;
  cbAutoOpen.Checked := GMInfoWindow1[lbInfoWindows.ItemIndex].AutoOpen;
  cbCloseOtherBeforeOpen.Checked := GMInfoWindow1[lbInfoWindows.ItemIndex].CloseOtherBeforeOpen;
  eMaxWidth.Text := IntToStr(GMInfoWindow1[lbInfoWindows.ItemIndex].MaxWidth);
  eHeight.Text := IntToStr(GMInfoWindow1[lbInfoWindows.ItemIndex].PixelOffset.Height);
  eWidth.Text := IntToStr(GMInfoWindow1[lbInfoWindows.ItemIndex].PixelOffset.Width);
  eInfoWinLng.Text := GMInfoWindow1[lbInfoWindows.ItemIndex].Position.LngToStr(GMMap1.Precision);
  eInfoWinLat.Text := GMInfoWindow1[lbInfoWindows.ItemIndex].Position.LatToStr(GMMap1.Precision);
  mHTMLContent.Lines.Text := GMInfoWindow1[lbInfoWindows.ItemIndex].HTMLContent;
  lZIndex.Caption := IntToStr(GMInfoWindow1[lbInfoWindows.ItemIndex].Index);
end;

procedure TGMInfoWinFrm.pOptionsChange(Sender: TObject);
begin
  if pOptions.ActivePageIndex = 5 then AddNewInfoWin;
end;

procedure TGMInfoWinFrm.ePrecisionChange(Sender: TObject);
begin
  GMMap1.Precision := ePrecision.Value;
end;

procedure TGMInfoWinFrm.StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
  const Rect: TRect);
begin
  StatusBar.Canvas.Font.Color := clBlue;
  Statusbar.Canvas.TextRect(Rect, Rect.Left, Rect.Top, Panel.Text);
end;

procedure TGMInfoWinFrm.StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if GetStatusBarPanelXY(StatusBar1, X, Y) = 1 then
    StatusBar1.Cursor := crHandPoint
  else
    StatusBar1.Cursor := crDefault;
end;

procedure TGMInfoWinFrm.StatusBar1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (GetStatusBarPanelXY(StatusBar1, X, Y) = 1) and (Button = mbLeft) then
    ShellExecute(Handle, 'open', 'http://www.cadetill.com', nil, nil, SW_SHOW);
end;

end.
