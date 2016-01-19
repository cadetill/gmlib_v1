{
GMPolyline unit

  ES: contiene las clases bases necesarias para mostrar polilineas y polígonos
      en un mapa de Google Maps mediante el componente TGMMap
  EN: includes the base classes needed to show polylines and polygons on Google
      Map map using the component TGMMap
=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner las
      polilineas o polígonos a mostrar
  EN: put the component into a form, link to a TGMMap and put the polylines or
      polygons to show
=========================================================================
History:

ver 1.1.0
  ES:
    nuevo: TCurveLine -> nueva clase para hacer polilineas curvas.
    cambio: TBasePolyline -> método AddLinePoint modificado para acelerar la
      creación de las polilineas.
    error: TBasePolyline -> mejorado rendimiento en métodos AddLinePoint y GetPath
      (GC: issue 9).
    nuevo: TBasePolyline -> se añade el método GetCenter.
  EN:
    new: TCurveLine -> new class to do curved polylines.
    change: TBasePolyline -> modified AddLinePoint method to accelerate the creation
      of polylines.
    bug: TBasePolyline -> improved performance on GetPath and AddLinePoint methods
      (GC: issue 9).
    new: TBasePolyline -> added GetCenter method.

ver 1.0.0
  ES:
    cambio: TCustomIconSequence -> se elimina la propiedad Icon para que sea
      definida en los hijos como TSymbol.
    nuevo: TBasePolyline -> ZoomToPoints, establece el zoom óptimo para visualizar
      la polilínea.
  EN:
    change: TCustomIconSequence -> Icon property is removed to be defined
      in descendents as TSymbol.
    new: TBasePolyline -> ZoomToPoints, sets the optimal zoom to display the polyline.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey

ver 0.1.8
  ES:
    cambio: TBasePolyline -> las clases TLinePoints y TLinePoint se desvinculan
      de TPolyline y se traspasan a GMClasses
    cambio: TBasePolyline -> implementa la interfaz ILinePoint
  EN:
    change: TBasePolyline -> class TLinePoints and TLinePoint is disassociated
      from TPolyline and they are transferred to GMClasses
    change: TBasePolyline -> implements ILinePoint interface

ver 0.1.7
  ES:
    cambio: modificados métodos Set y ShowElement para que usen el nuevo método
      ChangeProperties heredado de TLinkedComponent
    cambio: creada clase intermedia (TBasePolyline) entre TLinkedComponent y TPolyline
    cambio: creada clase intermedia (TGMBasePolyline) entre TGMLinkedComponent y
      TGMPolyline.
    cambio: TPolyline -> nueva propiedad Icon para definir el tipo de linea de la
      polilinea.
  EN:
    change: modified all Set and ShowElements methods to use the new method
      ChangeProperties inherited from TLinkedComponent
    change: created new class (TBasePolyline) between TLinkedComponent and TPolyline
    change: created new class (TGMBasePolyline) between TGMLinkedComponent and
      TGMPolyline.
    cambio: TPolyline -> added Icon property to define the line of polyline.

ver 0.1.6
  ES:
    error: TGMPolyline -> corregido error cuando se intentaba mostrar una polilinea
      sin TLinePoints
  EN:
    bug: TGMPolyline -> bug fixed when we try to show a polyline without TLinePoints

ver 0.1.5
  ES:
    nuevo: TPolyline -> añadida propiedad CountLinePoints
    nuevo: TLinePoint -> añadido método ToStr
    nuevo: TLinePoint -> añadida método StringToReal
  EN:
    new: TPolyline -> CountLinePoints property added
    new: TLinePoint -> ToStr method added
    new: TLinePoint -> StringToReal method added

ver 0.1.4
  ES:
    cambio: cambio en el JavaScript de algunos métodos Set
  EN:
    change: JavaScript changed from some Set methods

ver 0.1.3
  ES:
    cambio: métodos Set cambiados para evitar duplicidad de código
  EN:
    change: changed Set methods to avoid duplicate code

ver 0.1.2
  ES:
    cambio: cuando cambia la lat/lng de un TLinePoint, se actualiza en el mapa
    error: implementado SetPath en JavaScript
  EN:
    change: when change the lat/lng of a TLinePoint, the map is updated
    bug: implemented SetPath into JavaScript

ver 0.1.1:
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
{*------------------------------------------------------------------------------
  The GMPolyline unit includes the base classes needed to show polylines and polygons on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMPolyline contiene las clases bases necesarias para mostrar polilineas y polígonos en un mapa de Google Maps mediante el componente TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMPolyline;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMLinkedComponents, GMConstants, GMClasses;

type
  TBasePolyline = class;

  {*------------------------------------------------------------------------------
    Class to determine the symbol to show along the path.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para determinar el símbolo a mostrar a lo largo del camino.
  -------------------------------------------------------------------------------}
  TCustomSymbol = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Symbol to display.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Símbolo a mostrar.
    -------------------------------------------------------------------------------}
    FPath: TSymbolPath;
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
      The stroke opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del trazo entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FStrokeOpacity: Real;
    {*------------------------------------------------------------------------------
      OnChange is fired when some property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnChange se dispara cuando cambia alguna propiedad.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
    procedure SetFillOpacity(const Value: Real);
    procedure SetPath(const Value: TSymbolPath);
    procedure SetStrokeOpacity(const Value: Real);
    procedure SetStrokeWeight(const Value: Integer);
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

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

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
    property FillOpacity: Real read FFillOpacity write SetFillOpacity; // 0 to 1
    property Path: TSymbolPath read FPath write SetPath default spNONE;
    property StrokeOpacity: Real read FStrokeOpacity write SetStrokeOpacity; // 0 to 1
    property StrokeWeight: Integer read FStrokeWeight write SetStrokeWeight default 0; // 1 to 10
  end;

  {*------------------------------------------------------------------------------
    Class to determine the repetition of the showed icon.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para determinar la repetición del icono mostrado.
  -------------------------------------------------------------------------------}
  TValue = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Measure value.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Valor de la medida.
    -------------------------------------------------------------------------------}
    FValue: Integer;
    {*------------------------------------------------------------------------------
      Measure type (pixels or percentage).
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Valor de la medida (píxeles o porcentaje).
    -------------------------------------------------------------------------------}
    FMeasure: TMeasure;
    {*------------------------------------------------------------------------------
      OnChange is fired when some property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnChange se dispara cuando cambia alguna propiedad.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
    procedure SetMeasure(const Value: TMeasure);
    procedure SetValue(const Value: Integer);
  protected
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

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
    property Value: Integer read FValue write SetValue default 100;
    property Measure: TMeasure read FMeasure write SetMeasure default mPercentage;
  end;

  {*------------------------------------------------------------------------------
    Class to determine the icon and repetition to show.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para determinar el icono y la repetición a mostrar.
  -------------------------------------------------------------------------------}
  TCustomIconSequence = class(TPersistent)
  private
    FOwner: TBasePolyline;
    {*------------------------------------------------------------------------------
      Repetition properties.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propiedades de repetición.
    -------------------------------------------------------------------------------}
    FDistRepeat: TValue;
    {*------------------------------------------------------------------------------
      OffSet properties.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propiedades del OffSet.
    -------------------------------------------------------------------------------}
    FOffSet: TValue;
    {*------------------------------------------------------------------------------
      OnChange is fired when some property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnChange se dispara cuando cambia alguna propiedad.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
  protected
    {*------------------------------------------------------------------------------
      Response to OnChange event of OffSet property.
      @param Sender Object that fire event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Respuesta al evento del OnChange de la propiedad OffSet.
      @param Sender Objecto que dispara el evento
    -------------------------------------------------------------------------------}
    procedure OnOffSetChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      Response to OnChange event of DistRepeat property.
      @param Sender Object that fire event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Respuesta al evento del OnChange de la propiedad DistRepeat.
      @param Sender Objecto que dispara el evento
    -------------------------------------------------------------------------------}
    procedure OnDistRepeatChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      Response to OnChange event of Icon property.
      @param Sender Object that fire event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Respuesta al evento del OnChange de la propiedad Icon.
      @param Sender Objecto que dispara el evento
    -------------------------------------------------------------------------------}
    procedure OnIconChange(Sender: TObject);

    {*------------------------------------------------------------------------------
      Create the properties that contains some color value.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea las propiedades que contienen algún valor de color.
    -------------------------------------------------------------------------------}
    procedure CreatePropertiesWithColor; virtual; abstract;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TBasePolyline); virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

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
    property OffSet: TValue read FOffSet write FOffSet;
    property DistRepeat: TValue read FDistRepeat write FDistRepeat;
  end;

  {*------------------------------------------------------------------------------
    Class to determine the curve line properties.
    Based on Curved Line Plugin for Google Maps Api. Plugin web site http://curved_lines.overfx.net/
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para determinar las propiedades de una línea curva.
    Basado en Curved Line Plugin for Google Maps Api. Página web del plugin http://curved_lines.overfx.net/
  -------------------------------------------------------------------------------}
  TCurveLine = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      For horizontal or vertical lines.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Para lineas horizontales o verticales.
    -------------------------------------------------------------------------------}
    FHorizontal: Boolean;
    {*------------------------------------------------------------------------------
      Number multiplying the curved line roundness.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Multiplicador para la línea curva.
    -------------------------------------------------------------------------------}
    FMultiplier: Integer;
    {*------------------------------------------------------------------------------
      Activate curve line. If active, only will be consider the incial and final point of path.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Activar línea curva. Si se activa, sólo se tendrán en cuenta los puntos inicial y final del path.
    -------------------------------------------------------------------------------}
    FActive: Boolean;
    {*------------------------------------------------------------------------------
      Number to define how much points there will be in a curved line. For example 0.1 means there will be a point every 10% of the width of the line, 0.05 means there will be a point every 5% of the width of the line.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Numero para definir cuántos puntos habrá en la línea curva. Por ejemplo, 0.1 significa que habrá un punto cada 10% a lo largo de la línea, 0.05 significa que habrá un punto cada 5% a lo largo de la línea.
    -------------------------------------------------------------------------------}
    FResolution: Real;
    {*------------------------------------------------------------------------------
      Event fired when a property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Evento disparado cuando cambia alguna propiedad.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
    procedure SetActive(const Value: Boolean);
    procedure SetHorizontal(const Value: Boolean);
    procedure SetMultiplier(const Value: Integer);
    procedure SetResolution(const Value: Real);
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Active: Boolean read FActive write SetActive default False;
    property Horizontal: Boolean read FHorizontal write SetHorizontal default True;
    property Multiplier: Integer read FMultiplier write SetMultiplier default 1;
    property Resolution: Real read FResolution write SetResolution;
  end;

  {*------------------------------------------------------------------------------
    Base class for polylines and polygons.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para las polilineas y polígonos.
  -------------------------------------------------------------------------------}
  TBasePolyline = class(TLinkedComponent, ILinePoint)
  private
    {*------------------------------------------------------------------------------
      Whether this polyline is visible on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si la polilínea es visible en el mapa.
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
      When true, render each edge as a geodesic (a segment of a "great circle"). A geodesic is the shortest path between two points along the surface of the Earth. When false, render each edge as a straight line on screen.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, muestra cada arista como una geodésica (un segmento de un "gran círculo"). Una geodésica es el camino más corto entre dos puntos de la superfície terrestre. Si es false, muestra cada arista como una línea recta en pantalla.
    -------------------------------------------------------------------------------}
    FGeodesic: Boolean;
    {*------------------------------------------------------------------------------
      Indicates whether this polyline handles mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si la polilínea recibe eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      The stroke opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del trazo entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FStrokeOpacity: Real;
    {*------------------------------------------------------------------------------
      If set to true, the user can edit this shape by dragging the control points shown at the vertices and on each segment.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el usuario puede editar la figura arrastrando los puntos de control mostrados en los vertices y en cada segmento.
    -------------------------------------------------------------------------------}
    FEditable: Boolean;
    {*------------------------------------------------------------------------------
      The ordered sequence of coordinates of the Polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Secuencia ordenada de coordenadas de la polilínea.
    -------------------------------------------------------------------------------}
    FLinePoints: TLinePoints;
    {*------------------------------------------------------------------------------
      If set to true, each time you change the route on the map will update the array of LinePoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, cada vez que se modifique el recorrido en el mapa, se actualizará el array de LinePoints.
    -------------------------------------------------------------------------------}
    FAutoUpdatePath: Boolean;

    FIsUpdating: Boolean;

   { TInterfaced Persistent }
    FOwnerInterface: IInterface;

    procedure SetClickable(const Value: Boolean);
    procedure SetEditable(const Value: Boolean);
    procedure SetGeodesic(const Value: Boolean);
    procedure SetStrokeOpacity(const Value: Real);
    procedure SetStrokeWeight(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
    function GetItems(I: Integer): TLinePoint;
  protected
    {*------------------------------------------------------------------------------
      This method returns the assigned color to the StrokeColor property defined into its descendents.
      @return String with the color in RGB format.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad StrokeColor definida en los descendientes.
      @return Cadena con el color en formato RGB.
    -------------------------------------------------------------------------------}
    function GetStrokeColor: string; virtual; abstract;

    {*------------------------------------------------------------------------------
      Return the number of LinePoints.
      @return Number of LinePoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la cantidad de LinePoints.
      @return Numero de LinePoints.
    -------------------------------------------------------------------------------}
    function GetCountLinePoints: Integer;

    { ILinePoint }
    procedure LinePointChanged;

    { IInterface }
    {*------------------------------------------------------------------------------
      Returns a reference to a specified interface if the object supports that interface.
      @param IID See delphi documentation.
      @param Obj See delphi documentation.
      @return Reference.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una referencia a la interfaz especificada si el objeto soporta esta interfaz.
      @param IID Ver la documentación de Delphi.
      @param Obj Ver la documentación de Delphi.
      @return Referencia.
    -------------------------------------------------------------------------------}
    function QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    {*------------------------------------------------------------------------------
      Increments the reference count for this interface.
      @return Number of references.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Incrementa el contador de referencia para esta interfaz.
      @return Numero de referencias.
    -------------------------------------------------------------------------------}
    function _AddRef: Integer; stdcall;
    {*------------------------------------------------------------------------------
      Decrements the reference count for this interface.
      @return Number of references.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Decrementa el contador de referencia para esta interfaz.
      @return Numero de referencias.
    -------------------------------------------------------------------------------}
    function _Release: Integer; stdcall;
  public
   { TInterfaced Persistent }
    {*------------------------------------------------------------------------------
      Responds after the last constructor executes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Respuesta después de la ejecución del último constructor.
    -------------------------------------------------------------------------------}
    procedure AfterConstruction; override;

    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Returns the polyline's center.
      @param LL TLatLng with the center.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el centro de la polilinea.
      @param LL TLatLng con el centro.
    -------------------------------------------------------------------------------}
    procedure GetCenter(LL: TLatLng);
    {*------------------------------------------------------------------------------
      Sets the optimal zoom to display the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece el zoom óptimo para visualizar la polilínea.
    -------------------------------------------------------------------------------}
    procedure ZoomToPoints;
    {*------------------------------------------------------------------------------
      Converts to string the set of LinePoints. The elements are separated by semicolon (;) and the coordinates (lat/lng) by a pipe (|).
      @return String with conversion.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Convierte en una cadena el conjunto de LinePoints. Los elementos están separados por punto y coma (;) y las coordenadas (lat/lng) separados por una barra vertical (|).
      @return Cadena con la conversión.
    -------------------------------------------------------------------------------}
    function PolylineToStr: string;
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
      Computes whether the given point lies on or near to a polyline, or the edge of a polygon, within a specified tolerance.
      More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param LatLng Point to compute.
      @param Tolerance Tolerance.
      @return True if the point lies on or near to a polyline, or the edge of a polygon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula si el punto dado se encuentra en o cerca de una polilínea, o el borde de un polígono, dentro de una tolerancia especificada.
      Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param LatLng Punto a calcular.
      @param Tolerance Tolerancia.
      @return True si el punto se encuentra en o cerca de una polilínea, o el borde de un polígono.
    -------------------------------------------------------------------------------}
    function IsLocationOnEdge(LatLng: TLatLng; Tolerance: Integer = -1): Boolean; overload;
    {*------------------------------------------------------------------------------
      Computes whether the given point lies on or near to a polyline, or the edge of a polygon, within a specified tolerance.
      More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param Lat Latitude to compute.
      @param Lng Longitude to compute.
      @param Tolerance Tolerance. -1 no tolerance.
      @return True if the point lies on or near to a polyline, or the edge of a polygon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula si el punto dado se encuentra en o cerca de una polilínea, o el borde de un polígono, dentro de una tolerancia especificada.
      Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
      @param Lat Latitud a calcular.
      @param Lng Longitud a calcular.
      @param Tolerance Tolerancia. -1 sin tolerancia.
      @return True si el punto se encuentra en o cerca de una polilínea, o el borde de un polígono.
    -------------------------------------------------------------------------------}
    function IsLocationOnEdge(Lat, Lng: Real; Tolerance: Integer = -1): Boolean; overload;
    {*------------------------------------------------------------------------------
      Encodes a sequence of LatLngs into an encoded path string.
      More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#encoding
      @return Encoded string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Codifica una secuencia de LatLng en un string codificado.
      Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#encoding
      @return String codificado.
    -------------------------------------------------------------------------------}
    function EncodePath: string;
    {*------------------------------------------------------------------------------
      Decodes an encoded path string into a sequence of LatLngs.
      More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#encoding
      @param EncodedPath Path to decode.
      @param Add If true, the points resulting of decoding are added to current. If false (by default) , before to load the newest points resulting of decoding, the actual points will be deleted.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Decodifica un string codificado en una secuencia de LatLng.
      Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#encoding
      @param EncodedPath Path a decodificar.
      @param Add Si es true, se añaden los puntos resultantes de la decodificación a los actuales. Si es false (por defecto), antes de cargar los nuevos puntos resultantes de la decodificación, se borrarán los puntos actuales.
    -------------------------------------------------------------------------------}
    procedure DecodePath(EncodedPath: string; Add: Boolean = False);
    procedure CenterMapTo; override;
    {*------------------------------------------------------------------------------
      Get path changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Recupera los cambios en el path realizados.
    -------------------------------------------------------------------------------}
    procedure GetPath;
    {*------------------------------------------------------------------------------
      Set new path.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece el nuevo recorrido.
    -------------------------------------------------------------------------------}
    procedure SetPath;

    {*------------------------------------------------------------------------------
      Creates a new polyline point.
      @param Lat Point latitude.
      @param Lng Point longitude.
      @return New TLinePoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea un nuevo punto en la polilinea.
      @param Lat Latitud del punto.
      @param Lng Longitud del punto.
      @return Nuevo TLinePoint.
    -------------------------------------------------------------------------------}
    function AddLinePoint(Lat: Real = 0; Lng: Real = 0): TLinePoint; overload;
    {*------------------------------------------------------------------------------
      Creates a new polyline point.
      @param Lat Point latitude.
      @param Lng Point longitude.
      @return New TLinePoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea un nuevo punto en la polilinea.
      @param Lat Latitud del punto.
      @param Lng Longitud del punto.
      @return Nuevo TLinePoint.
    -------------------------------------------------------------------------------}
    function AddLinePoint(Lat, Lng: string): TLinePoint; overload;
    {*------------------------------------------------------------------------------
      Inserts a new polyline point at specified index.
      @param Index Position to insert.
      @param Lat Point latitude.
      @param Lng Point longitude.
      @return New TLinePoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Inserta un nuevo punto en la polilinea en el índice especificado.
      @param Index Posición en la que insertar.
      @param Lat Latitud del punto.
      @param Lng Longitud del punto.
      @return Nuevo TLinePoint.
    -------------------------------------------------------------------------------}
    function InsertLinePoint(Index: Integer; Lat, Lng: Real): TLinePoint;
    {*------------------------------------------------------------------------------
      Deletes a single point.
      @param Index Position to delete.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra un punto.
      @param Index Posición a borrar.
    -------------------------------------------------------------------------------}
    procedure DeleteLinePoint(Index: Integer);
    {*------------------------------------------------------------------------------
      Moves a point to a new position into LinePoints array.
      @param CurIndex Index of Item to move.
      @param NewIndex Destination index.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mueve un punto a una nueva posición dentro del array de LinePoints.
      @param CurIndex Índice del elemento a mover.
      @param NewIndex Índice destino.
    -------------------------------------------------------------------------------}
    procedure MoveLinePoint(CurIndex, NewIndex: Integer);
    {*------------------------------------------------------------------------------
      Deletes all points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los puntos.
    -------------------------------------------------------------------------------}
    procedure ClearLinePoints;

    property CountLinePoints: Integer read GetCountLinePoints;
    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TLinePoint read GetItems; default;
  published
    property Clickable: Boolean read FClickable write SetClickable default True;
    property Editable: Boolean read FEditable write SetEditable default False;
    property Geodesic: Boolean read FGeodesic write SetGeodesic default False;
    property StrokeOpacity: Real read FStrokeOpacity write SetStrokeOpacity; // 0 to 1
    property StrokeWeight: Integer read FStrokeWeight write SetStrokeWeight default 2; // 1 to 10
    property Visible: Boolean read FVisible write SetVisible default True;
    property AutoUpdatePath: Boolean read FAutoUpdatePath write FAutoUpdatePath default True;
    // ES/EN: TCollection
    property LinePoints: TLinePoints read FLinePoints write FLinePoints;
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
    Base class for polylines and polygons collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para la colección de polilineas y polígonos.
  -------------------------------------------------------------------------------}
  TBasePolylines = class(TLinkedComponents)
  private
    procedure SetItems(I: Integer; const Value: TBasePolyline);
    function GetItems(I: Integer): TBasePolyline;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TBasePolyline;
    function Insert(Index: Integer): TBasePolyline;

    {*------------------------------------------------------------------------------
      Lists the polylines in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de polilineas en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TBasePolyline read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Base class for GMPolyline component.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polyline
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para el componente GMPolyline.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Polyline
  -------------------------------------------------------------------------------}
  TGMBasePolyline = class(TGMLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      This event is fired when a polyline is right-clicked on.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando en una polilínea se pulsa el botón derecho del ratón.
    -------------------------------------------------------------------------------}
    FOnRightClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a mousedown on the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al pulsar en el polilínea.
    -------------------------------------------------------------------------------}
    FOnMouseDown: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when mousemove on the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón se mueve por encima del polilínea.
    -------------------------------------------------------------------------------}
    FOnMouseMove: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a mouseup on the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al soltar el polilínea.
    -------------------------------------------------------------------------------}
    FOnMouseUp: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired on polyline mouseout.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón sale del polilínea.
    -------------------------------------------------------------------------------}
    FOnMouseOut: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event occurs when the user double-clicks a polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario hace doble click una polilínea.
    -------------------------------------------------------------------------------}
    FOnDblClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the mouse enters the area of the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón entra en el área del polilínea.
    -------------------------------------------------------------------------------}
    FOnMouseOver: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event occurs when the user click a polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario pulsa una polilínea.
    -------------------------------------------------------------------------------}
    FOnClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's StrokeColor property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeColor de una polilínea.
    -------------------------------------------------------------------------------}
    FOnStrokeColorChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's Visible property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Visible de una polilínea.
    -------------------------------------------------------------------------------}
    FOnVisibleChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's StrokeWeight property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeWeight de una polilínea.
    -------------------------------------------------------------------------------}
    FOnStrokeWeightChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's Geodesic property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Geodesic de una polilínea.
    -------------------------------------------------------------------------------}
    FOnGeodesicChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's Clickable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Clickable de una polilínea.
    -------------------------------------------------------------------------------}
    FOnClickableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's StrokeOpacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad StrokeOpacity de una polilínea.
    -------------------------------------------------------------------------------}
    FOnStrokeOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's Editable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Editable de una polilínea.
    -------------------------------------------------------------------------------}
    FOnEditableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the polyline's Path property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Path de una polilínea.
    -------------------------------------------------------------------------------}
    FOnPathChange: TLinkedComponentChange;
  protected
    function GetItems(I: Integer): TBasePolyline;

    procedure EventFired(EventType: TEventType; Params: array of const); override;
  public
    {*------------------------------------------------------------------------------
      GetPath method retrieve changes realized by user directly into the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método GetPath recupera los cambios realizados por el usuario directamente en la polilinea.
    -------------------------------------------------------------------------------}
    procedure GetPath;
    {*------------------------------------------------------------------------------
      SetPath method sets new LinePoints to the polyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetPath establece los nuevos LinePoints a la polilínea.
    -------------------------------------------------------------------------------}
    procedure SetPath;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TBasePolyline read GetItems; default;
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
    property OnGeodesicChange: TLinkedComponentChange read FOnGeodesicChange write FOnGeodesicChange;
    property OnStrokeColorChange: TLinkedComponentChange read FOnStrokeColorChange write FOnStrokeColorChange;
    property OnStrokeOpacityChange: TLinkedComponentChange read FOnStrokeOpacityChange write FOnStrokeOpacityChange;
    property OnStrokeWeightChange: TLinkedComponentChange read FOnStrokeWeightChange write FOnStrokeWeightChange;
    property OnVisibleChange: TLinkedComponentChange read FOnVisibleChange write FOnVisibleChange;
    property OnPathChange: TLinkedComponentChange read FOnPathChange write FOnPathChange;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  Lang, GMFunctions;

