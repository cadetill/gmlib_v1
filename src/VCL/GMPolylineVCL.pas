{
GMPolylineVCL unit

  ES: contiene las clases VCL necesarias para mostrar polilíneas en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the VCL classes needed to show polylines on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner las
      polilíneas a mostrar
  EN: put the component into a form, link to a TGMMap and put the polylines to
      show
=========================================================================
History:

ver 1.1.0
  ES:
    nuevo: TPolyline -> añadida propiedad CurveLine.
    nuevo: TGMPolyline -> añadido evento OnCurveLineChange.
  EN:
    new: TPolyline -> added CurveLine property.
    new: TGMPolyline -> added OnCurveLineChange event.

ver 1.0.0
  ES:
    nuevo: se añade la propiedad TIconSequence.Icon.
  EN:
    new: TIconSequence.Icon property is added.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey
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
{*------------------------------------------------------------------------------
  The GMPolylineVCL unit includes the VCL classes needed to show polylines on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMPolylineVCL contiene las clases VCL necesarias para mostrar polilíneas en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMPolylineVCL;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes, Vcl.Graphics,
  {$ELSE}
  Classes, Graphics,
  {$ENDIF}

  GMPolyline, GMLinkedComponents;

type
  {*------------------------------------------------------------------------------
    VCL class to determine the symbol to show along the path.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para determinar el símbolo a mostrar a lo largo del camino.
  -------------------------------------------------------------------------------}
  TSymbol = class(TCustomSymbol)
  private
    {*------------------------------------------------------------------------------
      The fill color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de relleno.
    -------------------------------------------------------------------------------}
    FFillColor: TColor;
    {*------------------------------------------------------------------------------
      The stroke color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del trazo.
    -------------------------------------------------------------------------------}
    FStrokeColor: TColor;
    procedure SetFillColor(const Value: TColor);
    procedure SetStrokeColor(const Value: TColor);
  protected
    function GetFillColor: string; override;
    function GetStrokeColor: string; override;
  public
    constructor Create; override;

    procedure Assign(Source: TPersistent); override;
  published
    property FillColor: TColor read FFillColor write SetFillColor default clRed;
    property StrokeColor: TColor read FStrokeColor write SetStrokeColor default clRed;
  end;

  {*------------------------------------------------------------------------------
    VCL class to determine the icon and repetition to show in the polyline.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para determinar el icono y la repetición a mostrar en la polilínea.
  -------------------------------------------------------------------------------}
  TIconSequence = class(TCustomIconSequence)
  private
    {*------------------------------------------------------------------------------
      Icon properties.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propiedades del icono.
    -------------------------------------------------------------------------------}
    FIcon: TSymbol;
  protected
    procedure CreatePropertiesWithColor; override;
  public
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
  published
    property Icon: TSymbol read FIcon write FIcon;
  end;

  {*------------------------------------------------------------------------------
    VCL base class for polylines and polygons.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL base para las polilineas y polígonos.
  -------------------------------------------------------------------------------}
  TBasePolylineVCL = class(TBasePolyline)
  private
    {*------------------------------------------------------------------------------
      The stroke color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del trazo.
    -------------------------------------------------------------------------------}
    FStrokeColor: TColor;
    procedure SetStrokeColor(const Value: TColor);
  protected
    function GetStrokeColor: string; override;
  public
    constructor Create(Collection: TCollection); override;

    procedure Assign(Source: TPersistent); override;
  published
    property StrokeColor: TColor read FStrokeColor write SetStrokeColor default clBlack;
  end;

  {*------------------------------------------------------------------------------
    VCL class for polylines.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polyline
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para las polilineas.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polyline
  -------------------------------------------------------------------------------}
  TPolyline = class(TBasePolylineVCL)
  private
    {*------------------------------------------------------------------------------
      Features for a curve line polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propiedades para una polilínea con linea curva.
    -------------------------------------------------------------------------------}
    FCurveLine: TCurveLine;
    {*------------------------------------------------------------------------------
      Features for icon and repetition.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características para el icono y la repetición.
    -------------------------------------------------------------------------------}
    FIcon: TIconSequence;
    procedure OnIconChange(Sender: TObject);
    procedure OnCurveLineChange(Sender: TObject);
  protected
    function ChangeProperties: Boolean; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
  published
    property Icon: TIconSequence read FIcon write FIcon;
    property CurveLine: TCurveLine read FCurveLine write FCurveLine;
  end;

  {*------------------------------------------------------------------------------
    VCL class for polylines collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para la colección de polilíneas.
  -------------------------------------------------------------------------------}
  TPolylines = class(TBasePolylines)
  private
    procedure SetItems(I: Integer; const Value: TPolyline);
    function GetItems(I: Integer): TPolyline;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TPolyline;
    function Insert(Index: Integer): TPolyline;

    {*------------------------------------------------------------------------------
      Lists the polylines in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de polilíneas en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TPolyline read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of polylines.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la gestión de polilíneas.
  -------------------------------------------------------------------------------}
  TGMPolyline = class(TGMBasePolyline)
  private
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's Icon property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Icon de una polilínea.
    -------------------------------------------------------------------------------}
    FOnIconChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's CurveLine property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad CurveLine de una polilínea.
    -------------------------------------------------------------------------------}
    FOnCurveLineChange: TLinkedComponentChange;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TPolyline;

    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates a new TPolyline instance and adds it to the Items array.
      @return New TPolyline
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TPolyline y la añade en el array de Items.
      @return Nuevo TPolyline
    -------------------------------------------------------------------------------}
    function Add: TPolyline;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TPolyline read GetItems; default;
  published
    property OnIconChange: TLinkedComponentChange read FOnIconChange write FOnIconChange;
    property OnCurveLineChange: TLinkedComponentChange read FOnCurveLineChange write FOnCurveLineChange;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  GMFunctionsVCL, GMConstants;

