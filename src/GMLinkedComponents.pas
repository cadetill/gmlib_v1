{
TGMLinkedComponent class

  ES: Clase base para los componentes que necesitan una colección
  EN: Base class for components that need a collection

=========================================================================
History:

ver 1.1.0
  ES:
    cambio: TLinkedComponent -> el método CenterMapTo de las clases hijas se
      traslada a esta clase.
  EN:
    change: TLinkedComponent -> the CenterMapTo method of child classes moved to
      this class.

ver 1.0.0
  ES:
    cambio: el método TGMLinkedComponent.ShowElements se hace público.
    nuevo: TLinkedComponent -> añadido método OpenCloseInfoWin para mostrar/ocultar
      el InfoWindows asociado
  EN:
    change: TGMLinkedComponent.ShowElements method becomes public.
    new: TLinkedComponent -> added OpenCloseInfoWin method to show/hide associated
      InfoWindows.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
    cambio: TLinkedComponent -> se mueve a esta unidad (anteriormente en GMMap)
    cambio: TLinkedComponents -> se mueve a esta unidad (anteriormente en GMMap)
    cambio: TGMLinkedComponent -> se mueve a esta unidad (anteriormente en GMMap)
  EN:
    new: documentation
    new: now compatible with FireMonkey
    change: TLinkedComponent -> is moved to this unit (above in GMMap)
    change: TLinkedComponents -> is moved to this unit (above in GMMap)
    change: TGMLinkedComponent -> is moved to this unit (above in GMMap)

ver 0.1.7
  ES:
    cambio: TLinkedComponent -> añadida propiedad booleana ShowInfoWinMouseOver. A
      true, se mostrará el InfoWindows mientras el ratón esté encima del objeto.
      Actualmente válido sólo para TMarker (por Luis Joaquin Sencion).
    cambio: TLinkedComponent -> añadido método protegido ChangeProperties para
      centralizar en un sólo sitio el cambio de las propiedades de los objectos.
  EN:
    change: TLinkedComponent -> added ShowInfoWinMouseOver boolean property. If true,
      show the InfoWindows when mouse is over the object. Now only valid for TMarker
      (by Luis Joaquin Sencion).
    change: TLinkedComponent -> added ChangeProperties protected method to centralize
      in one place the changes of properties of the objects

ver 0.1.5
  ES:
    nuevo: TLinkedComponent -> se añade la propiedad Text (visible a todos sus
      descendientes menos a TMarker porque ya tiene la propiedad Title)
    nuevo: TGMLinkedComponent -> añadida propiedad Count
  EN:
    new: TLinkedComponent -> Text property added (visible to all his descendants
      except TMarker because it has the Title property)
    new: TGMLinkedComponent -> Count property added

ver 0.1.3
  ES:
    nuevo: TLinkedComponent -> añadida propiedad Tag: Integer (published)
    nuevo: TLinkedComponent -> añadida propiedad FObject: TObject (public)
  EN:
    new: TLinkedComponent -> property Tag: Integer added (published)
    new: TLinkedComponent -> property FObject: TObject added (public)

ver 0.1.1:
  ES:
    nuevo: Se ha añadido el método Clear a la clase base TGMLinkedComponent.
    nuevo: Se ha añadido el método Assign a la clase base TGMLinkedComponent.
    nuevo: Se ha añadido el método Clear en la clase base TLinkedComponents.
  EN:
    new: Added Clear method to the TGMLinkedComponent base class.
    new: Added Assign method to the TGMLinkedComponent base class.
    new: Added Clear method to the TLinkedComponents base class.
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
  The GMLinkedComponent unit includes the base classes that represent an object into the Google Maps map.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unidad GMLinkedComponent incluye las clases bases que representan un objete en un mapa de Google Maps.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMLinkedComponents;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMMap, GMClasses, GMConstants;

type
  TGMLinkedComponent = class;
  TLinkedComponents = class;
  {*------------------------------------------------------------------------------
    Base class for components that need a collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los componentes que necesitan una colección.
  -------------------------------------------------------------------------------}
  TLinkedComponent = class(TCollectionItem)
  private
    FIdxList: Cardinal;
    FInfoWindow: TBaseInfoWindow;
    FTag: Integer;
    FFObject: TObject;
    FText: string;
    FShowInfoWinMouseOver: Boolean;
    procedure SetShowInfoWinMouseOver(const Value: Boolean);
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
      OnHTMLContentChange method is fired when HTMLContent property from InfoWindow object changes.
      @param Sender InfoWindow object
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método OnHTMLContentChange se dispara cuando la propiedad HTMLContent del objeto InfoWindow cambia.
      @param Sender Objeto InfoWindow
    -------------------------------------------------------------------------------}
    procedure OnHTMLContentChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      OnDisableAutoPanChange method is fired when DisableAutoPan property from InfoWindow object changes.
      @param Sender InfoWindow object
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método OnDisableAutoPanChange se dispara cuando la propiedad DisableAutoPan del objeto InfoWindow cambia.
      @param Sender Objeto InfoWindow
    -------------------------------------------------------------------------------}
    procedure OnDisableAutoPanChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      OnMaxWidthChange method is fired when MaxWidth property from InfoWindow object changes.
      @param Sender InfoWindow object
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método OnMaxWidthChange se dispara cuando la propiedad MaxWidth del objeto InfoWindow cambia.
      @param Sender Objeto InfoWindow
    -------------------------------------------------------------------------------}
    procedure OnMaxWidthChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      OnPixelOffsetChange method is fired when PixelOffset property from InfoWindow object changes.
      @param Sender InfoWindow object
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método OnPixelOffsetChange se dispara cuando la propiedad PixelOffset del objeto InfoWindow cambia.
      @param Sender Objeto InfoWindow
    -------------------------------------------------------------------------------}
    procedure OnPixelOffsetChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      OnCloseOtherBeforeOpenChange method is fired when CloseOtherBeforeOpen property from InfoWindow object changes.
      @param Sender InfoWindow object
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método OnCloseOtherBeforeOpenChange se dispara cuando la propiedad CloseOtherBeforeOpen del objeto InfoWindow cambia.
      @param Sender Objeto InfoWindow
    -------------------------------------------------------------------------------}
    procedure OnCloseOtherBeforeOpenChange(Sender: TObject);

    {*------------------------------------------------------------------------------
      SetProperty method sets the value Value to a property of object from map using FunctionName function. Later fires EventName event.
      @param FunctionName Function name to call to set property value
      @param EventName Event name to fires after set value
      @param Value Value to set
      @param Quoted Indicates if the value requires quotes
      @return True is all is correct
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetProperty establece el valor Value a una propiedad al objeto del mapa mediante la función FunctionName. Posteriormente dispara el evento EventName.
      @param FunctionName Nombre de la función a llamar para establecer el valor de la propiedad
      @param EventName Nombre del evento a disparar después de establecer el valor
      @param Value Valor a establecer
      @param Quoted Indica si el valor tiene que ir entre comillas
      @return True si todo es correcto
    -------------------------------------------------------------------------------}
    function SetProperty(FunctionName, EventName, Value: string; Quoted: Boolean = True): Boolean; overload;
    {*------------------------------------------------------------------------------
      SetProperty method sets the value Value to a property of object from map using FunctionName function. Later fires EventName event.
      @param FunctionName Function name to call to set property value
      @param EventName Event name to fires after set value
      @param Value Value to set
      @return True is all is correct
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetProperty establece el valor Value a una propiedad al objeto del mapa mediante la función FunctionName. Posteriormente dispara el evento EventName.
      @param FunctionName Nombre de la función a llamar para establecer el valor de la propiedad
      @param EventName Nombre del evento a disparar después de establecer el valor
      @param Value Valor a establecer
      @return True si todo es correcto
    -------------------------------------------------------------------------------}
    function SetProperty(FunctionName, EventName: string; Value: Boolean): Boolean; overload;
    {*------------------------------------------------------------------------------
      SetProperty method sets the value Value to a property of object from map using FunctionName function. Later fires EventName event.
      @param FunctionName Function name to call to set property value
      @param EventName Event name to fires after set value
      @param Value Value to set
      @return True is all is correct
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetProperty establece el valor Value a una propiedad al objeto del mapa mediante la función FunctionName. Posteriormente dispara el evento EventName.
      @param FunctionName Nombre de la función a llamar para establecer el valor de la propiedad
      @param EventName Nombre del evento a disparar después de establecer el valor
      @param Value Valor a establecer
      @return True si todo es correcto
    -------------------------------------------------------------------------------}
    function SetProperty(FunctionName, EventName: string; Value: Integer): Boolean; overload;
    {*------------------------------------------------------------------------------
      SetProperty method sets the value Value to a property of object from map using FunctionName function. Later fires EventName event.
      @param FunctionName Function name to call to set property value
      @param EventName Event name to fires after set value
      @param Value Value to set
      @return True is all is correct
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SetProperty establece el valor Value a una propiedad al objeto del mapa mediante la función FunctionName. Posteriormente dispara el evento EventName.
      @param FunctionName Nombre de la función a llamar para establecer el valor de la propiedad
      @param EventName Nombre del evento a disparar después de establecer el valor
      @param Value Valor a establecer
      @return True si todo es correcto
    -------------------------------------------------------------------------------}
    function SetProperty(FunctionName, EventName: string; Value: Real): Boolean; overload;

    {*------------------------------------------------------------------------------
      Returns the name of the collection item as it appears in the collection editor. See Delphi documentation for more details.
      @return String with the name
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el nombre del item de la colección tal y como aparecerá en el editor de la colección. Ver la documentación de Delphi para más detalles.
      @return Cadena con el nombre
    -------------------------------------------------------------------------------}
    function GetDisplayName: string; override;

    {*------------------------------------------------------------------------------
      This method sets all properties to the object of the map.
      @return True if all is correct
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este método establece todas las propiedades al objeto del mapa.
      @return True si todo correcto
    -------------------------------------------------------------------------------}
    function ChangeProperties: Boolean; virtual; abstract;
    {*------------------------------------------------------------------------------
      Center the map on the figure.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Centra el mapa en la figura.
    -------------------------------------------------------------------------------}
    procedure CenterMapTo; virtual; abstract;

    {*------------------------------------------------------------------------------
      Index position in the list FLinkedComponents of TCustomGMMap class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Índice de la posición en la lista FLinkedComponents de la clase TCustomGMMap.
    -------------------------------------------------------------------------------}
    property IdxList: Cardinal read FIdxList write SetIdxList;
    {*------------------------------------------------------------------------------
      InfoWindows associated object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      InfoWindows asociado al objeto.
    -------------------------------------------------------------------------------}
    property InfoWindow: TBaseInfoWindow read FInfoWindow write FInfoWindow;
    {*------------------------------------------------------------------------------
      This property is used, if applicable, to establish the name that appears in the collection editor.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Esta propiedad se usa, si procede, para establecer el nombre que aparece en el editor de la colección.
    -------------------------------------------------------------------------------}
    property Text: string read FText write FText;
    {*------------------------------------------------------------------------------
      If true, InfoWindows is showed when mouse enter into the object and it is closed when leave.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si true, el InfoWindos se muestra cuando el ratón entra en el objeto y se cierra cuando sale.
    -------------------------------------------------------------------------------}
    property ShowInfoWinMouseOver: Boolean read FShowInfoWinMouseOver write SetShowInfoWinMouseOver default False;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param Collection Collection identifies the TCollection instance to which the new item belongs.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param Collection Collection identifica la instancia TCollection a la que pertenece el nuevo elemento.
    -------------------------------------------------------------------------------}
    constructor Create(Collection: TCollection); override;
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
      Shows or hides the InfoWindows.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra o oculta la ventana de información.
    -------------------------------------------------------------------------------}
    procedure OpenCloseInfoWin; virtual;
    {*------------------------------------------------------------------------------
      Represents an object that is associated with the item.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Representa un objeto que está asociado con el elemento.
    -------------------------------------------------------------------------------}
    property FObject: TObject read FFObject write FFObject;
  published
    {*------------------------------------------------------------------------------
      Tag property has no predefined meaning. It can store any additional integer value for the convenience of developers.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad Tag no tiene un sentido específico. Puede almacenar un valor entero adicional para comodidad del programador.
    -------------------------------------------------------------------------------}
    property Tag: Integer read FTag write FTag default 0;
  end;

  TLinkedComponentClass = class of TLinkedComponent;

  {*------------------------------------------------------------------------------
    Base class for components that need a collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los componentes que necesitan una colección.
  -------------------------------------------------------------------------------}
  TLinkedComponents = class(TCollection)
  private
    function GetItems(I: Integer): TLinkedComponent;
    procedure SetItems(I: Integer; const Value: TLinkedComponent);
  protected
    {*------------------------------------------------------------------------------
      Owner of the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propietario de la colección.
    -------------------------------------------------------------------------------}
    FGMLinkedComponent: TGMLinkedComponent;

    {*------------------------------------------------------------------------------
      Return the owner of the collection.
      @return Owner of collection
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el propietario de la colección.
      @return Propietario de la colección.
    -------------------------------------------------------------------------------}
    function GetOwner: TPersistent; override;

    {*------------------------------------------------------------------------------
      Creates a new TLinkedComponent instance and adds it to the Items array.
      @return New item
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TLinkedComponent y la añade en el array de Items.
      @return Nuevo elemento
    -------------------------------------------------------------------------------}
    function Add: TLinkedComponent;                     // ES: regenera todos los LinkedComponent - EN: reload all LinkedComponent
    {*------------------------------------------------------------------------------
      Creates a new TLinkedComponent instance and adds it to the Items array.
      @param Index Position to insert
      @return New item
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TLinkedComponent y la añade en el array de Items.
      @param Index Posición en la que insertar
      @return Nuevo elemento
    -------------------------------------------------------------------------------}
    function Insert(Index: Integer): TLinkedComponent;  // ES: regenera todos los LinkedComponent - EN: reload all LinkedComponent
    {*------------------------------------------------------------------------------
      Deletes a single item from the collection.
      @param Index Position to delete
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra un elemento de la colección.
      @param Index Posición a borrar
    -------------------------------------------------------------------------------}
    procedure Delete(Index: Integer);                   // ES: regenera todos los LinkedComponent - EN: reload all LinkedComponent
    {*------------------------------------------------------------------------------
      Moves a item to a new position into Items array.
      @param CurIndex Index of Item to move
      @param NewIndex Destination index
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mueve un item a una nueva posición dentro del array de Items.
      @param CurIndex Índice del elemento a mover
      @param NewIndex Índice destino
    -------------------------------------------------------------------------------}
    procedure Move(CurIndex, NewIndex: Integer);        // ES: regenera todos los LinkedComponent - EN: reload all LinkedComponent
    {*------------------------------------------------------------------------------
      Deletes all items from the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los elementos de la colección.
    -------------------------------------------------------------------------------}
    procedure Clear;                                    // ES: regenera todos los LinkedComponent - EN: reload all LinkedComponent

    {*------------------------------------------------------------------------------
      Lists the items in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de elementos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TLinkedComponent read GetItems write SetItems; default;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param GMLinkedComponent Owner of collection
      @param ItemClass Class of new Items
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param GMLinkedComponent Propietario de la colección
      @param ItemClass Clase de los nuevos elementos
    -------------------------------------------------------------------------------}
    constructor Create(GMLinkedComponent: TGMLinkedComponent; ItemClass: TCollectionItemClass); virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  end;

  TLinkedComponentsClass = class of TLinkedComponents;

  {*------------------------------------------------------------------------------
    TLinkedComponentChange is fired when a property of collection item changes.
    @param Sender Owner object of the collection item
    @param Index Index into the array of Items
    @param LinkedComponent Collection Item that changes
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TLinkedComponentChange se dispara cuando cambia una propiedad de un elemento de la colección.
    @param Sender Objecto propietario del elemento de la colección
    @param Index Índice dentro del array de elementos
    @param LinkedComponent Elemento de la colección que cambia
  -------------------------------------------------------------------------------}
  TLinkedComponentChange = procedure(Sender: TObject; Index: Integer; LinkedComponent: TLinkedComponent) of object;
  {*------------------------------------------------------------------------------
    TLatLngIdxEvent is fired when a property of collection item changes relevant to a TLatLng.
    @param Sender Owner object of the collection item.
    @param LatLng New LatLng of the collection item.
    @param Index Index into the array of Items.
    @param LinkedComponent Collection Item that changes.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El evento TLatLngIdxEvent se dispara cuando cambia una propiedad de un elemento de la colección relacionado a una TLatLng.
    @param Sender Objecto propietario del elemento de la colección.
    @param LatLng Nueva LatLng del elemento de la colección.
    @param Index Índice dentro del array de elementos.
    @param LinkedComponent Elemento de la colección que cambia.
  -------------------------------------------------------------------------------}
  TLatLngIdxEvent = procedure(Sender: TObject; LatLng: TLatLng; Index: Integer; LinkedComponent: TLinkedComponent) of object;

  {*------------------------------------------------------------------------------
    Base class for components that need a collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los componentes que necesitan una colección.
  -------------------------------------------------------------------------------}
  TGMLinkedComponent = class(TGMObjects)
  private
    FVisualObjects: TLinkedComponents;
    FOnCloseClick: TLinkedComponentChange;
    FAutoUpdate: Boolean;
    FOnCloseOtherBeforeOpenChange: TLinkedComponentChange;
    FOnDisableAutoPanChange: TLinkedComponentChange;
    FOnMaxWidthChange: TLinkedComponentChange;
    FOnPixelOffsetChange: TLinkedComponentChange;
    FOnHTMLContentChange: TLinkedComponentChange;
    procedure SetAutoUpdate(const Value: Boolean);
  protected
    procedure SetIdxList(const Value: Cardinal); override;
    {*------------------------------------------------------------------------------
      Get a TLinkedComponent object in I position
      @param I Position to return
      @return If exist into the Item collection, an instance of TLinkedComponent
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el objeto TLinkedComponent situado en la posición I.
      @param I Posición a devolver
      @return Si existe en la colección de elementos, una instancia de TLinkedComponent
    -------------------------------------------------------------------------------}
    function GetItems(I: Integer): TLinkedComponent;

    {*------------------------------------------------------------------------------
      Error management returned from JavaScript.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Gestión de los errores devueltos desde JavaScript.
    -------------------------------------------------------------------------------}
    procedure ErrorControl; virtual;
    procedure DeleteMapObjects; override;
    procedure EventFired(EventType: TEventType; Params: array of const); override;
    {*------------------------------------------------------------------------------
      Obtains the collection item class that implements.
      @return Item collection class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Obtienen la classe de la colección de items que implementa.
      @return Clase del elemento de la colección
    -------------------------------------------------------------------------------}
    function GetCollectionItemClass: TLinkedComponentClass; virtual;
    {*------------------------------------------------------------------------------
      Obtains the collection class that implements.
      @return Collection class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Obtienen la classe de la colección que implementa.
      @return Clase de la colección
    -------------------------------------------------------------------------------}
    function GetCollectionClass: TLinkedComponentsClass; virtual;

    {*------------------------------------------------------------------------------
      Obtains the number of collection items.
      @return Number of items
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Obtienen el número de elementos de la colección.
      @return Número de elementos
    -------------------------------------------------------------------------------}
    function GetCount: Integer;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TLinkedComponent read GetItems; default;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ShowElements; override;

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
      Creates a new TLinkedComponent instance and adds it to the Items array.
      @return New item
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TLinkedComponent y la añade en el array de Items.
      @return Nuevo elemento
    -------------------------------------------------------------------------------}
    function Add: TLinkedComponent;
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

    property Count: Integer read GetCount;
    {*------------------------------------------------------------------------------
      Collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Colección de elementos.
    -------------------------------------------------------------------------------}
    property VisualObjects: TLinkedComponents read FVisualObjects write FVisualObjects;
  published
    {*------------------------------------------------------------------------------
      If Active, update objects automatically, if not, you need to reload map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si Active, modifica los objetos de forma automática, sino, necesita recargar el mapa.
    -------------------------------------------------------------------------------}
    property AutoUpdate: Boolean read FAutoUpdate write SetAutoUpdate default True;

    // ES/EN: eventos/events
    {*------------------------------------------------------------------------------
      OnCloseClick event is fired when the InfoWindows is closed manually.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnCloseClick se dispara cuando la InfoWindows se cierra manualmente.
    -------------------------------------------------------------------------------}
    property OnCloseClick: TLinkedComponentChange read FOnCloseClick write FOnCloseClick;
    {*------------------------------------------------------------------------------
      OnHTMLContentChange event is fired when HTMLContent property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnHTMLContentChange se dispara cuando cambia la propiedad HTMLContent.
    -------------------------------------------------------------------------------}
    property OnHTMLContentChange: TLinkedComponentChange read FOnHTMLContentChange write FOnHTMLContentChange;
    {*------------------------------------------------------------------------------
      OnDisableAutoPanChange event is fired when DisableAutoPan property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnDisableAutoPanChange se dispara cuando cambia la propiedad DisableAutoPan.
    -------------------------------------------------------------------------------}
    property OnDisableAutoPanChange: TLinkedComponentChange read FOnDisableAutoPanChange write FOnDisableAutoPanChange;
    {*------------------------------------------------------------------------------
      OnMaxWidthChange event is fired when MaxWidth property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnMaxWidthChange se dispara cuando cambia la propiedad MaxWidth.
    -------------------------------------------------------------------------------}
    property OnMaxWidthChange: TLinkedComponentChange read FOnMaxWidthChange write FOnMaxWidthChange;
    {*------------------------------------------------------------------------------
      OnPixelOffsetChange event is fired when PixelOffset property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnPixelOffsetChange se dispara cuando cambia la propiedad PixelOffset.
    -------------------------------------------------------------------------------}
    property OnPixelOffsetChange: TLinkedComponentChange read FOnPixelOffsetChange write FOnPixelOffsetChange;
    {*------------------------------------------------------------------------------
      OnCloseOtherBeforeOpenChange event is fired when CloseOtherBeforeOpen property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El evento OnCloseOtherBeforeOpenChange se dispara cuando cambia la propiedad CloseOtherBeforeOpen.
    -------------------------------------------------------------------------------}
    property OnCloseOtherBeforeOpenChange: TLinkedComponentChange read FOnCloseOtherBeforeOpenChange write FOnCloseOtherBeforeOpenChange;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.TypInfo, System.SysUtils,
  {$ELSE}
  TypInfo, SysUtils,
  {$ENDIF}

  Lang, GMFunctions;