{ TCustomIconSequence }

procedure TCustomIconSequence.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomIconSequence then
  begin
    DistRepeat.Assign(TCustomIconSequence(Source).DistRepeat);
    OffSet.Assign(TCustomIconSequence(Source).OffSet);
  end;
end;

constructor TCustomIconSequence.Create(aOwner: TBasePolyline);
begin
  FOwner := aOwner;
  FOffSet := TValue.Create;
  FOffSet.FValue := 100;
  FOffSet.FMeasure := mPercentage;
  FOffSet.OnChange := OnOffSetChange;
  FDistRepeat := TValue.Create;
  FDistRepeat.FValue := 0;
  FDistRepeat.FMeasure := mPixels;
  FDistRepeat.OnChange := OnDistRepeatChange;

  CreatePropertiesWithColor;
end;

destructor TCustomIconSequence.Destroy;
begin
  if Assigned(FOffSet) then FreeAndNil(FOffSet);
  if Assigned(FDistRepeat) then FreeAndNil(FDistRepeat);

  inherited;
end;

procedure TCustomIconSequence.OnDistRepeatChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomIconSequence.OnIconChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomIconSequence.OnOffSetChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TCustomSymbol }

procedure TCustomSymbol.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomSymbol then
  begin
    FillOpacity := TCustomSymbol(Source).FillOpacity;
    Path := TCustomSymbol(Source).Path;
    StrokeOpacity := TCustomSymbol(Source).StrokeOpacity;
    StrokeWeight := TCustomSymbol(Source).StrokeWeight;
  end;
