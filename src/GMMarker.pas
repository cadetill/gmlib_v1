{
GMMarker unit

  ES: contiene las clases bases necesarias para mostrar marcadores en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the base classes needed to show markers on Google Map map using
      the component TGMMap
=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      marcadores a mostrar
  EN: put the component into a form, link to a TGMMap and put the markers to show
=========================================================================
History:

ver 1.5.0
  ES:
    cambio: TCustomMarker -> añadida propiedad Direction (GC: issue 38)
  EN:
    change: TCustomMarker -> addod Direction property (GC: issue 38)
ver 1.2.X
  ES:
    cambio: TCustomMarker -> en el método LoadFromDataSet se añade el parámetro
      opcional HTMLContentField (GC: issue 24).
    cambio: TCustomMarker -> en el método LoadFromDataSet se añade control de la
      existencia de los campos.
  EN:
    change: TCustomMarker -> added optional parameter HTMLContentField into
      LoadFromDataSet method (GC: issue 24).
    change: TCustomMarker -> the LoadFromDataSet method checks the existence of
      the needed fields.

ver 1.1.0
  ES:
    cambio: TCustomMarker -> el método CenterMapToMarker se marca como deprecated,
      en su lugar usar CenterMapTo.
    nuevo: TCustomMarker -> añadida propiedad CrossOnDrag.
    nuevo: TCustomGMMarker -> añadido evento OnCrossOnDragChange.
  EN:
    change: TCustomMarker -> CenterMapToMarker methos is marked as deprecated,
      instead use CenterMapTo.
    new: TCustomMarker -> added CrossOnDrag property.
    new: TCustomGMMarker -> added OnCrossOnDragChange event.

ver 1.0.1
  ES:
    error: TCustomGMMarker -> corregido error en el método LoadFromDataSet (first
      del DataSet).
  EN:
    bug: TCustomGMMarker -> bug fixed on LoadFromDataSet method (first from DataSet).

ver 1.0.0
  ES:
    cambio: se elimina la propiedad TCustomMarker.ColoredMarker para que sea
      definida en los hijos como TColoredMarker.
    cambio: se elimina la propiedad TCustomMarker.StyledMarker para que sea
      definida en los hijos como TStyledMarker.
    cambio: se ha añadido un parámetro al método TCustomGMMarker.LoadFromCSV,
      IconColumn, para poder especificar el icono a mostrar por defecto.
    nuevo: nuevo método TCustomGMMarker.LoadFromDataSet.
    nuevo: TCustomGMMarker -> ZoomToPoints, establece el zoom óptimo para visualizar
      todos los marcadores.
    cambio: TCustomGMMarker -> ZoomMapToAllMarkers se marca como obsoleta.
  EN:
    change: TCustomMarker.ColoredMarker property is removed to be defined
      in descendents as TColoredMarker.
    change: TCustomMarker.StyledMarker property is removed to be defined
      in descendents as TStyledMarker.
    change: a new parameter is added in TCustomGMMarker.LoadFromCSV method,
      IconColumn, to specify a default icon to show.
    new: added new method TCustomGMMarker.LoadFromDataSet.
    new: TCustomGMMarker -> ZoomToPoints, sets the optimal zoom to display all markers.
    change: TCustomGMMarker -> ZoomMapToAllMarkers is now deprecated.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
    nuevo: TCustomGMMarker -> añadido método ZoomMapToAllMarkers (gracias Hugo Pedersen)
  EN:
    new: documentation
    new: now compatible with FireMonkey
    nuevo: TCustomGMMarker -> added method ZoomMapToAllMarkers (thanks Hugo Pedersen)

ver 0.1.7
  ES:
    cambio: modificados métodos Set y ShowElement para que usen el nuevo método
      ChangeProperties heredado de TLinkedComponent
    cambio: suprimida clase TMarkerLatLng. Ahora se usa directamente la clase TLatLng
    cambio: TMarker-> la pripiedad Position ahora es de tipo TLatLng.
    cambio: TMarker-> añadida propiedad MarkerType para especificar el tipo de
      marcador a mostrar (mtStandard, mtColored, mtStyledMarker).
    cambio: TMarker-> añadida propiedad ColoredMarker para especificar la forma
      del marcador si MarkerType = mtColored.
    cambio: TMarker-> añadida propiedad StyledMarker para especificar la forma
      del marcador si MarkerType = mtStyledMarker.
    cambio: TGMMarker-> añadido método público LoadFromCSV para una carga masiva
      de marcadores que estén en un archivo CSV (unos 500 cada 10 seg.).
    cambio: TGMMarker-> 4 nuevos eventos: OnLoadFile y AfterLoadFile para el procesado
      del fichero CSV, y OnColoredMarkerChange y OnStyledMarkerChange para el cambio
      de las propiedades
  EN:
    change: modified all Set and ShowElements methods to use the new method
      ChangeProperties inherited from TLinkedComponent
    change: TMarkerLatLng class are deleted. Now it use the TLatLng class directly
    change: TMarker-> the Position property now is a TLatLng.
    change: TMarker-> added MarkerType property to specify the marker type to
      show (mtStandard, mtColored, mtStyledMarker).
    change: TMarker-> added ColoredMarker property to specify properties of marker
      when MarkerType = mtColored.
    change: TMarker-> added StyledMarker property to specify properties of marker
      when MarkerType = mtStyledMarker.
    change: TGMMarker-> added LoadFromCSV public method for a massive load of
      markers that are in a CSV file (about 500 each 10 sec).
    change: TGMMarker-> 4 news events: OnLoadFile and AfterLoadFile for processing
      the CSV file, and OnColoredMarkerChange and OnStyledMarkerChange for changing
      the properties

ver 0.1.5
  ES:
    error: se controlan la comilla simple en la propiedad Title
  EN:
    bug: the single quote is controled into Title property

ver 0.1.4
  ES:
    cambio: cambio en el JavaScript de algunos métodos Set
  EN:
    change: JavaScript changed from some Set methods

ver 0.1.3
  ES:
    nuevo: añadido propiedad Icon para especificar la imagen del marcador. Puede
      ser una imagen en la web (url) o una imagen en el ordenador. En blanco será
      la imagen por defecto.
    nuevo: añadido evento OnIconChange
    cambio: métodos Set cambiados para evitar duplicidad de código
  EN:
    new: added Icon property to specify a marker image. You can specify a web
      image (url) or a file in the PC. Nothing for default image
    new: added OnIconChange event
    change: changed Set methods to avoid duplicate code

ver 0.1.2
  ES:
    error: algunas propiedades daban un error de JavaScript al modificarse
  EN:
    bug: some properties giving a JavaScript error when modifying

ver 0.1.1
  ES:
    nuevo: Añadido evento Assign a la clase TMarkerLatLng
    cambio: Cuando se cambia la lat/lng de un marcador, éste cambia automáticamente en el mapa
  EN:
    new: Added Assign Assign to the TMarkerLatLng class
    change: When a lat/lng is changed into a marker, this is automatically changed into the map

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
{*------------------------------------------------------------------------------
  The GMMarker unit includes the base classes needed to show markers on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMMarker contiene las clases bases necesarias para mostrar marcadores en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMMarker;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes, System.Types, Data.DB,
  {$ELSE}
  Classes, Types, DB,
  {$ENDIF}

  GMLinkedComponents, GMConstants, GMClasses;

type
  TCustomGMMarker = class;
  TCustomMarker = class;

  {*------------------------------------------------------------------------------
    Internal class to determine animation of a marker.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna para determinar el tipo de animación de un marcador.
  -------------------------------------------------------------------------------}
  TAnimation = class(TPersistent)
  private
    FMarker: TCustomMarker;
    {*------------------------------------------------------------------------------
      If true, marker falls from the top of the map ending with a small bounce.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el marcador cae desde la parte superior del mapa terminando con un pequeño rebote.
    -------------------------------------------------------------------------------}
    FOnDrop: Boolean;
    {*------------------------------------------------------------------------------
      If true, marker bounces until animation is stopped.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el marcador rebota hasta parar la animación.
    -------------------------------------------------------------------------------}
    FBounce: Boolean;
    {*------------------------------------------------------------------------------
      Index position in the list FLinkedComponents of TCustomGMMap class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Índice de la posición en la lista FLinkedComponents de la clase TCustomGMMap.
    -------------------------------------------------------------------------------}
    FIdxList: Cardinal;
    procedure SetOnDrop(const Value: Boolean);
  protected
    {*------------------------------------------------------------------------------
      Set Bounce property.
      @param Value New value for Bounce property
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece la propiedad Bounce.
      @param Value Nuevo valor para la propiedad Bounce
    -------------------------------------------------------------------------------}
    procedure SetBounce(const Value: Boolean); virtual;

    property IdxList: Cardinal read FIdxList write FIdxList;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomMarker); virtual;

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
    property OnDrop: Boolean read FOnDrop write SetOnDrop default False;
    property Bounce: Boolean read FBounce write SetBounce default False;
  end;

  {*------------------------------------------------------------------------------
    Features for ColoredMarker type marker.
    Sorry, I lost the reference for more information.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para un marcador de tipo ColoredMarker.
    Lo siento, he perdido la referencia para más información.
  -------------------------------------------------------------------------------}
  TCustomColoredMarker = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Marker width.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Ancho del marcador.
    -------------------------------------------------------------------------------}
    FWidth: Integer;
    {*------------------------------------------------------------------------------
      Marker height.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Altura del marcador.
    -------------------------------------------------------------------------------}
    FHeight: Integer;
    procedure SetHeight(const Value: Integer);
    procedure SetWidth(const Value: Integer);
  protected
    {*------------------------------------------------------------------------------
      Class owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propietario de la clase.
    -------------------------------------------------------------------------------}
    FMarker: TCustomMarker;

    {*------------------------------------------------------------------------------
      This method returns the assigned color to the CornerColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad CornerColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetCornerColor: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      This method returns the assigned color to the PrimaryColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad PrimaryColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetPrimaryColor: string; virtual; abstract;
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
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomMarker); virtual;

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
    property Width: Integer read FWidth write SetWidth default 32;
    property Height: Integer read FHeight write SetHeight default 32;
  end;

  {*------------------------------------------------------------------------------
    Features for ColoredMarker type marker.
    More information at http://google-maps-utility-library-v3.googlecode.com/svn/trunk/styledmarker/docs/reference.html
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para un marcador de tipo ColoredMarker.
    Más información en http://google-maps-utility-library-v3.googlecode.com/svn/trunk/styledmarker/docs/reference.html
  -------------------------------------------------------------------------------}
  TCustomStyledMarker = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Show or hide a star in the upper right of the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mostrar o ocultar una estrella en la parte superior derecha del marcador.
    -------------------------------------------------------------------------------}
    FShowStar: Boolean;
    {*------------------------------------------------------------------------------
      Marker type.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tipo del marcador.
    -------------------------------------------------------------------------------}
    FStyledIcon: TStyledIcon;
    procedure SetShowStar(const Value: Boolean);
    procedure SetStyledIcon(const Value: TStyledIcon);
  protected
    {*------------------------------------------------------------------------------
      Class owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propietario de la clase.
    -------------------------------------------------------------------------------}
    FMarker: TCustomMarker;

    {*------------------------------------------------------------------------------
      This method returns the assigned color to the BackgroundColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad BackgroundColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetBackgroundColor: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      This method returns the assigned color to the TextColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad TextColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetTextColor: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      This method returns the assigned color to the StarColor property defined into its descendents.
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado a la propiedad StarColor definida en los descendientes.
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetStarColor: string; virtual; abstract;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomMarker); virtual;

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
    property StyledIcon: TStyledIcon read FStyledIcon write SetStyledIcon default siMarker;
    property ShowStar: Boolean read FShowStar write SetShowStar default False;
  end;

  {*------------------------------------------------------------------------------
    Font styles.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Estilos para las fuentes.
  -------------------------------------------------------------------------------}
  TGMFontStyle = (fstBold, fstItalic, fstOverline, fstUnderline, fstStrikeOut);
  {*------------------------------------------------------------------------------
    Set of Font styles.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Conjunto de estilos de fuentes.
  -------------------------------------------------------------------------------}
  TGMFontStyles = set of TGMFontStyle;

  {*------------------------------------------------------------------------------
    Features for Border property of TCustomStyleLabel class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para la propiedad Border de la clase TCustomStyleLabel.
  -------------------------------------------------------------------------------}
  TCustomGMBorder = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Border size.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tamaño del borde.
    -------------------------------------------------------------------------------}
    FSize: Integer;
    {*------------------------------------------------------------------------------
      Border style.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estilo del borde.
    -------------------------------------------------------------------------------}
    FStyle: TBorderStyle;
    procedure SetSize(const Value: Integer);
    procedure SetStyle(const Value: TBorderStyle);
  protected
    {*------------------------------------------------------------------------------
      Class owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propietario de la clase.
    -------------------------------------------------------------------------------}
    FMarker: TCustomMarker;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomMarker); virtual;

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
    property Size: Integer read FSize write SetSize;
    property Style: TBorderStyle read FStyle write SetStyle;
  end;

  {*------------------------------------------------------------------------------
    Features for Font property of TCustomStyleLabel class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para la propiedad Font de la clase TCustomStyleLabel.
  -------------------------------------------------------------------------------}
  TCustomGMFont = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Font size.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tamaño de la fuente.
    -------------------------------------------------------------------------------}
    FSize: Integer;
    {*------------------------------------------------------------------------------
      Font style.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estilo de la fuente.
    -------------------------------------------------------------------------------}
    FStyle: TGMFontStyles;
    procedure SetSize(const Value: Integer);
    procedure SetStyle(const Value: TGMFontStyles);
  protected
    {*------------------------------------------------------------------------------
      Class owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propietario de la clase.
    -------------------------------------------------------------------------------}
    FMarker: TCustomMarker;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomMarker); virtual;

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
    property Style: TGMFontStyles read FStyle write SetStyle;
    property Size: Integer read FSize write SetSize;
  end;

  {*------------------------------------------------------------------------------
    Features for mtStyledMarker type marker.
    It is programmed but can not be selected because it does not work well with IE (TWebBrowser).
    More information at http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerwithlabel/docs/reference.html
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para un marcador de tipo mtStyledMarker.
    Está programado pero no se puede seleccionar debido a que no funciona bien con el IE (TWebBrowser).
    Más información en http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerwithlabel/docs/reference.html
  -------------------------------------------------------------------------------}
  TCustomStyleLabel = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Features for Font property.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características para la propiedad Font.
    -------------------------------------------------------------------------------}
    FFont: TCustomGMFont;
    {*------------------------------------------------------------------------------
      Features for Border property.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características para la propiedad Border.
    -------------------------------------------------------------------------------}
    FBorder: TCustomGMBorder;
    {*------------------------------------------------------------------------------
      Opacity with values between 0 and 1.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad con valores entre 0 y 1.
    -------------------------------------------------------------------------------}
    FOpacity: Real;
    {*------------------------------------------------------------------------------
      Label in Background.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Etiqueta de fondo.
    -------------------------------------------------------------------------------}
    FNoBackground: Boolean;
    procedure SetOpacity(const Value: Real);
    procedure SetNoBackground(const Value: Boolean);
  protected
    {*------------------------------------------------------------------------------
      Class owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propietario de la clase.
    -------------------------------------------------------------------------------}
    FMarker: TCustomMarker;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomMarker); virtual;
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
    property Font: TCustomGMFont read FFont write FFont;
    property Border: TCustomGMBorder read FBorder write FBorder;
    property Opacity: Real read FOpacity write SetOpacity;
    property NoBackground: Boolean read FNoBackground write SetNoBackground;
  end;

  {*------------------------------------------------------------------------------
    Base class for markers.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Marker
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los marcadores.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Marker
  -------------------------------------------------------------------------------}
  TCustomMarker = class(TLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      Animation style for marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tipo de animación para los marcadores.
    -------------------------------------------------------------------------------}
    FAnimation: TAnimation;
    {*------------------------------------------------------------------------------
      If true, the marker receives mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece en true, el marcador recibe eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      If true, the marker can be dragged.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece en true, el marcador puede desplazarse.
    -------------------------------------------------------------------------------}
    FDraggable: Boolean;
    {*------------------------------------------------------------------------------
      If true, the marker shadow will not be displayed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece en true, no se mostrará la sombra del marcador.
    -------------------------------------------------------------------------------}
    FFlat: Boolean;
    {*------------------------------------------------------------------------------
      Optimization renders many markers as a single static element.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La optimización hace que muchos marcadores sean como un único elemento estático.
    -------------------------------------------------------------------------------}
    FOptimized: Boolean;
    {*------------------------------------------------------------------------------
      Marker position.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Posición del marcador.
    -------------------------------------------------------------------------------}
    FPosition: TLatLng;
    {*------------------------------------------------------------------------------
      If false, disables raising and lowering the marker on drag.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a false, deshabilita el subir y bajar del marcador al arrastrarlo.
    -------------------------------------------------------------------------------}
    FRaiseOnDrag: Boolean;
    {*------------------------------------------------------------------------------
      This property is used, if applicable, to establish the name that appears in the collection editor and is the hint text that appears when mouse is over the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Esta propiedad se usa, si procede, para establecer el nombre que aparece en el editor de la colección y es el texto ayuda que aparece al posicionar el ratón encima del marcador.
    -------------------------------------------------------------------------------}
    FTitle: string;
    {*------------------------------------------------------------------------------
      If true, the marker is visible.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el marcador será visible.
    -------------------------------------------------------------------------------}
    FVisible: Boolean;
    {*------------------------------------------------------------------------------
      Icon to display. Can be a url or a file on the PC. If not specified, will display the default icon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Icono a mostrar. Puede ser una url o un archivo en el PC. Si no se especifica, se mostrará el icono por defecto.
    -------------------------------------------------------------------------------}
    FIcon: string;
    {*------------------------------------------------------------------------------
      Marker type.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tipo de marcador.
    -------------------------------------------------------------------------------}
    FMarkerType: TMarkerType;
    {*------------------------------------------------------------------------------
      If false, disables cross that appears beneath the marker when dragging.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si es falso, desactiva la cruz que aparece debajo del marcador cuando éste es desplazado.
    -------------------------------------------------------------------------------}
    FCrossOnDrag: Boolean;
    FIsUpdating: Boolean;
    FDirection: Integer;

    procedure SetClickable(const Value: Boolean);
    procedure SetDraggable(const Value: Boolean);
    procedure SetFlat(const Value: Boolean);
    procedure SetRaiseOnDrag(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    function GetZIndex: Integer;
    procedure SetOptimized(const Value: Boolean);
    procedure SetTitle(const Value: string);
    procedure SetIcon(const Value: string);
    procedure OnLatLngChange(Sender: TObject);
    procedure SetMarkerType(const Value: TMarkerType);
    procedure SetCrossOnDrag(const Value: Boolean);
    procedure SetDirection(const Value: Integer);
  protected
    procedure SetIdxList(const Value: Cardinal); override;

    function GetDisplayName: string; override;
    function ChangeProperties: Boolean; override;
    {*------------------------------------------------------------------------------
      Create the properties that contains some color value.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea las propiedades que contienen algún valor de color.
    -------------------------------------------------------------------------------}
    procedure CreatePropertiesWithColor; virtual; abstract;
    {*------------------------------------------------------------------------------
      Return a formatted string that contains the ColoredMarker property values.
      @return Formatted string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena formateada con los valores de la propiedad ColoredMarker.
      @return Cadena formateada.
    -------------------------------------------------------------------------------}
    function ColoredMarkerToStr: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      Return a formatted string that contains the StyledMarker property values.
      @return Formatted string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena formateada con los valores de la propiedad StyledMarker.
      @return Cadena formateada.
    -------------------------------------------------------------------------------}
    function StyledMarkerToStr: string; virtual; abstract;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Center the map on the marker. Deprecated, instead use CenterMapTo.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Centra el mapa en el marcador. Obsoleto, en su lugar usar CenterMapTo.
    -------------------------------------------------------------------------------}
    procedure CenterMapToMarker; deprecated;
    procedure CenterMapTo; override;
  published
    property Direction: Integer read FDirection write SetDirection default 0;
    property MarkerType: TMarkerType read FMarkerType write SetMarkerType default mtStandard;
    property Animation: TAnimation read FAnimation write FAnimation;
    property Clickable: Boolean read FClickable write SetClickable default True;
    property Draggable: Boolean read FDraggable write SetDraggable default False;
    property Flat: Boolean read FFlat write SetFlat default False;
    property Position: TLatLng read FPosition write FPosition;
    property Title: string read FTitle write SetTitle;
    property Visible: Boolean read FVisible write SetVisible default True;
    property Optimized: Boolean read FOptimized write SetOptimized default True;
    property RaiseOnDrag: Boolean read FRaiseOnDrag write SetRaiseOnDrag default True;
    property Icon: string read FIcon write SetIcon;
    property CrossOnDrag: Boolean read FCrossOnDrag write SetCrossOnDrag default True;
    {*------------------------------------------------------------------------------
      Index within the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Índice dentro de la colección.
    -------------------------------------------------------------------------------}
    property ZIndex: Integer read GetZIndex;
    {*------------------------------------------------------------------------------
      InfoWindows associated object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      InfoWindows asociado al objeto.
    -------------------------------------------------------------------------------}
    property InfoWindow;
    {*------------------------------------------------------------------------------
      If true, InfoWindows is showed when mouse enter into the object and it is closed when leave.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si true, el InfoWindos se muestra cuando el ratón entra en el objeto y se cierra cuando sale.
    -------------------------------------------------------------------------------}
    property ShowInfoWinMouseOver;
  end;

  {*------------------------------------------------------------------------------
    Base class for markers collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para la colección de marcadores.
  -------------------------------------------------------------------------------}
  TCustomMarkers = class(TLinkedComponents)
  private
    procedure SetItems(I: Integer; const Value: TCustomMarker);
    function GetItems(I: Integer): TCustomMarker;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TCustomMarker;
    function Insert(Index: Integer): TCustomMarker;

    {*------------------------------------------------------------------------------
      Lists the markers in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de marcadores en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCustomMarker read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    TOnLoadFile event is fired on load each row of the CSV file.
    @param Sender Owner object of the collection item.
    @param Marker New marker.
    @param Current Current Row.
    @param Count Number of rows.
    @param Stop True to stop the process.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TOnLoadFile se dispara al cargar cada una de las filas del archivo CSV.
    @param Sender Objecto propietario del elemento de la colección.
    @param Marker Nuevo marcador.
    @param Current Fila actual.
    @param Count Cantidad de filas.
    @param Stop True para detener el proceso.
  -------------------------------------------------------------------------------}
  TOnLoadFile = procedure (Sender: TCustomGMMarker; Marker: TCustomMarker; Current, Count: Integer; var Stop: Boolean) of object;
  {*------------------------------------------------------------------------------
    This event is fired when TAfterLoadFile finish loading the CSV file.
    @param Sender Owner object of the collection item.
    @param Loaded Number of rows loaded.
    @param Count Number of rows.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TAfterLoadFile se dispara al terminar de cargar el archivo CSV.
    @param Sender Objecto propietario del elemento de la colección.
    @param Loaded Número de filas cargadas.
    @param Count Cantidad de filas.
  -------------------------------------------------------------------------------}
  TAfterLoadFile = procedure (Sender: TCustomGMMarker; Loaded, Count: Integer) of object;

  {*------------------------------------------------------------------------------
    Base class management of markers.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para la gestión de marcadores.
  -------------------------------------------------------------------------------}
  TCustomGMMarker = class(TGMLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      This event occurs when the user click a marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario pulsa un marcador.
    -------------------------------------------------------------------------------}
    FOnClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event occurs when the user double-clicks a marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario hace doble click un marcador.
    -------------------------------------------------------------------------------}
    FOnDblClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is repeatedly fired while the user drags the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara repetidamente mientras el usuario desplaza el marcador.
    -------------------------------------------------------------------------------}
    FOnDrag: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the user stops dragging the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el usuario para de desplazar el marcador.
    -------------------------------------------------------------------------------}
    FOnDragEnd: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a rightclick on the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al hacer click con el botón derecho del ratón en el marcador.
    -------------------------------------------------------------------------------}
    FOnRightClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a mousedown on the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al pulsar en el marcador.
    -------------------------------------------------------------------------------}
    FOnMouseDown: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired for a mouseup on the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al soltar el marcador.
    -------------------------------------------------------------------------------}
    FOnMouseUp: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the mouse leaves the area of the marker icon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón deja el área del icono del marcador.
    -------------------------------------------------------------------------------}
    FOnMouseOut: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the user starts dragging the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el usuario empieza a desplazar el marcador.
    -------------------------------------------------------------------------------}
    FOnDragStart: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the mouse enters the area of the marker icon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando el ratón entra en el área del icono del marcador.
    -------------------------------------------------------------------------------}
    FOnMouseOver: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Clickable property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Clickable del marcador.
    -------------------------------------------------------------------------------}
    FOnClickableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Draggable property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Draggable del marcador.
    -------------------------------------------------------------------------------}
    FOnDraggableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Flat property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Flat del marcador.
    -------------------------------------------------------------------------------}
    FOnFlatChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Position property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Position del marcador.
    -------------------------------------------------------------------------------}
    FOnPositionChange: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Title property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Title del marcador.
    -------------------------------------------------------------------------------}
    FOnTitleChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Visible property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Visible del marcador.
    -------------------------------------------------------------------------------}
    FOnVisibleChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's Icon property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad Icon del marcador.
    -------------------------------------------------------------------------------}
    FOnIconChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired every time you load a row of the CSV file.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cada vez que se carga una fila del archivo CSV.
    -------------------------------------------------------------------------------}
    FOnLoadFile: TOnLoadFile;
    {*------------------------------------------------------------------------------
      This event is fired to finish loading the CSV file.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara al terminar de cargar el archivo CSV.
    -------------------------------------------------------------------------------}
    FAfterLoadFile: TAfterLoadFile;
    {*------------------------------------------------------------------------------
      This event is fired when a property of the marker's ColoredMarker property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia una propiedad de la propiedad ColoredMarker del marcador.
    -------------------------------------------------------------------------------}
    FOnColoredMarkerChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when a property of the marker's StyledMarker property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia una propiedad de la propiedad StyledMarker del marcador.
    -------------------------------------------------------------------------------}
    FOnStyledMarkerChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the marker's CrossOnDrag property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la propiedad CrossOnDrag del marcador.
    -------------------------------------------------------------------------------}
    FOnCrossOnDragChange: TLinkedComponentChange;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TCustomMarker;

    procedure EventFired(EventType: TEventType; Params: array of const); override;
    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates TMarker instances and adds them to the Items array from a CSV file.
      @param LatColumn Column with latitude information.
      @param LngColumn Column with longitude information.
      @param FileName File name.
      @param TitleColumn Column with title information.
      @param Delimiter Field delimiter.
      @param DeleteBeforeLoad To true, delete markers before load file.
      @param WithRownTitle If the file have a first row with title columns.
      @param IconColumn Column for icon information.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea instancias de TMarker y las añade en el array de Items desde un archivo CSV.
      @param LatColumn Columna con la información de la latitud.
      @param LngColumn Columna con información de la longitud.
      @param FileName Nombre del fichero.
      @param TitleColumn Columna con información del título.
      @param Delimiter Delimitador de campos.
      @param DeleteBeforeLoad A true, borra los marcadores antes de cargar el fichero.
      @param WithRownTitle Si el fichero tiene una primera fila con el título de las columnas.
      @param IconColumn Columna con información del icono a mostrar.
    -------------------------------------------------------------------------------}
    procedure LoadFromCSV(LatColumn, LngColumn: Integer; FileName: string;
      TitleColumn: Integer = -1; Delimiter: Char = ','; DeleteBeforeLoad: Boolean = True;
      WithRownTitle: Boolean = True; IconColumn: Integer = -1);
    {*------------------------------------------------------------------------------
      Creates TMarker instances and adds them to the Items array from a DataSet.
      @param DataSet DataSet where get the data.
      @param LatField Field with latitude.
      @param LngField Field with longitude.
      @param TitleField Field with title information.
      @param IconField Field for icon information.
      @param DeleteBeforeLoad To true, delete markers before load file.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea instancias de TMarker y las añade en el array de Items desde un DataSet.
      @param DataSet DataSet de donde obtener los datos.
      @param LatField Campo con la latitud.
      @param LngField Campo con la longitud.
      @param TitleField Campo con información del título.
      @param IconField Campo con información del icono a mostrar.
      @param DeleteBeforeLoad A true, borra los marcadores antes de cargar el fichero.
    -------------------------------------------------------------------------------}
    procedure LoadFromDataSet(DataSet: TDataSet; LatField, LngField: string;
      TitleField: string = ''; IconField: string = ''; DeleteBeforeLoad: Boolean = True;
      HTMLContentField: string = '');

    {*------------------------------------------------------------------------------
      Creates a new TMarker instance and adds it to the Items array.
      @param Lat Marker latitude.
      @param Lng Marker longitude.
      @param Title Marker title.
      @return New marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TMarker y la añade en el array de Items.
      @param Lat Latitud del marcador.
      @param Lng Longitud del marcador.
      @param Title Título del marcador.
      @return Nuevo marcador.
    -------------------------------------------------------------------------------}
    function Add(Lat: Real = 0; Lng: Real = 0; Title: string = ''): TCustomMarker;

    {*------------------------------------------------------------------------------
      Applies zoom to the map to include all markers.
      Deprecated. Instead use ZoomToPoints method.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Se aplica zoom al mapa para incluir todos los marcadores.
      Obsoleto. En su lugar usar el método ZoomToPoints.
    -------------------------------------------------------------------------------}
    procedure ZoomMapToAllMarkers; deprecated;
    {*------------------------------------------------------------------------------
      Sets the optimal zoom to display all markers.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece el zoom óptimo para visualizar todos los marcadores.
    -------------------------------------------------------------------------------}
    procedure ZoomToPoints;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCustomMarker read GetItems; default;
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
    property OnLoadFile: TOnLoadFile read FOnLoadFile write FOnLoadFile;
    property AfterLoadFile: TAfterLoadFile read FAfterLoadFile write FAfterLoadFile;
        // from map
    property OnClick: TLatLngIdxEvent read FOnClick write FOnClick;
    property OnDblClick: TLatLngIdxEvent read FOnDblClick write FOnDblClick;
    property OnDrag: TLatLngIdxEvent read FOnDrag write FOnDrag;
    property OnDragEnd: TLatLngIdxEvent read FOnDragEnd write FOnDragEnd;
    property OnDragStart: TLatLngIdxEvent read FOnDragStart write FOnDragStart;
    property OnMouseDown: TLatLngIdxEvent read FOnMouseDown write FOnMouseDown;
    property OnMouseOut: TLatLngIdxEvent read FOnMouseOut write FOnMouseOut;
    property OnMouseOver: TLatLngIdxEvent read FOnMouseOver write FOnMouseOver;
    property OnMouseUp: TLatLngIdxEvent read FOnMouseUp write FOnMouseUp;
    property OnRightClick: TLatLngIdxEvent read FOnRightClick write FOnRightClick;
        // from properties
    property OnClickableChange: TLinkedComponentChange read FOnClickableChange write FOnClickableChange;
    property OnDraggableChange: TLinkedComponentChange read FOnDraggableChange write FOnDraggableChange;
    property OnFlatChange: TLinkedComponentChange read FOnFlatChange write FOnFlatChange;
    property OnPositionChange: TLatLngIdxEvent read FOnPositionChange write FOnPositionChange;
    property OnTitleChange: TLinkedComponentChange read FOnTitleChange write FOnTitleChange;
    property OnVisibleChange: TLinkedComponentChange read FOnVisibleChange write FOnVisibleChange;
    property OnIconChange: TLinkedComponentChange read FOnIconChange write FOnIconChange;
    property OnColoredMarkerChange: TLinkedComponentChange read FOnColoredMarkerChange write FOnColoredMarkerChange;
    property OnStyledMarkerChange: TLinkedComponentChange read FOnStyledMarkerChange write FOnStyledMarkerChange;
    property OnCrossOnDragChange: TLinkedComponentChange read FOnCrossOnDragChange write FOnCrossOnDragChange;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  Lang, GMFunctions;

