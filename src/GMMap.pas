{
GMMap unit

  ES: contiene clases base
  EN: contains base classes

=========================================================================
History:

ver 1.4.1
  ES:
    error: TGMObjects -> corregido error en método IsMapActive (gracias Fred).
  EN: 
    bug: TGMObjects -> bug fixed un method IsMapActive (thanks Fred).

ver 1.3.2
  ES:
    nuevo: TKML -> nueva clase para gestionar ficheros KML (gracias Fred).
  EN:
    new: TKML -> new class to manage KML files (thanks Fred).

ver 1.2.4
  ES:
    nuevo: TCustomGMMap -> añadido método GetMaxZoom.
    nuevo: TCustomGMMap -> añadida propiedad APIKey (gracias Zsolt).
    error: JavaScript -> corregido error en las funciones GeocoderAddressComponent
      y GeocoderParseResult (GC: issue 27).
  EN:
    new: TCustomGMMap -> added GetMaxZoom method.
    new: TCustomGMMap -> added APIKey property (thanks Zsolt).
    bug: JavaScript -> bug fixed into GeocoderAddressComponent and
      GeocoderParseResult functions (GC: issue 27).

ver 1.0.1
  ES:
    error: TCustomGMMap -> StreetView. Corregido error de JavaScript
  EN:
    bug: TCustomGMMap -> StreetView. JavaScript bug fixed.

ver 1.0.0
  ES:
    cambio: TLatLngEvent -> los parámetros X y Y pasan de Real a Double para
      evitar problemas en C++ XE3
    cambio: TCustomGMMap -> los métodos LatLngBoundsExtend, LatLngBoundsContains
      y LatLngBoundsGetCenter ya no hacen referencia a los límites del mapa. Para
      ello usar los nuevos métodos MapLatLngBoundsExtend y MapLatLngBoundsContains.
    nuevo: TCustomGMMap -> nuevo método ZoomToPoints para hacer que le mapa tenga el zoom
      adecuado para la visualización de los puntos pasados por parámetro.
    nuevo: TCustomGMMap -> añadida StreetView (TStreetView) para la gestión de las
      características del panorama StreetView (actualmente sólo la visibilidad).
  EN:
    change: TLatLngEvent -> params X and Y are changed from Real to Double to
      avoid problems in C++ XE3
    change: TCustomGMMap -> the methods LatLngBoundsExtend, LatLngBoundsContains and
      LatLngBoundsGetCenter not refers now to map bounds. For this, use
      the new methods MapLatLngBoundsExtend and MapLatLngBoundsContains.
    new: TCustomGMMap -> new method ZoomToPoints to do that the map have the necessary
      zoom to show all points passed by parameter.
    new: TCustomGMMap -> added StreetView property (TStreetView) to manipulate of
      StreetView panorama features (now only the visibility).

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
    nuevo: TCustomGMMap -> nueva clase base para los componentes que accedan a los
      mapas de Google Maps
    nuevo: TGMMapChro -> clase descendiente de TCustomGMMap para la el acceso al
      mapa de Google Maps a través de un navegador TChromium
    nuevo: TGMMapChroFMX -> clase descendiente de TCustomGMMap para la el acceso al
      mapa de Google Maps a través de un navegador TChromiumFMX
    cambio: TLinkedComponent -> se mueve a la unidad GMLinkedComponents
    cambio: TLinkedComponents -> se mueve a la unidad GMLinkedComponents
    cambio: TGMLinkedComponent -> se mueve a la unidad GMLinkedComponents
    cambio: TCustomGMMap -> las funciones LatLngBoundsGetBounds, LatLngBoundsExtend,
      LatLngBoundsGetCenter, LatLngBoundsToSpan y GetCenter se convierten en
      procedimientos (gracias Martin Clarke)
  EN:
    new: documentation
    new: now compatible with FireMonkey
    new: TCustomGMMap -> new base class for all components that access the Google
      Maps maps
    new: TGMMapChr -> TCustomGMMap class descendant for access to Google Maps through
      a browser TChromium
    new: TGMMapChrFMX -> TCustomGMMap class descendant for access to Google Maps
      through a browser TChromiumFMX
    change: TLinkedComponent -> is moved to GMLinkedComponents unit
    change: TLinkedComponents -> is moved to GMLinkedComponents unit
    change: TGMLinkedComponent -> is moved to GMLinkedComponents unit
    change: TCustomGMMap -> the LatLngBoundsGetBounds, LatLngBoundsExtend,
      LatLngBoundsGetCenter, LatLngBoundsToSpan and GetCenter functions now are
      procedures (thanks Martin Clarke)

ver 0.1.7
  ES:
    cambio: TGMMap.TNonVisualProp -> añadida propiedad MapMaker. A true si queremos
      que los mosaicos de Map Marker se muestren en lugar de los normales
    cambio: TLatLngEvent -> los eventos de este tipo ahora reciben dos nuevos
      parámetros, X y Y, de tipo Real, con la información del punto (X,Y)
  EN:
    change: TGMMap.TNonVisualProp -> added MapMarker property. True if Map Maker tiles
      should be used instead of regular tiles.
    change: TLatLngEvent -> the events of this type now have two new parametres,
      X and Y, of Real type, with information of point (X,Y)

ver 0.1.6
  ES:
    nuevo: TGMObjects -> nueva clase que hereda de TGMBase y de la que heredarán
      clases como TGMLinkedComponent o TGMDirection
    nuevo: TGMMaps -> añadida propiedad Layers para el acceso a las capas de
      Google Maps como:
        a) Panoramio (clase TPanoramio)
        b) Traffic (clase TTraffic)
        c) Transit (clase TTransit)
        d) Bicyclig (clase TBicycling)
        e) Weather (clase TWeather)
    nuevo: TGMMaps -> añadidos eventos OnWeatherClick y FOnPanoramioClick
    cambio: TGMMaps -> se cambian los métodos xxToStr y StrToxxx para reducir código
    cambio: TGMMaps -> los métodos Printxxxx y SaveToJPGFile usan los métodos de la
      unidad WebControls
  EN:
    new: TGMObjects -> new class that inherits from TGMBase and the classes that
      inherit as TGMLinkedComponent or TGMDrection
    new: TGMMaps -> added Layers property to access Google Maps layers like:
        a) Panoramio (TPanoramio class)
        b) Traffic (TTraffic class)
        c) Transit (TTransit class)
        d) Bicyclig (TBicycling class)
        e) Weather (TWeather class)
    new: TGMMaps -> added OnWeatherClick and FOnPanoramioClick events
    change: TGMMaps -> changed xxToStr and StrToxxx methods to reduce code
    change: TGMMaps -> the Printxxxx and SaveToJPGFile methods now uses methods
      of WebControls unit

ver 0.1.5
  ES:
    nuevo: TGMMap -> añadidos eventos OnActiveChange, OnIntervalEventsChange y
      OnPrecisionChange
    error: TGMMap -> corregido error en RemoveLinkedComponent cuando se intentaba
      suprimir un objeto sin estar la lista creada
    error: cuando había figuras de diferentes tipos juntas, daba un error de JS
      al pasar el ratón sobre ellas (gracias Erasmo)
    cambio: TGMMap -> se controlan los métodos Set de las propiedades Zoom y MapType
      para actualizar el mapa automáticamente
    cambio: Zoom, MaxZoom y MinZoom se limitan al rango de 0 a 15
  EN:
    new: TGMMap -> added events OnActiveChange, OnIntervalEventsChange and
      OnPrecisionChange
    bug: TGMMap -> bug fixed on RemoveLinkedComponent when trying delete an
      object without being the list created
    bug: when it had figures of different types together, there was a JS error
      when you move the mouse over them (thanks Erasmo)
    change: TGMMap -> control Set methods of Zoom and MapType properties to update
      map automatically
    change: Zoom, MaxZoom and MinZoom are limited at range 0 to 15

ver 0.1.4
  ES:
    nuevo: TGMMap -> añadidos métodos PrintNoDialog, PrintWithDialog,
      PrintPreview, PrintPageSetup y SaveToJPGFile para imprimir y guardar el mapa
  EN:
    new: TGMMap -> added methods PrintNoDialog, PrintWithDialog, PrintPreview,
      PrintPageSetup and SaveToJPGFile to print and save map

ver 0.1.1:
  ES:
    bug: Corrección de algún bug
  EN:
    bug: Some bugs fixed

ver 0.1:
  ES: primera versión
  EN: first version
=========================================================================
ES: IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

EN: IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================
Copyright (©) 2012, by Xavier Martinez (cadetill)
web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  The GMMap unit includes the base classes that manages the map and the objects in it are represented.

  @author Xavier Martinez (cadetill)
  @version 1.5.5
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMMap incluye las clases bases que gestionan el mapa y los objetos que en él se representan.

  @author Xavier Martinez (cadetill)
  @version 1.5.5
-------------------------------------------------------------------------------}
unit GMMap;

{$I ..\gmlib.inc}
{$R ..\Resources\gmmapres.RES}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Contnrs, System.SysUtils, System.Classes,
  {$ELSE}
  Contnrs, SysUtils, Classes,
  {$ENDIF}

  GMClasses, GMConstants, WebControl;