end;

constructor TCustomSymbol.Create;
begin
  FPath := spNONE;
end;

procedure TCustomSymbol.SetFillOpacity(const Value: Real);
begin
  if FFillOpacity = Value then Exit;

  FFillOpacity := Value;
  if FFillOpacity < 0 then FFillOpacity := 0;
  if FFillOpacity > 1 then FFillOpacity := 1;
  FFillOpacity := Trunc(FFillOpacity * 100) / 100;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomSymbol.SetPath(const Value: TSymbolPath);
begin
  if FPath = Value then Exit;

  FPath := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomSymbol.SetStrokeOpacity(const Value: Real);
begin
  if FStrokeOpacity = Value then Exit;

  FStrokeOpacity := Value;
  if FStrokeOpacity < 0 then FStrokeOpacity := 0;
  if FStrokeOpacity > 1 then FStrokeOpacity := 1;
  FStrokeOpacity := Trunc(FStrokeOpacity * 100) / 100;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomSymbol.SetStrokeWeight(const Value: Integer);
begin
  if FStrokeWeight = Value then Exit;

  FStrokeWeight := Value;
  if FStrokeWeight < 1 then FStrokeWeight := 1;
  if FStrokeWeight > 10 then FStrokeWeight := 10;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TValue }

procedure TValue.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TValue then
  begin
    Value := TValue(Source).Value;
    Measure := TValue(Source).Measure;
  end;