{ TCustomGMMarker }

function TCustomGMMarker.Add(Lat, Lng: Real; Title: string): TCustomMarker;
begin
  Result := TCustomMarker(inherited Add);
  Result.Position.Lat := Lat;
  Result.Position.Lng := Lng;
  if Title <> '' then Result.Title := Title
  else Result.Title := Result.GetDisplayName;
end;

function TCustomGMMarker.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#Marker';
end;

function TCustomGMMarker.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TCustomMarkers;
end;

function TCustomGMMarker.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TCustomMarker;
end;

function TCustomGMMarker.GetItems(I: Integer): TCustomMarker;
begin
  Result := TCustomMarker(inherited Items[i]);
end;

procedure TCustomGMMarker.LoadFromCSV(LatColumn, LngColumn: Integer;
  FileName: string; TitleColumn: Integer; Delimiter: Char; DeleteBeforeLoad,
  WithRownTitle: Boolean; IconColumn: Integer);
var
  L1, L2: TStringList;
  i: Integer;
  Auto: Boolean;
  Marker: TCustomMarker;
  Stop: Boolean;
begin
  if not FileExists(FileName) then
    raise Exception.Create(GetTranslateText('El fichero no existe', Language));

  Auto := AutoUpdate;
  AutoUpdate := False;

  if DeleteBeforeLoad then Clear;

  L1 := TStringList.Create;
  L2 := TStringList.Create;
  try
    L1.LoadFromFile(FileName);
    if WithRownTitle then L1.Delete(0);

    L2.Delimiter := Delimiter;
    {$IFDEF DELPHI2005}
    L2.StrictDelimiter := True;
    {$ENDIF}

    for i := 0 to L1.Count - 1 do
    begin
      L2.DelimitedText := L1[i];

      if (LatColumn > L2.Count) or (LngColumn > L2.Count) or
         ((TitleColumn <>1) and (TitleColumn > L2.Count)) then
        raise Exception.Create(GetTranslateText('El número de columna es incorrecto', Language));

      if TitleColumn = -1 then Marker := Add
      else Marker := Add(0, 0, L2[TitleColumn]);
      Marker.Position.Lat := Marker.Position.StringToReal(L2[LatColumn]);
      Marker.Position.Lng := Marker.Position.StringToReal(L2[LngColumn]);
      if IconColumn <> -1 then Marker.Icon := L2[IconColumn];

      Stop := False;
      if Assigned(FOnLoadFile) then FOnLoadFile(Self, Marker, i, L1.Count, Stop);
      if Stop then Break;
    end;

    if Auto then AutoUpdate := True;
    ShowElements;
    if Assigned(FAfterLoadFile) then FAfterLoadFile(Self, i, L1.Count);
  finally
    AutoUpdate := Auto;
    if Assigned(L1) then FreeAndNil(L1);
    if Assigned(L2) then FreeAndNil(L2);
  end;