{ TLinkedComponent }

procedure TLinkedComponent.Assign(Source: TPersistent);
begin
  if Source is TLinkedComponent then
  begin
    IdxList := TLinkedComponent(Source).IdxList;
    InfoWindow.Assign(TLinkedComponent(Source).InfoWindow);
    Text := TLinkedComponent(Source).Text;
    ShowInfoWinMouseOver := TLinkedComponent(Source).ShowInfoWinMouseOver;
    FObject := TLinkedComponent(Source).FObject;
    Tag := TLinkedComponent(Source).Tag;
  end
  else
    inherited Assign(Source);
end;

constructor TLinkedComponent.Create(Collection: TCollection);
begin
  inherited;

  FText := Self.ClassName;
  FInfoWindow := TBaseInfoWindow.Create(Self);
  FInfoWindow.OnCloseOtherBeforeOpenChange := OnCloseOtherBeforeOpenChange;
  FInfoWindow.OnHTMLContentChange := OnHTMLContentChange;
  FInfoWindow.OnDisableAutoPanChange := OnDisableAutoPanChange;
  FInfoWindow.OnMaxWidthChange := OnMaxWidthChange;
  FInfoWindow.OnPixelOffsetChange := OnPixelOffsetChange;
  FShowInfoWinMouseOver := False;

  FIdxList := 0;
  if Assigned(Collection) and (Collection is TLinkedComponents) and
     Assigned(TLinkedComponents(Collection).FGMLinkedComponent) then
    FIdxList := TLinkedComponents(Collection).FGMLinkedComponent.IdxList;
