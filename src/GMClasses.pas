{
GMClasses class

  ES: clases de apoyo
  EN: support classes

=========================================================================
History:

ver
  ES:
    nuevo: TLinePoint -> añadida propiedad Tag
  EN:
    new: TLinePoint -> added Tag property

ver 1.1.0
  ES:
    nuevo: General -> compilado para XE4
  EN:
    new: General -> compiled to XE4

ver 1.0.0
  ES:
    nuevo: (issue GC2) General -> compilado para XE
    cambio: General -> cambio de licencia a LGPL
    cambio: TLinePoints -> PointsToStr se marca como obsoleta.
    error: General -> solucionado problema con D2007.
  EN:
    new: (issue GC2) General -> compiled to XE
    change: General -> change of licence to LGPL
    change: TLinePoints -> PointsToStr is now deprecated.
    bug: General -> Problem with D2007 solved.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
    error: se controla la tecla F5 en el TWebBrowser desde JavaScript para evitar
      excepciones.
    cambio: TLatLng -> se mueve a esta unidad y se descarta la anterior (GMLatLng)
    cambio: TLatLngBounds -> se mueve a esta unidad y se descarta la anterior (GMLatLngBounds)
    cambio: TBaseInfoWindow -> se mueve a esta unidad y se descarta la anterior (GMBaseInfoWindow)
  EN:
    new: documentation
    new: now compatible with FireMonkey
    bug: control F5 key into TWebBrowser from JavaScript to avoid exception
    change: TLatLng -> is moved to this unit and the previous is discarded (GMLatLng)
    change: TLatLngBounds -> is moved to this unit and the previous is discarded (GMLatLngBounds)
    change: TBaseInfoWindow -> is moved to this unit and the previous is discarded (GMBaseInfoWindow)

ver 0.1.8
  ES:
    error: General -> corregidos todos los memory leak encontrados
  EN:
    bug: General -> fixed all memory leaks found

ver 0.1.6:
  ES:
    cambio: GMBase -> se translada a la clase base la función GetConvertedString
    nuevo: General -> el proyecto se ha dividido en 2 packages para poder compilar
      en 64 bits en XE2
  EN:
    change: GMBase -> GetConvertedString function is moved to the GMBase base class
    new: General -> the project is divided into 2 packages to compile the project
      into 64 bits under XE2

ver 0.1.5
  ES:
    - error: TBaseInfoWindow -> la función GetConvertedString ahora tiene en cuenta la comilla simple
  EN:
    - buf: TBaseInfoWindow -> GetConvertedString function now control the single quote

ver 0.1.3:
  ES:
    cambio: General -> Se ha cambiado la carpeta destino de los DCU. Ahora cada versión tiene la
      suya. Verifica el "library path".
  EN:
    change: General -> Changed destination folder of DCU files. Now, each version have their own
      folder. Check "library path".

ver 0.1:
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

Copyright (©) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  The GMClasses unit includes basse classes or support classes.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMClasses incluye clases bases o de apoyo.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMClasses;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMConstants;

type
  {*------------------------------------------------------------------------------
    Interface for LinePoint events.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Interface para eventos de LinePoint.
  -------------------------------------------------------------------------------}
  ILinePoint = interface(IInterface)
    ['{35926390-118A-4604-A343-73D200A36006}']
    {*------------------------------------------------------------------------------
      OnChange event.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Evento OnChange.
    -------------------------------------------------------------------------------}
    procedure LinePointChanged;
  end;

  {*------------------------------------------------------------------------------
    A LatLng is a point in geographical coordinates: latitude and longitude.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#LatLng
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Un Latng es un punto en coordenadas geográficas: latitud y longitud.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#LatLng
  -------------------------------------------------------------------------------}
  TLatLng = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Latitude in degrees
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Latitud en grados
    -------------------------------------------------------------------------------}
    FLat: Real;
    {*------------------------------------------------------------------------------
      Longitude in degrees
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Longitud en grados
    -------------------------------------------------------------------------------}
    FLng: Real;
    {*------------------------------------------------------------------------------
      OnChange is fired when Lat or Lng change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnChange se dispara cuando Lat o Lng cambia.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
  protected
    {*------------------------------------------------------------------------------
      Set latitude
      @param Value new latitude
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la latitud
      @param Value nueva latitud
    -------------------------------------------------------------------------------}
    procedure SetLat(const Value: Real); virtual;
    {*------------------------------------------------------------------------------
      Set longitude
      @param Value new longitude
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la longitud
      @param Value nueva longitud
    -------------------------------------------------------------------------------}
    procedure SetLng(const Value: Real); virtual;

    {*------------------------------------------------------------------------------
      Converts the LatLng to a string values. It takes into account the locale.
      @param aLat latitude
      @param aLng longitude
      @param Precision precision of values. Default 6
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte el LatLng en cadenas. Se tiene en cuenta la configuración regional.
      @param aLat latitud
      @param aLng longitud
      @param Precision precisión de los valores. Por defecto 6
    -------------------------------------------------------------------------------}
    procedure LatLngToStr(var aLat, aLng: string; Precision: Integer = 6);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param Lat latitude. Default 0
      @param Lng longitude. Default 0
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param Lat latitud. Por defecto 0
      @param Lng longitud. Por defecto 0
    -------------------------------------------------------------------------------}
    constructor Create(Lat: Real = 0; Lng: Real = 0); virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source Object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source Objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Returns True if this LatLng is equals the given latlng.
      @param Other LatLng to compare
      @return True if equals, otherwise False
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve True si la LatLng es igual a la pasada por parámetro.
      @param Other LatLng a comparar
      @return True si son iguales, False en caso contrario
    -------------------------------------------------------------------------------}
    function IsEqual(Other: TLatLng): Boolean; virtual;
    {*------------------------------------------------------------------------------
      Convert LatLng to string representation.
      @param Precision Precision of values. Default 6
      @return String with the latlng
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte la LatLng en una cadena.
      @param Precision Precisión de los valores. Por defecto 6
      @return Cadena con la latlng
    -------------------------------------------------------------------------------}
    function ToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Returns a string of the form "lat,lng" for this LatLng. By default, round the lat/lng to 6 decimal.
      @param Precision Precision of values. Default 6
      @return String with the formatted latlng
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena con el formato "lat,lng" para la actual LatLng. Por defecto se redondean a 6 decimales los valores lat/lng.
      @param Precision Precisión de los valores. Por defecto 6
      @return Cadena con la latlng formateada
    -------------------------------------------------------------------------------}
    function ToUrlValue(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Convert Lat value to a string.
      @param Precision Precision of value. Default 6
      @return String with the latitude
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte el valor de Lat en una cadena.
      @param Precision Precisión del valor. Por defecto 6
      @return Cadena con la latitud
    -------------------------------------------------------------------------------}
    function LatToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Convert Lng value to a string.
      @param Precision Precision of value. Default 6
      @return String with the longitude
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte el valor de Lng en una cadena.
      @param Precision Precisión del valor. Por defecto 6
      @return Cadena con la longitud
    -------------------------------------------------------------------------------}
    function LngToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Given a string, converts it to a real value considering the locale.
      @param Value String to convert to real
      @return Real with the conversion
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Dado una cadena, la convierte en un valor real teniendo en cuenta la configuración regional.
      @param Value Cadena a convertir a real
      @return Real con la conversión
    -------------------------------------------------------------------------------}
    function StringToReal(Value: string): Real;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Lat: Real read FLat write SetLat;
    property Lng: Real read FLng write SetLng;
  end;

  {*------------------------------------------------------------------------------
    Internal class for managing points of a Polyline or Polygon.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna para la gestión de puntos de un Polyline o Polygon.
  -------------------------------------------------------------------------------}
  TLinePoint = class(TCollectionItem)
  private
    FLatLng: TLatLng;
    FTag: Integer;
    function GetLat: Real;
    function GetLng: Real;
    procedure SetLat(const Value: Real);
    procedure SetLng(const Value: Real);

    procedure OnChangeFLatLng(Sender: TObject);
  public
    {*------------------------------------------------------------------------------
      Constructor class.
      @param Collection Collection identifies the TCollection instance to which the new item belongs.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param Collection Colección identifica la instancia TCollection a la que pertenece el nuevo elemento.
    -------------------------------------------------------------------------------}
    constructor Create(Collection: TCollection); override;
    {*------------------------------------------------------------------------------
      Destructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase.
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source Object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source Objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Set the position point.
      @param LatLng New position.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la posición del punto.
      @param LatLng Nueva posición.
    -------------------------------------------------------------------------------}
    procedure SetLatLng(LatLng: TLatLng);

    {*------------------------------------------------------------------------------
      Convert Lat value to a string.
      @param Precision Precision of value. Default 6.
      @return String with the latitude.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte el valor de Lat en una cadena.
      @param Precision Precisión del valor. Por defecto 6.
      @return Cadena con la latitud.
    -------------------------------------------------------------------------------}
    function LatToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Convert Lng value to a string.
      @param Precision Precision of value. Default 6.
      @return String with the longitude.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte el valor de Lng en una cadena.
      @param Precision Precisión del valor. Por defecto 6.
      @return Cadena con la longitud.
    -------------------------------------------------------------------------------}
    function LngToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Convert LatLng to string representation.
      @param Precision Precision of values. Default 6.
      @return String with the latlng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte la LatLng en una cadena.
      @param Precision Precisión de los valores. Por defecto 6.
      @return Cadena con la latlng.
    -------------------------------------------------------------------------------}
    function ToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Given a string, converts it to a real value considering the locale.
      @param Value String to convert to real.
      @return Real with the conversion.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Dado una cadena, la convierte en un valor real teniendo en cuenta la configuración regional.
      @param Value Cadena a convertir a real.
      @return Real con la conversión.
    -------------------------------------------------------------------------------}
    function StringToReal(Value: string): Real;
    {*------------------------------------------------------------------------------
      Return the point position.
      @return TLatLng with the point position.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la posición del punto.
      @return TLatLng con la posición del punto.
    -------------------------------------------------------------------------------}
    function GetLatLng: TLatLng;
  published
    {*------------------------------------------------------------------------------
      Point latitude.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Latitud del punto.
    -------------------------------------------------------------------------------}
    property Lat: Real read GetLat write SetLat;
    {*------------------------------------------------------------------------------
      Point longitude.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Longitud del punto.
    -------------------------------------------------------------------------------}
    property Lng: Real read GetLng write SetLng;
    {*------------------------------------------------------------------------------
      Tag.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tag.
    -------------------------------------------------------------------------------}
    property Tag: Integer read FTag write FTag default 0;
  end;

  {*------------------------------------------------------------------------------
    Internal class for managing points of a Polyline or Polygon.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna para la gestión de puntos de un Polyline o Polygon.
  -------------------------------------------------------------------------------}
  TLinePoints = class(TCollection)
  private
    FOwner: TObject;

    function GetItems(I: Integer): TLinePoint;
    procedure SetItems(I: Integer; const Value: TLinePoint);
  protected
    {*------------------------------------------------------------------------------
      Return the owner of the collection.
      @return Owner of collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el propietario de la colección.
      @return Propietario de la colección.
    -------------------------------------------------------------------------------}
    function GetOwner: TPersistent; override;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
      @param Owner Owner of collection.
      @param ItemClass Class of new Items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param Owner Propietario de la colección.
      @param ItemClass Clase de los nuevos elementos.
    -------------------------------------------------------------------------------}
    constructor Create(Owner: TObject; ItemClass: TCollectionItemClass); virtual;

    {*------------------------------------------------------------------------------
      Creates a new TLinePoint instance and adds it to the Items array.
      @return New item.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TLinePoint y la añade en el array de Items.
      @return Nuevo elemento.
    -------------------------------------------------------------------------------}
    function Add: TLinePoint;
    {*------------------------------------------------------------------------------
      Creates a new TLinePoint instance and adds it to the Items array.
      @param Index Position to insert.
      @return New item.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TLinePoint y la añade en el array de Items.
      @param Index Posición en la que insertar.
      @return Nuevo elemento.
    -------------------------------------------------------------------------------}
    function Insert(Index: Integer): TLinePoint;
    {*------------------------------------------------------------------------------
      Deletes a single item from the collection.
      @param Index Position to delete.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra un elemento de la colección.
      @param Index Posición a borrar.
    -------------------------------------------------------------------------------}
    procedure Delete(Index: Integer);
    {*------------------------------------------------------------------------------
      Moves a item to a new position into Items array.
      @param CurIndex Index of Item to move.
      @param NewIndex Destination index.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mueve un item a una nueva posición dentro del array de Items.
      @param CurIndex Índice del elemento a mover.
      @param NewIndex Índice destino.
    -------------------------------------------------------------------------------}
    procedure Move(CurIndex, NewIndex: Integer);
    {*------------------------------------------------------------------------------
      Deletes all items from the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los elementos de la colección.
    -------------------------------------------------------------------------------}
    procedure Clear;
    {*------------------------------------------------------------------------------
      Converts to string the set of items in the collection. The elements are separated by semicolon (;) and the coordinates (lat/lng) by a pipe (|).
      This function is deprecated. Instead, use the PointsToStr class method from TGMGenFunc class from GMFunctions unit.
      @param Precision Precision of values. Default 6.
      @return String with conversion.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Convierte en una cadena el conjunto de elementos de la colección. Los elementos están separados por punto y coma (;) y las coordenadas (lat/lng) separados por una barra vertical (|).
      Esta función está obsoleta. En su lugar usar el método de clase PointsToStr de la clase TGMGenFunc de la unidad GMFunctions.
      @param Precision Precisión de los valores. Por defecto 6.
      @return Cadena con la conversión.
    -------------------------------------------------------------------------------}
    function PointsToStr(Precision: Integer = 6): string; deprecated;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source Object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source Objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Lists the items in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de elementos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TLinePoint read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Base class for all GMLib components.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para todos los componentes de la GMLib.
  -------------------------------------------------------------------------------}
  TGMBase = class(TComponent)
  private
    {*------------------------------------------------------------------------------
      AboutGMLib property shows an "About" form with info of the GMLib.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad AboutGMLib muestra un formulario "Acerca de" con información de la GMLib.
    -------------------------------------------------------------------------------}
    FAboutGMLib: string;
    {*------------------------------------------------------------------------------
      Language property specifies the language in which messages are displayed the exceptions shown by the class/component.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad Language especifica el idioma en que se mostrarán los mensajes de las excepciones mostradas por la clase/componente.
    -------------------------------------------------------------------------------}
    FLanguage: TLang;
  protected
    {*------------------------------------------------------------------------------
      Returns the url to the Google Maps API.
      @return String containing the url.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la url a la API de Google Maps.
      @return Cadena conteniendo la url.
    -------------------------------------------------------------------------------}
    function GetAPIUrl: string; virtual;
    {*------------------------------------------------------------------------------
      Round Value with Prec number of decimal digits. If Prec is 0 does nothing
      @param Value Decimal value to round.
      @param Prec Precision to round.
      @return Real rounded to the specified precision.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Redondea Value con Prec número de decimales. Si Prec es 0 no hace nada.
      @param Value Valor decimal a redondear.
      @param Prec Precisión a la que redondear.
      @return Real redondeado a la precisión especificada.
    -------------------------------------------------------------------------------}
    function ControlPrecision(Value: Real; Prec: Integer): Real; virtual;
    {*------------------------------------------------------------------------------
      Replaces ' caracter by the string .#%#: to avoid problems at the moment of sending the string to JavaScript.
      @param Value String where do replacement.
      @return String with replaced character.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Reemplaza el caracter ' por la cadena .#%#: para evitar problemas en el momento de enviar la cadena a JavaScript.
      @param Value Cadena donde hacer el reemplazo.
      @return Cadena con el caracter reemplazado.
    -------------------------------------------------------------------------------}
    function GetConvertedString(Value: string): string;
  public
    {*------------------------------------------------------------------------------
      Class constructor.
      @param AOwner Component owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param AOwner Propietario del componente.
    -------------------------------------------------------------------------------}
    constructor Create(AOwner: TComponent); override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source Object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source Objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    {*------------------------------------------------------------------------------
      APIUrl property shows a url to the page of the Google Maps API related.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad APIUrl muestra una url a la página del API de Google Maps relacionada.
    -------------------------------------------------------------------------------}
    property APIUrl: string read GetAPIUrl;
    property Language: TLang read FLanguage write FLanguage default English;
    property AboutGMLib: string read FAboutGMLib stored False;
  end;

  {*------------------------------------------------------------------------------
    A LatLngBounds instance represents a rectangle in geographical coordinates.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#LatLngBounds
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Una instancia de la clase LatLngBounds representa un rectángulo en coordenadas geográficas.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#LatLngBounds
  -------------------------------------------------------------------------------}
  TLatLngBounds = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Northeast coordinates.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Coordenadas noreste.
    -------------------------------------------------------------------------------}
    FNE: TLatLng;
    {*------------------------------------------------------------------------------
      Southwest coordinates.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Coordenadas suroeste.
    -------------------------------------------------------------------------------}
    FSW: TLatLng;
  public
    {*------------------------------------------------------------------------------
      Class constructor.
      @param SWLat Southwest latitude. Default 0.
      @param SWLng Southwest longitude. Default 0.
      @param NELat Northeast latitude. Default 0.
      @param NELng Northeast longitude. Default 0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param SWLat Latitud suroeste. Por defecto 0.
      @param SWLng Longitud suroeste. Por defecto 0.
      @param NELat Latitud noreste. Por defecto 0.
      @param NELng Longitud noreste. Por defecto 0.
    -------------------------------------------------------------------------------}
    constructor Create(SWLat: Real = 0; SWLng: Real = 0; NELat: Real = 0; NELng: Real = 0); overload; virtual;
    {*------------------------------------------------------------------------------
      Class constructor.
      @param SW Southwest corner.
      @param NE Northeast corner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param SW Esquena suroeste.
      @param NE Esquena noreste.
    -------------------------------------------------------------------------------}
    constructor Create(SW, NE: TLatLng); overload; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source Object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source Objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Returns True if this bounds is equals the given bounds.
      @param Other Bounds to compare
      @return True if equals, otherwise False
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve True si los límites son iguales a los pasados por parámetro.
      @param Other Límites a comparar
      @return True si son iguales, False en caso contrario
    -------------------------------------------------------------------------------}
    function IsEqual(Other: TLatLngBounds): Boolean;
    {*------------------------------------------------------------------------------
      Convert bounds to string representation.
      @param Precision Precision of values. Default 6
      @return String with the bounds
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Combierte los límites en una cadena.
      @param Precision Precisión de los valores. Por defecto 6
      @return Cadena con los límites
    -------------------------------------------------------------------------------}
    function ToStr(Precision: Integer = 6): string;
    {*------------------------------------------------------------------------------
      Returns a string with format "lat_lo,lng_lo,lat_hi,lng_hi" for this bounds, where "lo" corresponds to the southwest corner of the bounding box and "hi" corresponds to the northeast corner of that box.
      @param Precision Precision of values. Default 6
      @return Formatted string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena con el formato "lat_lo,lng_lo,lat_hi,lng_hi" para los límites actuales, donde "lo" corresponde a la esquena suroeste de los límites y "hi" corresponde a la esquina noreste de los límites.
      @param Precision Precisión de los valores. Por defecto 6
      @return Cadena formateada
    -------------------------------------------------------------------------------}
    function ToUrlValue(Precision: Integer = 6): string;
  published
    property SW: TLatLng read FSW write FSW;
    property NE: TLatLng read FNE write FNE;
  end;

  {*------------------------------------------------------------------------------
    A TGMSize instance represents a bidimensional size.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Size
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Una instancia de la clase TGMSize representa un tamaño bidimensional.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Size
  -------------------------------------------------------------------------------}
  TGMSize = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      The width along the x-axis, in pixels.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La anchura a lo largo del eje x, en píxeles.
    -------------------------------------------------------------------------------}
    FWidth: Integer;
    {*------------------------------------------------------------------------------
      The height along the y-axis, in pixels.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Altura a lo largo del eje y, en píxeles
    -------------------------------------------------------------------------------}
    FHeight: Integer;
    {*------------------------------------------------------------------------------
      OnChange is fired when Height or Width change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnChange se dispara cuando Height o Width cambia.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
  protected
    {*------------------------------------------------------------------------------
      Set height
      @param Value new latitude
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la altura
      @param Value nueva altura
    -------------------------------------------------------------------------------}
    procedure SetHeight(const Value: Integer); virtual;
    {*------------------------------------------------------------------------------
      Set Width
      @param Value new latitude
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la anchura
      @param Value nueva anchura
    -------------------------------------------------------------------------------}
    procedure SetWidth(const Value: Integer); virtual;
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

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  published
    property Height: Integer read FHeight write SetHeight default 0;
    property Width: Integer read FWidth write SetWidth default 0;
  end;

  {*------------------------------------------------------------------------------
    Base class to be used by other components that represents a information windows.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#InfoWindow
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para ser usada desde otros componentes que representa una ventana de información.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#InfoWindow
  -------------------------------------------------------------------------------}
  TBaseInfoWindow = class(TPersistent)
  private
    FOwner: TPersistent;
    {*------------------------------------------------------------------------------
      Content to display in the InfoWindow. This can be an HTML element, a plain-text string, or a string containing HTML. The InfoWindow will be sized according to the content. To set an explicit size for the content, set content to be a HTML element with that size.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Contenido a mostrar en la InfoWindow. Éste puede ser un elemento HTML, texto plano, o una cadena que contenga HTML. El InfoWindow se agrandará acorde al contenido. Para especificar unas determinadas medidas para el contenido, establece el contenido como un elemento HTML con esas medidas.
    -------------------------------------------------------------------------------}
    FHTMLContent: string;
    {*------------------------------------------------------------------------------
      Disable auto-pan on open.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Deshabilita el auto-pan en abierto.
    -------------------------------------------------------------------------------}
    FDisableAutoPan: Boolean;
    {*------------------------------------------------------------------------------
      Maximum width of the infowindow, regardless of content's width. 0 no Max.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Ancho máximo del InfoWindows, independientemente de la anchura del contenido. A 0 sin máximo.
    -------------------------------------------------------------------------------}
    FMaxWidth: Integer;
    {*------------------------------------------------------------------------------
      The offset, in pixels, of the tip of the info window from the point on the map at whose geographical coordinates the info window is anchored.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Offset, en píxeles, del extremo de la ventana de información desde el punto en las coordenadas geográficas en las que se ancla la ventana de información.
    -------------------------------------------------------------------------------}
    FPixelOffset: TGMSize;
    {*------------------------------------------------------------------------------
      Set to true to close others info windows opened.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Poner a true para cerrar otras ventanas de información abiertas.
    -------------------------------------------------------------------------------}
    FCloseOtherBeforeOpen: Boolean;
    {*------------------------------------------------------------------------------
      OnMaxWidthChange event is fired when MaxWidth property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnMaxWidthChange se dispara cuando cambia la propiedad MaxWidth.
    -------------------------------------------------------------------------------}
    FOnMaxWidthChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnCloseOtherBeforeOpenChange event is fired when CloseOtherBeforeOpen property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnCloseOtherBeforeOpenChange se dispara cuando cambia la propiedad CloseOtherBeforeOpen.
    -------------------------------------------------------------------------------}
    FOnCloseOtherBeforeOpenChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnDisableAutoPanChange event is fired when DisableAutoPan property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnDisableAutoPanChange se dispara cuando cambia la propiedad DisableAutoPan.
    -------------------------------------------------------------------------------}
    FOnDisableAutoPanChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnPixelOffsetChange event is fired when PixelOffset property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnPixelOffsetChange se dispara cuando cambia la propiedad PixelOffset.
    -------------------------------------------------------------------------------}
    FOnPixelOffsetChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnHTMLContentChange event is fired when HTMLContent property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnHTMLContentChange se dispara cuando cambia la propiedad HTMLContent.
    -------------------------------------------------------------------------------}
    FOnHTMLContentChange: TNotifyEvent;
    procedure SetCloseOtherBeforeOpen(const Value: Boolean);
    procedure SetDisableAutoPan(const Value: Boolean);
    procedure SetHTMLContent(const Value: string);
    procedure SetMaxWidth(const Value: Integer);
    procedure SetPixelOffset(const Value: TGMSize);
  protected
    {*------------------------------------------------------------------------------
      Tethod to capture the OnChange event of TGMSize class.
      @param Sender Object that fired the event.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método para capturar el evento OnChange de la clase TGMSize.
      @param Sender objecto que generó el evento.
    -------------------------------------------------------------------------------}
    procedure PixelOffsetChange(Sender: TObject);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner of object
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario del objecto
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TPersistent); virtual;
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

    {*------------------------------------------------------------------------------
      GetConvertedString method returns the property HTMLContent formatted to be passed as parameter to a JavaScript function.
      @return formatted string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método GetConvertedString devuelve la propiedad HTMLContent formateada para poder ser pasada por parámetro a una función JavaScript.
      @return cadena formateada
    -------------------------------------------------------------------------------}
    function GetConvertedString: string;

    property OnHTMLContentChange: TNotifyEvent read FOnHTMLContentChange write FOnHTMLContentChange;
    property OnDisableAutoPanChange: TNotifyEvent read FOnDisableAutoPanChange write FOnDisableAutoPanChange;
    property OnMaxWidthChange: TNotifyEvent read FOnMaxWidthChange write FOnMaxWidthChange;
    property OnPixelOffsetChange: TNotifyEvent read FOnPixelOffsetChange write FOnPixelOffsetChange;
    property OnCloseOtherBeforeOpenChange: TNotifyEvent read FOnCloseOtherBeforeOpenChange write FOnCloseOtherBeforeOpenChange;
  published
    property HTMLContent: string read FHTMLContent write SetHTMLContent;
    property DisableAutoPan: Boolean read FDisableAutoPan write SetDisableAutoPan default False;
    property MaxWidth: Integer read FMaxWidth write SetMaxWidth default 0;  // 0 = no MaxWidth
    property PixelOffset: TGMSize read FPixelOffset write SetPixelOffset; // (0,0) = no pixelOffset
    property CloseOtherBeforeOpen: Boolean read FCloseOtherBeforeOpen write SetCloseOtherBeforeOpen default True;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.Math, System.SysUtils;
  {$ELSE}
  Math, SysUtils;
  {$ENDIF}