type
  TEventsFired = record
    Map: Boolean;
    InfoWin: Boolean;
    Marker: Boolean;
    Polyline: Boolean;
    Rectangle: Boolean;
    Circle: Boolean;
    GO: Boolean;
    Direction: Boolean;
  end;

  TEventsMapForm = record
      // map
    BoundsChanged: Boolean;
    CenterChanged: Boolean;
    Click: Boolean;
    DblClick: Boolean;
    Drag: Boolean;
    DragEnd: Boolean;
    DragStart: Boolean;
    MapTypeIdChanged: Boolean;
    MouseMove: Boolean;
    MouseOut: Boolean;
    MouseOver: Boolean;
    RightClick: Boolean;
    TilesLoaded: Boolean;
    ZoomChanged: Boolean;
    SWLat: Real;
    SWLng: Real;
    NELat: Real;
    NELng: Real;
    Lat: Real;
    Lng: Real;
    X: Real;
    Y: Real;
    MapTypeId: string;
    Zoom: Integer;
    WeatherClick: Boolean;
    WeatherLat: Real;
    WeatherLng: Real;
    WeatherFeature: string;
    PanoClick: Boolean;
    PanoLat: Real;
    PanoLng: Real;
    PanoAuthor: string;
    PanoPhotoId: string;
    PanoTitle: string;
    PanoUrl: string;
    PanoUserId: string;
  end;

  TEventsMarkerForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    Lat: Real;
    Lng: Real;
    // events
    Click: Boolean;
    DblClick: Boolean;
    Drag: Boolean;
    DragEnd: Boolean;
    DragStart: Boolean;
    MouseDown: Boolean;
    MouseOut: Boolean;
    MouseOver: Boolean;
    MouseUp: Boolean;
    RightClick: Boolean;
  end;

  TEventsInfoWindowForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    // InfoWindow
    InfoWinCloseClick: Boolean;
  end;

  TEventsPolylineForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    Lat: Real;
    Lng: Real;
    // events
    Click: Boolean;
    DblClick: Boolean;
    MouseDown: Boolean;
    MouseMove: Boolean;
    MouseOut: Boolean;
    MouseOver: Boolean;
    MouseUp: Boolean;
    RightClick: Boolean;
  end;

  TEventsRectangleForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    Lat: Real;
    Lng: Real;
    NELat: Real;
    NELng: Real;
    SWLat: Real;
    SWLng: Real;
    // events
    BoundsChange: Boolean;
    Click: Boolean;
    DblClick: Boolean;
    MouseDown: Boolean;
    MouseMove: Boolean;
    MouseOut: Boolean;
    MouseOver: Boolean;
    MouseUp: Boolean;
    RightClick: Boolean;
  end;

  TEventsCircleForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    Lat: Real;
    Lng: Real;
    Radius: Real;
    // events
    CenterChange: Boolean;
    RadiusChange: Boolean;
    Click: Boolean;
    DblClick: Boolean;
    MouseDown: Boolean;
    MouseMove: Boolean;
    MouseOut: Boolean;
    MouseOver: Boolean;
    MouseUp: Boolean;
    RightClick: Boolean;
  end;

  TEventsGOForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    Lat: Real;
    Lng: Real;
    // events
    Click: Boolean;
    DblClick: Boolean;
  end;

  TEventsDirectionForm = record
    // general
    LinkCompId: Integer;
    LinkCompZIndex: Integer;
    XML: string;
    // events
    DirectionsChanged: Boolean;
  end;

  TGMObjects = class;
  TCustomGMMap = class;
  TWeatherFeature = class;
  TPanoramioFeature = class;

  {*------------------------------------------------------------------------------
    AfterPageLoaded event is fired when the base HTML code es loaded (First param is true) and after the all map is loaded (First param is false).
    @param Sender Owner object.
    @param First True when HTML code loaded. False when Google Maps map loaded.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento AfterPageLoaded se dispara cuando se carga el código HTML base (parámetro First a true) y cada vez que se carga el mapa (parámetro First a false).
    @param Sender Objeto al que pertenece.
    @param First A true cuando se carga el código HTML base. A false cuando se carga el mapa de Google Maps.
  -------------------------------------------------------------------------------}
  TAfterPageLoaded = procedure(Sender: TObject; First: Boolean) of object;
  {*------------------------------------------------------------------------------
    OnBoundsChanged event is fired when the bounds of map changed.
    @param Sender Owner object.
    @param NewBounds New map bounds.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento OnBoundsChanged se dispara cuando cambia el límite del mapa.
    @param Sender Objeto al que pertenece.
    @param NewBounds Nuevos límites del mapa.
  -------------------------------------------------------------------------------}
  TBoundsChanged = procedure(Sender: TObject; NewBounds: TLatLngBounds) of object;
  {*------------------------------------------------------------------------------
    TLatLngEvent is used for events that return a lat/lng formatted in LatLng and a X and Y.
    @param Sender Owner object.
    @param LatLng Lat/lng coordinates.
    @param X X Coordinate.
    @param Y Y Coordinate.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TLatLngEvent se usa para los eventos que devuelven una lat/lng en formato de TLatLng y X e Y.
    @param Sender Objeto al que pertenece.
    @param LatLng Coordenadas lat/lng.
    @param X Coordenada X.
    @param Y Coordenada Y.
  -------------------------------------------------------------------------------}
  TLatLngEvent = procedure(Sender: TObject; LatLng: TLatLng; X, Y: Double) of object;
  {*------------------------------------------------------------------------------
    TMapTypeIdChanged event is fired when MapTypeId property change.
    @param Sender Owner object.
    @param NewMapTypeId The new MapTypeId.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TMapTypeIdChanged se dispara cuando la propiedad MapTypeId cambia.
    @param Sender Objeto al que pertenece.
    @param NewMapTypeId El nuevo MapTypeId.
  -------------------------------------------------------------------------------}
  TMapTypeIdChanged = procedure(Sender: TObject; NewMapTypeId: TMapTypeId) of object;
  {*------------------------------------------------------------------------------
    TZoomChanged event is fired when Zoom property change.
    @param Sender Owner object.
    @param NewZoom The new zoom.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TZoomChanged se dispara cuando la propiedad Zoom cambia.
    @param Sender Objeto al que pertenece.
    @param NewZoom El nuevo zoom.
  -------------------------------------------------------------------------------}
  TZoomChanged = procedure(Sender: TObject; NewZoom: Integer) of object;
  {*------------------------------------------------------------------------------
    OnWeatherClick event is fired when a feature in the weather layer is clicked.
    @param Sender Owner object.
    @param LatLng Lat/lng coordinates.
    @param FeatureDetails A TWeatherFeature object containing information about the clicked feature.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento OnWeatherClick se dispara cuando se pulsa alguna característica de la capa del tiempo.
    @param Sender Objeto al que pertenece.
    @param LatLng Coordenadas lat/lng.
    @param FeatureDetails Objeto TWeatherFeature que contiene información acerca de la característica pulsada.
  -------------------------------------------------------------------------------}
  TWeatherClick = procedure(Sender: TObject; LatLng: TLatLng; FeatureDetails: TWeatherFeature) of object;
  {*------------------------------------------------------------------------------
    OnPanoramioClick event is fired when a feature in the layer is clicked.
    @param Sender Owner object.
    @param LatLng Lat/lng coordinates.
    @param PanoramioFeature A TPanoramioFeature object containing information about the clicked feature.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento OnPanoramioClick se dispara cuando se pulsa alguna característica de la capa.
    @param Sender Objeto al que pertenece.
    @param LatLng Coordenadas lat/lng.
    @param PanoramioFeature Objeto TPanoramioFeature que contiene información acerca de la característica pulsada.
  -------------------------------------------------------------------------------}
  TPanoramioClick = procedure(Sender: TObject; LatLng: TLatLng; PanoramioFeature: TPanoramioFeature) of object;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the MapTypeControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#MapTypeControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del MapTypeControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#MapTypeControlOptions
  -------------------------------------------------------------------------------}
  TMapTypeControlOptions = class(TPersistent)
  private
    FPosition: TControlPosition;
    FStyle: TMapTypeControlStyle;
    FMapTypeIds: TMapTypeIds;
    FShow: Boolean;
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
      @param Source object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    {*------------------------------------------------------------------------------
      Set of all MapTypeId.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Conjunto de todos los MapTypeId.
    -------------------------------------------------------------------------------}
    property MapTypeIds: TMapTypeIds read FMapTypeIds write FMapTypeIds default [mtHYBRID, mtROADMAP, mtSATELLITE, mtTERRAIN, mtOSM]; // mapTypeIds
    {*------------------------------------------------------------------------------
      Control position in the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del control dentro del mapa.
    -------------------------------------------------------------------------------}
    property Position: TControlPosition read FPosition write FPosition default cpTOP_RIGHT;   // position
    {*------------------------------------------------------------------------------
      Control style.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estilo del control.
    -------------------------------------------------------------------------------}
    property Style: TMapTypeControlStyle read FStyle write FStyle default mtcDEFAULT; // style
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default true;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the OverviewMapControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#OverviewMapControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del OverviewMapControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#OverviewMapControlOptions
  -------------------------------------------------------------------------------}
  TOverviewMapControlOptions = class(TPersistent)
  private
    FOpened: Boolean;
    FShow: Boolean;
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
    {*------------------------------------------------------------------------------
      State of the control, opened or closed
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estado del control, cerrado o abierto
    -------------------------------------------------------------------------------}
    property Opened: Boolean read FOpened write FOpened default True;  // opened
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default True;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the PanControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#PanControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del PanControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#PanControlOptions
  -------------------------------------------------------------------------------}
  TPanControlOptions = class(TPersistent)
  private
    FPosition: TControlPosition;
    FShow: Boolean;
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
    {*------------------------------------------------------------------------------
      Control position in the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del control dentro del mapa
    -------------------------------------------------------------------------------}
    property Position: TControlPosition read FPosition write FPosition default cpTOP_LEFT;   // position
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default True;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the RotateControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#RotateControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del RotateControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#RotateControlOptions
  -------------------------------------------------------------------------------}
  TRotateControlOptions = class(TPersistent)
  private
    FPosition: TControlPosition;
    FShow: Boolean;
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
    {*------------------------------------------------------------------------------
      Control position in the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del control dentro del mapa
    -------------------------------------------------------------------------------}
    property Position: TControlPosition read FPosition write FPosition default cpTOP_LEFT;   // position
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default True;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the ScaleControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#ScaleControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del ScaleControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#ScaleControlOptions
  -------------------------------------------------------------------------------}
  TScaleControlOptions = class(TPersistent)
  private
    FPosition: TControlPosition;
    FStyle: TScaleControlStyle;
    FShow: Boolean;
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
    {*------------------------------------------------------------------------------
      Control position in the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del control dentro del mapa
    -------------------------------------------------------------------------------}
    property Position: TControlPosition read FPosition write FPosition default cpBOTTOM_LEFT;   // position
    {*------------------------------------------------------------------------------
      Control style.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estilo del control
    -------------------------------------------------------------------------------}
    property Style: TScaleControlStyle read FStyle write FStyle default scDEFAULT;  // style
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default True;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the StreetViewControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#StreetViewControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del StreetViewControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#StreetViewControlOptions
  -------------------------------------------------------------------------------}
  TStreetViewControlOptions = class(TPersistent)
  private
    FPosition: TControlPosition;
    FShow: Boolean;
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
    {*------------------------------------------------------------------------------
      Control position in the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del control dentro del mapa
    -------------------------------------------------------------------------------}
    property Position: TControlPosition read FPosition write FPosition default cpTOP_LEFT;   // position
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default True;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the options of the ZoomControl of the map.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#ZoomControlOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las opciones del ZoomControl del mapa.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#ZoomControlOptions
  -------------------------------------------------------------------------------}
  TZoomControlOptions = class(TPersistent)
  private
    FPosition: TControlPosition;
    FStyle: TZoomControlStyle;
    FShow: Boolean;
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
    {*------------------------------------------------------------------------------
      Control position in the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del control dentro del mapa
    -------------------------------------------------------------------------------}
    property Position: TControlPosition read FPosition write FPosition default cpTOP_LEFT;   // position
    {*------------------------------------------------------------------------------
      Control style.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estilo del control
    -------------------------------------------------------------------------------}
    property Style: TZoomControlStyle read FStyle write FStyle default zcDEFAULT;  // style
    {*------------------------------------------------------------------------------
      Show the control. To true, the control is shown, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra el control. A true, el control se muestra, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write FShow default True;
  end;

  {*------------------------------------------------------------------------------
    Internal class containing the visual properties of Google Maps map.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las propiedades visuales de un mapa de Google Maps.
  -------------------------------------------------------------------------------}
  TCustomVisualProp = class(TPersistent)
  private
    FMapTypeCtrl: TMapTypeControlOptions;
    FOverviewMapCtrl: TOverviewMapControlOptions;
    FPanCtrl: TPanControlOptions;
    FRotateCtrl: TRotateControlOptions;
    FScaleCtrl: TScaleControlOptions;
    FStreetViewCtrl: TStreetViewControlOptions;
    FZoomCtrl: TZoomControlOptions;
  protected
    {*------------------------------------------------------------------------------
      Returns a string with the values of properties.
      @return String with the values
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena con los valores de las propiedades.
      @return Cadena con los valores
    -------------------------------------------------------------------------------}
    function ToStr: string; virtual;

    {*------------------------------------------------------------------------------
      Returns as a string the assigned color to the BGColor property (declared in their descendants)
      @return String with the color
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve en formato cadena el color asignado a la propiedad BGColor (declarada en sus descendientes)
      @return Cadena con el color
    -------------------------------------------------------------------------------}
    function GetBckgroundColor: string; virtual; abstract;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
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
    {*------------------------------------------------------------------------------
      Options for the MapTypeControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control MapTypeControl.
    -------------------------------------------------------------------------------}
    property MapTypeCtrl: TMapTypeControlOptions read FMapTypeCtrl write FMapTypeCtrl;
    {*------------------------------------------------------------------------------
      Options for the OverviewMapControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control OverviewMapControl.
    -------------------------------------------------------------------------------}
    property OverviewMapCtrl: TOverviewMapControlOptions read FOverviewMapCtrl write FOverviewMapCtrl;
    {*------------------------------------------------------------------------------
      Options for the PanControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control PanControl.
    -------------------------------------------------------------------------------}
    property PanCtrl: TPanControlOptions read FPanCtrl write FPanCtrl;
    {*------------------------------------------------------------------------------
      Options for the RotateControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control RotateControl.
    -------------------------------------------------------------------------------}
    property RotateCtrl: TRotateControlOptions read FRotateCtrl write FRotateCtrl;
    {*------------------------------------------------------------------------------
      Options for the ScaleControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control ScaleControl.
    -------------------------------------------------------------------------------}
    property ScaleCtrl: TScaleControlOptions read FScaleCtrl write FScaleCtrl;
    {*------------------------------------------------------------------------------
      Options for the StreetViewControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control StreetViewControl.
    -------------------------------------------------------------------------------}
    property StreetViewCtrl: TStreetViewControlOptions read FStreetViewCtrl write FStreetViewCtrl;
    {*------------------------------------------------------------------------------
      Options for the ZoomControl control.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para el control ZoomControl.
    -------------------------------------------------------------------------------}
    property ZoomCtrl: TZoomControlOptions read FZoomCtrl write FZoomCtrl;
  end;

  {*------------------------------------------------------------------------------
    Class that contain the required properties of Google Maps map.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que contiene las propiedades requeridas de un mapa de Google Maps.
  -------------------------------------------------------------------------------}
  TRequiredProp = class(TPersistent)
  private
    FZoom: Integer;
    FMapType: TMapTypeId;
    FGMMap: TCustomGMMap;
    FCenter: TLatLng;
    procedure SetMapType(const Value: TMapTypeId);
    procedure SetZoom(const Value: Integer);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;
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
    {*------------------------------------------------------------------------------
      Contains the lat/lng coordinates with the centre of the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Contiene las coordenadas lat/lng con el centro del mapa.
    -------------------------------------------------------------------------------}
    property Center: TLatLng read FCenter write FCenter;
    {*------------------------------------------------------------------------------
      Indicates the map view.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica la vista del mapa.
    -------------------------------------------------------------------------------}
    property MapType: TMapTypeId read FMapType write SetMapType default mtROADMAP;
    {*------------------------------------------------------------------------------
      Indicates zoom with to be displayed the map. Values between 0 and 15.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica el zoom con el que se mostrará el mapa. Valores entre 0 y 15.
    -------------------------------------------------------------------------------}
    property Zoom: Integer read FZoom write SetZoom default 8;
  end;

  {*------------------------------------------------------------------------------
    Set of all boolean options to enable of the map.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Conjunto de todas las opciones booleanas para habilitar del mapa.
  -------------------------------------------------------------------------------}
  TBoolOption = (DisableDoubleClickZoom, Draggable, KeyboardShortcuts, NoClear, ScrollWheel);
  {*------------------------------------------------------------------------------
    Boolean options to enable maps options.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Opciones booleanas para habilitar opciones del mapa.
  -------------------------------------------------------------------------------}
  TBoolOptions = set of TBoolOption;
  {*------------------------------------------------------------------------------
    Class that contain the non visual properties of Google Maps map.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que contiene las propiedades no visuales de un mapa de Google Maps.
  -------------------------------------------------------------------------------}
  TNonVisualProp = class(TPersistent)
  private
    FOptions: TBoolOptions;
    FMinZoom: Integer;
    FMaxZoom: Integer;
    FMapMaker: Boolean;
    procedure SetMaxZoom(const Value: Integer);
    procedure SetMinZoom(const Value: Integer);
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
    {*------------------------------------------------------------------------------
      Set of boolean options (DisableDoubleClickZoom, Draggable, KeyboardShortcuts, NoClear, ScrollWheel).
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Conjunto de opciones booleanas (DisableDoubleClickZoom, Draggable, KeyboardShortcuts, NoClear, ScrollWheel).
    -------------------------------------------------------------------------------}
    property Options: TBoolOptions read FOptions write FOptions default [Draggable, KeyboardShortcuts, ScrollWheel];
    {*------------------------------------------------------------------------------
      The maximum zoom level which will be displayed on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nivel de zoom máximo que será mostrado en el mapa.
    -------------------------------------------------------------------------------}
    property MaxZoom: Integer read FMaxZoom write SetMaxZoom default 0;   // maxZoom, 0 = null
    {*------------------------------------------------------------------------------
      The minimum zoom level which will be displayed on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nivel de zoom mínimo que será mostrado en el mapa.
    -------------------------------------------------------------------------------}
    property MinZoom: Integer read FMinZoom write SetMinZoom default 0;   // minZoom, 0 = null
    {*------------------------------------------------------------------------------
      True if MapMaker tiles should be used instead of regular tiles.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      A true si se debe usar el mosaico MapMaker en lugar del mosaico normal.
    -------------------------------------------------------------------------------}
    property MapMaker: Boolean read FMapMaker write FMapMaker default False;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Panoramio layer.
    More information at https://developers.google.com/maps/documentation/javascript/layers?hl=en#PanoramioLibrary
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la capa Panoramio.
    Más información en https://developers.google.com/maps/documentation/javascript/layers?hl=en#PanoramioLibrary
  -------------------------------------------------------------------------------}
  TPanoramio = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    FShow: Boolean;
    FFiltered: Boolean;
    FFilterTag: string;
    FClickable: Boolean;
    FFilterUserId: string;
    procedure SetShow(const Value: Boolean);
    procedure SetFilterTag(const Value: string);
    procedure SetFiltered(const Value: Boolean);
    procedure SetClickable(const Value: Boolean);
    procedure SetFilterUserId(const Value: string);

    procedure SetOptions;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;

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
    {*------------------------------------------------------------------------------
      Filter Panoramio photos by Tag
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Filtro para las fotos de Panoramio mediante la etiqueta Tag
    -------------------------------------------------------------------------------}
    property FilterTag: string read FFilterTag write SetFilterTag;
    {*------------------------------------------------------------------------------
      Filter Panoramio photos by UserId
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Filtro para las fotos de Panoramio mediante la etiqueta UserId
    -------------------------------------------------------------------------------}
    property FilterUserId: string read FFilterUserId write SetFilterUserId;
    {*------------------------------------------------------------------------------
      Activates the filter
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Activa el filtro
    -------------------------------------------------------------------------------}
    property Filtered: Boolean read FFiltered write SetFiltered default False;
    {*------------------------------------------------------------------------------
      Sets clickables the Panoramio photos
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece clicables las photos de Panoramio
    -------------------------------------------------------------------------------}
    property Clickable: Boolean read FClickable write SetClickable default True;
    {*------------------------------------------------------------------------------
      Show the layer. To true, shown the layer, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra la capa. A true, se muestra la capa, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write SetShow default False;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Panoramio features.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#PanoramioFeature
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula las caracretísticas de Panoramio.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#PanoramioFeature
  -------------------------------------------------------------------------------}
  TPanoramioFeature = class
  private
    FAuthor: string;
    FUserId: string;
    FPhotoId: string;
    FTitle: string;
    FUrl: string;
  public
    {*------------------------------------------------------------------------------
      Author of photo.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Autor de la foto.
    -------------------------------------------------------------------------------}
    property Author: string read FAuthor;
    {*------------------------------------------------------------------------------
      Id Photo.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Id de la foto.
    -------------------------------------------------------------------------------}
    property PhotoId: string read FPhotoId;
    {*------------------------------------------------------------------------------
      Title of the photo.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Título de la foto.
    -------------------------------------------------------------------------------}
    property Title: string read FTitle;
    {*------------------------------------------------------------------------------
      Url of the photo.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Enlace de la foto.
    -------------------------------------------------------------------------------}
    property Url: string read FUrl;
    {*------------------------------------------------------------------------------
      Id of user of the photo.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Id del usuario de la foto.
    -------------------------------------------------------------------------------}
    property UserId: string read FUserId;
  end;


  {*** Fred : new class for KML layer}

  {*------------------------------------------------------------------------------
    Class that encapsulate the KML layer.
    More information at https://developers.google.com/maps/documentation/javascript/kmllayer
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la capa KML.
    More information at https://developers.google.com/maps/documentation/javascript/kmllayer
  -------------------------------------------------------------------------------}
  TKml = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    FShow: Boolean;
    FUrl: string;
    FScreenOverlays: Boolean;
    FSuppressInfoWindows: Boolean;
    FClickable: Boolean;
    FPreserveViewport: Boolean;
    procedure SetShow(const Value: Boolean);
    procedure SetUrl(const Value: string);
    procedure SetClickable(const Value: Boolean);
    procedure SetPreserveViewport(const Value: Boolean);
    procedure SetScreenOverlays(const Value: Boolean);
    procedure SetSuppressInfoWindows(const Value: Boolean);
  protected
    procedure CallJavaScriptFunction;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;

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
    {*------------------------------------------------------------------------------
      If true, the layer receives mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si en true, el layer recive los eventos del mouse
    -------------------------------------------------------------------------------}
    property Clickable: Boolean read FClickable write SetClickable default True;
    {*------------------------------------------------------------------------------
      By default, the input map is centered and zoomed to the bounding box of the contents of the layer. If this option is set to true, the viewport is left unchanged, unless the map's center and zoom were never set.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Por defecto, el mapa se centra y se le aplica el zoom necesario para mostrar el contenido de la capa. Si esta opción está a true, la ventana no se cambia, y el cento y zoom del mapa no cambian.
    -------------------------------------------------------------------------------}
    property PreserveViewport: Boolean read FPreserveViewport write SetPreserveViewport default False;
    {*------------------------------------------------------------------------------
      Whether to render the screen overlays.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Para representar las superposiciones de la pantalla.
    -------------------------------------------------------------------------------}
    property ScreenOverlays: Boolean read FScreenOverlays write SetScreenOverlays default True;
    {*------------------------------------------------------------------------------
      Suppress the rendering of info windows when layer features are clicked.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Desactiva el procesamiento de la ventana de información cuando se presionan las características de la capa.
    -------------------------------------------------------------------------------}
    property SuppressInfoWindows: Boolean read FSuppressInfoWindows write SetSuppressInfoWindows default False;
    {*------------------------------------------------------------------------------
      Show the layer. To true, shown the layer, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra la capa. A true, se muestra la capa, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write SetShow default False;
    {*------------------------------------------------------------------------------
      Url to KML file
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Url al archivo KML
    -------------------------------------------------------------------------------}
    property Url: string read FUrl write SetUrl;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Traffic layer.
    More information at https://developers.google.com/maps/documentation/javascript/layers?hl=en#TrafficLayer
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la capa Traffic.
    Más información en https://developers.google.com/maps/documentation/javascript/layers?hl=en#TrafficLayer
  -------------------------------------------------------------------------------}
  TTraffic = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    FShow: Boolean;
    procedure SetShow(const Value: Boolean);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;

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
    {*------------------------------------------------------------------------------
      Show the layer. To true, shown the layer, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra la capa. A true, se muestra la capa, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write SetShow default False;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Transit layer.
    More information at https://developers.google.com/maps/documentation/javascript/layers?hl=en#TransitLayer
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la capa Transit.
    Más información en https://developers.google.com/maps/documentation/javascript/layers?hl=en#TransitLayer
  -------------------------------------------------------------------------------}
  TTransit = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    FShow: Boolean;
    procedure SetShow(const Value: Boolean);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;

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
    {*------------------------------------------------------------------------------
      Show the layer. To true, shown the layer, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra la capa. A true, se muestra la capa, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write SetShow default False;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Bicycling layer.
    More information at https://developers.google.com/maps/documentation/javascript/layers?hl=en#BicyclingLayer
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la capa Bicycling.
    Más información en https://developers.google.com/maps/documentation/javascript/layers?hl=en#BicyclingLayer
  -------------------------------------------------------------------------------}
  TBicycling = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    FShow: Boolean;
    procedure SetShow(const Value: Boolean);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;

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
    {*------------------------------------------------------------------------------
      Show the layer. To true, shown the layer, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra la capa. A true, se muestra la capa, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write SetShow default False;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Weather layer.
    More information at https://developers.google.com/maps/documentation/javascript/layers?hl=en#WeatherLayer
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la capa Weather.
    Más información en https://developers.google.com/maps/documentation/javascript/layers?hl=en#WeatherLayer
  -------------------------------------------------------------------------------}
  TWeather = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    FShow: Boolean;
    FWindSpeedUnit: TWindSpeedUnit;
    FTemperatureUnit: TTemperatureUnit;
    FLabelColor: TLabelColor;
    FSuppressInfoWindows: Boolean;
    FClickable: Boolean;
    procedure SetShow(const Value: Boolean);
    procedure SetClickable(const Value: Boolean);
    procedure SetLabelColor(const Value: TLabelColor);
    procedure SetSuppressInfoWindows(const Value: Boolean);
    procedure SetTemperatureUnit(const Value: TTemperatureUnit);
    procedure SetWindSpeedUnit(const Value: TWindSpeedUnit);

    procedure SetOptions;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;

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
    {*------------------------------------------------------------------------------
      Show the layer. To true, shown the layer, to false is hidden
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra la capa. A true, se muestra la capa, a false se oculta
    -------------------------------------------------------------------------------}
    property Show: Boolean read FShow write SetShow default False;
    {*------------------------------------------------------------------------------
      Indicates if the layer is clickable or not.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si la capa es o no clicable.
    -------------------------------------------------------------------------------}
    property Clickable: Boolean read FClickable write SetClickable default True;
    {*------------------------------------------------------------------------------
      The color of labels on the weather layer.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de las etiquetas sobre la capa weather.
    -------------------------------------------------------------------------------}
    property LabelColor: TLabelColor read FLabelColor write SetLabelColor default lcBLACK;
    {*------------------------------------------------------------------------------
      Suppress the rendering of info windows when weather icons are clicked.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Suprime el procesamiento de las ventanas de información cuando se hace clic en los iconos del tiempo.
    -------------------------------------------------------------------------------}
    property SuppressInfoWindows: Boolean read FSuppressInfoWindows write SetSuppressInfoWindows default False;
    {*------------------------------------------------------------------------------
      Unit to use for temperature.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Unidad usada para la temperatura.
    -------------------------------------------------------------------------------}
    property TemperatureUnit: TTemperatureUnit read FTemperatureUnit write SetTemperatureUnit default tuCELSIUS;
    {*------------------------------------------------------------------------------
      Unit to use for wind speed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Unidad usada para la velocidad del viento.
    -------------------------------------------------------------------------------}
    property WindSpeedUnit: TWindSpeedUnit read FWindSpeedUnit write SetWindSpeedUnit default wsKILOMETERS_PER_HOUR;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Weather conditions.
    More information at https://developers.google.com/maps/documentation/javascript/reference#WeatherConditions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula las condiciones meteriológicas.
    Más información en https://developers.google.com/maps/documentation/javascript/reference#WeatherConditions
  -------------------------------------------------------------------------------}
  TWeatherConditions = class
  private
    FLow: Integer;
    FHumidity: Integer;
    FWindSpeed: Integer;
    FDay: string;
    FWindDirection: string;
    FHigh: Integer;
    FDescription: string;
    FTemperature: Integer;
    FShortDay: string;
  public
    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    {*------------------------------------------------------------------------------
      The current day of the week in long form.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día actual de la semana en formato largo.
    -------------------------------------------------------------------------------}
    property Day: string read FDay;
    {*------------------------------------------------------------------------------
      A description of the conditions.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Descripción de las condiciones.
    -------------------------------------------------------------------------------}
    property Description: string read FDescription;
    {*------------------------------------------------------------------------------
      The highest temperature reached during the day.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Temperatura más alta alcanzada del día.
    -------------------------------------------------------------------------------}
    property High: Integer read FHigh;
    {*------------------------------------------------------------------------------
      The current humidity, expressed as a percentage.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Humedad actual expresada en porcentaje.
    -------------------------------------------------------------------------------}
    property Humidity: Integer read FHumidity;
    {*------------------------------------------------------------------------------
      The lowest temperature reached during the day.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Temperatura mínima alcanzada durante el día.
    -------------------------------------------------------------------------------}
    property Low: Integer read FLow;
    {*------------------------------------------------------------------------------
      The current day of the week in short form.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día actual de la semana en formato corto.
    -------------------------------------------------------------------------------}
    property ShortDay: string read FShortDay;
    {*------------------------------------------------------------------------------
      The current temperature, in the specified temperature units.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Temperatura actual expresada en la unidad de temperatura especificada.
    -------------------------------------------------------------------------------}
    property Temperature: Integer read FTemperature;
    {*------------------------------------------------------------------------------
      The current wind direction.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Dirección del viento actual.
    -------------------------------------------------------------------------------}
    property WindDirection: string read FWindDirection;
    {*------------------------------------------------------------------------------
      The current wind speed, in the specified wind speed units.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Velocidad del viento actual expresado en la unidad de viento especificada.
    -------------------------------------------------------------------------------}
    property WindSpeed: Integer read FWindSpeed;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Weather forecast.
    More information at https://developers.google.com/maps/documentation/javascript/reference#WeatherForecast
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula la previsión metereológica.
    Más información en https://developers.google.com/maps/documentation/javascript/reference#WeatherForecast
  -------------------------------------------------------------------------------}
  TWeatherForecast = class
  private
    FLow: Integer;
    FDay: string;
    FHigh: Integer;
    FDescription: string;
    FShortDay: string;
  public
    {*------------------------------------------------------------------------------
      The day of the week in long format.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día de la semana en formato largo.
    -------------------------------------------------------------------------------}
    property Day: string read FDay;
    {*------------------------------------------------------------------------------
      A description of the conditions.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Descripción de las condiciones.
    -------------------------------------------------------------------------------}
    property Description: string read FDescription;
    {*------------------------------------------------------------------------------
      The highest temperature reached during the day.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Temperatura máxima alcanzada durante el día.
    -------------------------------------------------------------------------------}
    property High: Integer read FHigh;
    {*------------------------------------------------------------------------------
      The lowest temperature reached during the day.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Temperatura mínima alcanzada durante el día.
    -------------------------------------------------------------------------------}
    property Low: Integer read FLow;
    {*------------------------------------------------------------------------------
      The day of the week in short form.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día de la semana en formato corto.
    -------------------------------------------------------------------------------}
    property ShortDay: string read FShortDay;
  end;

  {*------------------------------------------------------------------------------
    Class that encapsulate the Weather features.
    More information at https://developers.google.com/maps/documentation/javascript/reference#WeatherFeature
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase que encapsula las características metereológicas.
    Más información en https://developers.google.com/maps/documentation/javascript/reference#WeatherFeature
  -------------------------------------------------------------------------------}
  TWeatherFeature = class
  private
    FLocation: string;
    FCurrent: TWeatherConditions;
    FTemperatureUnit: TTemperatureUnit;
    FWindSpeedUnit: TWindSpeedUnit;
    FForecast: TObjectList;
    function GetCount: Integer;
    function GetForecast(Index: Integer): TWeatherForecast;
  protected
    {*------------------------------------------------------------------------------
      This method processes the XML data retrieved with weather features.
      @param Data string with the XML data
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este método procesa las características climáticas recuperados en los datos XML.
      @param Data cadena con los datos del XML
    -------------------------------------------------------------------------------}
    procedure ProcessXMLData(Data: string);
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
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
    procedure Assign(Source: TObject); virtual;

    {*------------------------------------------------------------------------------
      The current weather conditions at this location.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Condiciones meterielógicas actuales en una determinada hubicación.
    -------------------------------------------------------------------------------}
    property Current: TWeatherConditions read FCurrent;
    {*------------------------------------------------------------------------------
      The location name of this feature.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nombre de la hubicación de esta característica.
    -------------------------------------------------------------------------------}
    property Location: string read FLocation;
    {*------------------------------------------------------------------------------
      The temperature units used.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Unidad de temperatura usada.
    -------------------------------------------------------------------------------}
    property TemperatureUnit: TTemperatureUnit read FTemperatureUnit;
    {*------------------------------------------------------------------------------
      The wind speed units used.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Unidades de velocidad usada.
    -------------------------------------------------------------------------------}
    property WindSpeedUnit: TWindSpeedUnit read FWindSpeedUnit;
    {*------------------------------------------------------------------------------
      A forecast of weather conditions over the next four days. The forecast array is always in chronological order.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Pronóstico de las condiciones metereológicas para los siguientes cuatro días. La proyección es siempre cronológica.
    -------------------------------------------------------------------------------}
    property Forecast[Index: Integer]: TWeatherForecast read GetForecast;
    {*------------------------------------------------------------------------------
      Count of Forecast.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de Forecast.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
  end;

  {*------------------------------------------------------------------------------
    Internal class that includes all layers of Google Maps API.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que engloba todos los layers de la API de Google Maps.
  -------------------------------------------------------------------------------}
  TLayers = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    {*------------------------------------------------------------------------------
      Object containing the properties of layer Panoramio.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Objeto que contiene las propiedades del layer Panoramio.
    -------------------------------------------------------------------------------}
    FPanoramio: TPanoramio;

    {*** Fred : added KML}
    {*------------------------------------------------------------------------------
      Object containing the properties of layer KML.
    -------------------------------------------------------------------------------}
    FKml : TKml;

    {*------------------------------------------------------------------------------
      Object containing the properties of layer Traffic.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Objeto que contiene las propiedades del layer Traffic.
    -------------------------------------------------------------------------------}
    FTraffic: TTraffic;
    {*------------------------------------------------------------------------------
      Object containing the properties of layer Transit.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Objeto que contiene las propiedades del layer Transit.
    -------------------------------------------------------------------------------}
    FTransit: TTransit;
    {*------------------------------------------------------------------------------
      Object containing the properties of layer Bicycling.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Objeto que contiene las propiedades del layer Bicycling.
    -------------------------------------------------------------------------------}
    FBicycling: TBicycling;
    {*------------------------------------------------------------------------------
      Object containing the properties of layer Weather.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Objeto que contiene las propiedades del layer Weather.
    -------------------------------------------------------------------------------}
    FWeather: TWeather;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;
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
    property Panoramio: TPanoramio read FPanoramio write FPanoramio;
    {*** Fred : added Kml}
    property Kml: TKml read FKml write FKml;
    property Traffic: TTraffic read FTraffic write FTraffic;
    property Transit: TTransit read FTransit write FTransit;
    property Bicycling: TBicycling read FBicycling write FBicycling;
    property Weather: TWeather read FWeather write FWeather;
  end;

  {*------------------------------------------------------------------------------
    Internal class to manipulate features of StreetView panorama.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna para gestionar las características del panorama StreetView.
  -------------------------------------------------------------------------------}
  TStreetView = class(TPersistent)
  private
    FGMMap: TCustomGMMap;
    {*------------------------------------------------------------------------------
      Make visible the StreetView panorama.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Hace visible el panoráma StreetView.
    -------------------------------------------------------------------------------}
    FVisible: Boolean;

    procedure SetVisible(const Value: Boolean);

    procedure SetOptions;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMMap Object owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMMap Propietario del objeto
    -------------------------------------------------------------------------------}
    constructor Create(GMMap: TCustomGMMap); virtual;
  published
    property Visible: Boolean read FVisible write SetVisible default False;
  end;

  {*------------------------------------------------------------------------------
    Base class for all components that access the Google Maps maps.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los componentes que accedan a los mapas de Google Maps.
  -------------------------------------------------------------------------------}
  TCustomGMMap = class(TGMBase)
  private
    // internal variables
    FIsDoMap: Boolean;       // ES: indica si el mapa se ha cargado - EN: indicates if the map is loaded
    FIsUpdating: Boolean;    // ES: indica si el mapa se está actualizando - EN: indicates if the map is being updated
    FLinkedComponents: TList;   // ES: lista de componentes unidos al mapa - EN: list of components linked to map
    FCountLinkedCom: Cardinal;  // ES: contador de componentes que están unidos (o se unieron) al mapa
                                // EN: count components are linked (or have linked) to map

    // from propertis
    {*------------------------------------------------------------------------------
      Activate or deactivate access to the map.
      Set to true to access to HTML code of Google Maps API.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Activa o desactiva el acceso al mapa.
      Establecer a true para tener acceso al código HTML del API de Google Maps
    -------------------------------------------------------------------------------}
    FActive: Boolean;
    {*------------------------------------------------------------------------------
      AfterPageLoaded event is fired when the base HTML code es loaded (First param is true) and after the all map is loaded (First param is false).
      See TAfterPageLoaded.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento AfterPageLoaded se dispara cuando se carga el código HTML base (parámetro First a true) y cada vez que se carga el mapa (parámetro First a false).
      Ver TAfterPageLoaded.
    -------------------------------------------------------------------------------}
    FAfterPageLoaded: TAfterPageLoaded;
    {*------------------------------------------------------------------------------
      OnActiveChange event is fired when Active property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnActiveChange se dispara cuando cambia la propiedad Active.
    -------------------------------------------------------------------------------}
    FOnActiveChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      Interval of time to check the events of map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Intervalo de tiempo para comprovar los eventos del mapa.
    -------------------------------------------------------------------------------}
    FIntervalEvents: Integer;
    {*------------------------------------------------------------------------------
      OnIntervalEventsChange event is fired when IntervalEvents property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnIntervalEventsChange se dispara cuando cambia la propiedad IntervalEvents.
    -------------------------------------------------------------------------------}
    FOnIntervalEventsChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      Precision for lat and long values. 0 = Max precision, 1..17 precision decimals.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Precisión para los valores de latitud y longitud. 0 = Max precisión, 1..17 decimales de precisión.
    -------------------------------------------------------------------------------}
    FPrecision: Integer;
    {*------------------------------------------------------------------------------
      OnPrecisionChange event is fired when Precision property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnPrecisionChange se dispara cuando cambia la propiedad Precision.
    -------------------------------------------------------------------------------}
    FOnPrecisionChange: TNotifyEvent;
    {*------------------------------------------------------------------------------
      Required configuration options.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones de configucación requeridas.
    -------------------------------------------------------------------------------}
    FRequiredProp: TRequiredProp;
    {*------------------------------------------------------------------------------
      OnMapTypeIdChanged event is fired when MapTypeId property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnMapTypeIdChanged se dispara cuando cambia la propiedad MapTypeId.
    -------------------------------------------------------------------------------}
    FOnMapTypeIdChanged: TMapTypeIdChanged;
    {*------------------------------------------------------------------------------
      OnZoomChanged event is fired when Zoom property change.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnZoomChanged se dispara cuando cambia la propiedad Zoom.
    -------------------------------------------------------------------------------}
    FOnZoomChanged: TZoomChanged;
    {*------------------------------------------------------------------------------
      Nonvisual configuration options.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones de configucación no visuales.
    -------------------------------------------------------------------------------}
    FNonVisualProp: TNonVisualProp;
    {*------------------------------------------------------------------------------
      Layers of Google Maps.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Capas de Google Maps.
    -------------------------------------------------------------------------------}
    FLayers: TLayers;
    {*------------------------------------------------------------------------------
      Features for StreetView panorama.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características del panorama StreetView.
    -------------------------------------------------------------------------------}
    FStreetView: TStreetView;
    {*------------------------------------------------------------------------------
      OnRightClick event is fired when press right mouse button.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnRightClick se dispara cuando se pulsa el botón derecho del ratón.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnRightClick: TLatLngEvent;
    {*------------------------------------------------------------------------------
      OnDrag event is repeatedly fired while the user drags the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnDrag se dispara repetidamente mientras se arrastra el mapa.
    -------------------------------------------------------------------------------}
    FOnDrag: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnMouseMove event is fired whenever the user's mouse moves over the map container.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnMouseMove se dispara cuando el ratón del usuario se desplaza por encima del mapa.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnMouseMove: TLatLngEvent;
    {*------------------------------------------------------------------------------
      OnMouseOut event is fired when the user's mouse exits the map.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnMouseOut se dispara cuando el ratón del usuario sale del mapa.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnMouseOut: TLatLngEvent;
    {*------------------------------------------------------------------------------
      OnDragStart event is fired when the user starts dragging the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnDragStart se dispara cuando el usuario empieza a arrastrar el mapa.
    -------------------------------------------------------------------------------}
    FOnDragStart: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnPanoramioClick event is fired when a feature in the layer is clicked.
      See TPanoramioClick.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnPanoramioClick se dispara cuando se pulsa alguna característica de la capa.
      Ver TPanoramioClick.
    -------------------------------------------------------------------------------}
    FOnPanoramioClick: TPanoramioClick;
    {*------------------------------------------------------------------------------
      OnWeatherClick event is fired when a feature in the weather layer is clicked.
      See TWeatherClick.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnWeatherClick se dispara cuando se pulsa alguna característica de la capa del tiempo.
      Ver TWeatherClick.
    -------------------------------------------------------------------------------}
    FOnWeatherClick: TWeatherClick;
    {*------------------------------------------------------------------------------
      OnBoundsChanged event is fired when the bounds of map changed.
      See TBoundsChanged.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnBoundsChanged se dispara cuando cambia el límite del mapa.
      Ver TBoundsChanged.
    -------------------------------------------------------------------------------}
    FOnBoundsChanged: TBoundsChanged;
    {*------------------------------------------------------------------------------
      OnDblClick event is fired when double click on the map.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnDblClick se dispara cuando se hace una doble pulsación en el mapa.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnDblClick: TLatLngEvent;
    {*------------------------------------------------------------------------------
      OnMouseOver event is fired when the user's mouse enters the map.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnMouseOver se dispara cuando el ratón del usuario entra en el mapa.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnMouseOver: TLatLngEvent;
    {*------------------------------------------------------------------------------
      OnClick event is fired when click on the map.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnClick se dispara cuando se pulsa en el mapa.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnClick: TLatLngEvent;
    {*------------------------------------------------------------------------------
      OnDragEnd event is fired when the user stops dragging the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnDragEnd se dispara cuando el usuario finaliza el arrastrado del mapa.
    -------------------------------------------------------------------------------}
    FOnDragEnd: TNotifyEvent;
    {*------------------------------------------------------------------------------
      OnCenterChanged event is fired when the center of map changed.
      See TLatLngEvent.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnCenterChanged se dispara cuando cambia el centro del mapa.
      Ver TLatLngEvent.
    -------------------------------------------------------------------------------}
    FOnCenterChanged: TLatLngEvent;
    {*------------------------------------------------------------------------------
      APIKey is the Key to use on Google Maps.
      To obtaining Api Key please check https://developers.google.com/maps/documentation/javascript/tutorial
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      APIKey es la Key a usar en Google Maps.
      PAra obtener una Api Key visita https://developers.google.com/maps/documentation/javascript/tutorial
    -------------------------------------------------------------------------------}
    FAPIKey: string;

    function AddLinkedComponent(GMObject: TGMObjects): Integer;
    procedure RemoveLinkedComponent(GMObject: TGMObjects);

    function ExistLinkedComponent(Id: Cardinal): Integer;

    procedure SetActive(const Value: Boolean);
    procedure SetIntervalEvents(const Value: Integer);
    procedure SetPrecision(const Value: Integer);
    procedure SetAPIKey(const Value: string);
  protected
    // Internal variables accessible to descendants
    {*------------------------------------------------------------------------------
      Indicates if the Web page is fully loaded.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si la página web se ha cargado completamente.
    -------------------------------------------------------------------------------}
    FDocLoaded: Boolean;
    {*------------------------------------------------------------------------------
      Browser.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Navegador.
    -------------------------------------------------------------------------------}
    FWebBrowser: TComponent;
    {*------------------------------------------------------------------------------
      Objecto to access DOM browser.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Objeto para acceder al DOM del navegador.
    -------------------------------------------------------------------------------}
    FWC: TCustomWeb;

    {*------------------------------------------------------------------------------
      Returns a string with the values of the VisualProp object properties defined into the descendants.
      @return String with the values
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena con los valores de las propiedades del objeto VisualProp definido en los descendientes.
      @return Cadena con los valores
    -------------------------------------------------------------------------------}
    function VisualPropToStr: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      Set the interval of Timer that control de map events. Internal use only.
      @param Interval Interval in miliseconds
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece el intervalo del Timer que controla los eventos del mapa. De uso interno.
      @param Interval Intervalo en milisegundos
    -------------------------------------------------------------------------------}
    procedure SetIntervalTimer(Interval: Integer); virtual; abstract;
    {*------------------------------------------------------------------------------
      Activate or deactivate the Timer that control de map events. Internal use only.
      @param State State of the Timer
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Activa o desactiva el Timer que controla los eventos del mapa. De uso interno.
      @param State Estado del Timer
    -------------------------------------------------------------------------------}
    procedure SetEnableTimer(State: Boolean); virtual; abstract;

    {*------------------------------------------------------------------------------
      Returns the HTML code of base map. Internal use only.
      @return String with the HTML code
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el código HTML del mapa base. De uso interno.
      @return Cadena con el código HTML
    -------------------------------------------------------------------------------}
    function GetBaseHTMLCode: string;
    {*------------------------------------------------------------------------------
      Performs status checks. Internal use only.
      @return True if all is ok
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Realiza comprobaciones de estado. De uso interno.
      @return True si todo es correcto
    -------------------------------------------------------------------------------}
    function Check: Boolean;
    {*------------------------------------------------------------------------------
      Check if the JavaScript Map variable is null. Internal use only.
      @return True if it is null
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Comprueba si la variable Map de JavaScript es null. De uso interno.
      @return True si es null
    -------------------------------------------------------------------------------}
    function MapIsNull: Boolean;

    {*------------------------------------------------------------------------------
      Execute the JavaScript fucntion NameFunct with parameters Params. If executed succefully returns True, otherwise False.
      @param NameFunct JavaScript function name to execute
      @param Params Function parameters
      @return True if executed succefully, otherwise False
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Ejecuta la función JavaScript NameFunct con los parámetros Params. Si se ha ejecutado correctamente devuelve True, en caso contrario, False.
      @param NameFunct Nombre de la función JavaScript a ejecutar
      @param Params Parámetros de la función
      @return True Si se ejecuta correctamente, en caso contrario, False
    -------------------------------------------------------------------------------}
    function ExecuteScript(NameFunct, Params: string): Boolean; virtual; abstract;

    {*------------------------------------------------------------------------------
      This method control the browser events when the browser is deleted.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este método controla los eventos del navegador cuando éste se borra.
    -------------------------------------------------------------------------------}
    procedure BrowserEventsControl; virtual; abstract;

    {*------------------------------------------------------------------------------
      Forwards notification messages to all owned components. See Delphi documentation for more details.
      @param AComponent Component that do the call
      @param Operation Inserted or removed of component
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Reenvía mensajes de notificación a todos los componentes de propiedad. Ver la documentación de Delphi para más detalles.
      @param AComponent Componente que produce la llamada
      @param Operation Insertado o borrado del componente
    -------------------------------------------------------------------------------}
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function GetAPIUrl: string; override;

    {*------------------------------------------------------------------------------
      OnChange control event from RequiredProp.Center property.
      @param Sender Object that fire event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Control del evento OnChange de la propiedad RequiredProp.Center.
      @param Sender Objecto que dispara el evento
    -------------------------------------------------------------------------------}
    procedure ChangeCenter(Sender: TObject);

    {*------------------------------------------------------------------------------
      OnTimer control event of Timer that check events from map.
      @param Sender Object that fire event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Control del evento OnTimer del Timer que comprueba los eventos del mapa.
      @param Sender Objecto que dispara el evento
    -------------------------------------------------------------------------------}
    procedure OnTimer(Sender: TObject); virtual;

    {*------------------------------------------------------------------------------
      LoadBaseWeb method load the base HTML to use API of Google Maps
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método LoadBaseWeb carga el HTML base para el uso de la API de Google Maps
    -------------------------------------------------------------------------------}
    procedure LoadBaseWeb; virtual; abstract;
    {*------------------------------------------------------------------------------
      LoadBlankPage method load the about:blank page
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método LoadBlankPage carga la página about:blank
    -------------------------------------------------------------------------------}
    procedure LoadBlankPage; virtual; abstract;

    {*------------------------------------------------------------------------------
      SetMapTypeId method sets a new MapTypeId to the map
      @param MapTypeId the new MapTypeId
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetMapTypeId establece un nuevo MapTypeId al mapa
      @param MapTypeId el nuevo MapTypeId
    -------------------------------------------------------------------------------}
    procedure SetMapTypeId(MapTypeId: TMapTypeId); overload;
    {*------------------------------------------------------------------------------
      SetMapTypeId method sets a new MapTypeId to the map
      @param MapTypeId the new MapTypeId
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetMapTypeId establece un nuevo MapTypeId al mapa
      @param MapTypeId el nuevo MapTypeId
    -------------------------------------------------------------------------------}
    procedure SetMapTypeId(const MapTypeId: string); overload;
    {*------------------------------------------------------------------------------
      SetZoom method sets a new zoom to the map
      @param Zoom the new zoom
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetZoom establece un nuevo zoom al mapa
      @param Zoom el nuevo zoom
    -------------------------------------------------------------------------------}
    procedure SetZoom(Zoom: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Returns max zoom of a LatLng. If error return -1.
      @param LL TLatLng to know Max Zoom.
      @return Max Zoom
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el zoom máximo de la LatLng dada. En caso de error devuelve -1.
      @param LL TLatLng de la que queremos saber el Zoom Máximo.
      @return Zoom Máximo.
    -------------------------------------------------------------------------------}
    function GetMaxZoom(LL: TLatLng): Integer;

    {*------------------------------------------------------------------------------
      Sets the optimal zoom to display all points.
      @param Points Array with the points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece el zoom óptimo para visualizar todos los punto.
      @param Points Array con los puntos.
    -------------------------------------------------------------------------------}
    procedure ZoomToPoints(Points: array of TLatLng);

    {*------------------------------------------------------------------------------
      Sets a new bounds to the map
      @param SWLat Southwest latitude of the bounds
      @param SWLng Southwest longitude of the bounds
      @param NELat Northeast latitude of the bounds
      @param NELng Northeast longitude of the bounds
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece unos nuevos límites al mapa
      @param SWLat Latitud suroeste de los límites
      @param SWLng Longitud suroeste de los límites
      @param NELat Latitud noreste de los límites
      @param NELng Longitug noreste de los límites
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsSetBounds(SWLat, SWLng, NELat, NELng: Real); overload;
    {*------------------------------------------------------------------------------
      Sets a new bounds to the map.
      @param TLatLngBounds New limits.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece unos nuevos límites al mapa.
      @param TLatLngBounds Nuevos límites.
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsSetBounds(Bounds: TLatLngBounds); overload;
    {*------------------------------------------------------------------------------
      Get the map bounds.
      @param LLB TLatLngBounds to store the information.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve los límites del mapa.
      @param LLB TLatLngBounds donde se almacenará la información.
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsGetBounds(LLB: TLatLngBounds);
    {*------------------------------------------------------------------------------
      Extends the bounds to contain the given point.
      @param LatLng TLatLng to contain.
      @param LLB TLatLngBounds to store the information.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Extiende los límites hasta contener el punto dado.
      @param LatLng TLatLng a contener.
      @param LLB TLatLngBounds donde se almacenará la información.
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsExtend(LatLng: TLatLng; LLB: TLatLngBounds); overload;
    {*------------------------------------------------------------------------------
      Extends the bounds to contain the given point.
      @param Lat Latitude to contain.
      @param Lng Longitude to contain.
      @param LLB TLatLngBounds to store the information.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Extiende los límites hasta contener el punto dado.
      @param Lat Latitud a contener.
      @param Lng Longitud a contener.
      @param LLB TLatLngBounds donde se almacenará la información.
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsExtend(Lat, Lng: Real; LLB: TLatLngBounds); overload;
    {*------------------------------------------------------------------------------
      Extends the map bounds to contain the given point.
      @param LatLng TLatLng to contain.
      @param LLB TLatLngBounds to store the information.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Extiende los límites del mapa hasta contener el punto dado.
      @param LatLng TLatLng a contener.
      @param LLB TLatLngBounds donde se almacenará la información.
    -------------------------------------------------------------------------------}
    procedure MapLatLngBoundsExtend(LatLng: TLatLng; LLB: TLatLngBounds); overload;
    {*------------------------------------------------------------------------------
      Returns true if the given TLatLng is in the bounds.
      @param LatLng TLatLng to check.
      @param LLB TLatLngBounds where search.
      @return True if the given TLatLng is in the bounds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve true si la TLatLng dada está dentro de los límites.
      @param LatLng TLatLng a comprobar.
      @param LLB TLatLngBounds donde mirar.
      @return True si la TLatLng dada está dentro de los límites.
    -------------------------------------------------------------------------------}
    function LatLngBoundsContains(LatLng: TLatLng; LLB: TLatLngBounds): Boolean; overload;
    {*------------------------------------------------------------------------------
      Returns true if the given lat/lng is into the bounds.
      @param Lat Latitude to check.
      @param Lng Longitude to check.
      @param LLB TLatLngBounds where search.
      @return True if the given lat/lng is into the bounds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve true si la lat/lng dada está dentro de los límites.
      @param Lat Latitud a comprobar.
      @param Lng Longitud a comprobar.
      @param LLB TLatLngBounds donde mirar.
      @return True si la lat/lng dada está dentro de los límites.
    -------------------------------------------------------------------------------}
    function LatLngBoundsContains(Lat, Lng: Real; LLB: TLatLngBounds): Boolean; overload;
    {*------------------------------------------------------------------------------
      Returns true if the given TLatLng is into the map bounds.
      @param LatLng TLatLng to check.
      @return True if the given TLatLng is into the map bounds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve true si la TLatLng dada está dentro de los límites del mapa.
      @param LatLng TLatLng a comprobar.
      @return True si la TLatLng dada está dentro de los límites del mapa.
    -------------------------------------------------------------------------------}
    function MapLatLngBoundsContains(LatLng: TLatLng): Boolean; overload;
    {*------------------------------------------------------------------------------
      Computes the TLatLngBounds centre.
      @param LLB TLatLngBounds where to search.
      @param LL TLatLng representing the centre.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula el centro del TLatLngBounds.
      @param LLB TLatLngBounds donde mirar.
      @param LL TLatLng que representa el centro.
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsGetCenter(LLB: TLatLngBounds; LL: TLatLng);
    {*------------------------------------------------------------------------------
      Converts the given map bounds to a TLatLng span.
      @param LL TLatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Convierte los límites del mapa en una extensión TLatLng
      @param LL TLatLng.
    -------------------------------------------------------------------------------}
    procedure LatLngBoundsToSpan(LL: TLatLng);

    {*------------------------------------------------------------------------------
      Returns the position displayed at the centre of the map.
      @param LL Center of the map
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la posición mostrada en el centro del mapa.
      @param LL Centro del mapa
    -------------------------------------------------------------------------------}
    procedure GetCenter(LL: TLatLng);
    {*------------------------------------------------------------------------------
      Returns the MapTypeId of the map.
      @return MapTypeId of the map
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el MapTypeId del mapa.
      @return MapTypeId del mapa
    -------------------------------------------------------------------------------}
    function GetMapTypeId: TMapTypeId;
    {*------------------------------------------------------------------------------
      Returns the zoom of the map.
      @return Zoom of the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el zoom del mapa.
      @return Zoom del mapa.
    -------------------------------------------------------------------------------}
    function GetZoom: Integer;
    {*------------------------------------------------------------------------------
      Changes the center of the map by the given distance in pixels.
      @param x Number of pixels to move into x-axis.
      @param y Number of pixels to move into y-axis.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cambia el centro del mapa en la distancia dada en píxels.
      @param x Número de píxels a moverse en el eje x.
      @param y Número de píxels a moverse en el eje y.
    -------------------------------------------------------------------------------}
    procedure PanBy(x, y: Integer);
    {*------------------------------------------------------------------------------
      Changes the center of the map to the given LatLng.
      @param LatLng New centre.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cambia el centro del mapa con la LatLng dada.
      @param LatLng Nuevo centro.
    -------------------------------------------------------------------------------}
    procedure PanTo(LatLng: TLatLng); overload;
    {*------------------------------------------------------------------------------
      Changes the center of the map to the given lat/lng.
      @param Lat New latitude for the centre.
      @param Lng New longitude for the centre.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cambia el centro del mapa con la lat/lng dada.
      @param Lat Nueva latitud para el centro.
      @param Lng Nueva longitud para el centro.
    -------------------------------------------------------------------------------}
    procedure PanTo(const Lat, Lng: Real); overload;
    {*------------------------------------------------------------------------------
      Changes the center of the map to the given LatLng.
      @param LatLng New center.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cambia el centro del mapa con la LatLng dada.
      @param LatLng Nuevo centro
    -------------------------------------------------------------------------------}
    procedure SetCenter(LatLng: TLatLng); overload;
    {*------------------------------------------------------------------------------
      Changes the center of the map to the given lat/lng.
      @param Lat New latitude for the centre
      @param Lng New longitude for the centre
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cambia el centro del mapa con la lat/lng dada.
      @param Lat Nueva latitud para el centro
      @param Lng Nueva longitud para el centro
    -------------------------------------------------------------------------------}
    procedure SetCenter(const Lat, Lng: Real); overload;

    {*------------------------------------------------------------------------------
      PrintNoDialog method print the loaded page directly. Only for TWebBrowser.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método PrintNoDialog imprime la página cargada directamente. Sólo para TWebBrowser.
    -------------------------------------------------------------------------------}
    procedure PrintNoDialog; virtual;
    {*------------------------------------------------------------------------------
      PrintWithDialog method show the print dialog before print the loaded page.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método PrintWithDialog muestra el cuadro de diálogo de impresión antes de imprimir la página cargada.
    -------------------------------------------------------------------------------}
    procedure PrintWithDialog; virtual;
    {*------------------------------------------------------------------------------
      PrintPreview method shows a preview before print the loaded page. Only for TWebBrowser.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método PrintPreview muestra una vista previa antes de imprimir la página cargada. Sólo para TWebBrowser.
    -------------------------------------------------------------------------------}
    procedure PrintPreview; virtual;
    {*------------------------------------------------------------------------------
      PrintPageSetup method show the page setup dialog before print the loaded page. Only for TWebBrowser.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método PrintPageSetup muestra el cuadro de diálogo de configuración de página antes de imprimir la página cargada. Sólo para TWebBrowser.
    -------------------------------------------------------------------------------}
    procedure PrintPageSetup; virtual;
    {*------------------------------------------------------------------------------
      SaveToJPGFile method create a JPG image with de page loaded.
      @param FileName JPG file name.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SaveToJPGFile crea una imagen JPG de la página cargada.
      @param FileName Nombre del archivo JPG.
    -------------------------------------------------------------------------------}
    procedure SaveToJPGFile(FileName: TFileName = ''); virtual; abstract;
    procedure SaveHTML(FileName: TFileName = ''); virtual; abstract;

    {*------------------------------------------------------------------------------
      Create the map with the specified features.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea el mapa con las opciones especificadas.
    -------------------------------------------------------------------------------}
    procedure DoMap; virtual;
  published
    property APIKey: string read FAPIKey write SetAPIKey;
    property Active: Boolean read FActive write SetActive default False;
    property IntervalEvents: Integer read FIntervalEvents write SetIntervalEvents default 200;
    property Precision: Integer read FPrecision write SetPrecision default 0;
    property RequiredProp: TRequiredProp read FRequiredProp write FRequiredProp;
    property NonVisualProp: TNonVisualProp read FNonVisualProp write FNonVisualProp;
    property Layers: TLayers read FLayers write FLayers;
    property StreetView: TStreetView read FStreetView write FStreetView;

    // eventos / Events
    property AfterPageLoaded: TAfterPageLoaded read FAfterPageLoaded write FAfterPageLoaded;
    property OnBoundsChanged: TBoundsChanged read FOnBoundsChanged write FOnBoundsChanged;
    property OnCenterChanged: TLatLngEvent read FOnCenterChanged write FOnCenterChanged;
    property OnClick: TLatLngEvent read FOnClick write FOnClick;
    property OnDblClick: TLatLngEvent read FOnDblClick write FOnDblClick;
    property OnDrag: TNotifyEvent read FOnDrag write FOnDrag;
    property OnDragEnd: TNotifyEvent read FOnDragEnd write FOnDragEnd;
    property OnDragStart: TNotifyEvent read FOnDragStart write FOnDragStart;
    property OnMapTypeIdChanged: TMapTypeIdChanged read FOnMapTypeIdChanged write FOnMapTypeIdChanged;
    property OnMouseMove: TLatLngEvent read FOnMouseMove write FOnMouseMove;
    property OnMouseOut: TLatLngEvent read FOnMouseOut write FOnMouseOut;
    property OnMouseOver: TLatLngEvent read FOnMouseOver write FOnMouseOver;
    property OnRightClick: TLatLngEvent read FOnRightClick write FOnRightClick;
    property OnZoomChanged: TZoomChanged read FOnZoomChanged write FOnZoomChanged;
    property OnWeatherClick: TWeatherClick read FOnWeatherClick write FOnWeatherClick;
    property OnPanoramioClick: TPanoramioClick read FOnPanoramioClick write FOnPanoramioClick;
    property OnActiveChange: TNotifyEvent read FOnActiveChange write FOnActiveChange;
    property OnIntervalEventsChange: TNotifyEvent read FOnIntervalEventsChange write FOnIntervalEventsChange;
    property OnPrecisionChange: TNotifyEvent read FOnPrecisionChange write FOnPrecisionChange;
  end;

  {*------------------------------------------------------------------------------
    Base class for a linked components to map.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los componentes enlazados al mapa.
  -------------------------------------------------------------------------------}
  TGMObjects = class(TGMBase)
  private
    FIdxList: Cardinal;
    FMap: TCustomGMMap;
  protected
    {*------------------------------------------------------------------------------
      Set IdxList property.
      @param Value New value for IdxList property
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la propiedad IdxList.
      @param Value Nuevo valor para la propiedad IdxList
    -------------------------------------------------------------------------------}
    procedure SetIdxList(const Value: Cardinal); virtual;
    {*------------------------------------------------------------------------------
      Set Map property.
      @param Value New value for Map property
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la propiedad Map.
      @param Value Nuevo valor para la propiedad Map
    -------------------------------------------------------------------------------}
    procedure SetMap(const Value: TCustomGMMap); virtual;

    {*------------------------------------------------------------------------------
      Forwards notification messages to all owned components. See Delphi documentation for more details.
      @param AComponent Component that do the call
      @param Operation Inserted or removed of component
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Reenvía mensajes de notificación a todos los componentes de propiedad. Ver la documentación de Delphi para más detalles.
      @param AComponent Componente que produce la llamada
      @param Operation Insertado o borrado del componente
    -------------------------------------------------------------------------------}
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    {*------------------------------------------------------------------------------
      Call ExecuteScript method of TCustomGMMap class.
      @param NameFunct JavaScript function name to execute
      @param Params Function parameters
      @return True if executed succefully, otherwise False
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Llama al método ExecuteScript de la clase TCustomGMMap.
      @param NameFunct nombre de la función JavaScript a ejecutar
      @param Params parámetros de la función
      @return True si se ejecuta correctamente, en caso contrario, False
    -------------------------------------------------------------------------------}
    function ExecuteScript(NameFunct, Params: string): Boolean; virtual;
    {*------------------------------------------------------------------------------
      Delete objects from map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra los objetos del mapa.
    -------------------------------------------------------------------------------}
    procedure DeleteMapObjects; virtual; abstract;
    {*------------------------------------------------------------------------------
      Show objects into the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra los objetos en el mapa.
    -------------------------------------------------------------------------------}
    procedure ShowElements; virtual; abstract;
    {*------------------------------------------------------------------------------
      Collect events fired from the map for this object.
      @param EventType Type of event fired
      @param Params Params of event
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Recoge los eventos lanzados desde el mapa para este objeto.
      @param EventType Tipo del evento disparado
      @param Params Parámetros del evento
    -------------------------------------------------------------------------------}
    procedure EventFired(EventType: TEventType; Params: array of const); virtual; abstract;

    {*------------------------------------------------------------------------------
      Get Active status of the Map object.
      @return True if Map is active, otherwise False
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el estado de Active del objecto Map.
      @return True si Map está activo, en caso contrario False
    -------------------------------------------------------------------------------}
    function IsMapActive: Boolean;

    {*------------------------------------------------------------------------------
      GetIntegerField function return the integer value of a field in a form of the map.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the integer value to return by default if form or field not exist
      @return integer containing the value. If Form or Field not exist, return the DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetIntegerField devuelve el valor integer de un campo de un formulario del mapa.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return integer que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetIntegerField(const FormName, FieldName: string; DefaultValue: Integer = 0): Integer;
    {*------------------------------------------------------------------------------
      GetStringField function return the string value of a field in a form of the map.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the string value to return by default if FormName or FieldName not exist
      @return string containing the value. If FormName or FieldName not exist, return DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetStringField devuelve el valor string de un campo de un formulario del mapa.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return string que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetStringField(const FormName, FieldName: string; DefaultValue: string = ''): string;
    {*------------------------------------------------------------------------------
      GetFloatField function return the real value of a field in a form of the map.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the float value to return by default if form or field not exist
      @return real containing the value. If Form or Field not exist, return the DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetFloatField devuelve el valor real de un campo de un formulario del mapa.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return real que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetFloatField(const FormName, FieldName: string; DefaultValue: Real = 0): Real;
    {*------------------------------------------------------------------------------
      GetBoolField function return the boolean value of a field in a form.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the boolean value to return by default if form or field not exist
      @return boolean containing the value. If Form or Field not exist, return the DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetBoolField devuelve el valor boolean de un campo de un formulario
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return boolean que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetBoolField(const FormName, FieldName: string; DefaultValue: Boolean = False): Boolean;

    {*------------------------------------------------------------------------------
      Get Precision property of the Map object.
      @return Precision for coordinates
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la propiedad Precision del objecto Map.
      @return Precisión para las coordenadas
    -------------------------------------------------------------------------------}
    function GetMapPrecision: Integer;

    {*------------------------------------------------------------------------------
      Index position in the list FLinkedComponents of TCustomGMMap class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Índice de la posición en la lista FLinkedComponents de la clase TCustomGMMap.
    -------------------------------------------------------------------------------}
    property IdxList: Cardinal read FIdxList write SetIdxList;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param AOwner Owner of component
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param AOwner Propietario del componente
    -------------------------------------------------------------------------------}
    constructor Create(AOwner: TComponent); override;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;
  published
    {*------------------------------------------------------------------------------
      Map associated with the component.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mapa asociado al componente.
    -------------------------------------------------------------------------------}
    property Map: TCustomGMMap read FMap write SetMap;
  end;

implementation

uses
  Lang, GMFunctions, GMLinkedComponents, GMMarker, GMPolyline, GMRectangle,
  GMCircle, GMDirection, GMGroundOverlay,

  {$IFDEF DELPHIXE2}
  System.Types, Xml.XMLIntf, Xml.XMLDoc;
  {$ELSE}
  Windows, XMLIntf, XMLDoc;
  {$ENDIF}

{ TCustomGMMap }

function TCustomGMMap.AddLinkedComponent(GMObject: TGMObjects): Integer;
begin
  FLinkedComponents.Add(GMObject);
  Inc(FCountLinkedCom);
  GMObject.IdxList := FCountLinkedCom;
  Result := FCountLinkedCom;
end;

procedure TCustomGMMap.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomGMMap then
  begin
    FWebBrowser.Assign(TCustomGMMap(Source).FWebBrowser);
    ApiKey := TCustomGMMap(Source).ApiKey;
    Active := TCustomGMMap(Source).Active;
    IntervalEvents := TCustomGMMap(Source).IntervalEvents;
    RequiredProp.Assign(TCustomGMMap(Source).RequiredProp);
    NonVisualProp.Assign(TCustomGMMap(Source).NonVisualProp);
    Layers.Assign(TCustomGMMap(Source).Layers);
  end;
end;

procedure TCustomGMMap.ChangeCenter(Sender: TObject);
begin
  if Assigned(FWebBrowser) and FActive and FDocLoaded and FIsDoMap and not FIsUpdating then
  begin
    FIsUpdating := True;
    SetCenter(RequiredProp.Center);
  end;
end;

function TCustomGMMap.Check: Boolean;
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create(GetTranslateText('No se ha especificado el objeto WebBrowser', Language));

  if not FActive then
    raise Exception.Create(GetTranslateText('No está activo', Language));

  if not FDocLoaded then
    raise Exception.Create(GetTranslateText('Página inicial aun no cargada', Language));

  Result := not (csDesigning in ComponentState);
end;

constructor TCustomGMMap.Create(AOwner: TComponent);
begin
  inherited;

  FDocLoaded := False;
  FIsDoMap := False;
  FLinkedComponents := TList.Create;
  FCountLinkedCom := 0;
  FIsUpdating := False;

  FApiKey := '';
  FActive := False;
  FIntervalEvents := 200;
  FRequiredProp := TRequiredProp.Create(Self);
  FRequiredProp.Center.OnChange := ChangeCenter;
  FNonVisualProp := TNonVisualProp.Create;
  FLayers := TLayers.Create(Self);
  FStreetView := TStreetView.Create(Self);
end;

destructor TCustomGMMap.Destroy;
begin
  if Assigned(FRequiredProp) then FreeAndNil(FRequiredProp);
  if Assigned(FNonVisualProp) then FreeAndNil(FNonVisualProp);
  if Assigned(FLayers) then FreeAndNil(FLayers);
  if Assigned(FStreetView) then FreeAndNil(FStreetView);

  if Assigned(FLinkedComponents) then FreeAndNil(FLinkedComponents);
  if Assigned(FWC) then FreeAndNil(FWC);

  inherited;
end;

procedure TCustomGMMap.DoMap;
{*** Fred : added '%s,%s,' for two more parameter (KML)}
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
  i: Integer;
begin
  FIsDoMap := False;
  Params := Format(StrParams, [
             // required property
             RequiredProp.Center.LatToStr(FPrecision),                          // center -> lat
             RequiredProp.Center.LngToStr(FPrecision),                          // center -> lng
             QuotedStr(TCustomTransform.MapTypeIdToStr(RequiredProp.MapType)),        // mapTypeId
             IntToStr(RequiredProp.Zoom),                                       // zoom
             // non visual property
             LowerCase(TCustomTransform.GMBoolToStr(DisableDoubleClickZoom in NonVisualProp.Options, True)),  // disableDoubleClickZoom
             LowerCase(TCustomTransform.GMBoolToStr(Draggable in NonVisualProp.Options, True)),               // draggable
             LowerCase(TCustomTransform.GMBoolToStr(KeyboardShortcuts in NonVisualProp.Options, True)),       // keyboardShortcuts
             LowerCase(TCustomTransform.GMBoolToStr(NoClear in NonVisualProp.Options, True)),                 // noClear
             LowerCase(TCustomTransform.GMBoolToStr(ScrollWheel in NonVisualProp.Options, True)),             // scrollwheel
             IntToStr(NonVisualProp.MaxZoom),                                              // maxZoom
             IntToStr(NonVisualProp.MinZoom),                                              // minZoom
             LowerCase(TCustomTransform.GMBoolToStr(NonVisualProp.MapMaker, True)),                           // mapMaker
             // visual property
             VisualPropToStr,
             // layers
             {*** Fred : added two arguments (ShowKml,UrlKml)}
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Kml.Show, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Kml.ScreenOverlays, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Kml.SuppressInfoWindows, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Kml.Clickable, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Kml.PreserveViewport, True)),
             QuotedStr(Layers.Kml.Url),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Traffic.Show, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Transit.Show, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Bicycling.Show, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Panoramio.Show, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Panoramio.Clickable, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Panoramio.Filtered, True)),
             QuotedStr(GetConvertedString(Layers.Panoramio.FilterTag)),
             QuotedStr(GetConvertedString(Layers.Panoramio.FilterUserId)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Weather.Show, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Weather.Clickable, True)),
             LowerCase(TCustomTransform.GMBoolToStr(Layers.Weather.SuppressInfoWindows, True)),
             QuotedStr(TCustomTransform.LabelColorToStr(Layers.Weather.LabelColor)),
             QuotedStr(TCustomTransform.TemperatureUnitToStr(Layers.Weather.TemperatureUnit)),
             QuotedStr(TCustomTransform.WindSpeedUnitToStr(Layers.Weather.WindSpeedUnit)),
             // streetview
             LowerCase(TCustomTransform.GMBoolToStr(StreetView.Visible, True))
             ]);
  if not ExecuteScript('DoMap', Params) then Exit;
  FIsDoMap := True;

  // mostramos elementos de los componentes linkados
  // show elements from linked components
  for i := 0 to FLinkedComponents.Count - 1 do
    if TGMLinkedComponent(FLinkedComponents[i]).AutoUpdate then
      TGMLinkedComponent(FLinkedComponents[i]).ShowElements;
end;

function TCustomGMMap.ExistLinkedComponent(Id: Cardinal): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FLinkedComponents.Count - 1 do
  begin
    if TGMObjects(FLinkedComponents[i]).IdxList = Id then
    begin
      Result := i;
      Break;
    end;
  end;
end;

function TCustomGMMap.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#Map';
end;

function TCustomGMMap.GetBaseHTMLCode: string;
var
  List: TStringList;
  Stream: TResourceStream;
begin
  Result := '';

  List := TStringList.Create;
  try
    try
      Stream := TResourceStream.Create(HInstance, RES_MAPA_CODE, RT_RCDATA);
      List.LoadFromStream(Stream);
      Result := List.Text;
      Result := StringReplace(Result, C_API_KEY, FApiKey, []);
//      List.SaveToFile('d:\mapa.html');
    finally
      if Assigned(Stream) then FreeAndNil(Stream);
      if Assigned(List) then FreeAndNil(List);
    end;
  except
    raise Exception.Create(GetTranslateText('No se ha podido cargar el recurso', Language));
  end;
end;

procedure TCustomGMMap.GetCenter(LL: TLatLng);
begin
  if not Assigned(LL) then Exit;

  if Assigned(FWC) and ExecuteScript('MapGetCenter', '') then
  begin
    LL.Lat := ControlPrecision(FWC.GetFloatField(MapForm, MapFormLat), Precision);
    LL.Lng := ControlPrecision(FWC.GetFloatField(MapForm, MapFormLng), Precision);
  end;
end;

function TCustomGMMap.GetMapTypeId: TMapTypeId;
begin
  Result := mtROADMAP;

  if Assigned(FWC) and ExecuteScript('MapGetMapType', '') then
    Result := TCustomTransform.StrToMapTypeId(FWC.GetStringField(MapForm, MapFormMapTypeId));
end;

function TCustomGMMap.GetMaxZoom(LL: TLatLng): Integer;
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  Result := -1;

  if not Assigned(LL) then Exit;

  Params := Format(StrParams, [LL.LatToStr(FPrecision),
                               LL.LngToStr(FPrecision)
                               ]);

  if Assigned(FWC) and ExecuteScript('GetMaxZoom', Params) then
  begin
    repeat
      TGMGenFunc.ProcessMessages;
    until (FWC.GetIntegerField(MaxZoomdForm, MaxZoomdFormResponse) = 1);
    Result := FWC.GetIntegerField(MaxZoomdForm, MaxZoomdFormMaxZoom);
  end;
end;

function TCustomGMMap.GetZoom: Integer;
begin
  Result := 0;

  if Assigned(FWC) and ExecuteScript('MapGetZoom', '') then
    Result := FWC.GetIntegerField(MapForm, MapFormZoom);
end;

function TCustomGMMap.LatLngBoundsContains(LatLng: TLatLng;
  LLB: TLatLngBounds): Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  Result := False;
  if not Assigned(LatLng) or not Assigned(LLB) then Exit;

  Params := Format(StrParams, [LatLng.LatToStr(FPrecision),
                               LatLng.LngToStr(FPrecision),
                               LLB.SW.LatToStr(FPrecision),
                               LLB.SW.LngToStr(FPrecision),
                               LLB.NE.LatToStr(FPrecision),
                               LLB.NE.LngToStr(FPrecision)
                               ]);

  if Assigned(FWC) and ExecuteScript('LatLngBoundsContains', Params) then
    Result := FWC.GetBoolField(LatLngBoundsForm, LatLngBoundsFormContains);
end;

function TCustomGMMap.LatLngBoundsContains(Lat, Lng: Real;
  LLB: TLatLngBounds): Boolean;
var
  LatLng: TLatLng;
begin
  LatLng := TLatLng.Create(ControlPrecision(Lat, Precision), ControlPrecision(Lng, Precision));
  try
    Result := LatLngBoundsContains(LatLng, LLB);
  finally
    FreeAndNil(LatLng);
  end;
end;

procedure TCustomGMMap.LatLngBoundsExtend(LatLng: TLatLng; LLB: TLatLngBounds);
const
  StrParams = '%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  if not Assigned(LLB) or not Assigned(LatLng) then Exit;

  Params := Format(StrParams, [LatLng.LatToStr(FPrecision),
                               LatLng.LngToStr(FPrecision),
                               LLB.SW.LatToStr(FPrecision),
                               LLB.SW.LngToStr(FPrecision),
                               LLB.NE.LatToStr(FPrecision),
                               LLB.NE.LngToStr(FPrecision)
                               ]);
  if Assigned(FWC) and ExecuteScript('LatLngBoundsExtend', Params) then
  begin
    LLB.SW.Lat := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLat), Precision);
    LLB.SW.Lng := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLng), Precision);
    LLB.NE.Lat := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormNELat), Precision);
    LLB.NE.Lng := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormNELng), Precision);
  end;
