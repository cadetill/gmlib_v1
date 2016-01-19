{
GMRectangle unit

  ES: contiene las clases bases necesarias para mostrar rectángulos en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the base classes needed to show rectangles on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      rectángulos a mostrar
  EN: put the component into a form, link to a TGMMap and put the rectangles to
      show
=========================================================================
History:

ver 1.0.0
  ES:
    cambio: el método TCustomRectangle.GetCenter pasa a ser un procedure.
    nuevo: TCustomRectangle -> ZoomToPoints, establece el zoom óptimo para visualizar
      el rectánglo.
  EN:
    change: TCustomRectangle.GetCenter method becomes a procedure.
    new: TCustomRectangle -> ZoomToPoints, sets the optimal zoom to display the rectangle.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey

ver 0.1.7
  ES:
    cambio: modificados métodos Set y ShowElement para que usen el nuevo método
      ChangeProperties heredado de TLinkedComponent
  EN:
    change: modified all Set and ShowElements methods to use the new method
      ChangeProperties inherited from TLinkedComponent

ver 0.1.5
  ES:
    nuevo: TRectangle -> añadido método GetCenter
  EN:
    new: TRectangle -> GetCenter method added

ver 0.1.4
  ES:
    cambio: cambio en el JavaScript de algunos métodos Set
  EN:
    change: JavaScript changed from some Set methods

ver 0.1.3
  ES: primera versión
  EN: first version
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
  The GMRectangle unit includes the base classes needed to show rectangles on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMRectangle contiene las clases bases necesarias para mostrar rectángulos en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMRectangle;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMLinkedComponents, GMClasses, GMConstants;

type
  {*------------------------------------------------------------------------------
    Base class for rectangles.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Rectangle
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los rectángulos.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Rectangle
  -------------------------------------------------------------------------------}
  TCustomRectangle = class(TLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      If this rectangle is visible on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si el rectángulo está visible en el mapa.
    -------------------------------------------------------------------------------}
    FVisible: Boolean;
    {*------------------------------------------------------------------------------
      The rectangle bounds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Límites del rectángulo.
    -------------------------------------------------------------------------------}
    FBounds: TLatLngBounds;
    {*------------------------------------------------------------------------------
      The stroke width in pixels.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Anchura del trazo en píxeles.
    -------------------------------------------------------------------------------}
    FStrokeWeight: Integer;
    {*------------------------------------------------------------------------------
      The fill opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del relleno con valores entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FFillOpacity: Real;
    {*------------------------------------------------------------------------------
      Indicates whether this rectangle handles mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si este rentángulo recivirá eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      The stroke opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del trazo con valores entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FStrokeOpacity: Real;
    {*------------------------------------------------------------------------------
      If set to true, the user can edit this rectangle by dragging the control points shown at the corners and on each edge.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el usuario puede editar este rectángulo desplazando el control mediantes los puntos mostrados en las esquinas y en cada lado.
    -------------------------------------------------------------------------------}
    FEditable: Boolean;
    FIsBoundsUpdt: Boolean;
    procedure SetClickable(const Value: Boolean);
    procedure SetEditable(const Value: Boolean);
    procedure SetFillOpacity(const Value: Real);
    procedure SetStrokeOpacity(const Value: Real);
    procedure SetStrokeWeight(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
    procedure OnChangeBounds(Sender: TObject);
  protected
    {*------------------------------------------------------------------------------
      This method returns the assigned color to the FillColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad FillColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetFillColor: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      This method returns the assigned color to the StrokeColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad StrokeColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetStrokeColor: string; virtual; abstract;

    function ChangeProperties: Boolean; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Sets the optimal zoom to display the rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece el zoom óptimo para visualizar el rectángulo.
    -------------------------------------------------------------------------------}
    procedure ZoomToPoints;
    {*------------------------------------------------------------------------------
      Converts to string the four points of the rectangle. The points are separated by semicolon (;) and the coordinates (lat/lng) by a pipe (|).
      @return String with conversion.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Convierte en una cadena los cuatro puntos del rectángulo. Los puntos están separados por punto y coma (;) y las coordenadas (lat/lng) separados por una barra vertical (|).
      @return Cadena con la conversión.
    -------------------------------------------------------------------------------}
    function GetStrPath: string;
    {*------------------------------------------------------------------------------
      Returns the area of a closed path. The computed area uses the same units as the Radius. The radius defaults to the Earth's radius in meters, in which case the area is in square meters.
      @param Radius Radius to use.
      @return Area.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el area de una ruta cerrada. El area calculada usa las mismas unidades que Radius. El radio por defecto es el radio de la Tierra en metros, en cuyo caso el área es en metros cuadrados.
      @param Radius Radio a usar.
      @return Area.
    -------------------------------------------------------------------------------}
    function ComputeArea(Radius: Real = -1): Real;
    {*------------------------------------------------------------------------------
      Returns the center of the rectangle.
      @param LL TLatLng with the center of the rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el centro del rectángulo.
      @param LL TLatLng con el centro del rectángulo.
    -------------------------------------------------------------------------------}
    procedure GetCenter(LL: TLatLng);
    procedure CenterMapTo; override;
  published
    property Bounds: TLatLngBounds read FBounds write FBounds;
    property Clickable: Boolean read FClickable write SetClickable default True;
    property Editable: Boolean read FEditable write SetEditable default False;
    property FillOpacity: Real read FFillOpacity write SetFillOpacity; // 0 to 1
    property StrokeOpacity: Real read FStrokeOpacity write SetStrokeOpacity; // 0 to 1
    property StrokeWeight: Integer read FStrokeWeight write SetStrokeWeight default 2; // 1 to 10
    property Visible: Boolean read FVisible write SetVisible default True;
    {*------------------------------------------------------------------------------
      InfoWindows associated object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      InfoWindows asociado al objeto.
    -------------------------------------------------------------------------------}
    property InfoWindow;
    {*------------------------------------------------------------------------------
      This property is used, if applicable, to establish the name that appears in the collection editor.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Esta propiedad se usa, si procede, para establecer el nombre que aparece en el editor de la colección.
    -------------------------------------------------------------------------------}
    property Text;
  end;

  {*------------------------------------------------------------------------------
    Base class for rectangles collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para la colección de rectángulos.
  -------------------------------------------------------------------------------}
  TCustomRectangles = class(TLinkedComponents)
  private
    procedure SetItems(I: Integer; const Value: TCustomRectangle);
    function GetItems(I: Integer): TCustomRectangle;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TCustomRectangle;
    function Insert(Index: Integer): TCustomRectangle;

    {*------------------------------------------------------------------------------
      Lists the rectangles in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de rectángulos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCustomRectangle read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Base class for GMRectangle component.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para el componente GMRectangle.
  -------------------------------------------------------------------------------}
  TCustomGMRectangle = class(TGMLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's StrokeColor property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeColor de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnStrokeColorChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when a rectangle is right-clicked on.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando en un rectángulo se pulsa el botón derecho del ratón.
    -------------------------------------------------------------------------------}
    FOnRightClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a mousedown on the rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al pulsar en el rentángulo.
    -------------------------------------------------------------------------------}
    FOnMouseDown: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's Visible property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Visible de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnVisibleChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when mousemove on the rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón se mueve por encima del rectángulo.
    -------------------------------------------------------------------------------}
    FOnMouseMove: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's StrokeWeight property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeWeight de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnStrokeWeightChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired for a mouseup on the rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al soltar el rectángulo.
    -------------------------------------------------------------------------------}
    FOnMouseUp: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's FillOpacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad FillOpacity de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnFillOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's Clickable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Clickable de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnClickableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired on rectangle mouseout.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón sale del rectángulo.
    -------------------------------------------------------------------------------}
    FOnMouseOut: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's StrokeOpacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeOpacity de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnStrokeOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's Editable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Editable de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnEditableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's bounds are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambian los límites de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnBoundsChanged: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event occurs when the user double-clicks a rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario hace doble click un rectángulo.
    -------------------------------------------------------------------------------}
    FOnDblClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the mouse enters the area of the rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón entra en el área del rectángulo.
    -------------------------------------------------------------------------------}
    FOnMouseOver: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the rectangle's FillColor property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad FillColor de un rectángulo.
    -------------------------------------------------------------------------------}
    FOnFillColorChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event occurs when the user click a rectangle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario pulsa un rectángulo.
    -------------------------------------------------------------------------------}
    FOnClick: TLatLngIdxEvent;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TCustomRectangle;

    procedure EventFired(EventType: TEventType; Params: array of const); override;
    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates a new TCustomRectangle instance and adds it to the Items array.
      @param SWLat The rectangle's southwest latitude
      @param SWLng The rectangle's southwest longitude
      @param NELat The rectangle's northeast latitude
      @param NELng The rectangle's northeast longitude
      @return A new instance of TCustomRectangle
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TCustomRectangle y la añade en el array de Items.
      @param SWLat Latitud suroeste del rectángulo
      @param SWLng Longitud suroeste del rectángulo
      @param NELat Latitud noreste del rectángulo
      @param NELng Longitud noreste del rectángulo
      @return Una nueva instancia de TCustomRectangle
    -------------------------------------------------------------------------------}
    function Add(SWLat: Real = 0; SWLng: Real = 0; NELat: Real = 0; NELng: Real = 0): TCustomRectangle;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCustomRectangle read GetItems; default;
  published
    {*------------------------------------------------------------------------------
      Collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Colección de elementos.
    -------------------------------------------------------------------------------}
    property VisualObjects;
    // eventos
    // events
        // both (map and properties)
    property OnBoundsChanged: TLinkedComponentChange read FOnBoundsChanged write FOnBoundsChanged;
        // from map
    property OnClick: TLatLngIdxEvent read FOnClick write FOnClick;
    property OnDblClick: TLatLngIdxEvent read FOnDblClick write FOnDblClick;
    property OnMouseDown: TLatLngIdxEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseMove: TLatLngIdxEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseOut: TLatLngIdxEvent read FOnMouseOut write FOnMouseOut;
    property OnMouseOver: TLatLngIdxEvent read FOnMouseOver write FOnMouseOver;
    property OnMouseUp: TLatLngIdxEvent read FOnMouseUp write FOnMouseUp;
    property OnRightClick: TLatLngIdxEvent read FOnRightClick write FOnRightClick;
        // from properties
    property OnClickableChange: TLinkedComponentChange read FOnClickableChange write FOnClickableChange;
    property OnEditableChange: TLinkedComponentChange read FOnEditableChange write FOnEditableChange;
    property OnFillColorChange: TLinkedComponentChange read FOnFillColorChange write FOnFillColorChange;
    property OnFillOpacityChange: TLinkedComponentChange read FOnFillOpacityChange write FOnFillOpacityChange;
    property OnStrokeColorChange: TLinkedComponentChange read FOnStrokeColorChange write FOnStrokeColorChange;
    property OnStrokeOpacityChange: TLinkedComponentChange read FOnStrokeOpacityChange write FOnStrokeOpacityChange;
    property OnStrokeWeightChange: TLinkedComponentChange read FOnStrokeWeightChange write FOnStrokeWeightChange;
    property OnVisibleChange: TLinkedComponentChange read FOnVisibleChange write FOnVisibleChange;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  Lang, GMFunctions;

