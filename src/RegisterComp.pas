{
unit RegisterComp

  ES: unidad para registrar los componentes que no dependen de ningún framework
  EN: unit to register the components that no depend of any framework

=========================================================================
History:

ver 1.0.0
  ES:
    nuevo: registra el componente TGMGeoCode.
    nuevo: registra el componente TGMGroundOverlay.
  EN:
    new: register the TGMGeoCode component.
    new: register the TGMGroundOverlay component.

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
  Unit to register the components that no depend of any framework.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Unidad para registrar los componentes que no dependen de ningún framework.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit RegisterComp;

{$I ..\gmlib.inc}

{$IFNDEF DELPHI2009}
{$R ..\Resources\gmlibres.res}
{$ENDIF}

interface

  {*------------------------------------------------------------------------------
    The Register procedure register the components.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    El procedimiento Register registra los componentes.
  -------------------------------------------------------------------------------}
  procedure Register;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMInfoWindow, GMGeoCode, GMGroundOverlay, GMHeatmap;

procedure Register;
begin
  RegisterComponents('GoogleMaps', [TGMInfoWindow, TGMGeoCode, TGMGroundOverlay,
                                    TGMHeatmap
                                    ]);
end;

end.