{ TLinePoint }

procedure TLinePoint.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TLinePoint then
  begin
    Lat := TLinePoint(Source).Lat;
    Lng := TLinePoint(Source).Lng;
    Tag := TLinePoint(Source).Tag;
  end;
end;

constructor TLinePoint.Create(Collection: TCollection);
begin
  inherited;

  FTag := 0;
  FLatLng := TLatLng.Create;
  FLatLng.OnChange := OnChangeFLatLng;
end;

destructor TLinePoint.Destroy;
begin
  if Assigned(FLatLng) then FreeAndNil(FLatLng);

  inherited;
end;

function TLinePoint.GetLat: Real;
begin
  Result := FLatLng.Lat;
end;

function TLinePoint.GetLatLng: TLatLng;
begin
  Result := FLatLng;
end;

function TLinePoint.GetLng: Real;
begin
  Result := FLatLng.Lng;
end;

function TLinePoint.LatToStr(Precision: Integer): string;
begin
  Result := FLatLng.LatToStr(Precision);
end;

function TLinePoint.LngToStr(Precision: Integer): string;
begin
  Result := FLatLng.LngToStr(Precision);
end;

procedure TLinePoint.OnChangeFLatLng(Sender: TObject);
var
  Intf: ILinePoint;
begin
  if Supports(TLinePoints(Collection).FOwner, ILinePoint, Intf) then
    Intf.LinePointChanged;