{ TSymbol }

procedure TSymbol.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TSymbol then
  begin
    FillColor := TSymbol(Source).FillColor;
    StrokeColor := TSymbol(Source).StrokeColor;
  end;
end;

constructor TSymbol.Create;
begin
  inherited;

  FFillColor := clRed;
  FStrokeColor := clRed;
end;

function TSymbol.GetFillColor: string;
begin
  Result := TTransform.TColorToStr(FFillColor);
end;

function TSymbol.GetStrokeColor: string;
begin
  Result := TTransform.TColorToStr(FStrokeColor);
end;

procedure TSymbol.SetFillColor(const Value: TColor);
begin
  if FFillColor = Value then Exit;

  FFillColor := Value;
  if Assigned(OnChange) then OnChange(Self);
end;

procedure TSymbol.SetStrokeColor(const Value: TColor);
begin
  if FStrokeColor = Value then Exit;

  FStrokeColor := Value;
  if Assigned(OnChange) then OnChange(Self);
end;

{ TIconSequence }

procedure TIconSequence.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TIconSequence then
  begin
    Icon.Assign(TIconSequence(Source).Icon);
  end;
end;

procedure TIconSequence.CreatePropertiesWithColor;
begin
  inherited;

  Icon := TSymbol.Create;
  Icon.OnChange := OnIconChange;
end;

destructor TIconSequence.Destroy;
begin
  if Assigned(FIcon) then FreeAndNil(FIcon);

  inherited;
end;

{ TBasePolylineVCL }

procedure TBasePolylineVCL.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TBasePolylineVCL then
  begin
    StrokeColor := TBasePolylineVCL(Source).StrokeColor;
  end;
end;

constructor TBasePolylineVCL.Create(Collection: TCollection);
begin
  inherited;

  FStrokeColor := clBlack;
end;

function TBasePolylineVCL.GetStrokeColor: string;
begin
  Result := TTransform.TColorToStr(FStrokeColor);
end;