end;

procedure TCustomGMMap.LatLngBoundsExtend(Lat, Lng: Real; LLB: TLatLngBounds);
var
  LatLng: TLatLng;
begin
  LatLng := TLatLng.Create(ControlPrecision(Lat, Precision), ControlPrecision(Lng, Precision));
  try
    LatLngBoundsExtend(LatLng, LLB);
  finally
    FreeAndNil(LatLng);
  end;
end;

procedure TCustomGMMap.LatLngBoundsGetBounds(LLB : TLatLngBounds);
begin
  if not Assigned(LLB) then Exit;

  if Assigned(FWC) and ExecuteScript('MapGetBounds', '') then
  begin
    LLB.SW.Lat := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLat), Precision);
    LLB.SW.Lng := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLng), Precision);
    LLB.NE.Lat := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormNELat), Precision);
    LLB.NE.Lng := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormNELng), Precision);
  end;
end;

procedure TCustomGMMap.LatLngBoundsGetCenter(LLB: TLatLngBounds; LL: TLatLng);
const
  StrParams = '%s,%s,%s,%s';
var
  Params: string;
begin
  if not Assigned(LL) or not Assigned(LLB) then Exit;

  Params := Format(StrParams, [LLB.SW.LatToStr(FPrecision),
                               LLB.SW.LngToStr(FPrecision),
                               LLB.NE.LatToStr(FPrecision),
                               LLB.NE.LngToStr(FPrecision)]);

  if Assigned(FWC) and ExecuteScript('LatLngBoundsGetCenter', Params) then
  begin
    LL.Lat := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLat), Precision);
    LL.Lng := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLng), Precision);
  end;