end;

destructor TLinkedComponent.Destroy;
begin
  if Assigned(FInfoWindow) then FreeAndNil(FInfoWindow);

  inherited;
end;

function TLinkedComponent.GetDisplayName: string;
begin
  if Length(FText) > 0 then
  begin
    if Length(FText) > 15 then
      Result := Copy(FText, 0, 15) + '...'
    else
      Result := FText;
  end
  else
  begin
    Result := inherited GetDisplayName;
    FText := Result;
  end;
end;

procedure TLinkedComponent.OnCloseOtherBeforeOpenChange(Sender: TObject);
begin
  ChangeProperties;
  if Assigned(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnCloseOtherBeforeOpenChange) then
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnCloseOtherBeforeOpenChange(
                     TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent),
                     Index,
                     Self);
end;

procedure TLinkedComponent.OnDisableAutoPanChange(Sender: TObject);
begin
  ChangeProperties;
  if Assigned(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnDisableAutoPanChange) then
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnDisableAutoPanChange(
                    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent),
                    Index,
                    Self);
end;

procedure TLinkedComponent.OnHTMLContentChange(Sender: TObject);
begin
  ChangeProperties;
  if Assigned(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnHTMLContentChange) then
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnHTMLContentChange(
                    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent),
                    Index,
                    Self);
