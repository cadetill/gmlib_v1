{
GMGroundOverlay unit

  ES: contiene las clases necesarias para mostrar imágenes en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the classes needed to show images on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner las
      imágenes a mostrar
  EN: put the component into a form, link to a TGMMap and put the images to
      show
=========================================================================
History:

ver 1.3.2
  ES:
    error: TGroundOverlay -> corregido método ChangeProperties (thanks Fred).
  EN:
    bug: TGroundOverlay -> fixed method ChangeProperties (thanks Fred).

ver 1.2.0
  ES:
    error: TGMGroundOverlay -> corregido error al añadir por código un item (gracias Drugoi_mir).
  EN:
    bug: TGMGroundOverlay -> bug fixed when adding an item by code (thanks Drugoi_mir).

ver 1.0.0
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
  The GMGroundOverlay unit includes the classes needed to show images on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMGroundOverlay contiene las clases necesarias para mostrar imágenes en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMGroundOverlay;

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
    Class for GroundOverlay.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#GroundOverlay
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para los GroundOverlay.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#GroundOverlay
  -------------------------------------------------------------------------------}
  TGroundOverlay = class(TLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      The opacity between 0.0 and 1.0.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad con valores entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FOpacity: Real;
    {*------------------------------------------------------------------------------
      The image bounds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Límites de la imagen.
    -------------------------------------------------------------------------------}
    FBounds: TLatLngBounds;
    {*------------------------------------------------------------------------------
      Url or file path of the image to show.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Url o path del fichero de la imagen a mostar.
    -------------------------------------------------------------------------------}
    FUrl: string;
    {*------------------------------------------------------------------------------
      Indicates whether this image handles mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si esta imagen recivirá eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      If this image is visible on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si la imagen está visible en el mapa.
    -------------------------------------------------------------------------------}
    FVisible: Boolean;

    procedure SetClickable(const Value: Boolean);
    procedure SetOpacity(const Value: Real);
    procedure SetUrl(const Value: string);
    procedure OnChangeBounds(Sender: TObject);
    procedure SetVisible(const Value: Boolean);
  protected
    function ChangeProperties: Boolean; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    procedure CenterMapTo; override;
  published
    property Bounds: TLatLngBounds read FBounds write FBounds;
    property Clickable: Boolean read FClickable write SetClickable;
    property Visible: Boolean read FVisible write SetVisible;
    property Opacity: Real read FOpacity write SetOpacity;
    property Url: string read FUrl write SetUrl;
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
    Class for overlays collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la colección de superposiciones.
  -------------------------------------------------------------------------------}
  TGroundOverlays = class(TLinkedComponents)
  private
    procedure SetItems(I: Integer; const Value: TGroundOverlay);
    function GetItems(I: Integer): TGroundOverlay;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TGroundOverlay;
    function Insert(Index: Integer): TGroundOverlay;

    {*------------------------------------------------------------------------------
      Lists the overlays in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de superposiciones en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TGroundOverlay read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class for GMGroundOverlay component.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para el componente GMGroundOverlay.
  -------------------------------------------------------------------------------}
  TGMGroundOverlay = class(TGMLinkedComponent)
  private
    {*------------------------------------------------------------------------------
      This event is fired when the overlay's Clickable property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Clickable de una superposición.
    -------------------------------------------------------------------------------}
    FOnClickableChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the overlay's Opacity property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Opacity de una superposición.
    -------------------------------------------------------------------------------}
    FOnOpacityChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the overlay's Url property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Url de una superposición.
    -------------------------------------------------------------------------------}
    FOnUrlChange: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event occurs when the user double-clicks an overlay.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario hace doble click en una superposición.
    -------------------------------------------------------------------------------}
    FOnDblClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event occurs when the user click an overlay.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando el usuario pulsa una superposición.
    -------------------------------------------------------------------------------}
    FOnClick: TLatLngIdxEvent;
    {*------------------------------------------------------------------------------
      This event is fired when the overlay's bounds are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambian los límites de una superposición.
    -------------------------------------------------------------------------------}
    FOnBoundsChanged: TLinkedComponentChange;
    {*------------------------------------------------------------------------------
      This event is fired when the overlay's Visible property are changed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento ocurre cuando cambia la propiedad Visible de una superposición.
    -------------------------------------------------------------------------------}
    FOnVisibleChange: TLinkedComponentChange;
  protected
    function GetAPIUrl: string; override;

    function GetItems(I: Integer): TGroundOverlay;

    procedure EventFired(EventType: TEventType; Params: array of const); override;
    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    {*------------------------------------------------------------------------------
      Creates a new TGroundOverlay instance and adds it to the Items array.
      @param Url Url or file path to the image to overlay.
      @param SWLat The overlay's southwest latitude
      @param SWLng The overlay's southwest longitude
      @param NELat The overlay's northeast latitude
      @param NELng The overlay's northeast longitude
      @return A new instance of TGroundOverlay
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TGroundOverlay y la añade en el array de Items.
      @param Url Url o path del fichero imagen a superponer.
      @param SWLat Latitud suroeste de la superposición.
      @param SWLng Longitud suroeste de la superposición.
      @param NELat Latitud noreste de la superposición.
      @param NELng Longitud noreste de la superposición.
      @return Una nueva instancia de TGroundOverlay
    -------------------------------------------------------------------------------}
    function Add(Url: string; SWLat: Real = 0; SWLng: Real = 0; NELat: Real = 0; NELng: Real = 0): TGroundOverlay;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TGroundOverlay read GetItems; default;
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
        // from properties
    property OnClickableChange: TLinkedComponentChange read FOnClickableChange write FOnClickableChange;
    property OnBoundsChanged: TLinkedComponentChange read FOnBoundsChanged write FOnBoundsChanged;
    property OnOpacityChange: TLinkedComponentChange read FOnOpacityChange write FOnOpacityChange;
    property OnUrlChange: TLinkedComponentChange read FOnUrlChange write FOnUrlChange;
    property OnVisibleChange: TLinkedComponentChange read FOnVisibleChange write FOnVisibleChange;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  GMFunctions, Lang;

