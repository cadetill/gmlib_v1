{
GMCircle unit

  ES: contiene las clases bases necesarias para mostrar círculos en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the base classes needed to show circles on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      círculos a mostrar
  EN: put the component into a form, link to a TGMMap and put the circled to
      show
=========================================================================
History:

ver 1.5.1
  ES:
    error: TCustomCircle -> error corregido en el método SetRadius (thanks Thierry)
  EN:
    bug: TCustomCircle -> bug fixed at SetRadius method (thanks Thierry)

ver 1.4.1
  ES:
    error: TCustomCircle -> corregido error en método SetRadius (gracias Fred).
    error: TCustomSizeable -> corregido error en método OnTimer (gracias Fred).
  EN:
    bug: TCustomCircle -> bug fixed on method SetRadius (thanks Fred).
    bug: TCustomSizeable -> bug fixed on method OnTimer (thanks Fred).

ver 1.2.0
  ES:
    cambio: TCustomCircle -> la propiedad Radius pasa a ser un Real.
    error: TCustomCircle -> el radio del círculo se hacía enorme con el cambio
      de alguna propiedad (issue GC19).
  EN:
    change: TCustomCircle -> Radius property becomes a Real.
    bug fixed: TCustomCircle -> the radius of the circle become very large with
      changing some property (issue GC19).

ver 1.0.0
  ES:
    cambio: TCustomCircle -> el método GetBounds pasa ha ser un procedure.
  EN:
    change: TCustomCircle -> GetBounds method becomes a procedure.

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

ver 0.1.6
  ES:
    nuevo: TCustomSizeable -> añadido método Assign
    error: TCustomSizeable -> cuando no era circular, el radio crecía más que el máximo
  EN:
    new: TCustomSizeable -> added Assign method
    bug: TCustomSizeable -> when no circular, radius was growing more than the maximum

ver 0.1.5
  ES:
    cambio: la propiedad Radius pasa a ser un entero
    nuevo: añadida propiedad AutoResize
  EN:
    change: Radius property becomes an integer
    new: added AutoResize property

ver 0.1.4
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
  The GMCircle unit includes the base classes needed to show circles on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMCircle contiene las clases bases necesarias para mostrar círculos en un mapa de Google Maps mediante el componente TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMCircle;

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
  TCustomCircle = class;

  {*------------------------------------------------------------------------------
    Base class for automatic enlarged circle.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para el agrandado automático del círculo.
  -------------------------------------------------------------------------------}
  TCustomSizeable = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Maximum radius to which will enlarge.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Radio máximo hasta el que se agrandará.
    -------------------------------------------------------------------------------}
    FMax: Integer;
    {*------------------------------------------------------------------------------
      Radius increment for every interval of time.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Incremento del radio por cada intervalo de tiempo.
    -------------------------------------------------------------------------------}
    FIncrement: Integer;
    {*------------------------------------------------------------------------------
      Circle's initial radius.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Radio inicial del círculo.
    -------------------------------------------------------------------------------}
    FMin: Integer;
    {*------------------------------------------------------------------------------
      If true, when reach the maximum it returns minimum to increase again.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, al llegar al máximo volverá mínimo nuevamente para volver a incrementarse.
    -------------------------------------------------------------------------------}
    FCircular: Boolean;
    {*------------------------------------------------------------------------------
      Activate or deactivate the autoenlargement.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Activa o desactiva el autoincremento.
    -------------------------------------------------------------------------------}
    FActive: Boolean;
    {*------------------------------------------------------------------------------
      Radius increment speed in milliseconds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Velocidad de incremento del radio en milisegundos.
    -------------------------------------------------------------------------------}
    FSpeed: Integer;
    FOwner: TCustomCircle;
  protected
    {*------------------------------------------------------------------------------
      Set Active property
      @param Value New value
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la propiedad Active
      @param Value Nuevo valor
    -------------------------------------------------------------------------------}
    procedure SetActive(const Value: Boolean); virtual;
    {*------------------------------------------------------------------------------
      Set Speed property
      @param Value New value
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la propiedad Speed
      @param Value Nuevo valor
    -------------------------------------------------------------------------------}
    procedure SetSpeed(const Value: Integer); virtual;

    {*------------------------------------------------------------------------------
      Radius increment speed in miliseconds.
      @return Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el propietario del objeto.
      @return Propietario
    -------------------------------------------------------------------------------}
    function GetOwner: TCustomCircle; reintroduce; virtual;
    {*------------------------------------------------------------------------------
      Response to TTimer event (defined in their descendants).
      @param Sender Object that fire event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Respuesta al evento del TTimer (definido en sus descendientes).
      @param Sender Objecto que dispara el evento
    -------------------------------------------------------------------------------}
    procedure OnTimer(Sender: TObject);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomCircle); virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    property Active: Boolean read FActive write SetActive default False;
    property Min: Integer read FMin write FMin default 0;
    property Max: Integer read FMax write FMax default 0;
    property Increment: Integer read FIncrement write FIncrement default 100;
    property Circular: Boolean read FCircular write FCircular default True;
    property Speed: Integer read FSpeed write SetSpeed default 0;
  end;

  {*------------------------------------------------------------------------------
    Base class for circles.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Circle
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los círculos.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Circle
  -------------------------------------------------------------------------------}
  TCustomCircle = class(TLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      The radius in meters on the Earth's surface.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Radio en metros en la superficie de la Tierra.
    -------------------------------------------------------------------------------}
    FRadius: Real;
    {*------------------------------------------------------------------------------
      Whether this circle is visible on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si el círculo es visible en el mapa.
    -------------------------------------------------------------------------------}
    FVisible: Boolean;
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
      Opacidad del relleno entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FFillOpacity: Real;
    {*------------------------------------------------------------------------------
      Indicates whether this Circle handles mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si el círculo recibe eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      The center of the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Centro del círculo.
    -------------------------------------------------------------------------------}
    FCenter: TLatLng;
    {*------------------------------------------------------------------------------
      The stroke opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del trazo entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FStrokeOpacity: Real;
    {*------------------------------------------------------------------------------
      If set to true, the user can edit this circle by dragging the control points shown at the center and around the circumference of the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a treu, el usuario puede editar el círculo arrastrando los puntos de control mostrados en el centro y alrededor de la circunferencia del círculo.
    -------------------------------------------------------------------------------}
    FEditable: Boolean;
    {*------------------------------------------------------------------------------
      Features to the autoenlargement of the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características para el autoagrandado del círculo.
    -------------------------------------------------------------------------------}
    FAutoResize: TCustomSizeable;
    FIsUpdating: Boolean;
    procedure SetClickable(const Value: Boolean);
    procedure SetEditable(const Value: Boolean);
    procedure SetFillOpacity(const Value: Real);
    procedure SetRadius(const Value: Real);
    procedure SetStrokeOpacity(const Value: Real);
    procedure SetStrokeWeight(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
    procedure OnChangeLatLng(Sender: TObject);
  protected
    function ChangeProperties: Boolean; override;

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
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    procedure CenterMapTo; override;
    {*------------------------------------------------------------------------------
      Gets the LatLngBounds of this circle.
      @param LLB The LatLngBounds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el LatLngBounds del círculo.
      @param LLB La LatLngBounds.
    -------------------------------------------------------------------------------}
    procedure GetBounds(LLB: TLatLngBounds);
  published
    property Center: TLatLng read FCenter write FCenter;
    property Clickable: Boolean read FClickable write SetClickable default True;
    property Editable: Boolean read FEditable write SetEditable default False;
    property FillOpacity: Real read FFillOpacity write SetFillOpacity; // 0 to 1
    property Radius: Real read FRadius write SetRadius;
    property StrokeOpacity: Real read FStrokeOpacity write SetStrokeOpacity; // 0 to 1
    property StrokeWeight: Integer read FStrokeWeight write SetStrokeWeight default 2; // 1 to 10
    property Visible: Boolean read FVisible write SetVisible default True;
    property AutoResize: TCustomSizeable read FAutoResize write FAutoResize;
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
    Base class for circles collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para la colección de círculos.
  -------------------------------------------------------------------------------}
  TCustomCircles = class(TLinkedComponents)
  private
    procedure SetItems(I: Integer; const Value: TCustomCircle);
    function GetItems(I: Integer): TCustomCircle;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TCustomCircle;
    function Insert(Index: Integer): TCustomCircle;

    {*------------------------------------------------------------------------------
      Lists the circles in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de círculos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCustomCircle read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of circles.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
     Clase para la gestión de círculos.
  -------------------------------------------------------------------------------}
  TCustomGMCircle = class(TGMLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      This event is fired when the circle's StrokeColor property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeColor de un círculo.
    -------------------------------------------------------------------------------}
    FOnStrokeColorChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when a circle is right-clicked on.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando en un círculo se pulsa el botón derecho del ratón.
    -------------------------------------------------------------------------------}
    FOnRightClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a mousedown on the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al pulsar en el círculo.
    -------------------------------------------------------------------------------}
    FOnMouseDown: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's Visible property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Visible de un círculo.
    -------------------------------------------------------------------------------}
    FOnVisibleChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when mousemove on the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón se mueve por encima del círculo.
    -------------------------------------------------------------------------------}
    FOnMouseMove: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's StrokeWeight property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeWeight de un círculo.
    -------------------------------------------------------------------------------}
    FOnStrokeWeightChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired for a mouseup on the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al soltar el círculo.
    -------------------------------------------------------------------------------}
    FOnMouseUp: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's FillOpacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad FillOpacity de un círculo.
    -------------------------------------------------------------------------------}
    FOnFillOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's Clickable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Clickable de un círculo.
    -------------------------------------------------------------------------------}
    FOnClickableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's Center property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Center de un círculo.
    -------------------------------------------------------------------------------}
    FOnCenterChange: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired on circle mouseout.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón sale del círculo.
    -------------------------------------------------------------------------------}
    FOnMouseOut: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's StrokeOpacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeOpacity de un círculo.
    -------------------------------------------------------------------------------}
    FOnStrokeOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's Editable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Editable de un círculo.
    -------------------------------------------------------------------------------}
    FOnEditableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event occurs when the user double-clicks a circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario hace doble click un círculo.
    -------------------------------------------------------------------------------}
    FOnDblClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the mouse enters the area of the circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón entra en el área del círculo.
    -------------------------------------------------------------------------------}
    FOnMouseOver: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's FillColor property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad FillColor de un círculo.
    -------------------------------------------------------------------------------}
    FOnFillColorChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the circle's Radius property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Radius de un círculo.
    -------------------------------------------------------------------------------}
    FOnRadiusChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event occurs when the user click a circle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario pulsa un círculo.
    -------------------------------------------------------------------------------}
    FOnClick: TLatLngIdxEvent;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TCustomCircle;

    procedure EventFired(EventType: TEventType; Params: array of const); override;
    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates a new TCustomCircle instance and adds it to the Items array.
      @param Lat The circle's latitude.
      @param Lng The circle's longitude.
      @param Radius The circle's radius.
      @return A new instance of TCustomCircle.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TCustomCircle y la añade en el array de Items.
      @param Lat Latitud del círculo.
      @param Lng Longitud del círculo.
      @param Radius Radio del círculo.
      @return Una nueva instancia de TCustomCircle.
    -------------------------------------------------------------------------------}
    function Add(Lat: Real = 0; Lng: Real = 0; Radius: Integer = 0): TCustomCircle;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCustomCircle read GetItems; default;
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
    property OnCenterChange: TLatLngIdxEvent read FOnCenterChange write FOnCenterChange;
    property OnRadiusChange: TLinkedComponentChange read FOnRadiusChange write FOnRadiusChange;
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

