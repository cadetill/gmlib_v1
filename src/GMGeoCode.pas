{
GMGeoCode unit

  ES: Contiene las classes necesarias para la geocodificación.
  EN: Includes the necessary classes to geocoding.

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, unirlo a un TGMMap y ejecutar el
    método Geocode. Si queremos mostrar los marcadores, linkarlo a un TGMMarker.
  EN: put the component into a form, link it to a TGMMap and execute Geocode
    method. If you want to show markers, link it to a TGMMarker.
=========================================================================
History:

ver 1.5.2
  ES:
    error: TGMGeoCode -> TGeoResult.Geometry.LocationType siempre devolvía gltNothing (GC: issue 46)
  EN:
    bug: TGMGeoCode -> TGeoResult.Geometry.LocationType is always gltNothing (GC: issue 46)

ver 1.2.0
  ES:
    error: TAddressComponentsList -> corregido Memory leak en el método Destroy (gracias Mike) (GC: issue 13).
  EN:
    bug: TAddressComponentsList -> fixed Memory leak on Destroy method (thanks Mike) (GC: issue 13).

ver 1.0.1
  ES:
    error: JavaScript -> corregido error en función GeocoderToXMLData cuando la
      geocodificación no devolvía resultados.
  EN:
    bug: JavaScript -> bug fixed on GeocoderToXMLData function when geocoding not
      retrun results.

ver 1.0.0
  ES:
    nuevo: documentación.
    nuevo: se hace compatible con FireMonkey.
    cambio: recodificación del componente para no usar WebService.
    cambio: la clase TGeometry pasa a llamarse TGeocodeGeometry para evitar confusiones.
    cambio: se suprime la clase TGoogleBusiness porque no puede usarse en la
      geocodificación mediante clases.
    cambio: TGMGeoCode ahora desciende de TGMObjects.
    error: corregido error en el método TGMGeoCode.DoMarkers (gracias Herwig).
    error: corregido error en el método TGMGeoCode.ParseData (gracias Herwig).
  EN:
    new: documentation.
    new: now compatible with FireMonkey.
    change: recodification of component to avoid use Web Service.
    change: TGeometry class is renamed to TGeocodeGeometry to avoid confusions.
    change: TGoogleBusiness is removed because cannot be used in geocoding with classes.
    change: TGMGeoCode now descends from TGMObjects.
    bug: bug fixed in TGMGeoCode.DoMarkers method (thanks Herwig).
    bug: bug fixed in TGMGeoCode.ParseData (thanks Herwig).

ver 0.1.7
  ES:
    cambio: TGMGeoCode-> añadida propiedad booleana PaintMarkerFound. A true se
      generarán automáticamente los marcadores (si hay un TGMMarker asociado)
      (por Luis Joaquin Sencion)
    cambio: TGMGeoCode-> en DoMarkers se codifica la URL generada en UTF8 para
      evitar problemas con carácteres especiales (ñ, acentos, ....)
  EN:
    change: TGMGeoCode-> added boolean property PaintMarkerFound. To true, all
      markers are automatically generated (if a TGMMarker is linked) (by Luis
      Joaquin Sencion)
    change: TGMGeoCode-> generated URL is encoded in UTF8 to avoid problems
      with special characters (ñ, accents, ....)

ver 0.1.6
  ES:
    nuevo: TAddressComponent -> añadido método Assign
    nuevo: TAddressComponentsList -> añadido método Assign
    nuevo: TGeocodeGeometry -> añadido método Assign
    nuevo: TGeoResult -> añadido método Assign
    nuevo: TGoogleBusiness -> añadido método Assign
    nuevo: TGMGeoCode -> se sobreescribe el método Notification para controlar
      la propiedad Marker
    cambio: TGMGeoCode -> se trasladan los métodos xxToStr y StrToxxx a la clase
      TTransform de la unidad GMFunctions
    nuevo: TGMGeoCode -> añadido método Assign
  EN:
    new: TAddressComponent -> added Assign method
    new: TAddressComponentsList -> added Assign method
    new: TGeocodeGeometry -> added Assign method
    new: TGeoResult -> added Assign method
    new: TGoogleBusiness -> added Assign method
    new: TGMGeoCode -> overrided Notification method to control Marker property
    change: TGMGeoCode -> xxToStr and StrToxxx moved to the TTransform class
      into the GMFunctions unit
    new: TGMGeoCode -> added Assign method

ver 0.1.5
  ES: primera versión
  EN: first version
=========================================================================
ATENCION!!!  LIMITES DE USO SEGUN Google
  - 2.500 geolocalizaciones por día
  - la geolocalización debe usarse con un mapa de Google Maps
  - para más información visitar https://developers.google.com/maps/documentation/geocoding/index#Limits

WARNING!!!  USAGE LIMITS BY Google
  - 2,500 geolocation requests per day
  - the geolocation should be used with Google Maps
  - for more information visit https://developers.google.com/maps/documentation/geocoding/index#Limits
=========================================================================
URL de interés
URL of Interest

  - https://developers.google.com/maps/documentation/javascript/services
  - http://stackoverflow.com/questions/5782611/how-do-i-use-google-maps-geocoder-getlatlng-and-store-its-result-in-a-database
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
  Includes the necessary classes to geocoding.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Contiene las classes necesarias para la geocodificación.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMGeoCode;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes, System.Contnrs,
  {$ELSE}
  Classes, Contnrs,
  {$ENDIF}

  GMMap, GMClasses, GMMarker, GMConstants;

type
  {*------------------------------------------------------------------------------
    A single address component within a GeocoderResult.
    A full address may consist of multiple address components.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderAddressComponent
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Un componente de la dirección único dentro de un GeocoderResult.
    Una dirección completa puede constar de múltiples componentes de dirección.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderAddressComponent
  -------------------------------------------------------------------------------}
  TAddressComponent = class
  private
    {*------------------------------------------------------------------------------
      The abbreviated, short text of the given address component.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Abreviación o texto corto del componente de la dirección dado.
    -------------------------------------------------------------------------------}
    FShortName: string;
    {*------------------------------------------------------------------------------
      List of strings denoting the type of this address component.
      See possibles types at https://developers.google.com/maps/documentation/geocoding/#Types
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de cadenas que representan el tipo de este componente de la dirección.
      Ver posibles tipos en https://developers.google.com/maps/documentation/geocoding/#Types
    -------------------------------------------------------------------------------}
    FAddrCompTypeList: TStringList;
    {*------------------------------------------------------------------------------
      The full text of the address component.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Texto completo del componente de la dirección.
    -------------------------------------------------------------------------------}
    FLongName: string;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
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
    procedure Assign(Source: TObject); virtual;

    property ShortName: string read FShortName;
    property LongName: string read FLongName;
    property AddrCompTypeList: TStringList read FAddrCompTypeList;
  end;

  {*------------------------------------------------------------------------------
    Internal class to manage the address components list.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna para gestionar la lista de componentes de la dirección.
  -------------------------------------------------------------------------------}
  TAddressComponentsList = class
  private
    FAddrComponents: TObjectList;
    function GetItem(Index: Integer): TAddressComponent;
    function GetCount: Integer;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
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
    procedure Assign(Source: TObject); virtual;

    {*------------------------------------------------------------------------------
      Adds a new element to the list.
      @param AddrComp Element to add.
      @return Position it has been added.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Añade un nuevo elemento a la lista.
      @param AddrComp Elemento a añadir.
      @return Posición en la que se ha añadido.
    -------------------------------------------------------------------------------}
    function Add(AddrComp: TAddressComponent): Integer;

    {*------------------------------------------------------------------------------
      Number of items in the list.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de elementos en la lista.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
    {*------------------------------------------------------------------------------
      Lists of items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de elementos.
    -------------------------------------------------------------------------------}
    property Items[Index: Integer]: TAddressComponent read GetItem; default;
  end;

  {*------------------------------------------------------------------------------
    Geometry information about this GeocoderResult.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderGeometry
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Información geométrica del GeocoderResult.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderGeometry
  -------------------------------------------------------------------------------}
  TGeocodeGeometry = class
  private
    {*------------------------------------------------------------------------------
      The coordinates of this result.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Las coordenadas de éste resultado.
    -------------------------------------------------------------------------------}
    FLocation: TLatLng;
    {*------------------------------------------------------------------------------
      The type of location returned in location.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tipo de ubicación devuelta en la localización.
    -------------------------------------------------------------------------------}
    FLocationType: TGeocoderLocationType;
    {*------------------------------------------------------------------------------
      The bounds of the recommended viewport for displaying this GeocodeResult.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Los límites de la ventana recomendada para mostrar este GeocodeResult.
    -------------------------------------------------------------------------------}
    FViewport: TLatLngBounds;
    {*------------------------------------------------------------------------------
      The precise bounds of this GeocodeResult, if applicable.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Límites precisos de este GeocodeResult, si aplica.
    -------------------------------------------------------------------------------}
    FBounds: TLatLngBounds;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
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
    procedure Assign(Source: TObject); virtual;

    property Location: TLatLng read FLocation;
    property LocationType: TGeocoderLocationType read FLocationType;
    property Viewport: TLatLngBounds read FViewport;
    property Bounds: TLatLngBounds read FBounds;
  end;

  {*------------------------------------------------------------------------------
    A single geocoder result retrieved from the geocode server.
    A geocode request may return multiple result objects.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderResult
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Un único resultado de la geocodificación devuelto por el servidor de geocodificación.
    Una consulta de geocodificación puede devolver varios resultados.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#GeocoderResult
  -------------------------------------------------------------------------------}
  TGeoResult = class
  private
    {*------------------------------------------------------------------------------
      List of strings denoting the type of the returned geocoded element.
      See possibles types at https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingAddressTypes
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de cadenas que representan el tipo de elemento devuelto por la geocodificación.
      Ver posibles tipos en https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingAddressTypes
    -------------------------------------------------------------------------------}
    FTypeList: TStringList;
    {*------------------------------------------------------------------------------
      A string containing the human-readable address of this location.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cadena que contiene la dirección interpretable por humanos de la localización.
    -------------------------------------------------------------------------------}
    FFormatedAddr: string;
    {*------------------------------------------------------------------------------
      List of GeocoderAddressComponents.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de GeocoderAddressComponents.
    -------------------------------------------------------------------------------}
    FAddrCompList: TAddressComponentsList;
    {*------------------------------------------------------------------------------
      Geometry information about this GeocoderResult.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Información geométrica del GeocoderResult.
    -------------------------------------------------------------------------------}
    FGeometry: TGeocodeGeometry;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
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
    procedure Assign(Source: TObject); virtual;

    property TypeList: TStringList read FTypeList;
    property FormatedAddr: string read FFormatedAddr;
    property AddrCompList: TAddressComponentsList read FAddrCompList;
    property Geometry: TGeocodeGeometry read FGeometry;
  end;

  {*------------------------------------------------------------------------------
    TParseData event is fired in each row of the XML file.
    @param Sender Owner object of the collection item.
    @param ActualNode Actual XML node.
    @param CountNodes Number of nodes to process.
    @param Continue If we like to continue the process.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TParseData se dispara en cada iteración de la lectura del archivo XML.
    @param Sender Objecto propietario del elemento de la colección.
    @param ActualNode Nodo XML actual.
    @param CountNodes Cantidad de nodos a procesar.
    @param Continue Si queremos continuar con el proceso.
  -------------------------------------------------------------------------------}
  TParseData = procedure(Sender: TObject; ActualNode, CountNodes: Integer; var Continue: Boolean) of object;

  {*------------------------------------------------------------------------------
    A service for converting between an address and a LatLng.
    More information at
    - https://developers.google.com/maps/documentation/javascript/reference?hl=en#Geocoder
    - https://developers.google.com/maps/documentation/javascript/geocoding
    - https://developers.google.com/maps/documentation/geocoding/index
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Servicio para convertir entre dirección y LatLng.
    Más información en
    - https://developers.google.com/maps/documentation/javascript/reference?hl=en#Geocoder
    - https://developers.google.com/maps/documentation/javascript/geocoding
    - https://developers.google.com/maps/documentation/geocoding/index
  -------------------------------------------------------------------------------}
  TGMGeoCode = class(TGMObjects)
  private
    {*------------------------------------------------------------------------------
      Associated GMMarker in which will create the results.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      GMMarker asociado en el que se crearán los resultados.
    -------------------------------------------------------------------------------}
    FMarker: TCustomGMMarker;
    {*------------------------------------------------------------------------------
      Resulting XML geocoding.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      XML resultante de la geocodificación.
    -------------------------------------------------------------------------------}
    FXMLData: TStringList;
    {*------------------------------------------------------------------------------
      Event fired after get data.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Evento disparado después de conseguir los datos.
    -------------------------------------------------------------------------------}
    FAfterGetData: TNotifyEvent;
    {*------------------------------------------------------------------------------
      Event fired before data parsing.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Evento disparado antes de analizar los datos.
    -------------------------------------------------------------------------------}
    FBeforeParseData: TNotifyEvent;
    {*------------------------------------------------------------------------------
      Event fired after data parsing.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Evento disparado después de analizar los datos.
    -------------------------------------------------------------------------------}
    FAfterParseData: TNotifyEvent;
    {*------------------------------------------------------------------------------
      Geolocation status.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estado de la geolocalización.
    -------------------------------------------------------------------------------}
    FGeoStatus: TGeoCoderStatus;
    {*------------------------------------------------------------------------------
      Event fired during data parsing.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Evento disparado durante el análisis de los datos.
    -------------------------------------------------------------------------------}
    FOnParseData: TParseData;
    {*------------------------------------------------------------------------------
      Geolocation results.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Resultados de la geolocalización.
    -------------------------------------------------------------------------------}
    FGeoResults: TObjectList;
    {*------------------------------------------------------------------------------
      Icon to show the results.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Icono para mostrar los resultados.
    -------------------------------------------------------------------------------}
    FIcon: string;
    {*------------------------------------------------------------------------------
      LatLngBounds within which to search.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      LatLngBounds dentro de la que buscar.
    -------------------------------------------------------------------------------}
    FBounds: TLatLngBounds;
    {*------------------------------------------------------------------------------
      Country code used to bias the search.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Código de pais utilizado para centrar la búsqueda.
    -------------------------------------------------------------------------------}
    FRegion: TRegion;
    {*------------------------------------------------------------------------------
      Language used in the result.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Idioma usado en el resultado.
    -------------------------------------------------------------------------------}
    FLangCode: TLangCode;
    {*------------------------------------------------------------------------------
      If true, will be created the markers into the GMMarker associated.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, se crearán los marcadores en el GMMarker asociado.
    -------------------------------------------------------------------------------}
    FPaintMarkerFound: Boolean;

    procedure GeocodeData(Data: string);
    procedure ParseData;

    function GetGeoResult(Index: Integer): TGeoResult;
    function GetCount: Integer;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function GetAPIUrl: string; override;
    procedure DeleteMapObjects; override;
    procedure ShowElements; override;
    procedure EventFired(EventType: TEventType; Params: array of const); override;

    {*------------------------------------------------------------------------------
      Returns the TGeocoderLocationType represented by the string GeocoderLocationType.
      @param GeocoderLocationType string to convert to TGeocoderLocationType
      @return TGeocoderLocationType that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TGeocoderLocationType representado por la cadena GeocoderLocationType.
      @param GeocoderLocationType Cadena a convertir a TGeocoderLocationType
      @return TGeocoderLocationType que representa la cadena
    -------------------------------------------------------------------------------}
    function StrToGeocoderLocationType(GeocoderLocationType: string): TGeocoderLocationType;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Geocodes the address passed by parameter.
      @param Address Address to geocoder.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Geolocaliza la dirección pasada por parámetro.
      @param Address Dirección a geolocalizar.
    -------------------------------------------------------------------------------}
    procedure Geocode(Address: string); overload;
    {*------------------------------------------------------------------------------
      Geocodes the LatLng passed by parameter.
      @param LatLng TLatLng to geocoder.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Geolocaliza la LatLng pasada por parámetro.
      @param LatLng TLatLng a geolocalizar.
    -------------------------------------------------------------------------------}
    procedure Geocode(LatLng: TLatLng); overload;
    {*------------------------------------------------------------------------------
      Geocodes the Lat/Lng passed by parameter.
      @param Lat Latitude to geocoder.
      @param Lng Longitude to geocoder.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Geolocaliza la Lat/Lng pasada por parámetro.
      @param Lat Latitud a geolocalizar.
      @param Lng Longitud a geolocalizar.
    -------------------------------------------------------------------------------}
    procedure Geocode(Lat, Lng: Real); overload;

    {*------------------------------------------------------------------------------
      Create the markers resulting of geocoder into the linked GMMarker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea los marcadores resultantes de la geocodificación en el GMMarker asociado.
    -------------------------------------------------------------------------------}
    procedure DoMarkers;

    {*------------------------------------------------------------------------------
      Number of results.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de resultados.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
    {*------------------------------------------------------------------------------
      Array of results.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de resultados.
    -------------------------------------------------------------------------------}
    property GeoResult[Index: Integer]: TGeoResult read GetGeoResult; default;
    property XMLData: TStringList read FXMLData write FXMLData;
    property GeoStatus: TGeocoderStatus read FGeoStatus;
  published
    property Marker: TCustomGMMarker read FMarker write FMarker;
    property Icon: string read FIcon write FIcon;
    property Bounds: TLatLngBounds read FBounds write FBounds;
    property Region: TRegion read FRegion write FRegion default r_NO_REGION;
    property LangCode: TLangCode read FLangCode write FLangCode default lcENGLISH;
    property PaintMarkerFound: Boolean read FPaintMarkerFound write FPaintMarkerFound default False;
    // eventos
    // events
    property AfterGetData: TNotifyEvent read FAfterGetData write FAfterGetData;
    property BeforeParseData: TNotifyEvent read FBeforeParseData write FBeforeParseData;
    property AfterParseData: TNotifyEvent read FAfterParseData write FAfterParseData;
    property OnParseData: TParseData read FOnParseData write FOnParseData;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils, Xml.XMLIntf, Xml.XMLDoc, System.StrUtils,
  {$ELSE}
  SysUtils, XMLIntf, XMLDoc, StrUtils, Controls,
  {$ENDIF}

  GMFunctions, Lang;

{ TGMGeoCode }

procedure TGMGeoCode.Geocode(Address: string);
var
  Tmp: string;
begin
  Tmp := QuotedStr(Trim(GetConvertedString(Address))) + ',-1, -1';

  GeocodeData(Tmp);
end;

function TGMGeoCode.GetCount: Integer;
begin
  Result := FGeoResults.Count;
end;

procedure TGMGeoCode.Assign(Source: TPersistent);
begin
  if Source is TGMGeoCode then
  begin
    Marker := TGMGeoCode(Source).Marker;
    Icon := TGMGeoCode(Source).Icon;
    Bounds.Assign(TGMGeoCode(Source).Bounds);
    Region := TGMGeoCode(Source).Region;
    LangCode := TGMGeoCode(Source).LangCode;
  end
  else
    inherited Assign(Source);
end;

constructor TGMGeoCode.Create(aOwner: TComponent);
begin
  inherited;

  FXMLData := TStringList.Create;
  FGeoResults := TObjectList.Create;
  FBounds := TLatLngBounds.Create;
  FRegion := r_NO_REGION;
  FLangCode := lcENGLISH;
  FGeoStatus := gsWithoutState;
end;

procedure TGMGeoCode.DeleteMapObjects;
begin
  inherited;
end;

destructor TGMGeoCode.Destroy;
begin
  if Assigned(FXMLData) then FreeAndNil(FXMLData);
  if Assigned(FGeoResults) then FreeAndNil(FGeoResults);
  if Assigned(FBounds) then FreeAndNil(FBounds);

  inherited;
end;

procedure TGMGeoCode.DoMarkers;
var
  i: Integer;
  Marker: TCustomMarker;
begin
  if not Assigned(FMarker) or not FPaintMarkerFound then Exit;

  for i := 0 to FGeoResults.Count - 1 do
  begin
    Marker := FMarker.Add(TGeoResult(FGeoResults[i]).Geometry.Location.Lat,
                          TGeoResult(FGeoResults[i]).Geometry.Location.Lng,
                          TGeoResult(FGeoResults[i]).FormatedAddr);
    Marker.Icon := Icon;
  end;
end;

procedure TGMGeoCode.EventFired(EventType: TEventType; Params: array of const);
begin
  inherited;
end;

procedure TGMGeoCode.Geocode(LatLng: TLatLng);
var
  Tmp: string;
begin
  Tmp := QuotedStr('') + ',' + LatLng.LatToStr(0) + ',' + LatLng.LngToStr(0);

  GeocodeData(Tmp);
end;

procedure TGMGeoCode.GeocodeData(Data: string);
var
  Tmp: string;
begin
  if not Assigned(Map) then
    raise Exception.Create(GetTranslateText('Mapa no asignado', Language));

  Tmp := Data + ',' + QuotedStr(TCustomTransform.RegionToStr(FRegion));
  if (Bounds.NE.Lat <> 0) or (Bounds.NE.Lng <> 0) or
     (Bounds.SW.Lat <> 0) or (Bounds.SW.Lng <> 0) then
    Tmp := Tmp + ',' +  Bounds.SW.ToUrlValue(0) + ',' + Bounds.NE.ToUrlValue(0)
  else
    Tmp := Tmp + ',-1,-1,-1,-1';

  Tmp := Tmp + ',' + QuotedStr(TCustomTransform.LangCodeToStr(FLangCode));
  ExecuteScript('GetGeocoder', Tmp);
  repeat
    TGMGenFunc.ProcessMessages;
  until (GetIntegerField(GeocoderForm, GeocoderFormResponse) = 1);
  FXMLData.Text := GetStringField(GeocoderForm, GeocoderFormXML);

  if Assigned(FAfterGetData) then FAfterGetData(Self);

  ParseData;
end;

function TGMGeoCode.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/geocoding/index';
end;

function TGMGeoCode.GetGeoResult(Index: Integer): TGeoResult;
begin
  Result := nil;
  if Assigned(FGeoResults[Index]) then Result := TGeoResult(FGeoResults[Index]);
end;

procedure TGMGeoCode.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (AComponent <> nil) and (AComponent = FMarker) then
    FMarker := nil;
end;

procedure TGMGeoCode.ParseData;
var
  XML: IXMLDocument;

  procedure ParseNodes(Node: IXMLNode);
    function ParseResultNode(Node: IXMLNode): TGeoResult;
      function ParseAddrComponent(Node: IXMLNode): TAddressComponent;
      begin
        Result := TAddressComponent.Create;

        while Assigned(Node) do
        begin
          // ES: etiqueta "long_name" (sólo una)   // EN: "long_name" tag (only one)
          if SameText(Node.NodeName, LBL_LONG_NAME) then
            Result.FLongName := Node.NodeValue;

          // ES: etiqueta "short_name" (sólo una)   // EN: "short_name" tag (only one)
          if SameText(Node.NodeName, LBL_SHORT_NAME) then
            Result.FShortName := Node.NodeValue;

          // ES: etiqueta "type" (una o más)   // EN: "type" tag (one or more)
          if SameText(Node.NodeName, LBL_TYPE) then
            Result.AddrCompTypeList.Add(Node.NodeValue);

          Node := Node.NextSibling;
        end;
      end;

      procedure ParseGeometry(GeoResult: TGeoResult; Node: IXMLNode);
        procedure GetLatLng(LatLng: TLatLng; Node: IXMLNode);
        begin
          while Assigned(Node) do
          begin
            if SameText(Node.NodeName, LBL_LAT) then
              LatLng.Lat := LatLng.StringToReal(Node.NodeValue);

            if SameText(Node.NodeName, LBL_LNG) then
              LatLng.Lng := LatLng.StringToReal(Node.NodeValue);

            Node := Node.NextSibling;
          end;
        end;

        procedure GetLatLngBounds(LatLngBounds: TLatLngBounds; Node: IXMLNode);
        begin
          while Assigned(Node) do
          begin
            if SameText(Node.NodeName, LBL_SOUTHWEST) and (Node.ChildNodes.Count = 2) then
              GetLatLng(LatLngBounds.SW, Node.ChildNodes.First);

            if SameText(Node.NodeName, LBL_NORTHEAST) and (Node.ChildNodes.Count = 2) then
              GetLatLng(LatLngBounds.NE, Node.ChildNodes.First);

            Node := Node.NextSibling;
          end;
        end;
      begin
        while Assigned(Node) do
        begin
          // ES: etiqueta "location" (sólo una)   // EN: "location" tag (only one)
          if SameText(Node.NodeName, LBL_LOCATION) and (Node.ChildNodes.Count = 2) then
            GetLatLng(Result.Geometry.Location, Node.ChildNodes.First);

          // ES: etiqueta "location_type" (sólo una)   // EN: "location_type" tag (only one)
          if SameText(Node.NodeName, LBL_LOCATION_TYPE) then
            Result.Geometry.FLocationType := StrToGeocoderLocationType(Node.NodeValue);

          // ES: etiqueta "viewport" (sólo una)   // EN: "viewport" tag (only one)
          if SameText(Node.NodeName, LBL_VIEWPORT) and (Node.ChildNodes.Count = 2) then
            GetLatLngBounds(Result.Geometry.Viewport, Node.ChildNodes.First);

          // ES: etiqueta "bounds" (sólo una)   // EN: "bounds" tag (only one)
          if SameText(Node.NodeName, LBL_BOUNDS) and (Node.ChildNodes.Count = 2) then
            GetLatLngBounds(Result.Geometry.Bounds, Node.ChildNodes.First);

          Node := Node.NextSibling;
        end;
      end;
    begin
      Result := TGeoResult.Create;

      while Assigned(Node) do
      begin
        // ES: etiqueta "type" (una o varias, normalmente sólo una)
        // EN: "type" tag (one or more, normally only one)
        if SameText(Node.NodeName, LBL_TYPE) then
          Result.TypeList.Add(Node.NodeValue);

        // ES: etiqueta "formatted_address" (sólo una)   // EN: "formatted_address" tag (only one)
        if SameText(Node.NodeName, LBL_FORMATTED_ADDRESS) then
          Result.FFormatedAddr := Node.NodeValue;

        // ES: etiqueta "address_component" (una o varias)   // EN: "address_component" tag (one or more)
        if SameText(Node.NodeName, LBL_ADDRCOMPONENT) and (Node.ChildNodes.Count > 0) then
          Result.AddrCompList.Add(ParseAddrComponent(Node.ChildNodes.First));

        // ES: etiqueta "geometry" (sólo una)   // EN: "geometry" tag (only one)
        if SameText(Node.NodeName, LBL_GEOMETRY) and (Node.ChildNodes.Count > 0) then
          ParseGeometry(Result, Node.ChildNodes.First);

        Node := Node.NextSibling;
      end;
    end;
  var
    ActualNode: Integer;
    CountNodes: Integer;
    Continue: Boolean;
  begin
    // ES: nos posicionamos en "GeocodeResponse" // EN: go to "GeocodeResponse" tag
    while Assigned(Node) and not SameText(Node.NodeName, LBL_GEOCODERESPONSE) do
      Node := Node.NextSibling;

    if not Assigned(Node) or (Node.ChildNodes.Count = 0) then Exit;
    CountNodes := Node.ChildNodes.Count;
    Node := Node.ChildNodes.First;

    Continue := True;
    ActualNode := 1;

    while Assigned(Node) and Continue do
    begin
      if Assigned(FOnParseData) then FOnParseData(Self, ActualNode, CountNodes, Continue);
      Inc(ActualNode);

      // ES: etiqueta "status" (sólo una)   // EN: "status" tag (only one)
      if SameText(Node.NodeName, LBL_STATUS) then
        FGeoStatus := TCustomTransform.StrToGeocoderStatus(Node.NodeValue);

      // ES: etiqueta "result" (ninguna, una o varias)  // EN: "result" (none, one or more)
      if SameText(Node.NodeName, LBL_RESULT) and (Node.ChildNodes.Count > 0) then
        FGeoResults.Add(ParseResultNode(Node.ChildNodes.First));

      Node := Node.NextSibling;
    end;
  end;
begin
  if Assigned(FBeforeParseData) then FBeforeParseData(Self);

  if FXMLData.Text <> '' then
  begin
    if Assigned(FMarker) and FPaintMarkerFound then FMarker.Clear;
    FGeoResults.Clear;

    {$IFDEF DELPHI2010}
    XML := LoadXMLData(FXMLData.Text);
    {$ELSE}
    XML := LoadXMLData(AnsiToUtf8(FXMLData.Text));
    {$ENDIF}
    try
      XML.Active := True;

      ParseNodes(XML.ChildNodes.First);
    finally
      XML := nil;
    end;

    DoMarkers;
  end;

  if Assigned(AfterParseData) then AfterParseData(Self);
end;

procedure TGMGeoCode.ShowElements;
begin
  inherited;
end;

function TGMGeoCode.StrToGeocoderLocationType(
  GeocoderLocationType: string): TGeocoderLocationType;
begin
  case AnsiIndexStr(UpperCase(GeocoderLocationType), ['GLTAPPROXIMATE', 'GLTGEOMETRIC_CENTER',
                                    'GLTRANGE_INTERPOLATED', 'GLTROOFTOP', 'GLTNOTHING']) of
    0: Result := gltAPPROXIMATE;
    1: Result := gltGEOMETRIC_CENTER;
    2: Result := gltRANGE_INTERPOLATED;
    3: Result := gltROOFTOP;
    else Result := gltNOTHING;
  end;
end;

procedure TGMGeoCode.Geocode(Lat, Lng: Real);
var
  Tmp: TLatLng;
begin
  Tmp := TLatLng.Create(Lat, Lng);
  try
    Geocode(Tmp);
  finally
    FreeAndNil(Tmp);
  end;
end;

{ TGeoResult }

procedure TGeoResult.Assign(Source: TObject);
begin
  if Source is TGeoResult then
  begin
    FFormatedAddr := TGeoResult(Source).FormatedAddr;
    FTypeList.Assign(TGeoResult(Source).TypeList);
    FAddrCompList.Assign(TGeoResult(Source).AddrCompList);
    FGeometry.Assign(TGeoResult(Source).Geometry);
  end;
end;

constructor TGeoResult.Create;
begin
  FTypeList := TStringList.Create;
  FAddrCompList := TAddressComponentsList.Create;
  FGeometry := TGeocodeGeometry.Create;
end;

destructor TGeoResult.Destroy;
begin
  if Assigned(FTypeList) then FreeAndNil(FTypeList);
  if Assigned(FAddrCompList) then FreeAndNil(FAddrCompList);
  if Assigned(FGeometry) then FreeAndNil(FGeometry);

  inherited;
end;

{ TGeocodeGeometry }

procedure TGeocodeGeometry.Assign(Source: TObject);
begin
  if Source is TGeocodeGeometry then
  begin
    FLocationType := TGeocodeGeometry(Source).LocationType;
    FLocation.Assign(TGeocodeGeometry(Source).Location);
    FViewport.Assign(TGeocodeGeometry(Source).Viewport);
    FBounds.Assign(TGeocodeGeometry(Source).Bounds);
  end;
end;

constructor TGeocodeGeometry.Create;
begin
  FLocation := TLatLng.Create;
  FLocationType := gltNOTHING;
  FViewport := TLatLngBounds.Create;
  FBounds := TLatLngBounds.Create;
end;

destructor TGeocodeGeometry.Destroy;
begin
  if Assigned(FLocation) then FreeAndNil(FLocation);
  if Assigned(FViewport) then FreeAndNil(FViewport);
  if Assigned(FBounds) then FreeAndNil(FBounds);

  inherited;
end;

{ TAddressComponentsList }

function TAddressComponentsList.Add(AddrComp: TAddressComponent): Integer;
begin
  Result := FAddrComponents.Add(AddrComp);
end;

procedure TAddressComponentsList.Assign(Source: TObject);
begin
  if Source is TAddressComponentsList then
  begin
    FAddrComponents.Assign(TAddressComponentsList(Source).FAddrComponents);
  end;
end;

constructor TAddressComponentsList.Create;
begin
  FAddrComponents := TObjectList.Create;
end;

destructor TAddressComponentsList.Destroy;
begin
  if Assigned(FAddrComponents) then FreeAndNil(FAddrComponents);

  inherited;
end;

function TAddressComponentsList.GetCount: Integer;
begin
  Result := FAddrComponents.Count;
end;

function TAddressComponentsList.GetItem(Index: Integer): TAddressComponent;
begin
  Result := nil;
  if Assigned(FAddrComponents[Index]) then
    Result := TAddressComponent(FAddrComponents[Index]);
end;

{ TAddressComponent }

procedure TAddressComponent.Assign(Source: TObject);
begin
  if Source is TAddressComponent then
  begin
    FShortName := TAddressComponent(Source).ShortName;
    FLongName := TAddressComponent(Source).LongName;
    FAddrCompTypeList.Assign(TAddressComponent(Source).AddrCompTypeList);
  end;
end;

constructor TAddressComponent.Create;
begin
  FAddrCompTypeList := TStringList.Create;
end;

destructor TAddressComponent.Destroy;
begin
  if Assigned(FAddrCompTypeList) then FreeAndNil(FAddrCompTypeList);

  inherited;
end;

end.
