{
TGMMarker component

  ES: componente para mostrar ventanas de informaci�n en un mapa de Google Maps
      mediante el componente TGMMap
  EN: component to show balloons with information on Google Map map using the
      component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner el
      texto a mostrar en la propiedad "HTMLContent"
  EN: put the component into a form, link to a TGMMap and put the text to show
      into "HTMLContent" property
=========================================================================
History:

ver 1.0.0
  ES:
    cambio: las propiedades se cambian mediante el m�todo ChangeProperties.
  EN:
    change: properties are changed by ChangeProperties method.

ver 0.1.9
  ES:
    nuevo: documentaci�n
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey

ver 0.1.1
  ES:
    nuevo: a�adida propiedad AutoOpen en la clase TInfoWindow
    nuevo: a�adido evento OnPositionChange
  EN:
    new: added property AutoOpen in TInfoWindow class
    new: added event OnPositionChange

ver 0.1
  ES- primera versi�n
  EN- first version
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, env�ame un correo a:
  gmlib@cadetill.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================

Copyright (�) 2012, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  The GMInfoWindow unit includes the classes needed to show InfoWindows on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.5
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMMarker contiene las clases necesarias para mostrar ventanas de informaci�n en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.5
-------------------------------------------------------------------------------}
unit GMInfoWindow;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMLinkedComponents, GMClasses;

type
  TGMInfoWindow = class;
  TInfoWindow = class;

  {*------------------------------------------------------------------------------
    Class management of InfoWindows.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#InfoWindow
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la gesti�n de ventanas de informaci�n.
    M�s informaci�n en https://developers.google.com/maps/documentation/javascript/reference?hl=en#InfoWindow
  -------------------------------------------------------------------------------}
  TInfoWindow = class(TLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      The LatLng at which to display this InfoWindow.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      TLatLng donde se mostrar� la ventana de informaci�n.
    -------------------------------------------------------------------------------}
    FPosition: TLatLng;
    {*------------------------------------------------------------------------------
      If true, when it is created, will be displayed automatically.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, cuando se cree, se mostrar� autom�ticamente.
    -------------------------------------------------------------------------------}
    FAutoOpen: Boolean;
    function GetContent: string;
    function GetDisableAutoPan: Boolean;
    function GetMaxWidth: Integer;
    function GetPixelOffset: TGMSize;
    function GetCloseOtherBeforeOpen: Boolean;
    procedure SetContent(const Value: string);
    procedure SetDisableAutoPan(const Value: Boolean);
    procedure SetMaxWidth(const Value: Integer);
    procedure SetPixelOffset(const Value: TGMSize);
    procedure SetCloseOtherBeforeOpen(const Value: Boolean);
    procedure OnPositionChange(Sender: TObject);
  protected
    function GetDisplayName: string; override;
    function ChangeProperties: Boolean; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    procedure CenterMapTo; override;

    {*------------------------------------------------------------------------------
      Shows or hides the InfoWindows.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra o oculta la ventana de informaci�n.
    -------------------------------------------------------------------------------}
    procedure OpenClose;
  published
    {*------------------------------------------------------------------------------
      Content to display in the InfoWindow. This can be an HTML element, a plain-text string, or a string containing HTML. The InfoWindow will be sized according to the content. To set an explicit size for the content, set content to be a HTML element with that size.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Contenido a mostrar en la InfoWindow. �ste puede ser un elemento HTML, texto plano, o una cadena que contenga HTML. El InfoWindow se agrandar� acorde al contenido. Para especificar unas determinadas medidas para el contenido, establece el contenido como un elemento HTML con esas medidas.
    -------------------------------------------------------------------------------}
    property HTMLContent: string read GetContent write SetContent;
    {*------------------------------------------------------------------------------
      Disable auto-pan on open.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Deshabilita el auto-pan en abierto.
    -------------------------------------------------------------------------------}
    property DisableAutoPan: Boolean read GetDisableAutoPan write SetDisableAutoPan;
    {*------------------------------------------------------------------------------
      Maximum width of the infowindow, regardless of content's width. 0 no Max.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Ancho m�ximo del InfoWindows, independientemente de la anchura del contenido. A 0 sin m�ximo.
    -------------------------------------------------------------------------------}
    property MaxWidth: Integer read GetMaxWidth write SetMaxWidth;  // 0 = no MaxWidth
    {*------------------------------------------------------------------------------
      The offset, in pixels, of the tip of the info window from the point on the map at whose geographical coordinates the info window is anchored.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Offset, en p�xeles, del extremo de la ventana de informaci�n desde el punto en las coordenadas geogr�ficas en las que se ancla la ventana de informaci�n.
    -------------------------------------------------------------------------------}
    property PixelOffset: TGMSize read GetPixelOffset write SetPixelOffset; // (0,0) = no pixelOffset
    {*------------------------------------------------------------------------------
      Set to true to close others info windows opened.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Poner a true para cerrar otras ventanas de informaci�n abiertas.
    -------------------------------------------------------------------------------}
    property CloseOtherBeforeOpen: Boolean read GetCloseOtherBeforeOpen write SetCloseOtherBeforeOpen;
    property Position: TLatLng read FPosition write FPosition;
    property AutoOpen: Boolean read FAutoOpen write FAutoOpen;
  end;

  {*------------------------------------------------------------------------------
    Class for InfoWindow collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la colecci�n de InfoWindow.
  -------------------------------------------------------------------------------}
  TInfoWindows = class(TLinkedComponents)
  private
    function GetItems(I: Integer): TInfoWindow;
    procedure SetItems(I: Integer; const Value: TInfoWindow);
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TInfoWindow;
    function Insert(Index: Integer): TInfoWindow;

    {*------------------------------------------------------------------------------
      Lists the infowindow in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de infowindow en la colecci�n.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TInfoWindow read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of InfoWindow.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la gesti�n de InfoWindow.
  -------------------------------------------------------------------------------}
  TGMInfoWindow = class(TGMLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      This event is fired when InfoWindow's position changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia la posici�n del InfoWindow.
    -------------------------------------------------------------------------------}
    FOnPositionChange: TLatLngIdxEvent;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TInfoWindow;

    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates a new TInfoWindow instance and adds it to the Items array.
      @param Lat InfoWindow latitude.
      @param Lng InfoWindow longitude.
      @param HTMLContent InfoWindow content in HTML format.
      @return New InfoWindow.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TInfoWindow y la a�ade en el array de Items.
      @param Lat Latitud del InfoWindow.
      @param Lng Longitud del InfoWindow.
      @param HTMLContent Contenido del InfoWindow en formato HTML.
      @return Nuevo InfoWindow.
    -------------------------------------------------------------------------------}
    function Add(Lat: Real = 0; Lng: Real = 0; HTMLContent: string = ''): TInfoWindow;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colecci�n de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TInfoWindow read GetItems; default;
  published
    {*------------------------------------------------------------------------------
      Collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Colecci�n de elementos.
    -------------------------------------------------------------------------------}
    property VisualObjects;
    property OnPositionChange: TLatLngIdxEvent read FOnPositionChange write FOnPositionChange;
  end;

