{
GMCircleVCL unit

  ES: contiene las clases VCL necesarias para mostrar círculos en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the VCL classes needed to show circles on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      círculos a mostrar
  EN: put the component into a form, link to a TGMMap and put the circled to
      show
=========================================================================
History:

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
  The GMCircleVCL unit includes the VCL classes needed to show circles on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMCircleVCL contiene las clases VCL necesarias para mostrar círculos en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMCircleVCL;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  Vcl.Graphics, System.Classes, Vcl.ExtCtrls,
  {$ELSE}
  Graphics, Classes, ExtCtrls,
  {$ENDIF}

  GMCircle, GMLinkedComponents;

type
  TCircle = class;

  {*------------------------------------------------------------------------------
    VCL class for automatic enlarged circle.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para el agrandado automático del círculo.
  -------------------------------------------------------------------------------}
  TSizeable = class(TCustomSizeable)
  private
    FTimer: TTimer;          // ES: TTimer para el control de eventos - EN: TTimer for events control
  protected
    procedure SetActive(const Value: Boolean); override;
    procedure SetSpeed(const Value: Integer); override;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCircle); reintroduce; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;
  end;

  {*------------------------------------------------------------------------------
    VCL class for circles.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Circle
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para los círculos.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Circle
  -------------------------------------------------------------------------------}
  TCircle = class(TCustomCircle)
  private
    {*------------------------------------------------------------------------------
      The fill color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color de relleno.
    -------------------------------------------------------------------------------}
    FFillColor: TColor;
    {*------------------------------------------------------------------------------
      The stroke color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del trazo.
    -------------------------------------------------------------------------------}
    FStrokeColor: TColor;
    procedure SetFillColor(const Value: TColor);
    procedure SetStrokeColor(const Value: TColor);
  protected
    function GetFillColor: string; override;
    function GetStrokeColor: string; override;
  public
    constructor Create(Collection: TCollection); override;

    procedure Assign(Source: TPersistent); override;
  published
    property FillColor: TColor read FFillColor write SetFillColor default clRed;
    property StrokeColor: TColor read FStrokeColor write SetStrokeColor default clBlack;
  end;

  {*------------------------------------------------------------------------------
    VCL class for circles collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para la colección de círculos.
  -------------------------------------------------------------------------------}
  TCircles = class(TCustomCircles)
  private
    procedure SetItems(I: Integer; const Value: TCircle);
    function GetItems(I: Integer): TCircle;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TCircle;
    function Insert(Index: Integer): TCircle;

    {*------------------------------------------------------------------------------
      Lists the circles in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de círculos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCircle read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of circles.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
     Clase para la gestión de círculos.
  -------------------------------------------------------------------------------}
  TGMCircle = class(TCustomGMCircle)
  protected
    function GetItems(I: Integer): TCircle;

    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    function Add(Lat: Real = 0; Lng: Real = 0; Radius: Integer = 0): TCircle;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TCircle read GetItems; default;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}                     // ES: si la verisón es la XE2 o superior - EN: if version is XE2 or higher
  SysUtils,
  {$ENDIF}

  GMFunctionsVCL;

{ TCircle }

procedure TCircle.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCircle then
  begin
    FillColor := TCircle(Source).FillColor;
    StrokeColor := TCircle(Source).StrokeColor;
  end;
end;

constructor TCircle.Create(Collection: TCollection);
begin
  inherited;

  FFillColor := clRed;
  FStrokeColor := clBlack;
  AutoResize := TSizeable.Create(Self);
end;

function TCircle.GetFillColor: string;
begin
  Result := TTransform.TColorToStr(FFillColor);
end;

function TCircle.GetStrokeColor: string;
begin
  Result := TTransform.TColorToStr(FStrokeColor);
end;

procedure TCircle.SetFillColor(const Value: TColor);
begin
  if FFillColor = Value then Exit;

  FFillColor := Value;

  ChangeProperties;
  if Assigned(TGMCircle(TCircles(Collection).FGMLinkedComponent).OnFillColorChange) then
    TGMCircle(TCircles(Collection).FGMLinkedComponent).OnFillColorChange(
                  TGMCircle(TCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TCircle.SetStrokeColor(const Value: TColor);
begin
  if FStrokeColor = Value then Exit;

  FStrokeColor := Value;

  ChangeProperties;
  if Assigned(TGMCircle(TCircles(Collection).FGMLinkedComponent).OnStrokeColorChange) then
    TGMCircle(TCircles(Collection).FGMLinkedComponent).OnStrokeColorChange(
                  TGMCircle(TCircles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TCircles }

function TCircles.Add: TCircle;
begin
  Result := TCircle(inherited Add);
end;

function TCircles.GetItems(I: Integer): TCircle;
begin
  Result := TCircle(inherited Items[I]);
end;

function TCircles.GetOwner: TPersistent;
begin
  Result := TGMCircle(inherited GetOwner);
end;

function TCircles.Insert(Index: Integer): TCircle;
begin
  Result := TCircle(inherited Insert(Index));
end;

procedure TCircles.SetItems(I: Integer; const Value: TCircle);
begin
  inherited SetItem(I, Value);
end;

{ TGMCircle }

function TGMCircle.Add(Lat, Lng: Real; Radius: Integer): TCircle;
begin
  Result := TCircle(inherited Add(Lat, Lng, Radius));
end;

function TGMCircle.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TCircles;
end;

function TGMCircle.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TCircle;
end;

function TGMCircle.GetItems(I: Integer): TCircle;
begin
  Result := TCircle(inherited Items[i]);
end;

{ TSizeable }

constructor TSizeable.Create(aOwner: TCircle);
begin
  inherited Create(aOwner);

  FTimer := TTimer.Create(nil);
  FTimer.Enabled := False;
  FTimer.OnTimer := OnTimer;
end;

destructor TSizeable.Destroy;
begin
  if Assigned(FTimer) then FreeAndNil(FTimer);

  inherited;
end;

procedure TSizeable.SetActive(const Value: Boolean);
begin
  inherited;

  //if Active = Value then Exit;

  if Active then
  begin
    GetOwner.Radius := Min;
    FTimer.Interval := Increment;
    FTimer.Enabled := True;
  end
  else
    FTimer.Enabled := False;
end;

procedure TSizeable.SetSpeed(const Value: Integer);
begin
  inherited;

  //if Speed = Value then Exit;

  if Active then FTimer.Interval := Speed;
end;

end.
