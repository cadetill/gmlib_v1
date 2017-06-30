{
GMElevationVCL unit

  ES: contiene las clases VCL necesarias para calcular elevaciones de terreno
      de un conjunto de LatLng
  EN: includes the VCL classes needed for calculate a terrain elevations of a
      set of LatLng

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap, establecer
      las lat/lng y ejecutar
  EN: put the component into a form, link to a TGMMap, establish the lat/lng and
      execute
=========================================================================
History:

ver 0.1.9
  ES:
    nuevo: documentaci�n
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey
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
  The GMElevation unit includes the VCL classes needed for calculate a terrain elevations of a set of LatLng.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMElevation contiene las clases VCL necesarias para calcular elevaciones de terreno de un conjunto de LatLng.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMElevationVCL;

interface

uses
  GMElevation, GMPolyline;

type
  {*------------------------------------------------------------------------------
    Class for calculating elevations.
    More information at:
    https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationService
    https://developers.google.com/maps/documentation/javascript/elevation
    https://developers.google.com/maps/documentation/elevation/index
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para el c�lculo de elevaciones.
    M�s informaci�n en:
    https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationService
    https://developers.google.com/maps/documentation/javascript/elevation
    https://developers.google.com/maps/documentation/elevation/index
  -------------------------------------------------------------------------------}
  TGMElevation = class(TCustomGMElevation)
  public
    procedure AddLatLngFromPoly(Poly: TBasePolyline; DeleteBeforeLoad: Boolean = True); override;
  end;

implementation

uses
  GMPolygonVCL, GMClasses;

{ TGMElevation }

procedure TGMElevation.AddLatLngFromPoly(Poly: TBasePolyline;
  DeleteBeforeLoad: Boolean);
var
  Point: TLinePoint;
begin
  inherited;

  if (Poly is TPolygon) and (Poly.CountLinePoints > 0) then
  begin
    Point := LinePoints.Add;
    Point.Assign(Poly[0]);
  end;
end;

end.