end;

procedure TCustomGMMarker.LoadFromDataSet(DataSet: TDataSet; LatField, LngField,
  TitleField, IconField: string; DeleteBeforeLoad: Boolean;
  HTMLContentField: string);

  procedure CheckFields;
  begin
    if not Assigned(DataSet.FindField(LatField)) then
      raise Exception.Create(Format(GetTranslateText('Campo "%s" no encontrado en la tabla.', Map.Language), [LatField]));
    if not Assigned(DataSet.FindField(LngField)) then
      raise Exception.Create(Format(GetTranslateText('Campo "%s" no encontrado en la tabla.', Map.Language), [LngField]));

    if (TitleField <> '') and not Assigned(DataSet.FindField(TitleField)) then
      raise Exception.Create(Format(GetTranslateText('Campo "%s" no encontrado en la tabla.', Map.Language), [TitleField]));
    if (IconField <> '') and not Assigned(DataSet.FindField(IconField)) then
      raise Exception.Create(Format(GetTranslateText('Campo "%s" no encontrado en la tabla.', Map.Language), [IconField]));
    if (HTMLContentField <> '') and not Assigned(DataSet.FindField(HTMLContentField)) then
      raise Exception.Create(Format(GetTranslateText('Campo "%s" no encontrado en la tabla.', Map.Language), [HTMLContentField]));
  end;