implementation

uses
  SysUtils,

  GMFunctions;

{ TGMInfoWindow }

function TGMInfoWindow.Add(Lat, Lng: Real; HTMLContent: string): TInfoWindow;
begin
  Result := TInfoWindow(inherited Add);
  Result.Position.Lat := Lat;
  Result.Position.Lng := Lng;
  Result.HTMLContent := HTMLContent;
end;

function TGMInfoWindow.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#InfoWindow';
end;

function TGMInfoWindow.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TInfoWindows;
end;

function TGMInfoWindow.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TInfoWindow;
end;

function TGMInfoWindow.GetItems(I: Integer): TInfoWindow;
begin
  Result := TInfoWindow(inherited Items[i]);
end;

{ TInfoWindows }

function TInfoWindows.Add: TInfoWindow;
begin
  Result := TInfoWindow(inherited Add);
end;

function TInfoWindows.GetItems(I: Integer): TInfoWindow;
begin
  Result := TInfoWindow(inherited Items[I]);
end;

function TInfoWindows.GetOwner: TPersistent;
begin
  Result := TGMInfoWindow(inherited GetOwner);
end;

function TInfoWindows.Insert(Index: Integer): TInfoWindow;
begin
  Result := TInfoWindow(inherited Insert(Index));
end;

procedure TInfoWindows.SetItems(I: Integer; const Value: TInfoWindow);
begin
  inherited SetItem(I, Value);
end;

{ TInfoWindow }

procedure TInfoWindow.Assign(Source: TPersistent);
begin
  if Source is TInfoWindow then
  begin
    Position.Assign(TInfoWindow(Source).Position);
    AutoOpen := TInfoWindow(Source).AutoOpen;
  end
  else
    inherited Assign(Source);
end;

procedure TInfoWindow.CenterMapTo;
begin
  inherited;

  if Assigned(Collection) and (Collection is TInfoWindows) and
     Assigned(TInfoWindows(Collection).FGMLinkedComponent) and
     Assigned(TInfoWindows(Collection).FGMLinkedComponent.Map) then
    TInfoWindows(Collection).FGMLinkedComponent.Map.SetCenter(Position.Lat, Position.Lng);
end;