end;

constructor TValue.Create;
begin
  FValue := 0;
  FMeasure := mPixels;
end;

procedure TValue.SetMeasure(const Value: TMeasure);
begin
  if FMeasure = Value then Exit;

  FMeasure := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TValue.SetValue(const Value: Integer);
begin
  if FValue = Value then Exit;

  FValue := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TBasePolyline }

function TBasePolyline.AddLinePoint(Lat, Lng: string): TLinePoint;
begin
  Result := LinePoints.Add;
  Result.Lat := Result.StringToReal(Lat);
  Result.Lng := Result.StringToReal(Lng);
end;

procedure TBasePolyline.AfterConstruction;
begin
  inherited;

  if GetOwner <> nil then
    GetOwner.GetInterface(IInterface, FOwnerInterface);
end;

function TBasePolyline.AddLinePoint(Lat, Lng: Real): TLinePoint;
begin
  FIsUpdating := True;
  Result := LinePoints.Add;
  Result.Lat := Lat;
  Result.Lng := Lng;
  FIsUpdating := False;
  ChangeProperties;
end;

procedure TBasePolyline.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TBasePolyline then
  begin
    Clickable := TBasePolyline(Source).Clickable;
    Editable  := TBasePolyline(Source).Editable;
    Geodesic := TBasePolyline(Source).Geodesic;
    StrokeOpacity := TBasePolyline(Source).StrokeOpacity;
    StrokeWeight := TBasePolyline(Source).StrokeWeight;
    Visible := TBasePolyline(Source).Visible;
    LinePoints.Assign(TBasePolyline(Source).LinePoints);
    AutoUpdatePath := TBasePolyline(Source).AutoUpdatePath;
  end;