{ TCustomGMCircle }

function TCustomGMCircle.Add(Lat, Lng: Real; Radius: Integer): TCustomCircle;
begin
  Result := TCustomCircle(inherited Add);
  Result.Center.Lat := Lat;
  Result.Center.Lng := Lng;
  Result.Radius := Radius;
end;

procedure TCustomGMCircle.EventFired(EventType: TEventType; Params: array of const);
var
  LL: TLatLng;
  OldEvent: TNotifyEvent;
begin
  inherited;

  if EventType = etInfoWinCloseClick then Exit;

  if EventType = etCircleRadiusChange then
  begin
    if High(Params) <> 2 then
      raise Exception.Create(GetTranslateText('Número de parámetros incorrecto', Map.Language));

    if Params[0].VType <> vtExtended then
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    if Params[1].VType <> vtInteger then
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    if Params[1].VInteger > VisualObjects.Count - 1 then
      raise Exception.Create(GetTranslateText('Valor de parámetro incorrecto', Map.Language));

    if Params[2].VType <> vtBoolean then
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    if Items[Params[1].VInteger].FIsUpdating then
    begin
      if not Params[0].VBoolean then
        Items[Params[1].VInteger].FIsUpdating := False;
      Exit;
    end;

    Items[Params[1].VInteger].FIsUpdating := True;
    Items[Params[1].VInteger].Radius := Params[0].VExtended^;
    if Assigned(FOnRadiusChange) then FOnRadiusChange(Self, Params[1].VInteger, Items[Params[1].VInteger]);
    Items[Params[1].VInteger].FIsUpdating := False;

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
      etCircleClick: if Assigned(FOnClick) then FOnClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleDblClick: if Assigned(FOnDblClick) then FOnDblClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleMouseDown: if Assigned(FOnMouseDown) then FOnMouseDown(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleMouseMove: if Assigned(FOnMouseMove) then FOnMouseMove(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleMouseOut: if Assigned(FOnMouseOut) then FOnMouseOut(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleMouseOver: if Assigned(FOnMouseOver) then FOnMouseOver(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleMouseUp: if Assigned(FOnMouseUp) then FOnMouseUp(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleRightClick: if Assigned(FOnRightClick) then FOnRightClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etCircleCenterChange:
      begin
        if Items[Params[2].VInteger].FIsUpdating then
        begin
          Items[Params[2].VInteger].FIsUpdating := False;
          Exit;
        end;

        OldEvent := Items[Params[2].VInteger].Center.OnChange;
        Items[Params[2].VInteger].Center.OnChange := nil;

        Items[Params[2].VInteger].Center.Assign(LL);
        if Assigned(FOnCenterChange) then FOnCenterChange(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);

        Items[Params[2].VInteger].Center.OnChange := OldEvent;
      end;
    end;
  finally
    FreeAndNil(LL);
  end;
end;

function TCustomGMCircle.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#Circle';
end;

function TCustomGMCircle.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TCustomCircles;
end;

function TCustomGMCircle.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TCustomCircle;
end;

function TCustomGMCircle.GetItems(I: Integer): TCustomCircle;
begin
  Result := TCustomCircle(inherited Items[i]);
end;

{ TCustomCircles }

function TCustomCircles.Add: TCustomCircle;
begin
  Result := TCustomCircle(inherited Add);
end;

function TCustomCircles.GetItems(I: Integer): TCustomCircle;
begin
  Result := TCustomCircle(inherited Items[I]);
end;

function TCustomCircles.GetOwner: TPersistent;
begin
  Result := TCustomGMCircle(inherited GetOwner);
end;

function TCustomCircles.Insert(Index: Integer): TCustomCircle;
begin
  Result := TCustomCircle(inherited Insert(Index));
end;

procedure TCustomCircles.SetItems(I: Integer; const Value: TCustomCircle);
begin
  inherited SetItem(I, Value);
end;

{ TCustomCircle }

procedure TCustomCircle.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomCircle then
  begin
    Center.Assign(TCustomCircle(Source).Center);
    Clickable := TCustomCircle(Source).Clickable;
    Editable  := TCustomCircle(Source).Editable;
    FillOpacity := TCustomCircle(Source).FillOpacity;
    Radius := TCustomCircle(Source).Radius;
    StrokeOpacity := TCustomCircle(Source).StrokeOpacity;
    StrokeWeight := TCustomCircle(Source).StrokeWeight;
    Visible := TCustomCircle(Source).Visible;
  end;
end;

procedure TCustomCircle.CenterMapTo;
begin
  inherited;

  if Assigned(Collection) and (Collection is TCustomCircles) and
     Assigned(TCustomCircles(Collection).FGMLinkedComponent) and
     Assigned(TCustomCircles(Collection).FGMLinkedComponent.Map) then
    TCustomCircles(Collection).FGMLinkedComponent.Map.SetCenter(FCenter.Lat, FCenter.Lng);
end;

function TCustomCircle.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  inherited;

  Result := False;

  if not Assigned(Collection) or not(Collection is TCustomCircles) or
     not Assigned(TCustomCircles(Collection).FGMLinkedComponent) or
     //not TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).AutoUpdate or
     not Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).ComponentState) then
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
                    Center.LatToStr(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).GetMapPrecision),
                    Center.LngToStr(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).GetMapPrecision),
                    StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll]),
                    IntToStr(Index),
                    QuotedStr(InfoWindow.GetConvertedString),
                    LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.DisableAutoPan, True)),
                    IntToStr(InfoWindow.MaxWidth),
                    IntToStr(InfoWindow.PixelOffset.Height),
                    IntToStr(InfoWindow.PixelOffset.Width),
                    LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.CloseOtherBeforeOpen, True))
                  ]);

  Result := TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).ExecuteScript('MakeCircle', Params);
  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).ErrorControl;