end;

procedure TLinkedComponent.OnMaxWidthChange(Sender: TObject);
begin
  ChangeProperties;
  if Assigned(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnMaxWidthChange) then
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnMaxWidthChange(
                    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent),
                    Index,
                    Self);
end;

procedure TLinkedComponent.OnPixelOffsetChange(Sender: TObject);
begin
  ChangeProperties;
  if Assigned(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnPixelOffsetChange) then
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).OnPixelOffsetChange(
                    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent),
                    Index,
                    Self);
end;

procedure TLinkedComponent.OpenCloseInfoWin;
const
  StrParams = 'null,%s,%s';
var
  Params: string;
begin
  if Assigned(Collection) and (Collection is TLinkedComponents) and
     Assigned(TLinkedComponents(Collection).FGMLinkedComponent) then
  begin
    Params := Format(StrParams, [
                      IntToStr(IdxList),
                      IntToStr(Index)]);
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).ExecuteScript('InfoWindowOpenClose', Params);
  end;
end;

procedure TLinkedComponent.SetIdxList(const Value: Cardinal);
begin
  if FIdxList = Value then Exit;

  FIdxList := Value;
end;

function TLinkedComponent.SetProperty(FunctionName, EventName: string;
  Value: Real): Boolean;
begin
  Result := SetProperty(FunctionName, EventName, StringReplace(FloatToStr(Value), ',', '.', [rfReplaceAll]), False);