{ TCustomGMRectangle }

function TCustomGMRectangle.Add(SWLat, SWLng, NELat, NELng: Real): TCustomRectangle;
begin
  Result := TCustomRectangle(inherited Add);
  Result.Bounds.SW.Lat := SWLat;
  Result.Bounds.SW.Lng := SWLng;
  Result.Bounds.NE.Lat := NELat;
  Result.Bounds.NE.Lng := NELng;
end;

procedure TCustomGMRectangle.EventFired(EventType: TEventType;
  Params: array of const);
var
  LL: TLatLng;
  OldEvent: TNotifyEvent;
begin
  inherited;

  if EventType = etInfoWinCloseClick then Exit;

  if EventType = etRectangleBoundsChange then
  begin
    if High(Params) <> 4 then
      raise Exception.Create(GetTranslateText('Número de parámetros incorrecto', Map.Language));

    if (Params[1].VType <> vtExtended) or (Params[2].VType <> vtExtended) or
       (Params[3].VType <> vtExtended) or (Params[4].VType <> vtExtended) then
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    if Params[0].VType <> vtInteger then
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    if Params[0].VInteger > VisualObjects.Count - 1 then
      raise Exception.Create(GetTranslateText('Valor de parámetro incorrecto', Map.Language));

    if Items[Params[0].VInteger].FIsBoundsUpdt then
    begin
      Items[Params[0].VInteger].FIsBoundsUpdt := False;
      Exit;
    end;

    OldEvent := Items[Params[0].VInteger].Bounds.NE.OnChange;
    Items[Params[0].VInteger].Bounds.NE.OnChange := nil;
    Items[Params[0].VInteger].Bounds.SW.OnChange := nil;

    Items[Params[0].VInteger].Bounds.NE.Lat := ControlPrecision(Params[1].VExtended^, GetMapPrecision);
    Items[Params[0].VInteger].Bounds.NE.Lng := ControlPrecision(Params[2].VExtended^, GetMapPrecision);
    Items[Params[0].VInteger].Bounds.SW.Lat := ControlPrecision(Params[3].VExtended^, GetMapPrecision);
    Items[Params[0].VInteger].Bounds.SW.Lng := ControlPrecision(Params[4].VExtended^, GetMapPrecision);
    if Assigned(FOnBoundsChanged) then FOnBoundsChanged(Self, Params[0].VInteger, Items[Params[0].VInteger]);

    Items[Params[0].VInteger].Bounds.NE.OnChange := OldEvent;
    Items[Params[0].VInteger].Bounds.SW.OnChange := OldEvent;

    Exit;
  end;

  if High(Params) <> 2 then
    raise Exception.Create(GetTranslateText('Número de parámetros incorrecto', Map.Language));

  if (Params[0].VType <> vtExtended) or (Params[1].VType <> vtExtended) then
    raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

  if Params[2].VType <> vtInteger then
    raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

  if Params[2].VInteger > VisualObjects.Count - 1 then
    raise Exception.Create(GetTranslateText('Valor de parámetro incorrecto', Map.Language));

  LL := TLatLng.Create(ControlPrecision(Params[0].VExtended^, GetMapPrecision),
                       ControlPrecision(Params[1].VExtended^, GetMapPrecision));
  try
    case EventType of
      etRectangleClick: if Assigned(FOnClick) then FOnClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleDblClick: if Assigned(FOnDblClick) then FOnDblClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleMouseDown: if Assigned(FOnMouseDown) then FOnMouseDown(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleMouseMove: if Assigned(FOnMouseMove) then FOnMouseMove(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleMouseOut: if Assigned(FOnMouseOut) then FOnMouseOut(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleMouseOver: if Assigned(FOnMouseOver) then FOnMouseOver(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleMouseUp: if Assigned(FOnMouseUp) then FOnMouseUp(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etRectangleRightClick: if Assigned(FOnRightClick) then FOnRightClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
    end;
  finally
    FreeAndNil(LL);
  end;
end;

function TCustomGMRectangle.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#Rectangle';
end;

function TCustomGMRectangle.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TCustomRectangles;
end;

function TCustomGMRectangle.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TCustomRectangle;
end;

function TCustomGMRectangle.GetItems(I: Integer): TCustomRectangle;
begin
  Result := TCustomRectangle(inherited Items[i]);
end;

{ TCustomRectangles }

function TCustomRectangles.Add: TCustomRectangle;
begin
  Result := TCustomRectangle(inherited Add);
end;

function TCustomRectangles.GetItems(I: Integer): TCustomRectangle;
begin
  Result := TCustomRectangle(inherited Items[I]);
end;

function TCustomRectangles.GetOwner: TPersistent;
begin
  Result := TCustomGMRectangle(inherited GetOwner);
end;

function TCustomRectangles.Insert(Index: Integer): TCustomRectangle;
begin
  Result := TCustomRectangle(inherited Insert(Index));
end;

procedure TCustomRectangles.SetItems(I: Integer; const Value: TCustomRectangle);
begin
  inherited SetItem(I, Value);
end;

{ TCustomRectangle }

procedure TCustomRectangle.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomRectangle then
  begin
    Bounds.Assign(TCustomRectangle(Source).Bounds);
    Clickable := TCustomRectangle(Source).Clickable;
    Editable  := TCustomRectangle(Source).Editable;
    FillOpacity := TCustomRectangle(Source).FillOpacity;
    StrokeOpacity := TCustomRectangle(Source).StrokeOpacity;
    StrokeWeight := TCustomRectangle(Source).StrokeWeight;
    Visible := TCustomRectangle(Source).Visible;
  end;
end;

procedure TCustomRectangle.CenterMapTo;
var
  LL: TLatLng;
begin
  inherited;

  if Assigned(Collection) and (Collection is TCustomRectangles) and
     Assigned(TCustomRectangles(Collection).FGMLinkedComponent) and
     Assigned(TCustomRectangles(Collection).FGMLinkedComponent.Map) then
  begin
    LL := TLatLng.Create;
    try
      GetCenter(LL);
      TCustomRectangles(Collection).FGMLinkedComponent.Map.SetCenter(LL.Lat, LL.Lng);
    finally
      if Assigned(LL) then FreeAndNil(LL);
    end;
  end;
end;

function TCustomRectangle.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  inherited;

  Result := False;

  if not Assigned(Collection) or not(Collection is TCustomRectangles) or
     not Assigned(TCustomRectangles(Collection).FGMLinkedComponent) or
     //not TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).AutoUpdate or
     not Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  Params := Format(StrParams, [
                    IntToStr(IdxList),
                    LowerCase(TCustomTransform.GMBoolToStr(Clickable, True)),
                    LowerCase(TCustomTransform.GMBoolToStr(Editable, True)),
                    QuotedStr(GetFillColor),
                    StringReplace(FloatToStr(FillOpacity), ',', '.', [rfReplaceAll]),
                    QuotedStr(GetStrokeColor),
                    StringReplace(FloatToStr(StrokeOpacity), ',', '.', [rfReplaceAll]),
                    IntToStr(StrokeWeight),
                    LowerCase(TCustomTransform.GMBoolToStr(Visible, True)),
                    Bounds.SW.LatToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
                    Bounds.SW.LngToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
                    Bounds.NE.LatToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
                    Bounds.NE.LngToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
                    IntToStr(Index),
                    QuotedStr(InfoWindow.GetConvertedString),
                    LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.DisableAutoPan, True)),
                    IntToStr(InfoWindow.MaxWidth),
                    IntToStr(InfoWindow.PixelOffset.Height),
                    IntToStr(InfoWindow.PixelOffset.Width),
                    LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.CloseOtherBeforeOpen, True))
                  ]);

  Result := TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).ExecuteScript('MakeRectangle', Params);
  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).ErrorControl;
