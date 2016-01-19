{
GMPolygonVCL unit

  ES: contiene las clases VCL necesarias para mostrar polígonos en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the VCL classes needed to show polygons on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      poligonos a mostrar
  EN: put the component into a form, link to a TGMMap and put the polygons to
      show
=========================================================================
History:

ver 1.0.0
  ES:
    cambio: TPolygons ahora hereda de TBasePolylines.
  EN:
    change: TPolygons now descends from TBasePolylines.

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
  The GMPolygonVCL unit includes the VCL classes needed to show polygons on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMPolygonVCL contiene las clases VCL necesarias para mostrar polígonos en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMPolygonVCL;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes, Vcl.Graphics,
  {$ELSE}
  Classes, Graphics,
  {$ENDIF}

  GMPolyline, GMPolylineVCL, GMLinkedComponents, GMClasses;

type
  {*------------------------------------------------------------------------------
    VCL class for polygons.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polygon
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para los polígonos.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polygon
  -------------------------------------------------------------------------------}
  TPolygon = class(TBasePolylineVCL)
  private
    {*------------------------------------------------------------------------------
      The fill color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de relleno.
    -------------------------------------------------------------------------------}
    FFillColor: TColor;
    {*------------------------------------------------------------------------------
      The fill opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del relleno entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FFillOpacity: Real;
    procedure SetFillColor(const Value: TColor);
    procedure SetFillOpacity(const Value: Real);
  protected
    function ChangeProperties: Boolean; override;
  public
    constructor Create(Collection: TCollection); override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Computes whether the given point lies inside the polygon.
      More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param LatLng Point to compute.
      @return True if the point is inside of the polygon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula si el punto dado se encuentra dentro del polígono.
      Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param LatLng Punto a calcular.
      @return True si el punto esta dentro del polígono.
    -------------------------------------------------------------------------------}
    function ContainsLocation(LatLng: TLatLng): Boolean; overload;
    {*------------------------------------------------------------------------------
      Computes whether the given point lies inside the polygon.
      More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param Lat Latitude to compute.
      @param Lng Longitude to compute.
      @return True if the point is inside of the polygon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula si el punto dado se encuentra dentro del polígono.
      Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param Lat Latitud a calcular.
      @param Lng Longitud a calcular.
      @return True si el punto esta dentro del polígono.
    -------------------------------------------------------------------------------}
    function ContainsLocation(Lat, Lng: Real): Boolean; overload;
  published
    property FillColor: TColor read FFillColor write SetFillColor default clRed;
    property FillOpacity: Real read FFillOpacity write SetFillOpacity; // 0 to 1
  end;

  {*------------------------------------------------------------------------------
    VCL class for polygons collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para la colección de polígonos.
  -------------------------------------------------------------------------------}
  TPolygons = class(TBasePolylines)
  private
    procedure SetItems(I: Integer; const Value: TPolygon);
    function GetItems(I: Integer): TPolygon;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TPolygon;
    function Insert(Index: Integer): TPolygon;

    {*------------------------------------------------------------------------------
      Lists the polygons in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de polígonos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TPolygon read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of polygons.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la gestión de polígonos.
  -------------------------------------------------------------------------------}
  TGMPolygon = class(TGMBasePolyline)
  private
    {*------------------------------------------------------------------------------
      This event is fired when the polygon's FillOpacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad FillOpacity de un polígono.
    -------------------------------------------------------------------------------}
    FOnFillOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polygon's FillColor property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad FillColor de un polígono.
    -------------------------------------------------------------------------------}
    FOnFillColorChange: TLinkedComponentChange;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TPolygon;

    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates a new TPolygon instance and adds it to the Items array.
      @return New TPolygon
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TPolygon y la añade en el array de Items.
      @return Nuevo TPolygon
    -------------------------------------------------------------------------------}
    function Add: TPolygon;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TPolygon read GetItems; default;
  published
    // eventos
    // events
        // from properties
    property OnFillColorChange: TLinkedComponentChange read FOnFillColorChange write FOnFillColorChange;
    property OnFillOpacityChange: TLinkedComponentChange read FOnFillOpacityChange write FOnFillOpacityChange;
  end;

implementation

uses
  SysUtils,
  GMFunctionsVCL, GMConstants;

{ TGMPolygon }

function TGMPolygon.Add: TPolygon;
begin
  Result := TPolygon(inherited Add);
end;

function TGMPolygon.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polygon';
end;

function TGMPolygon.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TPolygons;
end;

function TGMPolygon.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TPolygon;
end;

function TGMPolygon.GetItems(I: Integer): TPolygon;
begin
  Result := TPolygon(inherited Items[i]);
end;

{ TPolygons }

function TPolygons.Add: TPolygon;
begin
  Result := TPolygon(inherited Add);
end;

function TPolygons.GetItems(I: Integer): TPolygon;
begin
  Result := TPolygon(inherited Items[I]);
end;

function TPolygons.GetOwner: TPersistent;
begin
  Result := TGMPolygon(inherited GetOwner);