end;

function TLinkedComponent.SetProperty(FunctionName, EventName: string;
  Value: Integer): Boolean;
begin
  Result := SetProperty(FunctionName, EventName, IntToStr(Value), False);
end;

function TLinkedComponent.SetProperty(FunctionName, EventName, Value: string;
  Quoted: Boolean): Boolean;
const
  StrParams = '%s,%s,%s';
var
  Params: string;
  Event: TMethod;
  Tmp: string;
begin
  Result := False;
  if Assigned(Collection) and (Collection is TLinkedComponents) and
     Assigned(TLinkedComponents(Collection).FGMLinkedComponent) and
     TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).AutoUpdate then
  begin
    if csDesigning in TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).ComponentState then Exit;

    Tmp := TLinkedComponents(Collection).FGMLinkedComponent.GetConvertedString(Value);
    if Quoted then Tmp := QuotedStr(Tmp);

    Params := Format(StrParams, [
                      IntToStr(IdxList),
                      Tmp,
                      IntToStr(Index)]);
    Result := TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).ExecuteScript(FunctionName, Params);

    // ES: control de errores // EN: error control
    TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent).ErrorControl;

    // ES/EN: evento/event
    Event := GetMethodProp(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent), EventName);

    if Assigned(Event.Code) and Result then
      TLinkedComponentChange(Event)(TGMLinkedComponent(TLinkedComponents(Collection).FGMLinkedComponent), Index, Self);
  end;