end;

procedure TLinePoint.SetLat(const Value: Real);
begin
  if FLatLng.Lat = Value then Exit;

  FLatLng.Lat := Value;
end;

procedure TLinePoint.SetLatLng(LatLng: TLatLng);
begin
  FLatLng.Assign(LatLng);
end;

procedure TLinePoint.SetLng(const Value: Real);
begin
  if FLatLng.Lng = Value then Exit;

  FLatLng.Lng := Value;
end;

function TLinePoint.StringToReal(Value: string): Real;
begin
  Result := FLatLng.StringToReal(Value);
end;

function TLinePoint.ToStr(Precision: Integer): string;
begin
  Result := FLatLng.ToStr(Precision);
end;

{ TLinePoints }

function TLinePoints.Add: TLinePoint;
var
  Intf: ILinePoint;
begin
  Result := TLinePoint(inherited Add);

  if Supports(FOwner, ILinePoint, Intf) then Intf.LinePointChanged;
end;

procedure TLinePoints.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TLinePoints then FOwner := TLinePoints(Source).FOwner;
end;

procedure TLinePoints.Clear;
var
  Intf: ILinePoint;
begin
  inherited Clear;

  if Supports(FOwner, ILinePoint, Intf) then Intf.LinePointChanged;
end;

constructor TLinePoints.Create(Owner: TObject; ItemClass: TCollectionItemClass);
begin
  inherited Create(ItemClass);

  FOwner := Owner;