end;

constructor TCustomCircle.Create(Collection: TCollection);
begin
  inherited;

  FCenter := TLatLng.Create;
  FCenter.OnChange := OnChangeLatLng;
  FClickable := True;
  FEditable := False;
  FFillOpacity := 0.5;
  FRadius := 0;
  FStrokeOpacity := 1;
  FStrokeWeight := 2;
  FVisible := True;
  FIsUpdating := False;
end;

destructor TCustomCircle.Destroy;
begin
  if Assigned(FCenter) then FreeAndNil(FCenter);
  if Assigned(FAutoResize) then FreeAndNil(FAutoResize);

  inherited;
end;

procedure TCustomCircle.GetBounds(LLB: TLatLngBounds);
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  if not Assigned(LLB) then Exit;

  if not Assigned(Collection) or not (Collection is TCustomCircles) or
     not Assigned(TCustomCircles(Collection).FGMLinkedComponent) or
     not Assigned(TCustomCircles(Collection).FGMLinkedComponent.Map) then
    Exit;

  Params := Format(StrParams, [IntToStr(IdxList), IntToStr(Index)]);
  if not TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).ExecuteScript('CircleGetBounds', Params) then
    Exit;

  LLB.NE.Lat := TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).GetFloatField(CircleForm, CircleFormNELat);
  LLB.NE.Lng := TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).GetFloatField(CircleForm, CircleFormNELng);
  LLB.SW.Lat := TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).GetFloatField(CircleForm, CircleFormSWLat);
  LLB.SW.Lng := TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).GetFloatField(CircleForm, CircleFormSWLng);