end;

function TLinkedComponent.SetProperty(FunctionName, EventName: string;
  Value: Boolean): Boolean;
begin
  Result := SetProperty(FunctionName, EventName, LowerCase(TCustomTransform.GMBoolToStr(Value, True)), False);
end;

procedure TLinkedComponent.SetShowInfoWinMouseOver(const Value: Boolean);
begin
  if FShowInfoWinMouseOver = Value then Exit;

  FShowInfoWinMouseOver := Value;
  ChangeProperties;
end;

{ TLinkedComponents }

function TLinkedComponents.Add: TLinkedComponent;
begin
  Result := TLinkedComponent(inherited Add);

  if Assigned(FGMLinkedComponent) and FGMLinkedComponent.AutoUpdate then
    FGMLinkedComponent.ShowElements;
end;

procedure TLinkedComponents.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TLinkedComponents then
    FGMLinkedComponent := TLinkedComponents(Source).FGMLinkedComponent;
end;

procedure TLinkedComponents.Clear;
begin
  inherited Clear;

  if Assigned(FGMLinkedComponent) and FGMLinkedComponent.AutoUpdate then
    FGMLinkedComponent.ShowElements;
end;

constructor TLinkedComponents.Create(GMLinkedComponent: TGMLinkedComponent;
  ItemClass: TCollectionItemClass);