end;

procedure TBasePolyline.ZoomToPoints;
var
  Points: array of TLatLng;
  i: Integer;
begin
  if not Assigned(Collection) or not (Collection is TBasePolylines) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent.Map) or
     (LinePoints.Count = 0) then
    Exit;

  SetLength(Points, CountLinePoints);
  for i := 0 to CountLinePoints - 1 do
    Points[i] := LinePoints[i].GetLatLng;

  TBasePolylines(Collection).FGMLinkedComponent.Map.ZoomToPoints(Points);
end;

procedure TBasePolyline.CenterMapTo;
var
  LL: TLatLng;
begin
  inherited;

  if Assigned(Collection) and (Collection is TLinkedComponents) and
     Assigned(TBasePolylines(Collection).FGMLinkedComponent) and
     Assigned(TBasePolylines(Collection).FGMLinkedComponent.Map) and
     (CountLinePoints > 0) then
  begin
    LL := TLatLng.Create;
    try
      GetCenter(LL);
      TBasePolylines(Collection).FGMLinkedComponent.Map.SetCenter(LL);
    finally
      FreeAndNil(LL);
    end;
  end;
end;

procedure TBasePolyline.ClearLinePoints;
begin
  LinePoints.Clear;
end;

function TBasePolyline.ComputeArea(Radius: Real): Real;
begin
  Result := TGeometry.ComputeArea(TBasePolylines(Collection).FGMLinkedComponent.Map, PolylineToStr, Radius);