var
  Auto: Boolean;
  Marker: TCustomMarker;
  i: Integer;
  Bkm: TBookmark;
begin
  if not DataSet.Active then DataSet.Open;

  CheckFields;

  Auto := AutoUpdate;
  AutoUpdate := False;

  if DeleteBeforeLoad then Clear;

  Bkm := DataSet.GetBookmark;
  DataSet.DisableControls;
  try
    i := 0;
    DataSet.First;
    while not DataSet.Eof do
    begin
      if TitleField = '' then Marker := Add
      else Marker := Add(0, 0, DataSet.FieldByName(TitleField).AsString);
      Marker.Position.Lat := DataSet.FieldByName(LatField).AsFloat;
      Marker.Position.Lng := DataSet.FieldByName(LngField).AsFloat;
      if IconField <> '' then Marker.Icon := DataSet.FieldByName(IconField).AsString;
      if HTMLContentField <> '' then
        Marker.InfoWindow.HTMLContent := DataSet.FieldByName(HTMLContentField).AsString;

      Inc(i);
      DataSet.Next;
    end;
    DataSet.GotoBookmark(Bkm);

    if Auto then AutoUpdate := True;
    ShowElements;
    if Assigned(FAfterLoadFile) then FAfterLoadFile(Self, i, DataSet.RecordCount);
  finally
    DataSet.FreeBookmark(Bkm);
    DataSet.EnableControls;
    AutoUpdate := Auto;
  end;
