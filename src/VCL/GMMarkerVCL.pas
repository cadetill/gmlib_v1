{
GMMarkerVCL unit

  ES: contiene las clases necesarias para mostrar marcadores VCL en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the base classes needed to show VCL markers on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      marcadores a mostrar
  EN: put the component into a form, link to a TGMMap and put the markers to show
=========================================================================
History:

ver 1.0.0
  ES:
    nuevo: se añade la propiedad TMarker.StyledMarker.
    nuevo: se añade la propiedad TMarker.ColoredMarker.
  EN:
    new: TMarker.StyledMarker property is added.
    new: TMarker.ColoredMarker property is added.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey
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
  The GMMarker unit includes the classes needed to show VCL markers on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMMarker contiene las clases bases necesarias para mostrar marcadores VCL en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMMarkerVCL;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes, Vcl.Graphics,
  {$ELSE}
  Classes, Graphics,
  {$ENDIF}

  GMMarker, GMLinkedComponents;

type
  TMarker = class;

  {*------------------------------------------------------------------------------
    Features for ColoredMarker type marker.
    Sorry, I lost the reference for more information.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para un marcador de tipo ColoredMarker.
    Lo siento, he perdido la referencia para más información.
  -------------------------------------------------------------------------------}
  TColoredMarker = class(TCustomColoredMarker)
  private
    {*------------------------------------------------------------------------------
      Stroke color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del trazo.
    -------------------------------------------------------------------------------}
    FStrokeColor: TColor;
    {*------------------------------------------------------------------------------
      Corner color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de la esquina.
    -------------------------------------------------------------------------------}
    FCornerColor: TColor;
    {*------------------------------------------------------------------------------
      Fill color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de relleno.
    -------------------------------------------------------------------------------}
    FPrimaryColor: TColor;
    procedure SetCornerColor(const Value: TColor);
    procedure SetPrimaryColor(const Value: TColor);
    procedure SetStrokeColor(const Value: TColor);
  protected
    function GetCornerColor: string; override;
    function GetPrimaryColor: string; override;
    function GetStrokeColor: string; override;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TMarker); reintroduce; virtual;

    procedure Assign(Source: TPersistent); override;
  published
    property PrimaryColor: TColor read FPrimaryColor write SetPrimaryColor default clRed;
    property StrokeColor: TColor read FStrokeColor write SetStrokeColor default clBlack;
    property CornerColor: TColor read FCornerColor write SetCornerColor default clWhite;
  end;

  {*------------------------------------------------------------------------------
    Features for ColoredMarker type marker.
    More information at http://google-maps-utility-library-v3.googlecode.com/svn/trunk/styledmarker/docs/reference.html
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para un marcador de tipo ColoredMarker.
    Más información en http://google-maps-utility-library-v3.googlecode.com/svn/trunk/styledmarker/docs/reference.html
  -------------------------------------------------------------------------------}
  TStyledMarker = class(TCustomStyledMarker)
  private
    {*------------------------------------------------------------------------------
      Star color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de la estrella.
    -------------------------------------------------------------------------------}
    FStarColor: TColor;
    {*------------------------------------------------------------------------------
      Text color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del texto.
    -------------------------------------------------------------------------------}
    FTextColor: TColor;
    {*------------------------------------------------------------------------------
      Background color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de fondo.
    -------------------------------------------------------------------------------}
    FBackgroundColor: TColor;
    procedure SetBackgroundColor(const Value: TColor);
    procedure SetStarColor(const Value: TColor);
    procedure SetTextColor(const Value: TColor);
  protected
    function GetBackgroundColor: string; override;
    function GetTextColor: string; override;
    function GetStarColor: string; override;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TMarker); reintroduce; virtual;

    procedure Assign(Source: TPersistent); override;
  published
    property BackgroundColor: TColor read FBackgroundColor write SetBackgroundColor default clRed;
    property TextColor: TColor read FTextColor write SetTextColor default clBlack;
    property StarColor: TColor read FStarColor write SetStarColor default clLime;
  end;

  {*------------------------------------------------------------------------------
    Features for Border property of TStyleLabel class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para la propiedad Border de la clase TStyleLabel.
  -------------------------------------------------------------------------------}
  TGMBorder = class(TCustomGMBorder)
  private
    {*------------------------------------------------------------------------------
      Border color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del borde.
    -------------------------------------------------------------------------------}
    FColor: TColor;
    procedure SetColor(const Value: TColor);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TMarker); reintroduce; virtual;

    procedure Assign(Source: TPersistent); override;
  published
    property Color: TColor read FColor write SetColor;
  end;

  {*------------------------------------------------------------------------------
    Features for Font property of TStyleLabel class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Características para la propiedad Font de la clase TStyleLabel.
  -------------------------------------------------------------------------------}
  TGMFont = class(TCustomGMFont)
  private
    {*------------------------------------------------------------------------------
      Font color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de la fuente.
    -------------------------------------------------------------------------------}
    FColor: TColor;
    procedure SetColor(const Value: TColor);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TMarker); reintroduce; virtual;

    procedure Assign(Source: TPersistent); override;
  published
    property Color: TColor read FColor write SetColor;
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
  TStyleLabel = class(TCustomStyleLabel)
  private
    {*------------------------------------------------------------------------------
      Background color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de fondo.
    -------------------------------------------------------------------------------}
    FBackground: TColor;
    procedure SetBackground(const Value: TColor);
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TMarker); reintroduce; virtual;

    procedure Assign(Source: TPersistent); override;
  published
    property Background: TColor read FBackground write SetBackground;
  end;

  {*------------------------------------------------------------------------------
    Class for markers.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Marker
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para los marcadores.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Marker
  -------------------------------------------------------------------------------}
  TMarker = class(TCustomMarker)
  private
    {*------------------------------------------------------------------------------
      Features applicable when marker type is mtStyledMarker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características aplicables cuando el marcador es de tipo mtStyledMarker.
    -------------------------------------------------------------------------------}
    FStyledMarker: TStyledMarker;
    {*------------------------------------------------------------------------------
      Features applicable when marker type is mtColored.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Características aplicables cuando el marcador es de tipo mtColored.
    -------------------------------------------------------------------------------}
    FColoredMarker: TColoredMarker;
  protected
    procedure CreatePropertiesWithColor; override;
    function ColoredMarkerToStr: string; override;
    function StyledMarkerToStr: string; override;
  public
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;
  published
    property ColoredMarker: TColoredMarker read FColoredMarker write FColoredMarker;
    property StyledMarker: TStyledMarker read FStyledMarker write FStyledMarker;
  end;

  {*------------------------------------------------------------------------------
    Class for markers collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la colección de marcadores.
  -------------------------------------------------------------------------------}
  TMarkers = class(TCustomMarkers)
  private
    procedure SetItems(I: Integer; const Value: TMarker);
    function GetItems(I: Integer): TMarker;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TMarker;
    function Insert(Index: Integer): TMarker;

    {*------------------------------------------------------------------------------
      Lists the markers in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de marcadores en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TMarker read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of markers.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la gestión de marcadores.
  -------------------------------------------------------------------------------}
  TGMMarker = class(TCustomGMMarker)
  protected
    function GetItems(I: Integer): TMarker;

    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    function Add(Lat: Real = 0; Lng: Real = 0; Title: string = ''): TMarker;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TMarker read GetItems; default;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  GMFunctionsVCL, GMConstants;