begin
  inherited Create(ItemClass);

  FGMLinkedComponent := GMLinkedComponent;
end;

procedure TLinkedComponents.Delete(Index: Integer);
begin
  inherited Delete(Index);

  if Assigned(FGMLinkedComponent) and FGMLinkedComponent.AutoUpdate then
    FGMLinkedComponent.ShowElements;
end;

function TLinkedComponents.GetItems(I: Integer): TLinkedComponent;
begin
  Result := TLinkedComponent(inherited Items[I]);
end;

function TLinkedComponents.GetOwner: TPersistent;
begin
  Result := FGMLinkedComponent;
end;

function TLinkedComponents.Insert(Index: Integer): TLinkedComponent;
begin
  Result := TLinkedComponent(inherited Insert(Index));

  if Assigned(FGMLinkedComponent) and FGMLinkedComponent.AutoUpdate then
    FGMLinkedComponent.ShowElements;
end;

procedure TLinkedComponents.Move(CurIndex, NewIndex: Integer);
begin
  Items[CurIndex].Index := NewIndex;

  if Assigned(FGMLinkedComponent) and FGMLinkedComponent.AutoUpdate then
    FGMLinkedComponent.ShowElements;
end;

procedure TLinkedComponents.SetItems(I: Integer; const Value: TLinkedComponent);
begin
  inherited SetItem(I, Value);