end;

procedure TCustomCircle.OnChangeLatLng(Sender: TObject);
begin
  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnCenterChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnCenterChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Center,
                  Index,
                  Self);
end;

procedure TCustomCircle.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;

  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnClickableChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnClickableChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomCircle.SetEditable(const Value: Boolean);
begin
  if FEditable = Value then Exit;

  FEditable := Value;

  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnEditableChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnEditableChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomCircle.SetFillOpacity(const Value: Real);
begin
  if FFillOpacity = Value then Exit;

  FFillOpacity := Value;

  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnFillOpacityChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnFillOpacityChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomCircle.SetRadius(const Value: Real);
begin
  if FRadius = Value then Exit;

  FRadius := Value;
  if FRadius < 0 then FRadius := 0;

  if not TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).IsMapActive then
    Exit;

  if Assigned(Collection) and (Collection is TCustomCircles) and
     Assigned(TCustomCircles(Collection).FGMLinkedComponent) and
     Assigned(TCustomCircles(Collection).FGMLinkedComponent.Map) then
  begin
    FIsUpdating := True;
    if FAutoResize.Active then
    begin
      if not TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).ExecuteScript('CircleSetRadius', Format('%s,%s,%s', [
                    IntToStr(IdxList),
                    StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll]),
                    IntToStr(Index)
                    ])) then
      FIsUpdating := False;
    end
    else
      if not ChangeProperties then
        FIsUpdating := False;
    if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnRadiusChange) then
      TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnRadiusChange(
                    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                    Index,
                    Self);
  end;