end;

function TCustomRectangle.ComputeArea(Radius: Real): Real;
begin
  Result := TGeometry.ComputeArea(TCustomRectangles(Collection).FGMLinkedComponent.Map, GetStrPath, Radius);
end;

constructor TCustomRectangle.Create(Collection: TCollection);
begin
  inherited;

  FBounds := TLatLngBounds.Create;
  Bounds.NE.OnChange := OnChangeBounds;
  Bounds.SW.OnChange := OnChangeBounds;
  FClickable := True;
  FEditable := False;
  FFillOpacity := 0.5;
  FStrokeOpacity := 1;
  FStrokeWeight := 2;
  FVisible := True;
  FIsBoundsUpdt := False;
end;

destructor TCustomRectangle.Destroy;
begin
  if Assigned(FBounds) then FreeAndNil(FBounds);

  inherited;
end;

procedure TCustomRectangle.GetCenter(LL: TLatLng);
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  if not Assigned(LL) then Exit;

  if not Assigned(Collection) or not (Collection is TCustomRectangles) or
     not Assigned(TCustomRectangles(Collection).FGMLinkedComponent) or
     not Assigned(TCustomRectangles(Collection).FGMLinkedComponent.Map) then
    Exit;

  Params := Format(StrParams, [IntToStr(IdxList), IntToStr(Index)]);
  if not TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).ExecuteScript('RectangleGetCenter', Params) then
    Exit;

  LL.Lat := TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetFloatField(RectangleForm, RectangleFormLat);
  LL.Lng := TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetFloatField(RectangleForm, RectangleFormLng);