{ TColoredMarker }

procedure TColoredMarker.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TColoredMarker then
  begin
    CornerColor := TColoredMarker(Source).CornerColor;
    StrokeColor := TColoredMarker(Source).StrokeColor;
    PrimaryColor := TColoredMarker(Source).PrimaryColor;
  end;
end;

constructor TColoredMarker.Create(aOwner: TMarker);
begin
  inherited Create(aOwner);

  FStrokeColor := clBlack;
  FCornerColor := clWhite;
  FPrimaryColor := clRed;
end;

function TColoredMarker.GetCornerColor: string;
begin
  Result := TTransform.TColorToStr(FCornerColor);
end;

function TColoredMarker.GetPrimaryColor: string;
begin
  Result := TTransform.TColorToStr(FPrimaryColor);
end;

function TColoredMarker.GetStrokeColor: string;
begin
  Result := TTransform.TColorToStr(FStrokeColor);
end;

procedure TColoredMarker.SetCornerColor(const Value: TColor);
begin
  if FCornerColor = Value then Exit;

  FCornerColor := Value;

  if not Assigned(FMarker) then Exit;

  TMarker(FMarker).ChangeProperties;
  if Assigned(TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnColoredMarkerChange) then
    TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnColoredMarkerChange(
                  TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

procedure TColoredMarker.SetPrimaryColor(const Value: TColor);
begin
  if FPrimaryColor = Value then Exit;

  FPrimaryColor := Value;

  if not Assigned(FMarker) then Exit;

  TMarker(FMarker).ChangeProperties;
  if Assigned(TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnColoredMarkerChange) then
    TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnColoredMarkerChange(
                  TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

procedure TColoredMarker.SetStrokeColor(const Value: TColor);
begin
  if FStrokeColor = Value then Exit;

  FStrokeColor := Value;

  if not Assigned(FMarker) then Exit;

  TMarker(FMarker).ChangeProperties;
  if Assigned(TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnColoredMarkerChange) then
    TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnColoredMarkerChange(
                  TGMMarker(TMarkers(FMarker.Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

{ TStyledMarker }

procedure TStyledMarker.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TStyledMarker then
  begin
    BackgroundColor := TStyledMarker(Source).BackgroundColor;
    TextColor := TStyledMarker(Source).TextColor;
    StarColor := TStyledMarker(Source).StarColor;
  end;
end;

constructor TStyledMarker.Create(aOwner: TMarker);
begin
  inherited Create(aOwner);

  FBackgroundColor := clRed;
  FTextColor := clBlack;
  FStarColor := clLime;
end;

function TStyledMarker.GetBackgroundColor: string;
begin
  Result := TTransform.TColorToStr(FBackgroundColor);
end;

function TStyledMarker.GetStarColor: string;
begin
  Result := TTransform.TColorToStr(FStarColor);
end;

function TStyledMarker.GetTextColor: string;
begin
  Result := TTransform.TColorToStr(FTextColor);
end;

procedure TStyledMarker.SetBackgroundColor(const Value: TColor);
begin
  if FBackgroundColor = Value then Exit;

  FBackgroundColor := Value;

  if not Assigned(FMarker) then Exit;

  TMarker(FMarker).ChangeProperties;
  if Assigned(TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnStyledMarkerChange) then
    TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnStyledMarkerChange(
                  TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

procedure TStyledMarker.SetStarColor(const Value: TColor);
begin
  if FStarColor = Value then Exit;

  FStarColor := Value;

  if not Assigned(FMarker) then Exit;

  TMarker(FMarker).ChangeProperties;
  if Assigned(TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnStyledMarkerChange) then
    TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnStyledMarkerChange(
                  TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

procedure TStyledMarker.SetTextColor(const Value: TColor);
begin
  if FTextColor = Value then Exit;

  FTextColor := Value;

  if not Assigned(FMarker) then Exit;

  TMarker(FMarker).ChangeProperties;
  if Assigned(TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnStyledMarkerChange) then
    TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent).OnStyledMarkerChange(
                  TGMMarker(TMarkers(TMarker(FMarker).Collection).FGMLinkedComponent),
                  FMarker.Index,
                  FMarker);
end;

{ TGMBorder }

procedure TGMBorder.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TGMBorder then
  begin
    Color := TGMBorder(Source).Color;
  end
end;

constructor TGMBorder.Create(aOwner: TMarker);
begin
  inherited Create(aOwner);

  FColor := clBlack;
end;

procedure TGMBorder.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

{ TGMFont }

procedure TGMFont.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TGMFont then
  begin
    Color := TGMFont(Source).Color;
  end;
end;

constructor TGMFont.Create(aOwner: TMarker);
begin
  inherited Create(aOwner);

  FColor := clBlack;
end;

procedure TGMFont.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

{ TStyleLabel }

procedure TStyleLabel.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TStyleLabel then
  begin
    Background := TStyleLabel(Source).Background;
  end;
end;

constructor TStyleLabel.Create(aOwner: TMarker);
begin
  inherited Create(aOwner);

  FBackground := clWhite;
  Border := TGMBorder.Create(aOwner);
  Font := TGMFont.Create(aOwner);
end;

procedure TStyleLabel.SetBackground(const Value: TColor);
begin
  FBackground := Value;
end;

{ TMarker }

procedure TMarker.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TMarker then
  begin
    ColoredMarker.Assign(TMarker(Source).ColoredMarker);
    StyledMarker.Assign(TMarker(Source).StyledMarker);
  end;
end;

function TMarker.ColoredMarkerToStr: string;
begin
  Result := Format(StrColoredMarker, [
                            ColoredMarker.Width,
                            ColoredMarker.Height,
                            StringReplace(ColoredMarker.GetCornerColor, '#', '', [rfReplaceAll]),
                            StringReplace(ColoredMarker.GetPrimaryColor, '#', '', [rfReplaceAll]),
                            StringReplace(ColoredMarker.GetStrokeColor, '#', '', [rfReplaceAll])
                                     ]);
end;

procedure TMarker.CreatePropertiesWithColor;
begin
  inherited;

  ColoredMarker := TColoredMarker.Create(Self);
  StyledMarker := TStyledMarker.Create(Self);
end;

destructor TMarker.Destroy;
begin
  if Assigned(FColoredMarker) then FreeAndNil(FColoredMarker);
  if Assigned(FStyledMarker) then FreeAndNil(FStyledMarker);

  inherited;
end;

function TMarker.StyledMarkerToStr: string;
begin
  Result := Format('%s,%s,%s,%s,%s', [
                  QuotedStr(TTransform.StyledIconToStr(StyledMarker.StyledIcon)),
                  QuotedStr(StyledMarker.GetBackgroundColor),
                  QuotedStr(StyledMarker.GetTextColor),
                  QuotedStr(StyledMarker.GetStarColor),
                  LowerCase(TTransform.GMBoolToStr(StyledMarker.ShowStar, True))
                       ]);
end;

{ TMarkers }

function TMarkers.Add: TMarker;
begin
  Result := TMarker(inherited Add);
end;

function TMarkers.GetItems(I: Integer): TMarker;
begin
  Result := TMarker(inherited Items[I]);
end;

function TMarkers.GetOwner: TPersistent;
begin
  Result := TGMMarker(inherited GetOwner);
end;

function TMarkers.Insert(Index: Integer): TMarker;
begin
  Result := TMarker(inherited Insert(Index));
end;

procedure TMarkers.SetItems(I: Integer; const Value: TMarker);
begin
  inherited SetItem(I, Value);
end;

{ TGMMarker }

function TGMMarker.Add(Lat, Lng: Real; Title: string): TMarker;
begin
  Result := TMarker(inherited Add(Lat, Lng, Title));
end;

function TGMMarker.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TMarkers;
end;

function TGMMarker.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TMarker;
end;

function TGMMarker.GetItems(I: Integer): TMarker;
begin
  Result := TMarker(inherited Items[i]);
end;

end.