{ TGroundOverlay }

procedure TGroundOverlay.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TGroundOverlay then
  begin
    Bounds.Assign(TGroundOverlay(Source).Bounds);
    Clickable := TGroundOverlay(Source).Clickable;
    Url  := TGroundOverlay(Source).Url;
    Opacity := TGroundOverlay(Source).Opacity;
    Visible := TGroundOverlay(Source).Visible;
  end;
end;

procedure TGroundOverlay.CenterMapTo;
var
  LL: TLatLng;
begin
  inherited;

  if not Assigned(Collection) or not(Collection is TGroundOverlays) or
     not Assigned(TGroundOverlays(Collection).FGMLinkedComponent) or
     not Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  LL := TLatLng.Create;
  try
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).Map.LatLngBoundsGetCenter(FBounds, LL);
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).Map.SetCenter(LL);
  finally
    FreeAndNil(LL);
  end;
end;

function TGroundOverlay.ChangeProperties: Boolean;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
  Img: string;
begin
  inherited;

  Result := False;

  if FUrl = '' then Exit;

  Img := FUrl;
  if FileExists(Img) then
  begin
    Img := 'file:///' + Img;
    Img := StringReplace(Img, '\', '/', [rfReplaceAll]);
  end;

  if not Assigned(Collection) or not(Collection is TGroundOverlays) or
     not Assigned(TGroundOverlays(Collection).FGMLinkedComponent) or
     not Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).Map) or
     (csDesigning in TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).ComponentState) then
    Exit;

  Params := Format(StrParams, [
                    IntToStr(IdxList),
                    QuotedStr(Img),
                    LowerCase(TCustomTransform.GMBoolToStr(Clickable, True)),
                    StringReplace(FloatToStr(Opacity), ',', '.', [rfReplaceAll]),
                    Bounds.SW.LatToStr(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).GetMapPrecision),
                    Bounds.SW.LngToStr(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).GetMapPrecision),
                    Bounds.NE.LatToStr(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).GetMapPrecision),
                    Bounds.NE.LngToStr(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).GetMapPrecision),
                    LowerCase(TCustomTransform.GMBoolToStr(Visible, True)),
                    IntToStr(Index),
                    QuotedStr(InfoWindow.GetConvertedString),
                    LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.DisableAutoPan, True)),
                    IntToStr(InfoWindow.MaxWidth),
                    IntToStr(InfoWindow.PixelOffset.Height),
                    IntToStr(InfoWindow.PixelOffset.Width),
                    LowerCase(TCustomTransform.GMBoolToStr(InfoWindow.CloseOtherBeforeOpen, True))
                  ]);

  Result := TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).ExecuteScript('MakeGroundOverlay', Params);
  TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).ErrorControl;