end;

procedure TCustomGMMarker.ZoomMapToAllMarkers;
var
  i: integer;
  LatLow, LatHigh: real;
  LngLow, LngHigh: real;
  LatCenter: real;
  LngCenter: real;
begin
  LatLow := 500;
  LatHigh := -500;
  LngLow := 500;
  LngHigh := -500;

  for i := 0 to Count - 1 do
  begin
    if Items[i].Position.Lat < LatLow then
      LatLow := Items[i].Position.Lat;
    if Items[i].Position.Lat > LatHigh then
      LatHigh := Items[i].Position.Lat;
    if Items[i].Position.Lng < LngLow then
      LngLow := Items[i].Position.Lng;
    if Items[i].Position.Lng > LngHigh then
      LngHigh := Items[i].Position.Lng;
  end;
  LatCenter := LatLow + ((LatHigh - LatLow) / 2);
  LngCenter := LngLow + ((LngHigh - LngLow) / 2);
  Map.SetCenter(LatCenter, LngCenter);
  Map.LatLngBoundsSetBounds(LatLow, LngLow, LatHigh, LngHigh);
end;

procedure TCustomGMMarker.ZoomToPoints;
var
  Points: array of TLatLng;
  i: Integer;
begin
  if not Assigned(Map) then Exit;

  SetLength(Points, Count);
  for i := 0 to Count - 1 do
    Points[i] := Items[i].Position;

  Map.ZoomToPoints(Points);