end;

procedure TCustomGMMap.LatLngBoundsSetBounds(Bounds: TLatLngBounds);
const
  StrParams = '%s,%s,%s,%s';
var
  Params: string;
begin
  Params := Format(StrParams, [Bounds.SW.LatToStr(FPrecision),
                               Bounds.SW.LngToStr(FPrecision),
                               Bounds.NE.LatToStr(FPrecision),
                               Bounds.NE.LngToStr(FPrecision)]);
  ExecuteScript('MapSetBounds', Params);
end;

procedure TCustomGMMap.LatLngBoundsSetBounds(SWLat, SWLng, NELat, NELng: Real);
var
  LLB: TLatLngBounds;
begin
  LLB := TLatLngBounds.Create(ControlPrecision(SWLat, Precision),
                              ControlPrecision(SWLng, Precision),
                              ControlPrecision(NELat, Precision),
                              ControlPrecision(NELng, Precision));
  try
    LatLngBoundsSetBounds(LLB);
  finally
    FreeAndNil(LLB);
  end;
end;

procedure TCustomGMMap.LatLngBoundsToSpan(LL: TLatLng);
begin
  if not Assigned(LL) then Exit;

  if Assigned(FWC) and ExecuteScript('LatLngBoundsToSpan', '') then
  begin
    LL.Lat := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLat), Precision);
    LL.Lng := ControlPrecision(FWC.GetFloatField(LatLngBoundsForm, LatLngBoundsFormSWLng), Precision);
  end;