end;

constructor TGroundOverlay.Create(Collection: TCollection);
begin
  inherited;

  FBounds := TLatLngBounds.Create;
  Bounds.NE.OnChange := OnChangeBounds;
  Bounds.SW.OnChange := OnChangeBounds;
  FClickable := True;
  FOpacity := 1;
  FUrl := '';
  FVisible := True;
end;

destructor TGroundOverlay.Destroy;
begin
  if Assigned(FBounds) then FreeAndNil(FBounds);

  inherited;
end;

procedure TGroundOverlay.OnChangeBounds(Sender: TObject);
begin
  Visible := False;
  ChangeProperties;
  Visible := True;
  if Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnBoundsChanged) then
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnBoundsChanged(
                  TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TGroundOverlay.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;

  ChangeProperties;
  if Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnClickableChange) then
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnClickableChange(
                  TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TGroundOverlay.SetOpacity(const Value: Real);
begin
  if FOpacity = Value then Exit;

  FOpacity := Value;
  if FOpacity < 0 then FOpacity := 0;
  if FOpacity > 1 then FOpacity := 1;
  FOpacity := Trunc(FOpacity * 100) / 100;

  ChangeProperties;
  if Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnOpacityChange) then
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnOpacityChange(
                  TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TGroundOverlay.SetUrl(const Value: string);
begin
  if FUrl = Value then Exit;

  FUrl := Value;

  ChangeProperties;
  if Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnUrlChange) then
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnUrlChange(
                  TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TGroundOverlay.SetVisible(const Value: Boolean);
begin
  if FVisible = Value then Exit;

  FVisible := Value;

  ChangeProperties;
  if Assigned(TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnVisibleChange) then
    TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent).FOnVisibleChange(
                  TGMGroundOverlay(TGroundOverlays(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TGroundOverlays }

function TGroundOverlays.Add: TGroundOverlay;
begin
  Result := TGroundOverlay(inherited Add);
end;

function TGroundOverlays.GetItems(I: Integer): TGroundOverlay;
begin
  Result := TGroundOverlay(inherited Items[I]);
end;

function TGroundOverlays.GetOwner: TPersistent;
begin
  Result := TGMGroundOverlay(inherited GetOwner);
end;

function TGroundOverlays.Insert(Index: Integer): TGroundOverlay;
begin
  Result := TGroundOverlay(inherited Insert(Index));
end;

procedure TGroundOverlays.SetItems(I: Integer; const Value: TGroundOverlay);
begin
  inherited SetItem(I, Value);
end;

{ TGMGroundOverlay }

function TGMGroundOverlay.Add(Url: string; SWLat, SWLng, NELat,
  NELng: Real): TGroundOverlay;
begin
  Result := TGroundOverlay(inherited Add);
  Result.Visible := False;
  Result.Bounds.SW.Lat := SWLat;
  Result.Bounds.SW.Lng := SWLng;
  Result.Bounds.NE.Lat := NELat;
  Result.Bounds.NE.Lng := NELng;
  Result.Url := Url;
  Result.Visible := True;
end;

procedure TGMGroundOverlay.EventFired(EventType: TEventType;
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
      etGOClick: if Assigned(FOnClick) then FOnClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
      etGODblClick: if Assigned(FOnDblClick) then FOnDblClick(Self, LL, Params[2].VInteger, Items[Params[2].VInteger]);
    end;
  finally
    FreeAndNil(LL);
  end;
end;

function TGMGroundOverlay.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference?hl=en#GroundOverlay';
end;

function TGMGroundOverlay.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TGroundOverlays;
end;

function TGMGroundOverlay.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TGroundOverlay;
end;

function TGMGroundOverlay.GetItems(I: Integer): TGroundOverlay;
begin
  Result := TGroundOverlay(inherited Items[i]);
end;

end.