end;

procedure TCustomGMMarker.EventFired(EventType: TEventType; Params: array of const);
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
      etMarkerClick: if Assigned(FOnClick) then FOnClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerDblClick: if Assigned(FOnDblClick) then FOnDblClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerDrag: if Assigned(FOnDrag) then FOnDrag(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerDragEnd:
      begin
        Items[Params[2].VInteger].FIsUpdating := True;
        Items[Params[2].VInteger].Position.Assign(LL);
        if Assigned(FOnDragEnd) then FOnDragEnd(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
        Items[Params[2].VInteger].FIsUpdating := False;
      end;
      etMarkerDragStart: if Assigned(FOnDragStart) then FOnDragStart(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerMouseDown: if Assigned(FOnMouseDown) then FOnMouseDown(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerMouseOut: if Assigned(FOnMouseOut) then FOnMouseOut(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerMouseOver: if Assigned(FOnMouseOver) then FOnMouseOver(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerMouseUp: if Assigned(FOnMouseUp) then FOnMouseUp(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etMarkerRightClick: if Assigned(FOnRightClick) then FOnRightClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
    end;
  finally
    FreeAndNil(LL);
  end;
end;

{ TCustomMarkers }

function TCustomMarkers.Add: TCustomMarker;
begin
  Result := TCustomMarker(inherited Add);
end;

function TCustomMarkers.GetItems(I: Integer): TCustomMarker;
begin
  Result := TCustomMarker(inherited Items[I]);
end;

function TCustomMarkers.GetOwner: TPersistent;
begin
  Result := TCustomGMMarker(inherited GetOwner);
end;

function TCustomMarkers.Insert(Index: Integer): TCustomMarker;
begin
  Result := TCustomMarker(inherited Insert(Index));
end;

procedure TCustomMarkers.SetItems(I: Integer; const Value: TCustomMarker);
begin
  inherited SetItem(I, Value);
end;

{ TAnimation }

procedure TAnimation.Assign(Source: TPersistent);
begin
  if Source is TAnimation then
  begin
    OnDrop := TAnimation(Source).OnDrop;
    Bounce := TAnimation(Source).Bounce;
  end
  else
    inherited Assign(Source);
end;

constructor TAnimation.Create(aOwner: TCustomMarker);
begin
  FMarker := aOwner;
  FOnDrop := False;
  FBounce := False;

  if Assigned(FMarker) then FIdxList := FMarker.IdxList;
end;

procedure TAnimation.SetBounce(const Value: Boolean);
const
  StrParams = '%s,%s,%s';
var
  Params: String;
begin
  if FBounce = Value then Exit;

  FBounce := Value;

  if Assigned(FMarker) and (FMarker is TCustomMarker) and
     Assigned(FMarker.Collection) and (FMarker.Collection is TCustomMarkers) and
     Assigned(TCustomMarkers(FMarker.Collection).FGMLinkedComponent) and
     TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).AutoUpdate then
  begin
    Params := Format(StrParams, [
                      IntToStr(FIdxList),
                      LowerCase(TCustomTransform.GMBoolToStr(FBounce, True)),
                      IntToStr(FMarker.Index)]);
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).ExecuteScript('MarkerSetBounce', Params);

    // control de errores // error control
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).ErrorControl;
  end;
end;

procedure TAnimation.SetOnDrop(const Value: Boolean);
begin
  if FOnDrop = Value then Exit;

  FOnDrop := Value;

  if Assigned(FMarker) and (FMarker is TCustomMarker) and
     Assigned(FMarker.Collection) and (FMarker.Collection is TCustomMarkers) and
     Assigned(TCustomMarkers(FMarker.Collection).FGMLinkedComponent) and
     TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).AutoUpdate then
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).ShowElements;
end;

{ TCustomMarker }

procedure TCustomMarker.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomMarker then
  begin
    Animation.Assign(TCustomMarker(Source).Animation);
    Clickable := TCustomMarker(Source).Clickable;
    Draggable := TCustomMarker(Source).Draggable;
    Flat := TCustomMarker(Source).Flat;
    Optimized := TCustomMarker(Source).Optimized;
    Position.Assign(TCustomMarker(Source).Position);
    RaiseOnDrag := TCustomMarker(Source).RaiseOnDrag;
    Title := TCustomMarker(Source).Title;
    Visible := TCustomMarker(Source).Visible;
    MarkerType := TCustomMarker(Source).MarkerType;
  end;
end;

procedure TCustomMarker.CenterMapTo;
begin
  inherited;

  if Assigned(Collection) and (Collection is TCustomMarkers) and
     Assigned(TCustomMarkers(Collection).FGMLinkedComponent) and
     Assigned(TCustomMarkers(Collection).FGMLinkedComponent.Map) then
    TCustomMarkers(Collection).FGMLinkedComponent.Map.SetCenter(Position.Lat, Position.Lng);
end;

procedure TCustomMarker.CenterMapToMarker;
begin
  if Assigned(Collection) and (Collection is TCustomMarkers) and
     Assigned(TCustomMarkers(Collection).FGMLinkedComponent) and
     Assigned(TCustomMarkers(Collection).FGMLinkedComponent.Map) then
    TCustomMarkers(Collection).FGMLinkedComponent.Map.SetCenter(Position.Lat, Position.Lng);
end;

function TCustomMarker.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
  Icon: string;
begin
  inherited;

  Result := False;

  if not Assigned(Collection) or not(Collection is TCustomMarkers) or
     not Assigned(TCustomMarkers(Collection).FGMLinkedComponent) or
     //not TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).AutoUpdate or
     not Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  if MarkerType = mtColored then Icon := ColoredMarkerToStr
  else
  begin
    Icon := FIcon;
    if FileExists(Icon) then
    begin
      Icon := 'file:///' + Icon;
      Icon := StringReplace(Icon, '\', '/', [rfReplaceAll]);
    end;
  end;

  Params := Format(StrParams, [
                  IntToStr(IdxList),
                  LowerCase(TCustomTransform.GMBoolToStr(Animation.OnDrop, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(Animation.Bounce, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(Clickable, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(Draggable, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(Flat, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(Optimized, True)),
                  Position.LatToStr(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).GetMapPrecision),
                  Position.LngToStr(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).GetMapPrecision),
                  LowerCase(TCustomTransform.GMBoolToStr(RaiseOnDrag, True)),
                  QuotedStr(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).GetConvertedString(Title)),
                  LowerCase(TCustomTransform.GMBoolToStr(Visible, True)),
                  QuotedStr(Icon),
                  IntToStr(Index),
                  QuotedStr(InfoWindow.GetConvertedString),
                  LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.DisableAutoPan, True)),
                  IntToStr(InfoWindow.MaxWidth),
                  IntToStr(InfoWindow.PixelOffset.Height),
                  IntToStr(InfoWindow.PixelOffset.Width),
                  LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.CloseOtherBeforeOpen, True)),
                  QuotedStr(TCustomTransform.MarkerTypeToStr(MarkerType)),
                  StyledMarkerToStr,
                  LowerCase(TCustomTransform.GMBoolToStr(ShowInfoWinMouseOver, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(FCrossOnDrag, True))
                  ]);

  Result := TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).ExecuteScript('MakeMarker', Params);
  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).ErrorControl;