end;

procedure TLinePoints.Delete(Index: Integer);
var
  Intf: ILinePoint;
begin
  inherited Delete(Index);

  if Supports(FOwner, ILinePoint, Intf) then Intf.LinePointChanged;
end;

function TLinePoints.GetItems(I: Integer): TLinePoint;
begin
  Result := TLinePoint(inherited Items[I]);
end;

function TLinePoints.GetOwner: TPersistent;
begin
  Result := TPersistent(FOwner);
end;

function TLinePoints.Insert(Index: Integer): TLinePoint;
var
  Intf: ILinePoint;
begin
  Result := TLinePoint(inherited Insert(Index));

  if Supports(FOwner, ILinePoint, Intf) then Intf.LinePointChanged;
end;

procedure TLinePoints.Move(CurIndex, NewIndex: Integer);
var
  Intf: ILinePoint;
begin
  Items[CurIndex].Index := NewIndex;

  if Supports(FOwner, ILinePoint, Intf) then Intf.LinePointChanged;
end;

function TLinePoints.PointsToStr(Precision: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Count - 1 do
    if Result <> '' then
      Result := Result + ';' + Items[i].LatToStr(Precision) + '|' + Items[i].LngToStr(Precision)
    else
      Result := Items[i].LatToStr(Precision) + '|' + Items[i].LngToStr(Precision);
end;

procedure TLinePoints.SetItems(I: Integer; const Value: TLinePoint);
begin
  inherited SetItem(I, Value);
end;

{ TGMBase }

procedure TGMBase.Assign(Source: TPersistent);
begin
  if Source is TGMBase then
  begin
    Language := TGMBase(Source).Language;
    FAboutGMLib := TGMBase(Source).FAboutGMLib;
//    AboutGMLib.Assign(TGMBase(Source).FAboutGMLib);
  end
  else
    inherited Assign(Source);
end;

function TGMBase.ControlPrecision(Value: Real; Prec: Integer): Real;
begin
  Result := Value;

  if Prec > 0 then
    Result := RoundTo(Result, (-1) * Prec);
end;

constructor TGMBase.Create(AOwner: TComponent);
begin
  inherited;

  Language := English;
  FAboutGMLib := GMLIB_Version;
end;

function TGMBase.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en';
end;

function TGMBase.GetConvertedString(Value: string): string;
begin
  Result := StringReplace(Value, '''', '.#%#:', [rfReplaceAll]);
end;

{ TGMSize }

procedure TGMSize.Assign(Source: TPersistent);
begin
  if Source is TGMSize then
  begin
    Height := TGMSize(Source).Height;
    Width := TGMSize(Source).Width;
  end
  else inherited;
end;

constructor TGMSize.Create;
begin
  FWidth := 0;
  FHeight := 0;
end;

procedure TGMSize.SetHeight(const Value: Integer);
begin
  if FHeight = Value then Exit;

  FHeight := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TGMSize.SetWidth(const Value: Integer);
begin
  if FWidth = Value then Exit;

  FWidth := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TLatLngBounds }

procedure TLatLngBounds.Assign(Source: TPersistent);
begin
  if Source is TLatLngBounds then
  begin
    SW.Assign(TLatLngBounds(Source).SW);
    NE.Assign(TLatLngBounds(Source).NE);
  end
  else
    inherited Assign(Source);
end;

constructor TLatLngBounds.Create(SWLat, SWLng, NELat, NELng: Real);
begin
  FSW := TLatLng.Create(SWLat, SWLng);
  FNE := TLatLng.Create(NELat, NELng);
end;

constructor TLatLngBounds.Create(SW, NE: TLatLng);
begin
  FSW := TLatLng.Create;
  FNE := TLatLng.Create;

  FSW.Assign(SW);
  FNE.Assign(NE);
end;

destructor TLatLngBounds.Destroy;
begin
  if Assigned(FSW) then FreeAndNil(FSW);
  if Assigned(FNE) then FreeAndNil(FNE);

  inherited;
end;

function TLatLngBounds.IsEqual(Other: TLatLngBounds): Boolean;
begin
  Result := FNE.IsEqual(Other.NE) and FSW.IsEqual(Other.SW);
end;

function TLatLngBounds.ToStr(Precision: Integer): string;
const
  Str = '(%s, %s)';
begin
  Result := Format(Str, [SW.ToStr(Precision), NE.ToStr(Precision)]);
end;

function TLatLngBounds.ToUrlValue(Precision: Integer): string;
const
  Str = '%s,%s';
begin
  Result := Format(Str, [SW.ToUrlValue(Precision), NE.ToUrlValue(Precision)]);
end;

{ TLatLng }

procedure TLatLng.Assign(Source: TPersistent);
begin
  if Source is TLatLng then
  begin
    Lat := TLatLng(Source).Lat;
    Lng := TLatLng(Source).Lng;
  end
  else
    inherited Assign(Source);
end;

constructor TLatLng.Create(Lat, Lng: Real);
begin
  FLat := Lat;
  FLng := Lng;
end;

function TLatLng.IsEqual(Other: TLatLng): Boolean;
begin
  Result := (FLat = Other.Lat) and (FLng = Other.Lng);
end;

procedure TLatLng.LatLngToStr(var aLat, aLng: string; Precision: Integer);
var
  i: Integer;
  Prec: Integer;
begin
  if Precision > 0 then
  begin
    Prec := 1;
    for i := 1 to Precision do Prec := Prec * 10;
    aLat := FloatToStr(Trunc(FLat * Prec) / Prec);
    aLng := FloatToStr(Trunc(FLng * Prec) / Prec);
  end
  else
  begin
    aLat := FloatToStr(FLat);
    aLng := FloatToStr(FLng);
  end;

  if {$IFDEF DELPHIXE}FormatSettings.DecimalSeparator{$ELSE}DecimalSeparator{$ENDIF} = ',' then
  begin
    aLat := StringReplace(aLat, ',', '.', [rfReplaceAll]);
    aLng := StringReplace(aLng, ',', '.', [rfReplaceAll]);
  end;
end;

function TLatLng.LatToStr(Precision: Integer): string;
var
  La, Ln: string;
begin
  LatLngToStr(La, Ln, Precision);
  Result := La;
end;

function TLatLng.LngToStr(Precision: Integer): string;
var
  La, Ln: string;
begin
  LatLngToStr(La, Ln, Precision);
  Result := Ln;
end;

procedure TLatLng.SetLat(const Value: Real);
begin
  if FLat = Value then Exit;

  FLat := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TLatLng.SetLng(const Value: Real);
begin
  if FLng = Value then Exit;

  FLng := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

function TLatLng.StringToReal(Value: string): Real;
begin
  if {$IFDEF DELPHIXE}FormatSettings.DecimalSeparator{$ELSE}DecimalSeparator{$ENDIF} = ',' then
    Value := StringReplace(Value, '.', ',', [rfReplaceAll])
  else
    Value := StringReplace(Value, ',', '.', [rfReplaceAll]);
  try
    Result := StrToFloat(Value);
  except
    on E: Exception do
      raise Exception.Create(Value + ' is not a valid real value');
  end;
end;

function TLatLng.ToStr(Precision: Integer): string;
const
  Str = '(%s, %s)';
var
  La, Ln: string;
begin
  LatLngToStr(La, Ln, Precision);
  Result := Format(Str, [La, Ln]);
end;

function TLatLng.ToUrlValue(Precision: Integer): string;
const
  Str = '%s,%s';
var
  La, Ln: string;
begin
  LatLngToStr(La, Ln, Precision);
  Result := Format(Str, [La, Ln]);
end;

{ TBaseInfoWindow }

procedure TBaseInfoWindow.Assign(Source: TPersistent);
begin
  if Source is TBaseInfoWindow then
  begin
    HTMLContent := TBaseInfoWindow(Source).HTMLContent;
    DisableAutoPan := TBaseInfoWindow(Source).DisableAutoPan;
    MaxWidth := TBaseInfoWindow(Source).MaxWidth;
    PixelOffset := TBaseInfoWindow(Source).PixelOffset;
    CloseOtherBeforeOpen := TBaseInfoWindow(Source).CloseOtherBeforeOpen;
  end
  else
    inherited Assign(Source);
end;

constructor TBaseInfoWindow.Create(aOwner: TPersistent);
begin
  FHTMLContent := '';
  FDisableAutoPan := False;
  FMaxWidth := 0;
  FPixelOffset := TGMSize.Create;
  FPixelOffset.OnChange := PixelOffsetChange;
  FCloseOtherBeforeOpen := True;
  FOwner := aOwner;
end;

destructor TBaseInfoWindow.Destroy;
begin
  if Assigned(FPixelOffset) then FreeAndNil(FPixelOffset);

  inherited;
end;

function TBaseInfoWindow.GetConvertedString: string;
begin
  Result := StringReplace(FHTMLContent, #$D#$A, '', [rfReplaceAll]);
  Result := StringReplace(Result, '''', '.#%#:', [rfReplaceAll]);
end;

procedure TBaseInfoWindow.PixelOffsetChange(Sender: TObject);
begin
  if Assigned(FOnPixelOffsetChange) then FOnPixelOffsetChange(Self);
end;

procedure TBaseInfoWindow.SetCloseOtherBeforeOpen(const Value: Boolean);
begin
  if FCloseOtherBeforeOpen = Value then Exit;

  FCloseOtherBeforeOpen := Value;
  if Assigned(FOnCloseOtherBeforeOpenChange) then FOnCloseOtherBeforeOpenChange(Self);
end;

procedure TBaseInfoWindow.SetDisableAutoPan(const Value: Boolean);
begin
  if FDisableAutoPan = Value then Exit;

  FDisableAutoPan := Value;
  if Assigned(FOnDisableAutoPanChange) then FOnDisableAutoPanChange(Self);
end;

procedure TBaseInfoWindow.SetHTMLContent(const Value: string);
begin
  if FHTMLContent = Value then Exit;

  FHTMLContent := Value;
  if Assigned(FOnHTMLContentChange) then FOnHTMLContentChange(Self);
end;

procedure TBaseInfoWindow.SetMaxWidth(const Value: Integer);
begin
  if FMaxWidth = Value then Exit;

  FMaxWidth := Value;
  if Assigned(FOnMaxWidthChange) then FOnMaxWidthChange(Self);
end;

procedure TBaseInfoWindow.SetPixelOffset(const Value: TGMSize);
begin
  FPixelOffset := Value;
end;

end.
