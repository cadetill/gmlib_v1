{
GMRectangleVCL unit

  ES: contiene las clases VCL necesarias para mostrar rectángulos en un mapa de
      Google Maps mediante el componente TGMMap
  EN: includes the VCL classes needed to show rectangles on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      rectángulos a mostrar
  EN: put the component into a form, link to a TGMMap and put the rectangles to
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
  The GMRectangleVCL unit includes the base classes needed to show rectangles on Google Map map using the component TGMMap.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMRectangleVCL contiene las clases bases necesarias para mostrar rectángulos en un mapa de Google Maps mediante el componente TGMMap

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMRectangleVCL;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  Vcl.Graphics, System.Classes,
  {$ELSE}
  Graphics, Classes,
  {$ENDIF}

  GMRectangle, GMLinkedComponents;

type
  {*------------------------------------------------------------------------------
    VCL class for rectangles.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Rectangle
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para los rectángulos.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Rectangle
  -------------------------------------------------------------------------------}
  TRectangle = class(TCustomRectangle)
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
    VCL class for rectangles collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para la colección de rectángulos.
  -------------------------------------------------------------------------------}
  TRectangles = class(TCustomRectangles)
  private
    procedure SetItems(I: Integer; const Value: TRectangle);
    function GetItems(I: Integer): TRectangle;
  protected
    function GetOwner: TPersistent; override;
  public
    function Add: TRectangle;
    function Insert(Index: Integer): TRectangle;

    {*------------------------------------------------------------------------------
      Lists the rectangles in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de rectángulos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TRectangle read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    Class management of rectangles.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
     Clase para la gestión de rectángulos.
  -------------------------------------------------------------------------------}
  TGMRectangle = class(TCustomGMRectangle)
  protected
    function GetItems(I: Integer): TRectangle;

    function GetCollectionItemClass: TLinkedComponentClass; override;
    function GetCollectionClass: TLinkedComponentsClass; override;
  public
    function Add(SWLat: Real = 0; SWLng: Real = 0; NELat: Real = 0; NELng: Real = 0): TRectangle;

    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TRectangle read GetItems; default;
  end;

implementation

uses
  GMFunctionsVCL;

{ TRectangle }

procedure TRectangle.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TRectangle then
  begin
    FillColor := TRectangle(Source).FillColor;
    StrokeColor := TRectangle(Source).StrokeColor;
  end;
end;

constructor TRectangle.Create(Collection: TCollection);
begin
  inherited;

  FFillColor := clRed;
  FStrokeColor := clBlack;
end;

function TRectangle.GetFillColor: string;
begin
  Result := TTransform.TColorToStr(FFillColor);
end;

function TRectangle.GetStrokeColor: string;
begin
  Result := TTransform.TColorToStr(FStrokeColor);
end;

procedure TRectangle.SetFillColor(const Value: TColor);
begin
  if FFillColor = Value then Exit;

  FFillColor := Value;

  ChangeProperties;
  if Assigned(TGMRectangle(TRectangles(Collection).FGMLinkedComponent).OnFillColorChange) then
    TGMRectangle(TRectangles(Collection).FGMLinkedComponent).OnFillColorChange(
                  TGMRectangle(TRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

procedure TRectangle.SetStrokeColor(const Value: TColor);
begin
  if FStrokeColor = Value then Exit;

  FStrokeColor := Value;

  ChangeProperties;
  if Assigned(TGMRectangle(TRectangles(Collection).FGMLinkedComponent).OnStrokeColorChange) then
    TGMRectangle(TRectangles(Collection).FGMLinkedComponent).OnStrokeColorChange(
                  TGMRectangle(TRectangles(Collection).FGMLinkedComponent),
                  Index,
                  Self);
end;

{ TRectangles }

function TRectangles.Add: TRectangle;
begin
  Result := TRectangle(inherited Add);
end;

function TRectangles.GetItems(I: Integer): TRectangle;
begin
  Result := TRectangle(inherited Items[I]);
end;

function TRectangles.GetOwner: TPersistent;
begin
  Result := TGMRectangle(inherited GetOwner);
end;

function TRectangles.Insert(Index: Integer): TRectangle;
begin
  Result := TRectangle(inherited Insert(Index));
end;

procedure TRectangles.SetItems(I: Integer; const Value: TRectangle);
begin
  inherited SetItem(I, Value);
end;

{ TGMRectangle }

function TGMRectangle.Add(SWLat, SWLng, NELat, NELng: Real): TRectangle;
begin
  Result := TRectangle(inherited Add(SWLat, SWLng, NELat, NELng));
end;

function TGMRectangle.GetCollectionClass: TLinkedComponentsClass;
begin
  Result := TRectangles;
end;

function TGMRectangle.GetCollectionItemClass: TLinkedComponentClass;
begin
  Result := TRectangle;
end;

function TGMRectangle.GetItems(I: Integer): TRectangle;
begin
  Result := TRectangle(inherited Items[i]);
end;

end.