end;

constructor TCustomMarker.Create(Collection: TCollection);
begin
  inherited;

  FAnimation := TAnimation.Create(Self);
  FClickable := True;
  FDraggable := False;
  FFlat := False;
  FOptimized := True;
  FPosition := TLatLng.Create;
  FPosition.OnChange := OnLatLngChange;
  FRaiseOnDrag := True;
  FTitle := '';
  FVisible := True;
  FIsUpdating := False;
  FMarkerType := mtStandard;
  FCrossOnDrag := True;

  CreatePropertiesWithColor;
end;

destructor TCustomMarker.Destroy;
begin
  if Assigned(FPosition) then FreeAndNil(FPosition);
  if Assigned(FAnimation) then FreeAndNil(FAnimation);

  inherited;
end;

function TCustomMarker.GetDisplayName: string;
begin
  if Length(Title) > 0 then
  begin
    if Length(Title) > 15 then
      Result := Copy(Title, 0, 12) + '...'
    else
      Result := Title;
  end
  else
  begin
    Result := inherited GetDisplayName;
    Title := Result;
  end;
end;

function TCustomMarker.GetZIndex: Integer;
begin
  Result := Index;
end;

procedure TCustomMarker.OnLatLngChange(Sender: TObject);
begin
  if FIsUpdating then Exit;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnPositionChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnPositionChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Position,
                  Index,
                  Self);
end;

procedure TCustomMarker.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnClickableChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnClickableChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomMarker.SetCrossOnDrag(const Value: Boolean);
begin
  if FCrossOnDrag = Value then Exit;

  FCrossOnDrag := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnCrossOnDragChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnCrossOnDragChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomMarker.SetDirection(const Value: Integer);