procedure TBasePolylineVCL.SetStrokeColor(const Value: TColor);
begin
  if FStrokeColor = Value then Exit;

  FStrokeColor := Value;

  ChangeProperties;
  if Assigned(TGMPolyline(TPolylines(Collection).FGMLinkedComponent).OnStrokeColorChange) then
    TGMBasePolyline(TPolylines(Collection).FGMLinkedComponent).OnStrokeColorChange(
                  TGMPolyline(TPolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TPolyline }

procedure TPolyline.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TPolyline then
  begin
    Icon.Assign(TPolyline(Source).Icon);
  end;
end;

function TPolyline.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
  DistRepeat: string;
  Offset: string;
begin
  inherited;

  Result := False;

  if not Assigned(Collection) or not(Collection is TPolylines) or
     not Assigned(TPolylines(Collection).FGMLinkedComponent) or
     //not TGMPolyline(TPolylines(Collection).FGMLinkedComponent).AutoUpdate or
     not Assigned(TGMPolyline(TPolylines(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TGMPolyline(TPolylines(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  case Icon.DistRepeat.Measure of
    mPixels: DistRepeat := IntToStr(Icon.DistRepeat.Value) + 'px';
    else DistRepeat := IntToStr(Icon.DistRepeat.Value) + '%';
  end;

  case Icon.OffSet.Measure of
    mPixels: Offset := IntToStr(Icon.OffSet.Value) + 'px';
    else Offset := IntToStr(Icon.OffSet.Value) + '%';
  end;

  Params := Format(StrParams, [
                  IntToStr(IdxList),
                  IntToStr(Index),
                  LowerCase(TTransform.GMBoolToStr(Clickable, True)),
                  LowerCase(TTransform.GMBoolToStr(Editable, True)),
                  LowerCase(TTransform.GMBoolToStr(Geodesic, True)),
                  QuotedStr(GetStrokeColor),
                  StringReplace(FloatToStr(StrokeOpacity), ',', '.', [rfReplaceAll]),
                  IntToStr(StrokeWeight),
                  LowerCase(TTransform.GMBoolToStr(Visible, True)),
                  QuotedStr(PolylineToStr),
                  QuotedStr(InfoWindow.GetConvertedString),
                  LowerCase(TTransform.GMBoolToStr(InfoWindow.DisableAutoPan, True)),
                  IntToStr(InfoWindow.MaxWidth),
                  IntToStr(InfoWindow.PixelOffset.Height),
                  IntToStr(InfoWindow.PixelOffset.Width),
                  LowerCase(TTransform.GMBoolToStr(InfoWindow.CloseOtherBeforeOpen, True)),
                  QuotedStr(DistRepeat),
                  QuotedStr(Icon.Icon.GetFillColor),
                  StringReplace(FloatToStr(Icon.Icon.FillOpacity), ',', '.', [rfReplaceAll]),
                  QuotedStr(TTransform.SymbolPathToStr(Icon.Icon.Path)),
                  QuotedStr(Icon.Icon.GetStrokeColor),
                  StringReplace(FloatToStr(Icon.Icon.StrokeOpacity), ',', '.', [rfReplaceAll]),
                  IntToStr(Icon.Icon.StrokeWeight),
                  QuotedStr(Offset),
                  LowerCase(TTransform.GMBoolToStr(CurveLine.Active, True)),
                  LowerCase(TTransform.GMBoolToStr(CurveLine.Horizontal, True)),
                  IntToStr(CurveLine.Multiplier),
                  StringReplace(FloatToStr(CurveLine.Resolution), ',', '.', [rfReplaceAll])
                  ]);

  Result := TGMPolyline(TPolylines(Collection).FGMLinkedComponent).ExecuteScript('MakePolyline', Params);
  TGMPolyline(TPolylines(Collection).FGMLinkedComponent).ErrorControl;
end;

constructor TPolyline.Create(Collection: TCollection);
begin
  inherited Create(Collection);

  FIcon := TIconSequence.Create(Self);
  FIcon.OnChange := OnIconChange;
  FCurveLine := TCurveLine.Create;
  FCurveLine.OnChange := OnCurveLineChange;
end;

destructor TPolyline.Destroy;
begin
  if Assigned(FIcon) then FreeAndNil(FIcon);
  if Assigned(FCurveLine) then FreeAndNil(FCurveLine);

  inherited;
end;

procedure TPolyline.OnCurveLineChange(Sender: TObject);
begin
  if ChangeProperties and Assigned(TGMPolyline(TPolylines(Collection).FGMLinkedComponent).FOnCurveLineChange) then
    TGMPolyline(TPolylines(Collection).FGMLinkedComponent).FOnCurveLineChange(
                  TGMPolyline(TPolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TPolyline.OnIconChange(Sender: TObject);
begin
  if ChangeProperties and Assigned(TGMPolyline(TPolylines(Collection).FGMLinkedComponent).FOnIconChange) then
    TGMPolyline(TPolylines(Collection).FGMLinkedComponent).FOnIconChange(
                  TGMPolyline(TPolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TPolylines }

function TPolylines.Add: TPolyline;
begin
  Result := TPolyline(inherited Add);
end;

function TPolylines.GetItems(I: Integer): TPolyline;
begin
  Result := TPolyline(inherited Items[I]);
end;

function TPolylines.GetOwner: TPersistent;
begin
  Result := TGMPolyline(inherited GetOwner);
end;

function TPolylines.Insert(Index: Integer): TPolyline;
begin
  Result := TPolyline(inherited Insert(Index));
end;

procedure TPolylines.SetItems(I: Integer; const Value: TPolyline);
begin
  inherited SetItem(I, Value);
end;

{ TGMPolyline }

function TGMPolyline.Add: TPolyline;
begin
  Result := TPolyline(inherited Add);
end;

function TGMPolyline.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polyline';
end;

function TGMPolyline.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TPolylines;
end;

function TGMPolyline.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TPolyline;
end;

function TGMPolyline.GetItems(I: Integer): TPolyline;
begin
  Result := TPolyline(inherited Items[i]);
end;

end.
