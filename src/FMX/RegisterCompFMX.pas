{
unit RegisterComp

  ES: unidad para registrar los componentes FireMonkey
  EN: unit to register the components FireMonkey

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

Copyright (©) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  Unit to register the FireMonkey components.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Unidad para registrar los componentes FireMonkey.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit RegisterCompFMX;

{.$DEFINE CHROMIUMFMX}
{$I ..\gmlib.inc}
{$R ..\Resources\gmlibres.res}

interface

{$IFDEF CHROMIUMFMX}

  {*------------------------------------------------------------------------------
    The Register procedure register the FireMonkey components.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El procedimiento Register registra los componentes FireMonkey.
  -------------------------------------------------------------------------------}
  procedure Register;
{$ENDIF}

implementation

{$IFDEF CHROMIUMFMX}
uses
  System.Classes, FMX.Types,

  GMMapFMX, GMMarkerFMX, GMPolylineFMX, GMPolygonFMX, GMRectangleFMX,
  GMCircleFMX, GMDirectionFMX, GMElevationFMX;

procedure Register;
begin
  GroupDescendentsWith(TGMMapChr, Fmx.Types.TControl);
  GroupDescendentsWith(TGMMarker, Fmx.Types.TControl);
  GroupDescendentsWith(TGMPolyline, Fmx.Types.TControl);
  GroupDescendentsWith(TGMPolygon, Fmx.Types.TControl);
  GroupDescendentsWith(TGMRectangle, Fmx.Types.TControl);
  GroupDescendentsWith(TGMCircle, Fmx.Types.TControl);
  GroupDescendentsWith(TGMDirection, Fmx.Types.TControl);
  GroupDescendentsWith(TGMElevation, Fmx.Types.TControl);

  RegisterComponents('GoogleMaps', [TGMMapChr, TGMMarker,
                                    TGMPolyline, TGMPolygon,
                                    TGMRectangle, TGMCircle,
                                    TGMDirection, TGMElevation
                                   ]);
end;

{$ENDIF}
end.