function TInfoWindow.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  inherited;

  Result := False;

  if not Assigned(Collection) or not(Collection is TInfoWindows) or
     not Assigned(TInfoWindows(Collection).FGMLinkedComponent) or
     //not TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).AutoUpdate or
     not Assigned(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  Params := Format(StrParams, [
                  IntToStr(IdxList),
                  IntToStr(Index),
                  QuotedStr(InfoWindow.GetConvertedString),
                  LowerCase(TCustomTransform.GMBoolToStr(DisableAutoPan, True)),
                  IntToStr(MaxWidth),
                  IntToStr(PixelOffset.Height),
                  IntToStr(PixelOffset.Width),
                  Position.LatToStr(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).GetMapPrecision),
                  Position.LngToStr(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).GetMapPrecision),
                  LowerCase(TCustomTransform.GMBoolToStr(CloseOtherBeforeOpen, True))
                  ]);

  TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).ExecuteScript('MakeInfoWindow', Params);

  if AutoOpen then OpenClose;
end;

constructor TInfoWindow.Create(Collection: TCollection);
begin
  inherited;

  FPosition := TLatLng.Create;
  FPosition.OnChange := OnPositionChange;
  FAutoOpen := True;
end;

destructor TInfoWindow.Destroy;
begin
  if Assigned(FPosition) then FreeAndNil(FPosition);

  inherited;
end;

function TInfoWindow.GetCloseOtherBeforeOpen: Boolean;
begin
  Result := InfoWindow.CloseOtherBeforeOpen;
end;

function TInfoWindow.GetContent: string;
begin
  Result := InfoWindow.HTMLContent;
end;

function TInfoWindow.GetDisableAutoPan: Boolean;
begin
  Result := InfoWindow.DisableAutoPan;
end;

function TInfoWindow.GetDisplayName: string;
begin
  if Length(InfoWindow.HTMLContent) > 0 then
  begin
    if Length(InfoWindow.HTMLContent) > 15 then
      Result := Copy(InfoWindow.HTMLContent, 0, 12) + '...'
    else
      Result := InfoWindow.HTMLContent;
  end
  else
    Result := inherited GetDisplayName;
end;

function TInfoWindow.GetMaxWidth: Integer;
begin
  Result := InfoWindow.MaxWidth;
end;

function TInfoWindow.GetPixelOffset: TGMSize;
begin
  Result := InfoWindow.PixelOffset;
end;

procedure TInfoWindow.OnPositionChange(Sender: TObject);
{const
  StrParams = '%s,%s,%s,%s';
var
  Params: string;}
begin
  ChangeProperties;
  if Assigned(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).OnPositionChange) then
    TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).OnPositionChange(
                TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent),
                FPosition,
                Index,
                Self);

{  if Assigned(Collection) and (Collection is TInfoWindows) and
     Assigned(TInfoWindows(Collection).FGMLinkedComponent) and
     TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).AutoUpdate and
     Assigned(TInfoWindows(Collection).FGMLinkedComponent.Map) then
  begin
    Params := Format(StrParams, [
                   IntToStr(IdxList),
                   Position.LatToStr(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).GetMapPrecision),
                   Position.LngToStr(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).GetMapPrecision),
                   IntToStr(Index)
                  ]);
    TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).ExecuteScript('InfoWindowSetPosition', Params);

    // ES/EN: evento/event
    if Assigned(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).OnPositionChange) then
      TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).OnPositionChange(TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent), FPosition, Index, Self);
  end;}
end;

procedure TInfoWindow.OpenClose;
const
  StrParams = 'null,%s,%s';
var
  Params: string;
begin
  if Assigned(Collection) and (Collection is TInfoWindows) and
     Assigned(TInfoWindows(Collection).FGMLinkedComponent) and
     TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).AutoUpdate then
  begin
    Params := Format(StrParams, [
                      IntToStr(IdxList),
                      IntToStr(Index)]);
    TGMInfoWindow(TInfoWindows(Collection).FGMLinkedComponent).ExecuteScript('InfoWindowOpenClose', Params);
  end;
end;

procedure TInfoWindow.SetCloseOtherBeforeOpen(const Value: Boolean);
begin
  InfoWindow.CloseOtherBeforeOpen := Value;
end;

procedure TInfoWindow.SetContent(const Value: string);
begin
  InfoWindow.HTMLContent := Value;
end;

procedure TInfoWindow.SetDisableAutoPan(const Value: Boolean);
begin
  InfoWindow.DisableAutoPan := Value;
end;

procedure TInfoWindow.SetMaxWidth(const Value: Integer);
begin
  InfoWindow.MaxWidth := Value;
end;

procedure TInfoWindow.SetPixelOffset(const Value: TGMSize);
begin
  InfoWindow.PixelOffset.Assign(Value);
end;

end.