end;

function TCustomRectangle.GetStrPath: string;
const
  Tmp = '%s|%s;%s|%s;%s|%s;%s|%s';
begin
  Result := Format(Tmp, [
               Bounds.NE.LatToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.NE.LngToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.NE.LatToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.SW.LngToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.SW.LatToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.SW.LngToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.SW.LatToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision),
               Bounds.NE.LngToStr(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).GetMapPrecision)
                        ]);
end;

procedure TCustomRectangle.OnChangeBounds(Sender: TObject);
begin
  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnBoundsChanged) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnBoundsChanged(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomRectangle.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;

  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnClickableChange) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnClickableChange(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomRectangle.SetEditable(const Value: Boolean);
begin
  if FEditable = Value then Exit;

  FEditable := Value;

  SetProperty('SetEditable', 'OnEditableChange', FEditable);
{  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnEditableChange) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnEditableChange(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);}
end;

procedure TCustomRectangle.SetFillOpacity(const Value: Real);
begin
  if FFillOpacity = Value then Exit;

  FFillOpacity := Value;
  if FFillOpacity < 0 then FFillOpacity := 0;
  if FFillOpacity > 1 then FFillOpacity := 1;
  FFillOpacity := Trunc(FFillOpacity * 100) / 100;

  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnFillOpacityChange) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnFillOpacityChange(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomRectangle.SetStrokeOpacity(const Value: Real);
begin
  if FStrokeOpacity = Value then Exit;

  FStrokeOpacity := Value;
  if FStrokeOpacity < 0 then FStrokeOpacity := 0;
  if FStrokeOpacity > 1 then FStrokeOpacity := 1;
  FStrokeOpacity := Trunc(FStrokeOpacity * 100) / 100;

  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnStrokeOpacityChange) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnStrokeOpacityChange(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomRectangle.SetStrokeWeight(const Value: Integer);
begin
  if FStrokeWeight = Value then Exit;

  FStrokeWeight := Value;
  if FStrokeWeight < 1 then FStrokeWeight := 1;
  if FStrokeWeight > 10 then FStrokeWeight := 10;

  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnStrokeWeightChange) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnStrokeWeightChange(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomRectangle.SetVisible(const Value: Boolean);
begin
  if FVisible = Value then Exit;

  FVisible := Value;

  ChangeProperties;
  if Assigned(TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnVisibleChange) then
    TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent).FOnVisibleChange(
                  TCustomGMRectangle(TCustomRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomRectangle.ZoomToPoints;
var
  Points: array of TLatLng;
begin
  if not Assigned(Collection) or not (Collection is TCustomRectangles) or
     not Assigned(TCustomRectangles(Collection).FGMLinkedComponent) or
     not Assigned(TCustomRectangles(Collection).FGMLinkedComponent.Map) then
    Exit;

  SetLength(Points, 2);
  Points[0] := Bounds.SW;
  Points[1] := Bounds.NE;

  TCustomRectangles(Collection).FGMLinkedComponent.Map.ZoomToPoints(Points);
end;

end.
