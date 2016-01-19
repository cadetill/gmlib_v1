{
GMFunctionsFMX unit

  ES: unidad con funciones de caracter general específicas para FireMonkey
  EN: unit with a general functions specific for FireMonkey

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
  Unit with a general functions specific for FMX.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Unidad con funciones de caracter general específicas para FMX.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMFunctionsFMX;

interface

uses
  System.UITypes,
  GMFunctions, GMPolygonFMX, GMClasses;

type
  {*------------------------------------------------------------------------------
    Class to access protected methods of TGMPolygon class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para acceder a métodos protected de la clase TGMPolygon.
  -------------------------------------------------------------------------------}
  THackGMPolygon = class(TGMPolygon);

  {*------------------------------------------------------------------------------
    Class to access Geometry library.
    More information at:
      - https://developers.google.com/maps/documentation/javascript/reference?hl=en#encoding
      - https://developers.google.com/maps/documentation/javascript/reference?hl=en#spherical
      - https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para acceder a la libraría Geometry.
    Más información en:
      - https://developers.google.com/maps/documentation/javascript/reference?hl=en#encoding
      - https://developers.google.com/maps/documentation/javascript/reference?hl=en#spherical
      - https://developers.google.com/maps/documentation/javascript/reference?hl=en#poly
  -------------------------------------------------------------------------------}
  TGeometry = class(GMFunctions.TGeometry)
  public
    {*------------------------------------------------------------------------------
      Computes whether the given point lies inside the specified polygon.
      @param GMPoly GMPolygon.
      @param Idx Index that specified a Polygon.
      @param LatLng LatLng to compute.
      @return True if the point is inside the polygon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula si el punto dado se encuentra dentro del polígono especificado.
      @param GMPoly GMPolygon.
      @param Idx Índice que especifica un Polygon.
      @param LatLng LatLng a calcular.
      @return True si el punto se encuentra dentro del polígono.
    -------------------------------------------------------------------------------}
    class function ContainsLocation(GMPoly: TGMPolygon; Idx: Integer;
      LatLng: TLatLng): Boolean;
  end;

  {*------------------------------------------------------------------------------
    Contains methods of transformations specific for FMX.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Contiene métodos de transformaciones específicas para FMX.
  -------------------------------------------------------------------------------}
  TTransform = class(TCustomTransform)
  public
    {*------------------------------------------------------------------------------
      Converts Color to a string that contains their RGB representation.
      @param Color Color to transform to RGB
      @return String with RGB representation
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Convierte Color en una cadena que contiene su representación RGB.
      @param Color Color a transformar a RGB
      @return Cadena con la representación RGB
    -------------------------------------------------------------------------------}
    class function TColorToStr(Color: TAlphaColor): string;
  end;

implementation

uses
  System.SysUtils,

  GMConstants;

{ TTransform }

class function TTransform.TColorToStr(Color: TAlphaColor): string;
var
  rgbValue: longint;
begin
  rgbValue:= TAlphaColorRec(Color).Color;
  Result := Copy(IntToHex(rgbValue,8), 3, 6);
end;

{ TGeometry }

class function TGeometry.ContainsLocation(GMPoly: TGMPolygon; Idx: Integer;
  LatLng: TLatLng): Boolean;
const
  StrParams = '%s,%s,%s,%s';
var
  Params: string;
begin
  Params := Format(StrParams, [
                  IntToStr(THackGMPolygon(GMPoly).IdxList),
                  IntToStr(Idx),
                  LatLng.LatToStr(THackGMPolygon(GMPoly).GetMapPrecision),
                  LatLng.LngToStr(THackGMPolygon(GMPoly).GetMapPrecision)
                  ]);
  THackGMPolygon(GMPoly).ExecuteScript('ContainsLocation', Params);
  Result := THackGMPolygon(GMPoly).GetBoolField(GeometryForm, GeometryFormContainsLocation);
end;

end.