end;

constructor TBasePolyline.Create(Collection: TCollection);
begin
  inherited;

  FIsUpdating := False;
  FClickable := True;
  FEditable := False;
  FGeodesic := False;
  FStrokeOpacity := 1;
  FStrokeWeight := 2;
  FVisible := True;
  FLinePoints := TLinePoints.Create(Self, TLinePoint);
  FAutoUpdatePath := True;
end;

procedure TBasePolyline.DecodePath(EncodedPath: string; Add: Boolean);
var
  Points: string;
  L,P: TStringList;
  i: Integer;
begin
  if not Add then ClearLinePoints;

  Points := TGeometry.DecodePath(TBasePolylines(Collection).FGMLinkedComponent.Map, EncodedPath);
  if Points = '' then Exit;

  L := TStringList.Create;
  P := TStringList.Create;
  try
    L.Delimiter := ';';
    P.Delimiter := '|';
    {$IFDEF DELPHI2005}
    L.StrictDelimiter := True;
    P.StrictDelimiter := True;
    {$ENDIF}
    L.DelimitedText := Points;
    for i := 0 to L.Count - 1 do
    begin
      P.DelimitedText := L[i];
      AddLinePoint(P[0], P[1]);
    end;
  finally
    if Assigned(L) then FreeAndNil(L);
    if Assigned(P) then FreeAndNil(P);
  end;