end;

function TPolygons.Insert(Index: Integer): TPolygon;
begin
  Result := TPolygon(inherited Insert(Index));
end;

procedure TPolygons.SetItems(I: Integer; const Value: TPolygon);
begin
  inherited SetItem(I, Value);
end;

{ TPolygon }

procedure TPolygon.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TPolyline then
  begin
    FillColor := TPolygon(Source).FillColor;
    FillOpacity := TPolygon(Source).FillOpacity;
  end;
end;

function TPolygon.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  inherited;

  Result := False;

  if not Assigned(Collection) or not(Collection is TPolygons) or
     not Assigned(TPolygons(Collection).FGMLinkedComponent) or
     //not TGMPolygon(TPolygons(Collection).FGMLinkedComponent).AutoUpdate or
     not Assigned(TGMPolygon(TPolygons(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TGMPolygon(TPolygons(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  Params := Format(StrParams, [
                  IntToStr(IdxList),
                  LowerCase(TTransform.GMBoolToStr(Clickable, True)),
                  LowerCase(TTransform.GMBoolToStr(Editable, True)),
                  QuotedStr(TTransform.TColorToStr(FillColor)),
                  StringReplace(FloatToStr(FillOpacity), ',', '.', [rfReplaceAll]),
                  LowerCase(TTransform.GMBoolToStr(Geodesic, True)),
                  QuotedStr(GetStrokeColor),
                  StringReplace(FloatToStr(StrokeOpacity), ',', '.', [rfReplaceAll]),
                  IntToStr(StrokeWeight),
                  LowerCase(TTransform.GMBoolToStr(Visible, True)),
                  QuotedStr(PolylineToStr),
                  IntToStr(Index),
                  QuotedStr(InfoWindow.GetConvertedString),
                  LowerCase(TTransform.GMBoolToStr(InfoWindow.DisableAutoPan, True)),
                  IntToStr(InfoWindow.MaxWidth),
                  IntToStr(InfoWindow.PixelOffset.Height),
                  IntToStr(InfoWindow.PixelOffset.Width),
                  LowerCase(TTransform.GMBoolToStr(InfoWindow.CloseOtherBeforeOpen, True))
                  ]);

  Result := TGMPolygon(TPolygons(Collection).FGMLinkedComponent).ExecuteScript('MakePolygon', Params);
  TGMPolygon(TPolygons(Collection).FGMLinkedComponent).ErrorControl;
end;

function TPolygon.ContainsLocation(LatLng: TLatLng): Boolean;
//const
//  StrParams = '%s,%s,%s,%s';
//var
//  Params: string;
begin
//  Params := Format(StrParams, [
//                  IntToStr(IdxList),
//                  IntToStr(Index),
//                  LatLng.LatToStr(TGMPolygon(TPolygons(Collection).FGMLinkedComponent).GetMapPrecision),
//                  LatLng.LngToStr(TGMPolygon(TPolygons(Collection).FGMLinkedComponent).GetMapPrecision)
//                  ]);
//  TGMPolygon(TPolygons(Collection).FGMLinkedComponent).ExecuteScript('ContainsLocation', Params);
//  Result := TGMPolygon(TPolygons(Collection).FGMLinkedComponent).GetBoolField(PolylineForm, PolylineFormContainsLocation);
  Result := TGeometry.ContainsLocation(TGMPolygon(TPolygons(Collection).FGMLinkedComponent), Index, LatLng);
end;

function TPolygon.ContainsLocation(Lat, Lng: Real): Boolean;
var
  LatLng: TLatLng;
begin
  LatLng := TLatLng.Create(Lat, Lng);
  try
    Result := ContainsLocation(LatLng);
  finally
    FreeAndNil(LatLng);
  end;
end;

constructor TPolygon.Create(Collection: TCollection);
begin
  inherited;

  FFillOpacity := 0.5;
  FFillColor := clRed;
end;

procedure TPolygon.SetFillColor(const Value: TColor);
begin
  if FFillColor = Value then Exit;

  FFillColor := Value;

  ChangeProperties;
  if Assigned(TGMPolygon(TPolygons(Collection).FGMLinkedComponent).FOnFillColorChange) then
    TGMPolygon(TPolygons(Collection).FGMLinkedComponent).FOnFillColorChange(
                  TGMPolygon(TPolygons(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TPolygon.SetFillOpacity(const Value: Real);
begin
  if FFillOpacity = Value then Exit;

  FFillOpacity := Value;
  if FFillOpacity < 0 then FFillOpacity := 0;
  if FFillOpacity > 1 then FFillOpacity := 1;
  FFillOpacity := Trunc(FFillOpacity * 100) / 100;

  ChangeProperties;
  if Assigned(TGMPolygon(TPolygons(Collection).FGMLinkedComponent).FOnFillOpacityChange) then
    TGMPolygon(TPolygons(Collection).FGMLinkedComponent).FOnFillOpacityChange(
                  TGMPolygon(TPolygons(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

end.