begin
  if FDirection = Value then Exit;

  FDirection := Value;
  if FDirection > 360 then FDirection := 360;
  if FDirection < 0 then FDirection := 0;
end;

procedure TCustomMarker.SetDraggable(const Value: Boolean);
begin
  if FDraggable = Value then Exit;

  FDraggable := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnDraggableChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnDraggableChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomMarker.SetFlat(const Value: Boolean);
begin
  if FFlat = Value then Exit;

  FFlat := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnFlatChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnFlatChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomMarker.SetIcon(const Value: string);
begin
  if FIcon = Value then Exit;

  FIcon := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnIconChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnIconChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomMarker.SetIdxList(const Value: Cardinal);
begin
  inherited;

  FAnimation.IdxList := Value;
end;

procedure TCustomMarker.SetMarkerType(const Value: TMarkerType);
begin
  if FMarkerType = Value then Exit;

  FMarkerType := Value;
  ChangeProperties;
end;

procedure TCustomMarker.SetOptimized(const Value: Boolean);
begin
  if FOptimized = Value then Exit;

  FOptimized := Value;

  ChangeProperties;
end;

procedure TCustomMarker.SetRaiseOnDrag(const Value: Boolean);
begin
  if FRaiseOnDrag = Value then Exit;

  FRaiseOnDrag := Value;

  ChangeProperties;
end;

procedure TCustomMarker.SetTitle(const Value: string);
begin
  if FTitle = Value then Exit;

  FTitle := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnTitleChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnTitleChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCustomMarker.SetVisible(const Value: Boolean);
begin
  if FVisible = Value then Exit;

  FVisible := Value;

  ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnVisibleChange) then
    TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent).FOnVisibleChange(
                  TCustomGMMarker(TCustomMarkers(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TCustomColoredMarker }

procedure TCustomColoredMarker.Assign(Source: TPersistent);
begin
  if Source is TCustomColoredMarker then
  begin
    FMarker := TCustomColoredMarker(Source).FMarker;
    Height := TCustomColoredMarker(Source).Height;
    Width := TCustomColoredMarker(Source).Width;
  end
  else inherited;
end;

constructor TCustomColoredMarker.Create(aOwner: TCustomMarker);
begin
  FMarker := aOwner;
  FHeight := 32;
  FWidth := 32;
end;

procedure TCustomColoredMarker.SetHeight(const Value: Integer);
begin
  if FHeight = Value then Exit;

  FHeight := Value;

  if not Assigned(FMarker) then Exit;

  FMarker.ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnColoredMarkerChange) then
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnColoredMarkerChange(
                  TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

procedure TCustomColoredMarker.SetWidth(const Value: Integer);
begin
  if FWidth = Value then Exit;

  FWidth := Value;

  if not Assigned(FMarker) then Exit;

  FMarker.ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnColoredMarkerChange) then
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnColoredMarkerChange(
                  TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

{ TCustomStyledMarker }

procedure TCustomStyledMarker.Assign(Source: TPersistent);
begin
  if Source is TCustomStyledMarker then
  begin
    FMarker := TCustomStyledMarker(Source).FMarker;
    StyledIcon := TCustomStyledMarker(Source).StyledIcon;
    ShowStar := TCustomStyledMarker(Source).ShowStar;
  end
  else inherited;
end;

constructor TCustomStyledMarker.Create(aOwner: TCustomMarker);
begin
  FMarker := aOwner;
  FStyledIcon := siMarker;
  FShowStar := False;
end;

procedure TCustomStyledMarker.SetShowStar(const Value: Boolean);
begin
  if FShowStar = Value then Exit;

  FShowStar := Value;

  if not Assigned(FMarker) then Exit;

  FMarker.ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnStyledMarkerChange) then
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnStyledMarkerChange(
                  TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

procedure TCustomStyledMarker.SetStyledIcon(const Value: TStyledIcon);
begin
  if FStyledIcon = Value then Exit;

  FStyledIcon := Value;

  if not Assigned(FMarker) then Exit;

  FMarker.ChangeProperties;
  if Assigned(TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnStyledMarkerChange) then
    TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent).FOnStyledMarkerChange(
                  TCustomGMMarker(TCustomMarkers(FMarker.Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

{ TCustomStyleLabel }

procedure TCustomStyleLabel.Assign(Source: TPersistent);
begin
  if Source is TCustomStyleLabel then
  begin
    FMarker := TCustomStyleLabel(Source).FMarker;
    Font.Assign(TCustomStyleLabel(Source).Font);
    Border.Assign(TCustomStyleLabel(Source).Border);
    Opacity := TCustomStyleLabel(Source).Opacity;
    NoBackground := TCustomStyleLabel(Source).NoBackground;
  end
  else inherited;
end;

constructor TCustomStyleLabel.Create(aOwner: TCustomMarker);
begin
  FMarker := aOwner;
  FOpacity := 1;
  FNoBackground := False;
end;

destructor TCustomStyleLabel.Destroy;
begin
  if Assigned(FFont) then FreeAndNil(FFont);
  if Assigned(FBorder) then FreeAndNil(FBorder);

  inherited;
end;

procedure TCustomStyleLabel.SetNoBackground(const Value: Boolean);
begin
  FNoBackground := Value;
end;

procedure TCustomStyleLabel.SetOpacity(const Value: Real);
begin
  FOpacity := Value;
  if FOpacity < 0 then FOpacity := 0;
  if FOpacity > 1 then FOpacity := 1;
  FOpacity := Trunc(FOpacity * 100) / 100;
end;

{ TCustomGMFont }

procedure TCustomGMFont.Assign(Source: TPersistent);
begin
  if Source is TCustomGMFont then
  begin
    FMarker := TCustomGMFont(Source).FMarker;
    Style := TCustomGMFont(Source).Style;
    Size := TCustomGMFont(Source).Size;
  end
  else inherited;
end;

constructor TCustomGMFont.Create(aOwner: TCustomMarker);
begin
  FMarker := aOwner;
  FStyle := [fstBold];
  FSize := 20;
end;

procedure TCustomGMFont.SetSize(const Value: Integer);
begin
  FSize := Value;
end;

procedure TCustomGMFont.SetStyle(const Value: TGMFontStyles);
begin
  FStyle := Value;
end;

{ TCustomGMBorder }

procedure TCustomGMBorder.Assign(Source: TPersistent);
begin
  if Source is TCustomGMBorder then
  begin
    FMarker := TCustomGMBorder(Source).FMarker;
    Size := TCustomGMBorder(Source).Size;
    Style := TCustomGMBorder(Source).Style;
  end
  else inherited;
end;

constructor TCustomGMBorder.Create(aOwner: TCustomMarker);
begin
  FMarker := aOwner;
  FSize := 2;
  FStyle := bsSolid;
end;

procedure TCustomGMBorder.SetSize(const Value: Integer);
begin
  FSize := Value;
end;

procedure TCustomGMBorder.SetStyle(const Value: TBorderStyle);
begin
  FStyle := Value;
end;

end.