end;

procedure TBasePolyline.DeleteLinePoint(Index: Integer);
begin
  LinePoints.Delete(Index);
end;

destructor TBasePolyline.Destroy;
begin
  if Assigned(FLinePoints) then FreeAndNil(FLinePoints);

  inherited;
end;

function TBasePolyline.EncodePath: string;
begin
  Result := TGeometry.EncodePath(TBasePolylines(Collection).FGMLinkedComponent.Map, PolylineToStr);
end;

procedure TBasePolyline.GetCenter(LL: TLatLng);
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  if not Assigned(Collection) or not (Collection is TBasePolylines) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent.Map) or
     not Assigned(LL) then
    Exit;

  LL.Lat := 0;
  LL.Lng := 0;

  Params := Format(StrParams, [IntToStr(IdxList), IntToStr(Index)]);
  if not TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).ExecuteScript('PolylineGetCenter', Params) then
    Exit;

  LL.Lat := TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).GetFloatField(PolylineForm, PolylineFormLat);
  LL.Lng := TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).GetFloatField(PolylineForm, PolylineFormLng);
end;

function TBasePolyline.GetCountLinePoints: Integer;
begin
  Result := LinePoints.Count;
end;

function TBasePolyline.GetItems(I: Integer): TLinePoint;
begin
  Result := TLinePoint(FLinePoints[i]);
end;

procedure TBasePolyline.GetPath;
const
  StrParams = '%s,%s';
var
  Params: string;
  Path: string;
  i: Integer;
  L1, L2: TStringList;
  IsEqual: Boolean;
  LL: TLatLng;
begin
  if not Assigned(Collection) or not (Collection is TBasePolylines) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent.Map) or
     not FAutoUpdatePath then
    Exit;

  Params := Format(StrParams, [IntToStr(IdxList), IntToStr(Index)]);
  if not TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).ExecuteScript('PolylineGetPath', Params) then
    Exit;

  Path := TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).GetStringField(PolylineForm, PolylineFormPath);

  if Path = '' then Exit;

  L1 := TStringList.Create;
  L2 := TStringList.Create;
  LL := TLatLng.Create;
  try
    L1.Delimiter := ';';
    L2.Delimiter := '|';
    L1.DelimitedText := Path;

    // ES: miramos si no ha cambiado // EN: check if not have changed
    if LinePoints.Count = L1.Count then
    begin
      IsEqual := True;
      for i := 0 to L1.Count - 1 do
      begin
        L2.DelimitedText := L1[i];
        LL.Lat := LL.StringToReal(L2[0]);
        LL.Lng := LL.StringToReal(L2[1]);
        if not LL.IsEqual(Items[i].GetLatLng) then
        begin
          IsEqual := False;
          Break;
        end;
      end;

      if IsEqual then
      begin
        if Assigned(LL) then FreeAndNil(LL);
        if Assigned(L1) then FreeAndNil(L1);
        if Assigned(L2) then FreeAndNil(L2);
        Exit;
      end;
    end;

    FIsUpdating := True;
    LinePoints.Clear;
    for i := 0 to L1.Count - 1 do
    begin
      L2.DelimitedText := L1[i];
      if L2.Count <> 2 then Break;
      AddLinePoint(L2[0], L2[1]);
    end;
  finally
    FIsUpdating := False;
    if Assigned(LL) then FreeAndNil(LL);
    if Assigned(L1) then FreeAndNil(L1);
    if Assigned(L2) then FreeAndNil(L2);
  end;

  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).OnPathChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).OnPathChange(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent), Index, Self);
end;

function TBasePolyline.InsertLinePoint(Index: Integer; Lat,
  Lng: Real): TLinePoint;
begin
  Result := LinePoints.Insert(Index);
  Result.Lat := Lat;
  Result.Lng := Lng;
end;

function TBasePolyline.IsLocationOnEdge(LatLng: TLatLng;
  Tolerance: Integer): Boolean;
begin
  Result := TGeometry.IsLocationOnEdge(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent), Index, LatLng, Tolerance);
end;

function TBasePolyline.IsLocationOnEdge(Lat, Lng: Real;
  Tolerance: Integer): Boolean;
var
  LatLng: TLatLng;
begin
  LatLng := TLatLng.Create(Lat, Lng);
  try
    Result := IsLocationOnEdge(LatLng, Tolerance);
  finally
    FreeAndNil(LatLng);
  end;
end;

procedure TBasePolyline.LinePointChanged;
begin
  if FIsUpdating then Exit;

  ChangeProperties;
end;

procedure TBasePolyline.MoveLinePoint(CurIndex, NewIndex: Integer);
begin
  LinePoints.Move(CurIndex, NewIndex);
end;

function TBasePolyline.PolylineToStr: string;
var
  Points: array of TLatLng;
  i: Integer;
begin
  Result := '';

  if not Assigned(Collection) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent) or
     not Assigned(TBasePolylines(Collection).FGMLinkedComponent.Map) then
    Exit;

  SetLength(Points, CountLinePoints);
  for i := 0 to LinePoints.Count - 1 do
    Points[i] := LinePoints[i].GetLatLng;
  Result := TGMGenFunc.PointsToStr(Points, TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).GetMapPrecision);
end;

function TBasePolyline.QueryInterface(const IID: TGUID; out Obj): HResult;
const
  E_NOINTERFACE = HResult($80004002);