end;

{ TGMLinkedComponent }

function TGMLinkedComponent.Add: TLinkedComponent;
begin
  Result := FVisualObjects.Add;
end;

procedure TGMLinkedComponent.Assign(Source: TPersistent);
begin
  if Source is TGMLinkedComponent then
  begin
    IdxList := TGMLinkedComponent(Source).IdxList;
    VisualObjects.Assign(TGMLinkedComponent(Source).VisualObjects);
    Map := TGMLinkedComponent(Source).Map;
    AutoUpdate := TGMLinkedComponent(Source).AutoUpdate;
  end
  else
    inherited Assign(Source);
end;

procedure TGMLinkedComponent.Clear;
begin
  FVisualObjects.Clear;
end;

constructor TGMLinkedComponent.Create(AOwner: TComponent);
begin
  inherited;

  FVisualObjects := GetCollectionClass.Create(Self, GetCollectionItemClass);
  FAutoUpdate := True;
end;

procedure TGMLinkedComponent.Delete(Index: Integer);
begin
  FVisualObjects.Delete(Index);
end;

procedure TGMLinkedComponent.DeleteMapObjects;
begin
  ExecuteScript('DeleteObjects', IntToStr(IdxList));
end;

destructor TGMLinkedComponent.Destroy;
begin
  if Assigned(FVisualObjects) then FreeAndNil(FVisualObjects);

  inherited;
end;

procedure TGMLinkedComponent.ErrorControl;
var
  ErrCode: Integer;
begin
  if not Assigned(Map) or not IsMapActive then Exit;

  ErrCode := GetIntegerField(ErrorForm, ErrorFormErrorCode);

  case ErrCode of
    1: // objeto no encontrado en JavaScript // Object not find in JavaScript
      raise Exception.Create(GetTranslateText('Este objeto no tiene relación en JavaScript', Map.Language));
  end;
end;

procedure TGMLinkedComponent.EventFired(EventType: TEventType;
  Params: array of const);
begin
  inherited;

  if EventType = etInfoWinCloseClick then
    if Assigned(OnCloseClick) then OnCloseClick(Self, Params[0].VInteger, Items[Params[0].VInteger]);
end;

function TGMLinkedComponent.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TLinkedComponents;
end;

function TGMLinkedComponent.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TLinkedComponent;
end;

function TGMLinkedComponent.GetCount: Integer;
begin
  Result := FVisualObjects.Count;
end;

function TGMLinkedComponent.GetItems(I: Integer): TLinkedComponent;
begin
  Result := TLinkedComponent(FVisualObjects[i]);
end;

procedure TGMLinkedComponent.Move(CurIndex, NewIndex: Integer);
begin
  FVisualObjects.Move(CurIndex, NewIndex);
end;

procedure TGMLinkedComponent.SetAutoUpdate(const Value: Boolean);
begin
  if FAutoUpdate = Value then Exit;

  FAutoUpdate := Value;
  ShowElements;
end;

procedure TGMLinkedComponent.SetIdxList(const Value: Cardinal);
var
  i: Integer;
begin
  inherited;

  if Assigned(FVisualObjects) then
    for i := 0 to FVisualObjects.Count - 1 do
      Items[i].IdxList := IdxList;
end;

procedure TGMLinkedComponent.ShowElements;
var
  i: Integer;
begin
  if not ExecuteScript('DeleteObjects', IntToStr(IdxList)) then Exit;

  for i:= 0 to VisualObjects.Count - 1 do
    Items[i].ChangeProperties;
end;

end.