end;

procedure TCustomCircle.SetStrokeOpacity(const Value: Real);
begin
  if FStrokeOpacity = Value then Exit;

  FStrokeOpacity := Value;

  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnStrokeOpacityChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnStrokeOpacityChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomCircle.SetStrokeWeight(const Value: Integer);
begin
  if FStrokeWeight = Value then Exit;

  FStrokeWeight := Value;

  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnStrokeWeightChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnStrokeWeightChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomCircle.SetVisible(const Value: Boolean);
begin
  if FVisible = Value then Exit;

  FVisible := Value;

  FIsUpdating := True;
  ChangeProperties;
  if Assigned(TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnVisibleChange) then
    TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent).FOnVisibleChange(
                  TCustomGMCircle(TCustomCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TCustomSizeable }

procedure TCustomSizeable.Assign(Source: TPersistent);
begin
  if Source is TCustomSizeable then
  begin
    Active := TCustomSizeable(Source).Active;
    Min := TCustomSizeable(Source).Min;
    Max := TCustomSizeable(Source).Max;
    Increment := TCustomSizeable(Source).Increment;
    Circular := TCustomSizeable(Source).Circular;
    Speed := TCustomSizeable(Source).Speed;
  end
  else
    inherited Assign(Source);
end;

constructor TCustomSizeable.Create(aOwner: TCustomCircle);
begin
  FOwner := aOwner;
  FActive := False;
  FCircular := True;
  FMin := 0;
  FMax := 0;
  FIncrement := 100;
end;

function TCustomSizeable.GetOwner: TCustomCircle;
begin
  Result := FOwner;
end;

procedure TCustomSizeable.OnTimer(Sender: TObject);
begin
  if not TCustomGMCircle(TCustomCircles(FOwner.Collection).FGMLinkedComponent).IsMapActive then
    Exit;

  if (FOwner.Radius > FMax) then
    if FCircular then FOwner.Radius := FMin
    else Active := False
  else FOwner.Radius := FOwner.Radius + FIncrement;
end;

procedure TCustomSizeable.SetActive(const Value: Boolean);
begin
  if FActive = Value then Exit;

  FActive := Value;
end;

procedure TCustomSizeable.SetSpeed(const Value: Integer);
begin
  if FSpeed = Value then Exit;

  FSpeed := Value;
end;

end.