begin
  if GetInterface(IID, Obj) then Result := 0
  else Result := E_NOINTERFACE;
end;

procedure TBasePolyline.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;

  ChangeProperties;
  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnClickableChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnClickableChange(
                  TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TBasePolyline.SetEditable(const Value: Boolean);
begin
  if FEditable = Value then Exit;

  FEditable := Value;

  ChangeProperties;
  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnEditableChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnEditableChange(
                  TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TBasePolyline.SetGeodesic(const Value: Boolean);
begin
  if FGeodesic = Value then Exit;

  FGeodesic := Value;

  ChangeProperties;
  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnGeodesicChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnGeodesicChange(
                  TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TBasePolyline.SetPath;
begin
  ChangeProperties;
end;

procedure TBasePolyline.SetStrokeOpacity(const Value: Real);
begin
  if FStrokeOpacity = Value then Exit;

  FStrokeOpacity := Value;
  if FStrokeOpacity < 0 then FStrokeOpacity := 0;
  if FStrokeOpacity > 1 then FStrokeOpacity := 1;
  FStrokeOpacity := Trunc(FStrokeOpacity * 100) / 100;

  ChangeProperties;
  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnStrokeOpacityChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnStrokeOpacityChange(
                  TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TBasePolyline.SetStrokeWeight(const Value: Integer);
begin
  if FStrokeWeight = Value then Exit;

  FStrokeWeight := Value;
  if FStrokeWeight < 1 then FStrokeWeight := 1;
  if FStrokeWeight > 10 then FStrokeWeight := 10;

  ChangeProperties;
  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnStrokeWeightChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnStrokeWeightChange(
                  TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TBasePolyline.SetVisible(const Value: Boolean);
begin
  if FVisible = Value then Exit;

  FVisible := Value;

  ChangeProperties;
  if Assigned(TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnVisibleChange) then
    TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent).FOnVisibleChange(
                  TGMBasePolyline(TBasePolylines(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

function TBasePolyline._AddRef: Integer;
begin
  if FOwnerInterface <> nil then
    Result := FOwnerInterface._AddRef
  else
    Result := -1;
end;

function TBasePolyline._Release: Integer;
begin
  if FOwnerInterface <> nil then
    Result := FOwnerInterface._Release
  else
    Result := -1;
end;

{ TGMBasePolyline }

procedure TGMBasePolyline.EventFired(EventType: TEventType;
  Params: array of const);
var
  LL: TLatLng;
begin
  inherited;

  if EventType = etInfoWinCloseClick then Exit;

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
      etPolylineClick: if Assigned(FOnClick) then FOnClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineDblClick: if Assigned(FOnDblClick) then FOnDblClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineMouseDown: if Assigned(FOnMouseDown) then FOnMouseDown(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineMouseMove: if Assigned(FOnMouseMove) then FOnMouseMove(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineMouseOut: if Assigned(FOnMouseOut) then FOnMouseOut(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineMouseOver: if Assigned(FOnMouseOver) then FOnMouseOver(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineMouseUp: if Assigned(FOnMouseUp) then FOnMouseUp(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etPolylineRightClick: if Assigned(FOnRightClick) then FOnRightClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
    end;
  finally
    FreeAndNil(LL);
  end;
end;

function TGMBasePolyline.GetItems(I: Integer): TBasePolyline;
begin
  Result := TBasePolyline(inherited Items[i]);
end;

procedure TGMBasePolyline.GetPath;
var
  i: Integer;
begin
  if not Assigned(Map) then Exit;

  for i := 0 to VisualObjects.Count - 1 do
    Items[i].GetPath;
end;

procedure TGMBasePolyline.SetPath;
var
  i: Integer;
begin
  if not Assigned(Map) then Exit;

  for i := 0 to VisualObjects.Count - 1 do
    Items[i].SetPath;
end;

{ TBasePolylines }

function TBasePolylines.Add: TBasePolyline;
begin
  Result := TBasePolyline(inherited Add);
end;

function TBasePolylines.GetItems(I: Integer): TBasePolyline;
begin
  Result := TBasePolyline(inherited Items[I]);
end;

function TBasePolylines.GetOwner: TPersistent;
begin
  Result := TGMBasePolyline(inherited GetOwner);
end;

function TBasePolylines.Insert(Index: Integer): TBasePolyline;
begin
  Result := TBasePolyline(inherited Insert(Index));
end;

procedure TBasePolylines.SetItems(I: Integer; const Value: TBasePolyline);
begin
  inherited SetItem(I, Value);
end;

{ TCurveLine }

constructor TCurveLine.Create;
begin
  inherited;

  FResolution := 0.1;
  FHorizontal := True;
  FMultiplier := 1;
  FActive := False;
end;

procedure TCurveLine.SetActive(const Value: Boolean);
begin
  if Value = FActive then Exit;

  FActive := Value;

  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCurveLine.SetHorizontal(const Value: Boolean);
begin
  if Value = FHorizontal then Exit;

  FHorizontal := Value;

  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCurveLine.SetMultiplier(const Value: Integer);
begin
  if Value = FMultiplier then Exit;

  FMultiplier := Value;

  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCurveLine.SetResolution(const Value: Real);
begin
  if Value = FResolution then Exit;

  FResolution := Value;
  if FResolution < 0 then FResolution := 0;
  if FResolution > 1 then FResolution := 1;
  FResolution := Round(FResolution * 100) / 100;

  if Assigned(FOnChange) then FOnChange(Self);
end;

end.