end;

function TCustomGMMap.MapIsNull: Boolean;
begin
  Result := FWC.GetIntegerField(MapForm, MapFormMapIsNull, 1) = 1;
end;

function TCustomGMMap.MapLatLngBoundsContains(LatLng: TLatLng): Boolean;
var
  LLB: TLatLngBounds;
begin
  Result := False;
  if not Assigned(LatLng) then Exit;

  LLB := TLatLngBounds.Create;
  try
    LatLngBoundsGetBounds(LLB);
    Result := LatLngBoundsContains(LatLng, LLB);
  finally
    FreeAndNil(LLB);
  end;
end;

procedure TCustomGMMap.MapLatLngBoundsExtend(LatLng: TLatLng;
  LLB: TLatLngBounds);
begin
  if not Assigned(LLB) or not Assigned(LatLng) then Exit;

  LatLngBoundsGetBounds(LLB);
  LatLngBoundsExtend(LatLng, LLB);
  LatLngBoundsSetBounds(LLB);
end;

procedure TCustomGMMap.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (AComponent <> nil) then
    if AComponent = FWebBrowser then
    begin
      BrowserEventsControl;
      FWebBrowser := nil;
    end;
end;

procedure TCustomGMMap.OnTimer(Sender: TObject);
var
  MapEvents: TEventsMapForm;
  MarkerEvents: TEventsMarkerForm;
  InfoWinEvents: TEventsInfoWindowForm;
  PolylineEvents: TEventsPolylineForm;
  RectangleEvents: TEventsRectangleForm;
  CircleEvents: TEventsCircleForm;
  GOEvents: TEventsGOForm;
  DirectionEvents: TEventsDirectionForm;
  EventFired: TEventsFired;

  procedure GetFormFields;
  begin
    // map
    MapEvents.BoundsChanged := FWC.GetBoolField(EventsMapForm, EventsFormBoundsChange);
    MapEvents.CenterChanged := FWC.GetBoolField(EventsMapForm, EventsFormCenterChange);
    MapEvents.Click := FWC.GetBoolField(EventsMapForm, EventsFormClick);
    MapEvents.DblClick := FWC.GetBoolField(EventsMapForm, EventsFormDblClick);
    MapEvents.Drag := FWC.GetBoolField(EventsMapForm, EventsFormDrag);
    MapEvents.DragEnd := FWC.GetBoolField(EventsMapForm, EventsFormDragEnd);
    MapEvents.DragStart := FWC.GetBoolField(EventsMapForm, EventsFormDragStart);
    MapEvents.MapTypeIdChanged := FWC.GetBoolField(EventsMapForm, EventsFormMapTypeIdChanged);
    MapEvents.MouseMove := FWC.GetBoolField(EventsMapForm, EventsFormMouseMove);
    MapEvents.MouseOut := FWC.GetBoolField(EventsMapForm, EventsFormMouseOut);
    MapEvents.MouseOver := FWC.GetBoolField(EventsMapForm, EventsFormMouseOver);
    MapEvents.RightClick := FWC.GetBoolField(EventsMapForm, EventsFormRightClick);
    MapEvents.TilesLoaded := FWC.GetBoolField(EventsMapForm, EventsFormTilesLoaded);
    MapEvents.ZoomChanged := FWC.GetBoolField(EventsMapForm, EventsFormZoomChanged);
    MapEvents.SWLat := FWC.GetFloatField(EventsMapForm, EventsFormSWLat);
    MapEvents.SWLng := FWC.GetFloatField(EventsMapForm, EventsFormSWLng);
    MapEvents.NELat := FWC.GetFloatField(EventsMapForm, EventsFormNELat);
    MapEvents.NELng := FWC.GetFloatField(EventsMapForm, EventsFormNELng);
    MapEvents.Lat := FWC.GetFloatField(EventsMapForm, EventsFormLat);
    MapEvents.Lng := FWC.GetFloatField(EventsMapForm, EventsFormLng);
    MapEvents.X := FWC.GetFloatField(EventsMapForm, EventsFormX);
    MapEvents.Y := FWC.GetFloatField(EventsMapForm, EventsFormY);
    MapEvents.MapTypeId := FWC.GetStringField(EventsMapForm, EventsFormMapTypeId);
    MapEvents.Zoom := FWC.GetIntegerField(EventsMapForm, EventsFormZoom);
    MapEvents.WeatherClick := FWC.GetBoolField(EventsMapForm, EventsFormWeatherClick);
    MapEvents.WeatherLat := FWC.GetFloatField(EventsMapForm, EventsFormWeatherLat);
    MapEvents.WeatherLng := FWC.GetFloatField(EventsMapForm, EventsFormWeatherLng);
    MapEvents.WeatherFeature := FWC.GetStringField(EventsMapForm, EventsFormWeatherFeature);
    MapEvents.PanoClick := FWC.GetBoolField(EventsMapForm, EventsFormPanoClick);
    MapEvents.PanoLat := FWC.GetFloatField(EventsMapForm, EventsFormPanoLat);
    MapEvents.PanoLng := FWC.GetFloatField(EventsMapForm, EventsFormPanoLng);
    MapEvents.PanoAuthor := FWC.GetStringField(EventsMapForm, EventsFormPanoAuthor);
    MapEvents.PanoPhotoId := FWC.GetStringField(EventsMapForm, EventsFormPanoPhotoId);
    MapEvents.PanoTitle := FWC.GetStringField(EventsMapForm, EventsFormPanoTitle);
    MapEvents.PanoUrl := FWC.GetStringField(EventsMapForm, EventsFormPanoUrl);
    MapEvents.PanoUserId := FWC.GetStringField(EventsMapForm, EventsFormPanoUserId);
    // marker
    MarkerEvents.LinkCompId := FWC.GetIntegerField(EventsMarkerForm, EventsFormLinkCompId);
    MarkerEvents.LinkCompZIndex := FWC.GetIntegerField(EventsMarkerForm, EventsFormLinkCompZIndex);
    MarkerEvents.Lat := FWC.GetFloatField(EventsMarkerForm, EventsFormLat);
    MarkerEvents.Lng := FWC.GetFloatField(EventsMarkerForm, EventsFormLng);
    MarkerEvents.Click := FWC.GetBoolField(EventsMarkerForm, EventsFormClick);
    MarkerEvents.DblClick := FWC.GetBoolField(EventsMarkerForm, EventsFormDblClick);
    MarkerEvents.Drag := FWC.GetBoolField(EventsMarkerForm, EventsFormDrag);
    MarkerEvents.DragEnd := FWC.GetBoolField(EventsMarkerForm, EventsFormDragEnd);
    MarkerEvents.DragStart := FWC.GetBoolField(EventsMarkerForm, EventsFormDragStart);
    MarkerEvents.MouseDown := FWC.GetBoolField(EventsMarkerForm, EventsFormMouseDown);
    MarkerEvents.MouseOut := FWC.GetBoolField(EventsMarkerForm, EventsFormMouseOut);
    MarkerEvents.MouseOver := FWC.GetBoolField(EventsMarkerForm, EventsFormMouseOver);
    MarkerEvents.MouseUp := FWC.GetBoolField(EventsMarkerForm, EventsFormMouseUp);
    MarkerEvents.RightClick := FWC.GetBoolField(EventsMarkerForm, EventsFormRightClick);
    // InfoWindow
    InfoWinEvents.LinkCompId := FWC.GetIntegerField(EventsInfoWinForm, EventsFormLinkCompId);
    InfoWinEvents.LinkCompZIndex := FWC.GetIntegerField(EventsInfoWinForm, EventsFormLinkCompZIndex);
    InfoWinEvents.InfoWinCloseClick := FWC.GetBoolField(EventsInfoWinForm, EventsFormInfoWinCloseClick);
    // Polyline
    PolylineEvents.LinkCompId := FWC.GetIntegerField(EventsPolylineForm, EventsFormLinkCompId);
    PolylineEvents.LinkCompZIndex := FWC.GetIntegerField(EventsPolylineForm, EventsFormLinkCompZIndex);
    PolylineEvents.Lat := FWC.GetFloatField(EventsPolylineForm, EventsFormLat);
    PolylineEvents.Lng := FWC.GetFloatField(EventsPolylineForm, EventsFormLng);
    PolylineEvents.Click := FWC.GetBoolField(EventsPolylineForm, EventsFormClick);
    PolylineEvents.DblClick := FWC.GetBoolField(EventsPolylineForm, EventsFormDblClick);
    PolylineEvents.MouseDown := FWC.GetBoolField(EventsPolylineForm, EventsFormMouseDown);
    PolylineEvents.MouseMove := FWC.GetBoolField(EventsPolylineForm, EventsFormMouseMove);
    PolylineEvents.MouseOut := FWC.GetBoolField(EventsPolylineForm, EventsFormMouseOut);
    PolylineEvents.MouseOver := FWC.GetBoolField(EventsPolylineForm, EventsFormMouseOver);
    PolylineEvents.MouseUp := FWC.GetBoolField(EventsPolylineForm, EventsFormMouseUp);
    PolylineEvents.RightClick := FWC.GetBoolField(EventsPolylineForm, EventsFormRightClick);
    // Rectangle
    RectangleEvents.LinkCompId := FWC.GetIntegerField(EventsRectangleForm, EventsFormLinkCompId);
    RectangleEvents.LinkCompZIndex := FWC.GetIntegerField(EventsRectangleForm, EventsFormLinkCompZIndex);
    RectangleEvents.Lat := FWC.GetFloatField(EventsRectangleForm, EventsFormLat);
    RectangleEvents.Lng := FWC.GetFloatField(EventsRectangleForm, EventsFormLng);
    RectangleEvents.NELat := FWC.GetFloatField(EventsRectangleForm, EventsFormNELat);
    RectangleEvents.NELng := FWC.GetFloatField(EventsRectangleForm, EventsFormNELng);
    RectangleEvents.SWLat := FWC.GetFloatField(EventsRectangleForm, EventsFormSWLat);
    RectangleEvents.SWLng := FWC.GetFloatField(EventsRectangleForm, EventsFormSWLng);
    RectangleEvents.BoundsChange := FWC.GetBoolField(EventsRectangleForm, EventsFormBoundsChange);
    RectangleEvents.Click := FWC.GetBoolField(EventsRectangleForm, EventsFormClick);
    RectangleEvents.DblClick := FWC.GetBoolField(EventsRectangleForm, EventsFormDblClick);
    RectangleEvents.MouseDown := FWC.GetBoolField(EventsRectangleForm, EventsFormMouseDown);
    RectangleEvents.MouseMove := FWC.GetBoolField(EventsRectangleForm, EventsFormMouseMove);
    RectangleEvents.MouseOut := FWC.GetBoolField(EventsRectangleForm, EventsFormMouseOut);
    RectangleEvents.MouseOver := FWC.GetBoolField(EventsRectangleForm, EventsFormMouseOver);
    RectangleEvents.MouseUp := FWC.GetBoolField(EventsRectangleForm, EventsFormMouseUp);
    RectangleEvents.RightClick := FWC.GetBoolField(EventsRectangleForm, EventsFormRightClick);
    // Circle
    CircleEvents.LinkCompId := FWC.GetIntegerField(EventsCircleForm, EventsFormLinkCompId);
    CircleEvents.LinkCompZIndex := FWC.GetIntegerField(EventsCircleForm, EventsFormLinkCompZIndex);
    CircleEvents.Lat := FWC.GetFloatField(EventsCircleForm, EventsFormLat);
    CircleEvents.Lng := FWC.GetFloatField(EventsCircleForm, EventsFormLng);
    CircleEvents.Radius := FWC.GetFloatField(EventsCircleForm, EventsFormCircleRadius);
    CircleEvents.CenterChange := FWC.GetBoolField(EventsCircleForm, EventsFormCenterChange);
    CircleEvents.RadiusChange := FWC.GetBoolField(EventsCircleForm, EventsFormCircleRadiusChange);
    CircleEvents.Click := FWC.GetBoolField(EventsCircleForm, EventsFormClick);
    CircleEvents.DblClick := FWC.GetBoolField(EventsCircleForm, EventsFormDblClick);
    CircleEvents.MouseDown := FWC.GetBoolField(EventsCircleForm, EventsFormMouseDown);
    CircleEvents.MouseMove := FWC.GetBoolField(EventsCircleForm, EventsFormMouseMove);
    CircleEvents.MouseOut := FWC.GetBoolField(EventsCircleForm, EventsFormMouseOut);
    CircleEvents.MouseOver := FWC.GetBoolField(EventsCircleForm, EventsFormMouseOver);
    CircleEvents.MouseUp := FWC.GetBoolField(EventsCircleForm, EventsFormMouseUp);
    CircleEvents.RightClick := FWC.GetBoolField(EventsCircleForm, EventsFormRightClick);
    // GroundOverlay
    GOEvents.LinkCompId := FWC.GetIntegerField(EventsGroundOverlay, EventsFormLinkCompId);
    GOEvents.LinkCompZIndex := FWC.GetIntegerField(EventsGroundOverlay, EventsFormLinkCompZIndex);
    GOEvents.Lat := FWC.GetFloatField(EventsGroundOverlay, EventsFormLat);
    GOEvents.Lng := FWC.GetFloatField(EventsGroundOverlay, EventsFormLng);
    GOEvents.Click := FWC.GetBoolField(EventsGroundOverlay, EventsFormClick);
    GOEvents.DblClick := FWC.GetBoolField(EventsGroundOverlay, EventsFormDblClick);
    // Direction
    DirectionEvents.LinkCompId := FWC.GetIntegerField(EventsDirectionForm, EventsFormLinkCompId);
    DirectionEvents.LinkCompZIndex := FWC.GetIntegerField(EventsDirectionForm, EventsFormLinkCompZIndex);
    DirectionEvents.XML := FWC.GetStringField(EventsDirectionForm, EventsFormXML);
    DirectionEvents.DirectionsChanged := FWC.GetBoolField(EventsDirectionForm, EventsFormDirectionsChanged);
  end;

  procedure InitializeFlags;
  begin
    // map
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormZoomChanged, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormTilesLoaded, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormRightClick, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormMouseOver, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormMouseOut, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormMouseMove, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormMapTypeIdChanged, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormDragStart, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormDragEnd, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormDrag, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormDblClick, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormClick, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormCenterChange, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormBoundsChange, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormWeatherClick, '0');
    FWC.WebFormSetFieldValue(EventsMapForm, EventsFormPanoClick, '0');
    // marker
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormLinkCompZIndex, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormClick, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormDblClick, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormDrag, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormDragEnd, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormDragStart, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormMouseDown, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormMouseOut, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormMouseOver, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormMouseUp, '0');
    FWC.WebFormSetFieldValue(EventsMarkerForm, EventsFormRightClick, '0');
    // InfoWindow
    FWC.WebFormSetFieldValue(EventsInfoWinForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsInfoWinForm, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsInfoWinForm, EventsFormLinkCompZIndex, '0');
    FWC.WebFormSetFieldValue(EventsInfoWinForm, EventsFormInfoWinCloseClick, '0');
    // polyline
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormLinkCompZIndex, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormClick, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormDblClick, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormMouseDown, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormMouseMove, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormMouseOut, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormMouseOver, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormMouseUp, '0');
    FWC.WebFormSetFieldValue(EventsPolylineForm, EventsFormRightClick, '0');
    // rectangle
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormLinkCompZIndex, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormBoundsChange, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormClick, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormDblClick, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormMouseDown, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormMouseMove, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormMouseOut, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormMouseOver, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormMouseUp, '0');
    FWC.WebFormSetFieldValue(EventsRectangleForm, EventsFormRightClick, '0');
    // circle
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormLinkCompZIndex, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormCenterChange, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormCircleRadiusChange, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormClick, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormDblClick, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormMouseDown, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormMouseMove, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormMouseOut, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormMouseOver, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormMouseUp, '0');
    FWC.WebFormSetFieldValue(EventsCircleForm, EventsFormRightClick, '0');
    // ground overlay
    FWC.WebFormSetFieldValue(EventsGroundOverlay, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsGroundOverlay, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsGroundOverlay, EventsFormLinkCompZIndex, '0');
    //FWC.WebFormSetFieldValue(EventsGroundOverlay, EventsFormClick, '0');
    FWC.WebFormSetFieldValue(EventsGroundOverlay, EventsFormDblClick, '0');
    // direction
    FWC.WebFormSetFieldValue(EventsDirectionForm, EventsFormEventFired, '0');
    FWC.WebFormSetFieldValue(EventsDirectionForm, EventsFormLinkCompId, '0');
    FWC.WebFormSetFieldValue(EventsDirectionForm, EventsFormLinkCompZIndex, '0');
    FWC.WebFormSetFieldValue(EventsDirectionForm, EventsFormDirectionsChanged, '0');
  end;

  function GetEventsFired(var EF: TEventsFired): Boolean;
  begin
    EF.Map := FWC.GetIntegerField(EventsMapForm, EventsFormEventFired) = 1;
    EF.InfoWin := FWC.GetIntegerField(EventsInfoWinForm, EventsFormEventFired) = 1;
    EF.Marker := FWC.GetIntegerField(EventsMarkerForm, EventsFormEventFired) = 1;
    EF.Polyline := FWC.GetIntegerField(EventsPolylineForm, EventsFormEventFired) = 1;
    EF.Rectangle := FWC.GetIntegerField(EventsRectangleForm, EventsFormEventFired) = 1;
    EF.Circle := FWC.GetIntegerField(EventsCircleForm, EventsFormEventFired) = 1;
    EF.GO := FWC.GetIntegerField(EventsGroundOverlay, EventsFormEventFired) = 1;
    EF.Direction := FWC.GetIntegerField(EventsDirectionForm, EventsFormEventFired) = 1;

    // cogemos campos del formulario // get form fields
    GetFormFields;
    // inicializamos banderas // initialize flags
    InitializeFlags;

    Result := EF.Map or EF.InfoWin or EF.Marker or EF.Polyline or EF.Rectangle or
              EF.Circle or EF.GO or EF.Direction;
  end;

  procedure MapEvent;
  var
    LLB: TLatLngBounds;
    LL: TLatLng;
    Weather: TWeatherFeature;
    Pano: TPanoramioFeature;
  begin
    // Map bounds_changed
    if MapEvents.BoundsChanged and Assigned(FOnBoundsChanged) then
    begin
      LLB := TLatLngBounds.Create(
                      ControlPrecision(MapEvents.SWLat, Precision),
                      ControlPrecision(MapEvents.SWLng, Precision),
                      ControlPrecision(MapEvents.NELat, Precision),
                      ControlPrecision(MapEvents.NELng, Precision));
      try
        FOnBoundsChanged(Self, LLB);
      finally
        FreeAndNil(LLB);
      end;
    end;

    // Map center_changed, click, dblclick, mousemove, mouseout, mouseover, rightclick
    if MapEvents.CenterChanged or MapEvents.Click or MapEvents.DblClick or MapEvents.MouseMove or
       MapEvents.MouseOut or MapEvents.MouseOver or MapEvents.RightClick then
    begin
      LL := TLatLng.Create(ControlPrecision(MapEvents.Lat, Precision), ControlPrecision(MapEvents.Lng, Precision));
      try
        if MapEvents.CenterChanged and Assigned(FOnCenterChanged) then
        begin
          if not FIsUpdating then
          begin
            FIsUpdating := True;
            FRequiredProp.Center.Assign(LL);
          end;
          FIsUpdating := False;
          {if Assigned(FOnCenterChanged) then} FOnCenterChanged(Self, LL, MapEvents.X, MapEvents.Y);
        end;
        if MapEvents.Click and Assigned(FOnClick) then FOnClick(Self, LL, MapEvents.X, MapEvents.Y);
        if MapEvents.DblClick and Assigned(FOnDblClick) then FOnDblClick(Self, LL, MapEvents.X, MapEvents.Y);
        if MapEvents.MouseMove and Assigned(FOnMouseMove) then FOnMouseMove(Self, LL, MapEvents.X, MapEvents.Y);
        if MapEvents.MouseOut and Assigned(FOnMouseOut) then FOnMouseOut(Self, LL, MapEvents.X, MapEvents.Y);
        if MapEvents.MouseOver and Assigned(FOnMouseOver) then FOnMouseOver(Self, LL, MapEvents.X, MapEvents.Y);
        if MapEvents.RightClick and Assigned(FOnRightClick) then FOnRightClick(Self, LL, MapEvents.X, MapEvents.Y);
      finally
        FreeAndNil(LL);
      end;
    end;

    // Map drag, dargend, dragstart
    if MapEvents.Drag and Assigned(FOnDrag) then FOnDrag(Self);
    if MapEvents.DragEnd and Assigned(FOnDragEnd) then
    begin
      LL := TLatLng.Create;
      try
        GetCenter(LL);
        FRequiredProp.Center.Assign(LL);
      finally
        FreeAndNil(LL);
      end;
      if Assigned(FOnDragEnd) then FOnDragEnd(Self);
    end;
    if MapEvents.DragStart and Assigned(FOnDragStart) then FOnDragStart(Self);

    // Map MapTypeIdChanged
    if MapEvents.MapTypeIdChanged then
    begin
      if not FIsUpdating then
      begin
        FIsUpdating := True;
        FRequiredProp.MapType := TCustomTransform.StrToMapTypeId(MapEvents.MapTypeId);
        if Assigned(FOnMapTypeIdChanged) then FOnMapTypeIdChanged(Self, RequiredProp.MapType);
      end;
      FIsUpdating := False;
    end;

    // Map TilesLoaded
    if MapEvents.TilesLoaded and Assigned(FAfterPageLoaded) then AfterPageLoaded(Self, False);

    // Map ZoomChanged
    if MapEvents.ZoomChanged then
    begin
      if not FIsUpdating then
      begin
        FIsUpdating := True;
        FRequiredProp.Zoom := MapEvents.Zoom;
        if Assigned(FOnZoomChanged) then FOnZoomChanged(Self, MapEvents.Zoom);
      end;
      FIsUpdating := False;
    end;

    // Map WeatherClick
    if MapEvents.WeatherClick then
    begin
      LL := TLatLng.Create(ControlPrecision(MapEvents.WeatherLat, Precision), ControlPrecision(MapEvents.WeatherLng, Precision));
      Weather := TWeatherFeature.Create;
      Weather.ProcessXMLData(MapEvents.WeatherFeature);

      if Assigned(FOnWeatherClick) then FOnWeatherClick(Self, LL, Weather);
    end;

    // Map PanoramioClick
    if MapEvents.PanoClick then
    begin
      LL := TLatLng.Create(ControlPrecision(MapEvents.PanoLat, Precision), ControlPrecision(MapEvents.PanoLng, Precision));
      Pano := TPanoramioFeature.Create;
      Pano.FAuthor := MapEvents.PanoAuthor;
      Pano.FUserId := MapEvents.PanoUserId;
      Pano.FPhotoId := MapEvents.PanoPhotoId;
      Pano.FTitle := MapEvents.PanoTitle;
      Pano.FUrl := MapEvents.PanoUrl;

      if Assigned(FOnPanoramioClick) then FOnPanoramioClick(Self, LL, Pano);
    end;
  end;

  procedure MarkerEvent;
  var
    LinkComp: Integer;
  begin
    // Marker events
    if not MarkerEvents.Click and not MarkerEvents.DblClick and not MarkerEvents.Drag and
       not MarkerEvents.DragEnd and not MarkerEvents.DragStart and not MarkerEvents.MouseDown and
       not MarkerEvents.MouseOut and not MarkerEvents.MouseOver and not MarkerEvents.MouseUp and
       not MarkerEvents.RightClick then
      Exit;

    LinkComp := ExistLinkedComponent(MarkerEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    if not (TGMLinkedComponent(FLinkedComponents[LinkComp]) is TCustomGMMarker) then
      raise Exception.Create(GetTranslateText('Id de JavaScript incorrecto', Language));

    with TGMLinkedComponent(FLinkedComponents[LinkComp]), MarkerEvents do
    begin
      if Click then EventFired(etMarkerClick, [Lat, Lng, LinkCompZIndex]);
      if DblClick then EventFired(etMarkerDblClick, [Lat, Lng, LinkCompZIndex]);
      if Drag then EventFired(etMarkerDrag, [Lat, Lng, LinkCompZIndex]);
      if DragEnd then EventFired(etMarkerDragEnd, [Lat, Lng, LinkCompZIndex]);
      if DragStart then EventFired(etMarkerDragStart, [Lat, Lng, LinkCompZIndex]);
      if MouseDown then EventFired(etMarkerMouseDown, [Lat, Lng, LinkCompZIndex]);
      if MouseOut then EventFired(etMarkerMouseOut, [Lat, Lng, LinkCompZIndex]);
      if MouseOver then EventFired(etMarkerMouseOver, [Lat, Lng, LinkCompZIndex]);
      if MouseUp then EventFired(etMarkerMouseUp, [Lat, Lng, LinkCompZIndex]);
      if RightClick then EventFired(etMarkerRightClick, [Lat, Lng, LinkCompZIndex]);
    end;
  end;

  procedure InfoWindowEvent;
  var
    LinkComp: Integer;
  begin
    // InfoWindow events
    if not InfoWinEvents.InfoWinCloseClick then Exit;

    LinkComp := ExistLinkedComponent(InfoWinEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    with TGMLinkedComponent(FLinkedComponents[LinkComp]), InfoWinEvents do
    begin
      if InfoWinCloseClick then EventFired(etInfoWinCloseClick, [LinkCompZIndex]);
    end;
  end;

  procedure PolylineEvent;
  var
    LinkComp: Integer;
  begin
    // Polyline and polygon events
    if not PolylineEvents.Click and not PolylineEvents.DblClick and not PolylineEvents.MouseDown and
       not PolylineEvents.MouseMove and not PolylineEvents.MouseOut and not PolylineEvents.MouseOver and
       not PolylineEvents.MouseUp and not PolylineEvents.RightClick then
      Exit;

    LinkComp := ExistLinkedComponent(PolylineEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    if not (TGMLinkedComponent(FLinkedComponents[LinkComp]) is TGMBasePolyline) then
      raise Exception.Create(GetTranslateText('Id de JavaScript incorrecto', Language));

    with TGMLinkedComponent(FLinkedComponents[LinkComp]), PolylineEvents do
    begin
      if Click then EventFired(etPolylineClick, [Lat, Lng, LinkCompZIndex]);
      if DblClick then EventFired(etPolylineDblClick, [Lat, Lng, LinkCompZIndex]);
      if MouseDown then EventFired(etPolylineMouseDown, [Lat, Lng, LinkCompZIndex]);
      if MouseMove then EventFired(etPolylineMouseMove, [Lat, Lng, LinkCompZIndex]);
      if MouseOut then EventFired(etPolylineMouseOut, [Lat, Lng, LinkCompZIndex]);
      if MouseOver then EventFired(etPolylineMouseOver, [Lat, Lng, LinkCompZIndex]);
      if MouseUp then EventFired(etPolylineMouseUp, [Lat, Lng, LinkCompZIndex]);
      if RightClick then EventFired(etPolylineRightClick, [Lat, Lng, LinkCompZIndex]);
    end;
  end;

  procedure CheckAutoUpdatePath;
  var
    i, j: Integer;
  begin
    for i := 0 to FLinkedComponents.Count - 1 do
    begin
      if not (TGMLinkedComponent(FLinkedComponents[i]) is TGMBasePolyline) then Continue;

      for j := 0 to TGMBasePolyline(FLinkedComponents[i]).VisualObjects.Count - 1 do
      begin
        if TGMBasePolyline(FLinkedComponents[i])[j].AutoUpdatePath then
          TGMBasePolyline(FLinkedComponents[i])[j].GetPath;
      end;
    end;
  end;

  procedure RectangleEvent;
  var
    LinkComp: Integer;
  begin
    // Rectangle events
    if not RectangleEvents.Click and not RectangleEvents.DblClick and not RectangleEvents.MouseDown and
       not RectangleEvents.MouseMove and not RectangleEvents.MouseOut and not RectangleEvents.MouseOver and
       not RectangleEvents.MouseUp and not RectangleEvents.RightClick and not RectangleEvents.BoundsChange then
      Exit;

    LinkComp := ExistLinkedComponent(RectangleEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    if not (TGMLinkedComponent(FLinkedComponents[LinkComp]) is TCustomGMRectangle) then
      raise Exception.Create(GetTranslateText('Id de JavaScript incorrecto', Language));

    with TGMLinkedComponent(FLinkedComponents[LinkComp]), RectangleEvents do
    begin
      if Click then EventFired(etRectangleClick, [Lat, Lng, LinkCompZIndex]);
      if DblClick then EventFired(etRectangleDblClick, [Lat, Lng, LinkCompZIndex]);
      if MouseDown then EventFired(etRectangleMouseDown, [Lat, Lng, LinkCompZIndex]);
      if MouseMove then EventFired(etRectangleMouseMove, [Lat, Lng, LinkCompZIndex]);
      if MouseOut then EventFired(etRectangleMouseOut, [Lat, Lng, LinkCompZIndex]);
      if MouseOver then EventFired(etRectangleMouseOver, [Lat, Lng, LinkCompZIndex]);
      if MouseUp then EventFired(etRectangleMouseUp, [Lat, Lng, LinkCompZIndex]);
      if RightClick then EventFired(etRectangleRightClick, [Lat, Lng, LinkCompZIndex]);
      if BoundsChange then EventFired(etRectangleBoundsChange, [LinkCompZIndex, NELat, NELng, SWLat, SWLng]);
    end;
  end;

  procedure CircleEvent;
  var
    LinkComp: Integer;
  begin
    // Circle events
    if not CircleEvents.Click and not CircleEvents.DblClick and not CircleEvents.MouseDown and
       not CircleEvents.MouseMove and not CircleEvents.MouseOut and not CircleEvents.MouseOver and
       not CircleEvents.MouseUp and not CircleEvents.RightClick and not CircleEvents.CenterChange and
       not CircleEvents.RadiusChange then
      Exit;

    LinkComp := ExistLinkedComponent(CircleEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    if not (TGMLinkedComponent(FLinkedComponents[LinkComp]) is TCustomGMCircle) then
      raise Exception.Create(GetTranslateText('Id de JavaScript incorrecto', Language));

    with TGMLinkedComponent(FLinkedComponents[LinkComp]), CircleEvents do
    begin
      if Click then EventFired(etCircleClick, [Lat, Lng, LinkCompZIndex]);
      if DblClick then EventFired(etCircleDblClick, [Lat, Lng, LinkCompZIndex]);
      if MouseDown then EventFired(etCircleMouseDown, [Lat, Lng, LinkCompZIndex]);
      if MouseMove then EventFired(etCircleMouseMove, [Lat, Lng, LinkCompZIndex]);
      if MouseOut then EventFired(etCircleMouseOut, [Lat, Lng, LinkCompZIndex]);
      if MouseOver then EventFired(etCircleMouseOver, [Lat, Lng, LinkCompZIndex]);
      if MouseUp then EventFired(etCircleMouseUp, [Lat, Lng, LinkCompZIndex]);
      if RightClick then EventFired(etCircleRightClick, [Lat, Lng, LinkCompZIndex]);
      if RadiusChange then EventFired(etCircleRadiusChange, [CircleEvents.Radius, LinkCompZIndex, RadiusChange]);
      if CenterChange then EventFired(etCircleCenterChange, [Lat, Lng, LinkCompZIndex]);
    end;
  end;

  procedure GroundOverlayEvent;
  var
    LinkComp: Integer;
  begin
    // GroundOverlay events
    if not GOEvents.Click and not GOEvents.DblClick then Exit;

    LinkComp := ExistLinkedComponent(GOEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    if not (TGMLinkedComponent(FLinkedComponents[LinkComp]) is TGMGroundOverlay) then
      raise Exception.Create(GetTranslateText('Id de JavaScript incorrecto', Language));

    with TGMLinkedComponent(FLinkedComponents[LinkComp]), GOEvents do
    begin
      if Click then EventFired(etGOClick, [Lat, Lng, LinkCompZIndex]);
      if DblClick then EventFired(etGODblClick, [Lat, Lng, LinkCompZIndex]);
    end;
  end;

  procedure DirectionEvent;
  var
    LinkComp: Integer;
  begin
    // Direction events
    if not DirectionEvents.DirectionsChanged then Exit;

    LinkComp := ExistLinkedComponent(DirectionEvents.LinkCompId);
    if LinkComp = -1 then
      raise Exception.Create(GetTranslateText('Id de JavaScript inexistente', Language));

    if not (TGMObjects(FLinkedComponents[LinkComp]) is TCustomGMDirection) then
      raise Exception.Create(GetTranslateText('Id de JavaScript incorrecto', Language));

    with TCustomGMDirection(FLinkedComponents[LinkComp]), DirectionEvents do
      if DirectionsChanged then EventFired(etDirectionsChanged, [XML, LinkCompZIndex]);
  end;
begin
  if csDesigning in ComponentState then Exit;
  if not Assigned(FWebBrowser) or not FDocLoaded or not FIsDoMap then Exit;

  if not GetEventsFired(EventFired) then Exit;

  // map events
  if EventFired.Map then MapEvent;

  // marker events
  if EventFired.Marker then MarkerEvent;

  // infoWindow event
  if EventFired.InfoWin then InfoWindowEvent;

  // polyline or polygon events
  if EventFired.Polyline then PolylineEvent;

  // check AutoUpdatePath
  CheckAutoUpdatePath;

  // rectangle events
  if EventFired.Rectangle then RectangleEvent;

  // circle events
  if EventFired.Circle then CircleEvent;

  // groundoverlay events
  if EventFired.GO then GroundOverlayEvent;

  // direction events
  if EventFired.Direction then DirectionEvent;
end;

procedure TCustomGMMap.PanBy(x, y: Integer);
begin
  ExecuteScript('MapPanBy', Format('%s,%s', [IntToStr(x), IntToStr(y)]));
end;

procedure TCustomGMMap.PanTo(const Lat, Lng: Real);
var
  LatLng: TLatLng;
begin
  LatLng := TLatLng.Create(ControlPrecision(Lat, Precision), ControlPrecision(Lng, Precision));
  try
    PanTo(LatLng);
  finally
    if Assigned(LatLng) then FreeAndNil(LatLng);
  end;
end;

procedure TCustomGMMap.PrintNoDialog;
begin
  if Assigned(FWebBrowser) and Assigned(FWC) then
    FWC.WebPrintWithoutDialog;
end;

procedure TCustomGMMap.PrintPageSetup;
begin
  if Assigned(FWebBrowser) and Assigned(FWC) then
    FWC.WebPrintPageSetup;
end;

procedure TCustomGMMap.PrintPreview;
begin
  if Assigned(FWebBrowser) and Assigned(FWC) then
    FWC.WebPreview;
end;

procedure TCustomGMMap.PrintWithDialog;
begin
  if Assigned(FWebBrowser) and Assigned(FWC) then
    FWC.WebPrintWithDialog;
end;

procedure TCustomGMMap.PanTo(LatLng: TLatLng);
begin
  ExecuteScript('MapPanTo', Format('%s,%s', [LatLng.LatToStr(FPrecision), LatLng.LngToStr(FPrecision)]));
end;

procedure TCustomGMMap.RemoveLinkedComponent(GMObject: TGMObjects);
begin
  if Assigned(FLinkedComponents) then
    FLinkedComponents.Remove(GMObject);
end;

procedure TCustomGMMap.SetAPIKey(const Value: string);
begin
  if FAPIKey = Value then Exit;

  FAPIKey := Trim(Value);
  if FActive then FActive := False;
end;

procedure TCustomGMMap.SetActive(const Value: Boolean);
begin
  if FActive = Value then Exit;

  FActive := Value;

  if csDesigning in ComponentState then Exit;

  if Assigned(FWebBrowser) then
  begin
    if FActive then
      LoadBaseWeb
    else
    begin
      FIsDoMap := False;
      LoadBlankPage;
    end;
  end;

  SetEnableTimer(FActive);

  if Assigned(FOnActiveChange) then FOnActiveChange(Self);
end;

procedure TCustomGMMap.SetCenter(LatLng: TLatLng);
var
  Lat, Lng: string;
begin
  if Assigned(LatLng) then
  begin
    Lng := LatLng.LngToStr(FPrecision);
    Lat := LatLng.LatToStr(FPrecision);

    if Assigned(FWebBrowser) and FActive and FDocLoaded then
      ExecuteScript('MapSetCenter', Format('%s,%s', [Lat, Lng]));
  end;
end;

procedure TCustomGMMap.SetCenter(const Lat, Lng: Real);
var
  LatLng: TLatLng;
begin
  LatLng := TLatLng.Create(ControlPrecision(Lat, Precision), ControlPrecision(Lng, Precision));
  try
    SetCenter(LatLng);
  finally
    if Assigned(LatLng) then FreeAndNil(LatLng);
  end;
end;

procedure TCustomGMMap.SetIntervalEvents(const Value: Integer);
begin
  if FIntervalEvents = Value then Exit;

  FIntervalEvents := Value;

  SetIntervalTimer(FIntervalEvents);

  if Assigned(FOnIntervalEventsChange) then FOnIntervalEventsChange(Self);
end;

procedure TCustomGMMap.SetMapTypeId(MapTypeId: TMapTypeId);
begin
  SetMapTypeId(TCustomTransform.MapTypeIdToStr(MapTypeId));
end;

procedure TCustomGMMap.SetMapTypeId(const MapTypeId: string);
begin
  ExecuteScript('MapSetMapTypeId', QuotedStr(MapTypeId));
end;

procedure TCustomGMMap.SetPrecision(const Value: Integer);
begin
  if FPrecision = Value then Exit;

  FPrecision := Value;

  if FPrecision < 0 then FPrecision := 0;
  if FPrecision > 17 then FPrecision := 17;

  if Assigned(FOnPrecisionChange) then FOnPrecisionChange(Self);
end;

procedure TCustomGMMap.SetZoom(Zoom: Integer);
begin
  ExecuteScript('MapSetZoom', IntToStr(Zoom));
end;

procedure TCustomGMMap.ZoomToPoints(Points: array of TLatLng);
begin
  ExecuteScript('MapZoomToPoints', QuotedStr(TGMGenFunc.PointsToStr(Points, FPrecision)));
end;

{ TRequiredProp }

procedure TRequiredProp.Assign(Source: TPersistent);
begin
  if Source is TRequiredProp then
  begin
    Center.Assign(TRequiredProp(Source).Center);
    MapType := TRequiredProp(Source).MapType;
    Zoom := TRequiredProp(Source).Zoom;
  end
  else
    inherited Assign(Source);
end;

constructor TRequiredProp.Create(GMMap: TCustomGMMap);
begin
  FCenter := TLatLng.Create(0,0);
  FMapType := mtROADMAP;
  FZoom := 8;
  FGMMap := GMMap;
end;

destructor TRequiredProp.Destroy;
begin
  if Assigned(FCenter) then FreeAndNil(FCenter);

  inherited;
end;

procedure TRequiredProp.SetMapType(const Value: TMapTypeId);
begin
  if FMapType = Value then Exit;

  FMapType := Value;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap and not FGMMap.FIsUpdating then
  begin
    FGMMap.FIsUpdating := True;
    FGMMap.SetMapTypeId(FMapType);
    if Assigned(FGMMap.OnMapTypeIdChanged) then FGMMap.OnMapTypeIdChanged(FGMMap, FMapType);
  end;
end;

procedure TRequiredProp.SetZoom(const Value: Integer);
begin
  if FZoom = Value then Exit;

  FZoom := Value;
  if FZoom > 21 then FZoom := 21;
  if FZoom < 0 then FZoom := 0;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap and not FGMMap.FIsUpdating then
  begin
    FGMMap.FIsUpdating := True;
    FGMMap.SetZoom(FZoom);
    if Assigned(FGMMap.OnZoomChanged) then FGMMap.OnZoomChanged(FGMMap, FZoom);
  end;
end;

{ TMapTypeControlOptions }

procedure TMapTypeControlOptions.Assign(Source: TPersistent);
begin
  if Source is TMapTypeControlOptions then
  begin
    MapTypeIds := TMapTypeControlOptions(Source).MapTypeIds;
    Position := TMapTypeControlOptions(Source).Position;
    Style := TMapTypeControlOptions(Source).Style;
    Show := TMapTypeControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TMapTypeControlOptions.Create;
begin
  FPosition := cpTOP_RIGHT;
  FStyle := mtcDEFAULT;
  FShow := True;
  FMapTypeIds := [mtHYBRID, mtROADMAP, mtSATELLITE, mtTERRAIN, mtOSM];
end;

{ TOverviewMapControlOptions }

procedure TOverviewMapControlOptions.Assign(Source: TPersistent);
begin
  if Source is TOverviewMapControlOptions then
  begin
    Opened := TOverviewMapControlOptions(Source).Opened;
    Show := TOverviewMapControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TOverviewMapControlOptions.Create;
begin
  FOpened := True;
  FShow := True;
end;

{ TPanControlOptions }

procedure TPanControlOptions.Assign(Source: TPersistent);
begin
  if Source is TPanControlOptions then
  begin
    Position := TPanControlOptions(Source).Position;
    Show := TPanControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TPanControlOptions.Create;
begin
  FPosition := cpTOP_LEFT;
  FShow := True;
end;

{ TRotateControlOptions }

procedure TRotateControlOptions.Assign(Source: TPersistent);
begin
  if Source is TRotateControlOptions then
  begin
    Position := TRotateControlOptions(Source).Position;
    Show := TRotateControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TRotateControlOptions.Create;
begin
  FPosition := cpTOP_LEFT;
  FShow := True;
end;

{ TScaleControlOptions }

procedure TScaleControlOptions.Assign(Source: TPersistent);
begin
  if Source is TScaleControlOptions then
  begin
    Position := TScaleControlOptions(Source).Position;
    Style := TScaleControlOptions(Source).Style;
    Show := TScaleControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TScaleControlOptions.Create;
begin
  FPosition := cpBOTTOM_LEFT;
  FStyle := scDEFAULT;
  FShow := True;
end;

{ TStreetViewControlOptions }

procedure TStreetViewControlOptions.Assign(Source: TPersistent);
begin
  if Source is TStreetViewControlOptions then
  begin
    Position := TStreetViewControlOptions(Source).Position;
    Show := TStreetViewControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TStreetViewControlOptions.Create;
begin
  FPosition := cpTOP_LEFT;
  FShow := True;
end;

{ TZoomControlOptions }

procedure TZoomControlOptions.Assign(Source: TPersistent);
begin
  if Source is TZoomControlOptions then
  begin
    Position := TZoomControlOptions(Source).Position;
    Style := TZoomControlOptions(Source).Style;
    Show := TZoomControlOptions(Source).Show;
  end
  else
    inherited Assign(Source);
end;

constructor TZoomControlOptions.Create;
begin
  FPosition := cpTOP_LEFT;
  FStyle := zcDEFAULT;
  FShow := True;
end;

{ TCustomVisualProp }

procedure TCustomVisualProp.Assign(Source: TPersistent);
begin
  if Source is TCustomVisualProp then
  begin
    MapTypeCtrl.Assign(TCustomVisualProp(Source).MapTypeCtrl);
    OverviewMapCtrl.Assign(TCustomVisualProp(Source).OverviewMapCtrl);
    PanCtrl.Assign(TCustomVisualProp(Source).PanCtrl);
    RotateCtrl.Assign(TCustomVisualProp(Source).RotateCtrl);
    ScaleCtrl.Assign(TCustomVisualProp(Source).ScaleCtrl);
    StreetViewCtrl.Assign(TCustomVisualProp(Source).StreetViewCtrl);
    ZoomCtrl.Assign(TCustomVisualProp(Source).ZoomCtrl);
  end
  else
    inherited Assign(Source);
end;

constructor TCustomVisualProp.Create;
begin
  FMapTypeCtrl := TMapTypeControlOptions.Create;
  FOverviewMapCtrl := TOverviewMapControlOptions.Create;
  FPanCtrl := TPanControlOptions.Create;
  FRotateCtrl := TRotateControlOptions.Create;
  FScaleCtrl := TScaleControlOptions.Create;
  FStreetViewCtrl := TStreetViewControlOptions.Create;
  FZoomCtrl := TZoomControlOptions.Create;
end;

destructor TCustomVisualProp.Destroy;
begin
  if Assigned(FMapTypeCtrl) then FreeAndNil(FMapTypeCtrl);
  if Assigned(FOverviewMapCtrl) then FreeAndNil(FOverviewMapCtrl);
  if Assigned(FPanCtrl) then FreeAndNil(FPanCtrl);
  if Assigned(FRotateCtrl) then FreeAndNil(FRotateCtrl);
  if Assigned(FScaleCtrl) then FreeAndNil(FScaleCtrl);
  if Assigned(FStreetViewCtrl) then FreeAndNil(FStreetViewCtrl);
  if Assigned(FZoomCtrl) then FreeAndNil(FZoomCtrl);

  inherited;
end;

function TCustomVisualProp.ToStr: string;
const
  Data = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
begin
  Result := Format(Data, [
                          QuotedStr(GetBckgroundColor),                                      // backgroundColor
                          LowerCase(TCustomTransform.GMBoolToStr(MapTypeCtrl.Show, True)),                      // mapTypeControl
                          QuotedStr(TCustomTransform.MapTypeIdsToStr(MapTypeCtrl.MapTypeIds, ';')),//   mapTypeIds
                          QuotedStr(TCustomTransform.PositionToStr(MapTypeCtrl.Position)),         //   position
                          QuotedStr(TCustomTransform.MapTypeControlStyleToStr(MapTypeCtrl.Style)), //   style
                          LowerCase(TCustomTransform.GMBoolToStr(OverviewMapCtrl.Show, True)),                  // overviewMapCtrl
                          LowerCase(TCustomTransform.GMBoolToStr(OverviewMapCtrl.Opened, True)),                //   opened
                          LowerCase(TCustomTransform.GMBoolToStr(PanCtrl.Show, True)),                          // PanCtrl
                          QuotedStr(TCustomTransform.PositionToStr(PanCtrl.Position)),       //   position
                          LowerCase(TCustomTransform.GMBoolToStr(RotateCtrl.Show, True)),                       // rotateCtrl
                          QuotedStr(TCustomTransform.PositionToStr(RotateCtrl.Position)),    //   position
                          LowerCase(TCustomTransform.GMBoolToStr(ScaleCtrl.Show, True)),                        // scaleCtrl
                          QuotedStr(TCustomTransform.PositionToStr(ScaleCtrl.Position)),     //   position
                          QuotedStr(TCustomTransform.ScaleControlStyleToStr(ScaleCtrl.Style)),//   style
                          LowerCase(TCustomTransform.GMBoolToStr(StreetViewCtrl.Show, True)),                   // streetViewCtrl
                          QuotedStr(TCustomTransform.PositionToStr(StreetViewCtrl.Position)),//   position
                          LowerCase(TCustomTransform.GMBoolToStr(ZoomCtrl.Show, True)),                         // zoomCtrl
                          QuotedStr(TCustomTransform.PositionToStr(ZoomCtrl.Position)),      //   position
                          QuotedStr(TCustomTransform.ZoomControlStyleToStr(ZoomCtrl.Style))  //   style
                         ]);
end;

{ TNonVisualProp }

procedure TNonVisualProp.Assign(Source: TPersistent);
begin
  if Source is TNonVisualProp then
  begin
    Options := TNonVisualProp(Source).Options;
    MinZoom := TNonVisualProp(Source).MinZoom;
    MaxZoom := TNonVisualProp(Source).MaxZoom;
  end
  else
    inherited Assign(Source);
end;

constructor TNonVisualProp.Create;
begin
  FMaxZoom := 0;
  FMinZoom := 0;
  FOptions := [Draggable, KeyboardShortcuts, ScrollWheel];
  FMapMaker := False;
end;

procedure TNonVisualProp.SetMaxZoom(const Value: Integer);
begin
  if FMaxZoom = Value then Exit;

  FMaxZoom := Value;

  if FMaxZoom > 21 then FMaxZoom := 21;
  if FMaxZoom < 0 then FMaxZoom := 0;
end;

procedure TNonVisualProp.SetMinZoom(const Value: Integer);
begin
  if FMinZoom = Value then Exit;

  FMinZoom := Value;

  if FMinZoom > 21 then FMinZoom := 21;
  if FMinZoom < 0 then FMinZoom := 0;
end;

{ TPanoramio }

procedure TPanoramio.Assign(Source: TPersistent);
begin
  if Source is TPanoramio then
  begin
    FGMMap := TPanoramio(Source).FGMMap;
    Show := TPanoramio(Source).Show;
    Filtered := TPanoramio(Source).Filtered;
    FilterTag := TPanoramio(Source).FilterTag;
    FilterUserId := TPanoramio(Source).FilterUserId;
    Clickable := TPanoramio(Source).Clickable;
  end
  else inherited;
end;

constructor TPanoramio.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FShow := False;
  FFiltered := False;
  FFilterTag := '';
  FFilterUserId := '';
  FClickable := True;
end;

procedure TPanoramio.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;
  SetOptions;
end;

procedure TPanoramio.SetFiltered(const Value: Boolean);
begin
  if FFiltered = Value then Exit;

  FFiltered := Value;
  SetOptions;
end;

procedure TPanoramio.SetFilterTag(const Value: string);
begin
  if FFilterTag = Value then Exit;

  FFilterTag := Value;
  if FFiltered then SetOptions;
end;

procedure TPanoramio.SetFilterUserId(const Value: string);
begin
  if FFilterUserId = Value then Exit;

  FFilterUserId := Value;
  if FFiltered then SetOptions;
end;

procedure TPanoramio.SetOptions;
const
  StrParams = '%s,%s,%s,%s';
var
  Params: string;
begin
  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
  begin
    Params := Format(StrParams, [
               LowerCase(TCustomTransform.GMBoolToStr(FClickable, True)),
               LowerCase(TCustomTransform.GMBoolToStr(FFiltered, True)),
               QuotedStr(FGMMap.GetConvertedString(FFilterTag)),
               QuotedStr(FGMMap.GetConvertedString(FFilterUserId))
               ]);
    FGMMap.ExecuteScript('MapsPanoramioOptions', Params);
  end;
end;

procedure TPanoramio.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
    FGMMap.ExecuteScript('MapsControlPanoramio', LowerCase(TCustomTransform.GMBoolToStr(FShow, True)));
end;


{*** Fred : added Kml class}
{ TKml }

procedure TKml.Assign(Source: TPersistent);
begin
  if Source is TKml then
  begin
    FGMMap := TKml(Source).FGMMap;
    FClickable := TKml(Source).FClickable;
    FPreserveViewport := TKml(Source).FPreserveViewport;
    FScreenOverlays := TKml(Source).FScreenOverlays;
    FSuppressInfoWindows := TKml(Source).FSuppressInfoWindows;
    FShow := TKml(Source).FShow;
    FUrl := TKml(Source).FUrl;
  end
  else inherited;
end;

procedure TKml.CallJavaScriptFunction;
const
  StrParams = '%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  Params := Format(StrParams, [LowerCase(TCustomTransform.GMBoolToStr(FShow, True)),
                               LowerCase(TCustomTransform.GMBoolToStr(FScreenOverlays, True)),
                               LowerCase(TCustomTransform.GMBoolToStr(FSuppressInfoWindows, True)),
                               LowerCase(TCustomTransform.GMBoolToStr(FClickable, True)),
                               LowerCase(TCustomTransform.GMBoolToStr(FPreserveViewport, True)),
                               QuotedStr(FUrl)
                               ]);

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
    FGMMap.ExecuteScript('MapsControlKml', Params);
end;

constructor TKml.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;

  FClickable := True;
  FPreserveViewport := False;
  FScreenOverlays := True;
  FSuppressInfoWindows := False;
  FUrl := '';
  FShow := False;
end;

procedure TKml.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;
  CallJavaScriptFunction;
end;

procedure TKml.SetPreserveViewport(const Value: Boolean);
begin
  if FPreserveViewport = Value then Exit;

  FPreserveViewport := Value;
  CallJavaScriptFunction;
end;

procedure TKml.SetScreenOverlays(const Value: Boolean);
begin
  if FScreenOverlays = Value then Exit;

  FScreenOverlays := Value;
  CallJavaScriptFunction;
end;

procedure TKml.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;
  if FUrl = '' then FShow := False;

  CallJavaScriptFunction;
end;


procedure TKml.SetSuppressInfoWindows(const Value: Boolean);
begin
  if FSuppressInfoWindows = Value then Exit;

  FSuppressInfoWindows := Value;
  CallJavaScriptFunction;
end;

procedure TKml.SetUrl(const Value: string);
begin
  if FUrl = Value then Exit;

  FUrl := Value;
  if Url = '' then FShow := False;

  CallJavaScriptFunction;
end;

{ TTraffic }

procedure TTraffic.Assign(Source: TPersistent);
begin
  if Source is TPanoramio then
  begin
    FGMMap := TPanoramio(Source).FGMMap;
    FShow := TPanoramio(Source).FShow;
  end
  else inherited;
end;

constructor TTraffic.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FShow := False;
end;

procedure TTraffic.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
    FGMMap.ExecuteScript('MapsControlTraffic', LowerCase(TCustomTransform.GMBoolToStr(FShow, True)));
end;

{ TTransit }

procedure TTransit.Assign(Source: TPersistent);
begin
  if Source is TPanoramio then
  begin
    FGMMap := TPanoramio(Source).FGMMap;
    FShow := TPanoramio(Source).FShow;
  end
  else inherited;
end;

constructor TTransit.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FShow := False;
end;

procedure TTransit.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
    FGMMap.ExecuteScript('MapsControlTransit', LowerCase(TCustomTransform.GMBoolToStr(FShow, True)));
end;

{ TBicycling }

procedure TBicycling.Assign(Source: TPersistent);
begin
  if Source is TBicycling then
  begin
    FGMMap := TBicycling(Source).FGMMap;
    FShow := TBicycling(Source).FShow;
  end
  else inherited;
end;

constructor TBicycling.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FShow := False;
end;

procedure TBicycling.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
    FGMMap.ExecuteScript('MapsControlBicycling', LowerCase(TCustomTransform.GMBoolToStr(FShow, True)));
end;

{ TWeather }

procedure TWeather.Assign(Source: TPersistent);
begin
  if Source is TWeather then
  begin
    FGMMap := TWeather(Source).FGMMap;
    Show := TWeather(Source).Show;
    Clickable := TWeather(Source).Clickable;
    LabelColor := TWeather(Source).LabelColor;
    SuppressInfoWindows := TWeather(Source).SuppressInfoWindows;
    TemperatureUnit := TWeather(Source).TemperatureUnit;
    WindSpeedUnit := TWeather(Source).WindSpeedUnit;
  end
  else inherited;
end;

constructor TWeather.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FShow := False;
  FClickable := True;
  FLabelColor := lcBLACK;
  FSuppressInfoWindows := False;
  FTemperatureUnit := tuCELSIUS;
  FWindSpeedUnit := wsKILOMETERS_PER_HOUR;
end;

procedure TWeather.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;
  SetOptions;
end;

procedure TWeather.SetLabelColor(const Value: TLabelColor);
begin
  if FLabelColor = Value then Exit;

  FLabelColor := Value;
  SetOptions;
end;

procedure TWeather.SetOptions;
const
  StrParams = '%s,%s,%s,%s,%s';
var
  Params: string;
begin
  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
  begin
    Params := Format(StrParams, [
               LowerCase(TCustomTransform.GMBoolToStr(FClickable, True)),
               LowerCase(TCustomTransform.GMBoolToStr(FSuppressInfoWindows, True)),
               QuotedStr(TCustomTransform.LabelColorToStr(FLabelColor)),
               QuotedStr(TCustomTransform.TemperatureUnitToStr(FTemperatureUnit)),
               QuotedStr(TCustomTransform.WindSpeedUnitToStr(FWindSpeedUnit))
               ]);
    FGMMap.ExecuteScript('MapsWeatherOptions', Params);
  end;
end;

procedure TWeather.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;

  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
    FGMMap.ExecuteScript('MapsControlWeather', LowerCase(TCustomTransform.GMBoolToStr(FShow, True)));
end;

procedure TWeather.SetSuppressInfoWindows(const Value: Boolean);
begin
  if FSuppressInfoWindows = Value then Exit;

  FSuppressInfoWindows := Value;
  SetOptions;
end;

procedure TWeather.SetTemperatureUnit(const Value: TTemperatureUnit);
begin
  if FTemperatureUnit = Value then Exit;

  FTemperatureUnit := Value;
  SetOptions;
end;

procedure TWeather.SetWindSpeedUnit(const Value: TWindSpeedUnit);
begin
  if FWindSpeedUnit = Value then Exit;

  FWindSpeedUnit := Value;
  SetOptions;
end;

{ TLayers }

procedure TLayers.Assign(Source: TPersistent);
begin
  if Source is TLayers then
  begin
    Panoramio.Assign(TLayers(Source).Panoramio);
    Kml.Assign(TLayers(Source).Kml);  {*** Fred : added KML}
    Traffic.Assign(TLayers(Source).Traffic);
    Transit.Assign(TLayers(Source).Transit);
    Bicycling.Assign(TLayers(Source).Bicycling);
    Weather.Assign(TLayers(Source).Weather);
  end
  else inherited;
end;

constructor TLayers.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FPanoramio := TPanoramio.Create(FGMMap);
  FKml := TKml.Create(FGMMap);   {*** Fred : added KML}
  FTraffic := TTraffic.Create(FGMMap);
  FTransit := TTransit.Create(FGMMap);
  FBicycling := TBicycling.Create(FGMMap);
  FWeather := TWeather.Create(FGMMap);
end;

destructor TLayers.Destroy;
begin
  if Assigned(FPanoramio) then FreeAndNil(FPanoramio);
  if Assigned(FKml) then FreeAndNil(FKml);
  if Assigned(FTraffic) then FreeAndNil(FTraffic);
  if Assigned(FTransit) then FreeAndNil(FTransit);
  if Assigned(FBicycling) then FreeAndNil(FBicycling);
  if Assigned(FWeather) then FreeAndNil(FWeather);

  inherited;
end;

{ TWeatherFeature }

procedure TWeatherFeature.Assign(Source: TObject);
begin
  if Source is TWeatherFeature then
  begin
    FCurrent.Assign(TWeatherFeature(Source).Current);
    FLocation := TWeatherFeature(Source).Location;
    FTemperatureUnit := TWeatherFeature(Source).TemperatureUnit;
    FWindSpeedUnit := TWeatherFeature(Source).WindSpeedUnit;
    FForecast.Assign(TWeatherFeature(Source).FForecast);
  end
  else inherited;
end;

constructor TWeatherFeature.Create;
begin
  FForecast := TObjectList.Create;
  FCurrent := TWeatherConditions.Create;
end;

destructor TWeatherFeature.Destroy;
begin
  if Assigned(FForecast) then FreeAndNil(FForecast);
  if Assigned(FCurrent) then FreeAndNil(FCurrent);

  inherited;
end;

function TWeatherFeature.GetCount: Integer;
begin
  Result := FForecast.Count;
end;

function TWeatherFeature.GetForecast(Index: Integer): TWeatherForecast;
begin
  Result := nil;
  if Assigned(FForecast[Index]) then
    Result := TWeatherForecast(FForecast[Index]);
end;

procedure TWeatherFeature.ProcessXMLData(Data: string);
var
  XML: IXMLDocument;

  procedure ParseNodes(Node: IXMLNode);
  var
    Tmp: IXMLNode;
    Forecast: TWeatherForecast;
  begin
    // ES: nos posicionamos en "WeatherFeature" // EN: go to "WeatherFeature" tag
    while Assigned(Node) and (Node.NodeName <> LBL_WEATHERFEATURE) do
      Node := Node.NextSibling;

    if not Assigned(Node) or (Node.ChildNodes.Count = 0) then Exit;
    Node := Node.ChildNodes.First;

    while Assigned(Node) do
    begin
      // ES: etiqueta "location" (sólo una)   // EN: "location" tag (only one)
      if Node.NodeName = LBL_W_LOCATION then FLocation := Node.NodeValue;

      // ES: etiqueta "temperatureUnit" (sólo una)   // EN: "temperatureUnit" tag (only one)
      if Node.NodeName = LBL_W_TEMPERATUREUNIT then
        FTemperatureUnit := TCustomTransform.StrToTemperatureUnit(Node.NodeValue);

      // ES: etiqueta "windSpeedUnit" (sólo una)   // EN: "windSpeedUnit" tag (only one)
      if Node.NodeName = LBL_W_WINDSPEEDUNIT then
        FWindSpeedUnit := TCustomTransform.StrToWindSpeedUnit(Node.NodeValue);

      // ES: etiqueta "current" (sólo una)   // EN: "current" tag (only one)
      if (Node.NodeName = LBL_W_CURRENT) and (Node.ChildNodes.Count > 0) then
      begin
        Tmp := Node.ChildNodes.First;
        while Assigned(Tmp) do
        begin
          if Tmp.NodeName = LBL_W_DAY then FCurrent.FDay := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_DESCRIPTION then FCurrent.FDescription := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_HIGH then FCurrent.FHigh := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_HUMIDITY then FCurrent.FHumidity := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_LOW then FCurrent.FLow := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_SHORTDAY then FCurrent.FShortDay := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_TEMPERATURE then FCurrent.FTemperature := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_WINDDIRECTION then FCurrent.FWindDirection := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_WINDSPEED then FCurrent.FWindSpeed := Tmp.NodeValue;

          Tmp := Tmp.NextSibling;
        end;
      end;

      // ES: etiqueta "forecast" (normalmente 4)   // EN: "forecast" tag (normally 4)
      if (Node.NodeName = LBL_W_FORECAST) and (Node.ChildNodes.Count > 0) then
      begin
        Forecast := TWeatherForecast.Create;
        Tmp := Node.ChildNodes.First;
        while Assigned(Tmp) do
        begin
          if Tmp.NodeName = LBL_W_DAY then Forecast.FDay := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_DESCRIPTION then Forecast.FDescription := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_HIGH then Forecast.FHigh := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_LOW then Forecast.FLow := Tmp.NodeValue;
          if Tmp.NodeName = LBL_W_SHORTDAY then Forecast.FShortDay := Tmp.NodeValue;

          Tmp := Tmp.NextSibling;
        end;
        FForecast.Add(Forecast);
      end;

      Node := Node.NextSibling;
    end;
  end;
begin
  FForecast.Clear;

  XML := TXMLDocument.Create(nil);
  try
    XML.LoadFromXML(Data);
    XML.Active := True;
    ParseNodes(XML.ChildNodes.First);
  finally
    XML := nil;
  end;
end;

{ TWeatherConditions }

procedure TWeatherConditions.Assign(Source: TObject);
begin
  if Source is TWeatherConditions then
  begin
    FDay := TWeatherConditions(Source).Day;
    FDescription := TWeatherConditions(Source).Description;
    FHigh := TWeatherConditions(Source).High;
    FHumidity := TWeatherConditions(Source).Humidity;
    FLow := TWeatherConditions(Source).Low;
    FShortDay := TWeatherConditions(Source).ShortDay;
    FTemperature := TWeatherConditions(Source).Temperature;
    FWindDirection := TWeatherConditions(Source).WindDirection;
    FWindSpeed := TWeatherConditions(Source).WindSpeed;
  end
  else inherited;
end;

{ TGMObjects }

constructor TGMObjects.Create(AOwner: TComponent);
begin
  inherited;

  FIdxList := 0;
end;

destructor TGMObjects.Destroy;
begin
  if Assigned(FMap) then FMap.RemoveLinkedComponent(Self);

  inherited;
end;

function TGMObjects.ExecuteScript(NameFunct, Params: string): Boolean;
begin
  Result := False;
  if (csDesigning in ComponentState) or not Assigned(FMap) or
     not Map.Active or not Map.FDocLoaded then Exit;

  Result := FMap.ExecuteScript(NameFunct, Params);
end;

function TGMObjects.GetBoolField(const FormName, FieldName: string;
  DefaultValue: Boolean): Boolean;
begin
  Result := DefaultValue;
  if Assigned(FMap) then
    Result := FMap.FWC.GetBoolField(FormName, FieldName, DefaultValue);
end;

function TGMObjects.GetFloatField(const FormName, FieldName: string;
  DefaultValue: Real): Real;
var
  Temp: string;
  Val: Extended;
begin
  Result := DefaultValue;

  Temp := GetStringField(FormName, FieldName, '');
  if {$IFDEF DELPHIXE}FormatSettings.DecimalSeparator{$ELSE}DecimalSeparator{$ENDIF} = ',' then
    Temp := StringReplace(Temp, '.', ',', [rfReplaceAll]);
  if (Temp <> '') and TryStrToFloat(Temp, Val) then
    Result := Val;
end;

function TGMObjects.GetIntegerField(const FormName, FieldName: string;
  DefaultValue: Integer): Integer;
begin
  Result := DefaultValue;
  if Assigned(FMap) then
    Result := FMap.FWC.GetIntegerField(FormName, FieldName, DefaultValue);
end;

function TGMObjects.GetMapPrecision: Integer;
begin
  Result := 0;
  if Assigned(FMap) then
    Result := FMap.Precision;
end;

function TGMObjects.GetStringField(const FormName, FieldName: string;
  DefaultValue: string): string;
begin
  Result := DefaultValue;
  if Assigned(FMap) then
    Result := FMap.FWC.GetStringField(FormName, FieldName, DefaultValue);
end;

function TGMObjects.IsMapActive: Boolean;
begin
  Result := False;
  if Assigned(FMap) then
    Result := FMap.Active and FMap.FDocLoaded and FMap.FIsDoMap;
end;

procedure TGMObjects.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

  if (Operation = opRemove) and (AComponent <> nil) and (AComponent = FMap) then
    FMap := nil;
end;

procedure TGMObjects.SetIdxList(const Value: Cardinal);
begin
  if FIdxList = Value then Exit;

  FIdxList := Value;
end;

procedure TGMObjects.SetMap(const Value: TCustomGMMap);
begin
  if FMap = Value then Exit;

  if Assigned(FMap) then
  begin
    if not (csDesigning in ComponentState) and (FIdxList <> 0) and
      Map.Active and Map.FDocLoaded then
    begin
      DeleteMapObjects;
      IdxList := 0;
    end;
    FMap.RemoveLinkedComponent(Self);
  end;
  FMap := Value;
  if Assigned(FMap) then
  begin
    {IdxList := }FMap.AddLinkedComponent(Self);
    if not (csDesigning in ComponentState) and (FIdxList <> 0) and
       Map.Active and Map.FDocLoaded then ShowElements;
  end;
end;

{ TStreetView }

constructor TStreetView.Create(GMMap: TCustomGMMap);
begin
  FGMMap := GMMap;
  FVisible := False;
end;

procedure TStreetView.SetOptions;
const
  StrParams = '%s';
var
  Params: string;
begin
  if Assigned(FGMMap.FWebBrowser) and FGMMap.FActive and FGMMap.FDocLoaded and
     FGMMap.FIsDoMap then
  begin
    Params := Format(StrParams, [
               LowerCase(TCustomTransform.GMBoolToStr(FVisible, True))
               ]);
    FGMMap.ExecuteScript('MapsSVPanoramaOptions', Params);
  end;
end;

procedure TStreetView.SetVisible(const Value: Boolean);
begin
  if FVisible = Value then Exit;

  FVisible := Value;
  SetOptions;
end;

end.

