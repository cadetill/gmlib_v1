{
unit RegisterComp

  ES: unidad para registrar los componentes VCL
  EN: unit to register the VCL components

=========================================================================
History:

ver 1.0.0
  ES:
    cambio: ya no registra el componente TGMGeoCode.
  EN:
    change: TGMGeoCode component no longer registered here.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey

ver 0.1.8
  ES:
    nuevo: se registra la clase TGMElevation
  EN:
    new: TGMElevation class is registered

ver 0.1.6
  ES:
    nuevo: se registra la clase TGMDirection
  EN:
    new: TGMDirection class is registered

ver 0.1.5
  ES:
    nuevo: se registra la clase TGMGeoCode
  EN:
    new: TGMGeoCode class is registered

ver 0.1.4
  ES:
    nuevo: se registra la clase TGMCircle
  EN:
    new: TGMCircle class is registered

ver 0.1.3
  ES:
    nuevo: se registra la clase TGMRectangle
  EN:
    new: TGMRectangle class is registered

ver 0.1.2
  ES:
    nuevo: se registra la clase TGMPolygon
  EN:
    new: TGMPolygon class is registered

ver 0.1.1
  ES:
    nuevo: se registra la clase TGMPolyline
  EN:
    new: TGMPolyline class is registered

ver 0.1:
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

Copyright (©) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  Unit to register the VCL components.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Unidad para registrar los componentes VCL.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit RegisterCompVCL;

{.$DEFINE CHROMIUM}
{$I ..\gmlib.inc}

interface

  {*------------------------------------------------------------------------------
    The Register procedure register the VCL components.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El procedimiento Register registra los componentes VCL.
  -------------------------------------------------------------------------------}
  procedure Register;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.Classes, Vcl.Controls, Vcl.Graphics,
  {$ELSE}
  Classes, Graphics,
  {$ENDIF}

  GMMapVCL, GMMarkerVCL, GMPolylineVCL, GMPolygonVCL, GMRectangleVCL,
  GMCircleVCL, GMDirectionVCL, GMElevationVCL;

procedure Register;
begin
  {$IFDEF DELPHIXE2}
  GroupDescendentsWith(TGMMap, Vcl.Controls.TControl);
  {$IFDEF CHROMIUM}GroupDescendentsWith(TGMMapChr, Vcl.Controls.TControl);{$ENDIF}
  GroupDescendentsWith(TGMMarker, Vcl.Controls.TControl);
  GroupDescendentsWith(TGMPolyline, Vcl.Controls.TControl);
  GroupDescendentsWith(TGMPolygon, Vcl.Controls.TControl);
  GroupDescendentsWith(TGMRectangle, Vcl.Controls.TControl);
  GroupDescendentsWith(TGMCircle, Vcl.Controls.TControl);
  GroupDescendentsWith(TGMDirection, Vcl.Controls.TControl);
  GroupDescendentsWith(TGMElevation, Vcl.Controls.TControl);
  {$ENDIF}

  RegisterComponents('GoogleMaps', [TGMMap, {$IFDEF CHROMIUM}TGMMapChr,{$ENDIF} TGMMarker,
                                    TGMPolyline, TGMPolygon,
                                    TGMRectangle, TGMCircle,
                                    TGMDirection, TGMElevation
                                    ]);
end;

end.
