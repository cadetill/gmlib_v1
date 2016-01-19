{
GMFunctions unit

  ES: unidad con funciones de caracter general
  EN: unit with a general functions

=========================================================================
History:

ver 1.0.0
  ES:
    nuevo: clase TGMGenFunc para alvergar funciones generales
    nuevo: se termina de implementar la librería Geometry.
    cambio: (issue GC3) TCustomTransform -> nueva función GMBoolToStr
  EN:
    new: TGMGenFunc class to store general functions
    new: Geometry library is completed.
    change: (issue GC3) TCustomTransform -> new function GMBoolToStr

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
    cambio: se transladan las funciones de transformación de las propiedades del Mapa
  EN:
    new: documentation
    new: now compatible with FireMonkey
    change: moved transformation functions of the map

ver 0.1.7
  ES:
    cambio: añadidas nuevas funciones de transformación de tipos
  EN:
    change: added new functions of transformation types

ver 0.1.6
  ES:
    nuevo: nueva clase TCustomTransform con transformaciones xxxToStr y StrToxxx
  EN:
    new: new TCustomTransform class with xxxToStr and StrToxxx transformations

ver 0.1.5
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
  Unit with a general functions.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Unidad con funciones de caracter general.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMFunctions;

{$I ..\gmlib.inc}

interface

uses
  GMConstants, GMPolyline, GMClasses, GMLinkedComponents, GMMap;

type
  {*------------------------------------------------------------------------------
    Class to store general functions.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para almacenar funciones de carácter general.
  -------------------------------------------------------------------------------}
  TGMGenFunc = class
  public
    {*------------------------------------------------------------------------------
      Processes the message queue.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Procesa la cola de mensajes.
    -------------------------------------------------------------------------------}
    class procedure ProcessMessages;
    {*------------------------------------------------------------------------------
      Converts to string a set of points. The elements are separated by semicolon (;) and the coordinates (lat/lng) by a pipe (|).
      @param Points Array with the points to convert.
      @param Precision Precision of values. Default 6.
      @return String with conversion.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Convierte en una cadena un conjunto de puntos. Los elementos están separados por punto y coma (;) y las coordenadas (lat/lng) separados por una barra vertical (|).
      @param Points Array con los puntos a convertir.
      @param Precision Precisión de los valores. Por defecto 6.
      @return Cadena con la conversión.
    -------------------------------------------------------------------------------}
    class function PointsToStr(Points: array of TLatLng; Precision: Integer): string;
  end;

  {*------------------------------------------------------------------------------
    Class to access protected methods of TGMLinkedComponent class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para acceder a métodos protected de la clase TGMLinkedComponent.
  -------------------------------------------------------------------------------}
  THackGMLinkedComponent = class(TGMLinkedComponent);
  {*------------------------------------------------------------------------------
    Class to access protected methods of TCustomGMMap class.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para acceder a métodos protected de la clase TCustomGMMap.
  -------------------------------------------------------------------------------}
  THackMap = class(TCustomGMMap);

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
  TGeometry = class
  protected
    {*------------------------------------------------------------------------------
      Checks if PointsStr string contains a correct relation of points. These points must be separated by semicolon (;) and the Lat/Lng of a point by a pipe (|).
      @param PointsStr String that contain the converted points.
      @return True if the string is correcto. Otherwise False.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Comprueba si la cadena PointsStr contiene una correcta relación de puntos. Estos puntos tiene que estar separados por punto y coma (;) y la Lat/Lng de un punto por una barra vertical (|).
      @param PointsStr String que contiene los puntos convertidos.
      @return True si la cadena es correcta. De lo contrario False.
    -------------------------------------------------------------------------------}
    class function CheckPointsStr(PointsStr: string): Boolean;
  public
    {*------------------------------------------------------------------------------
      Encodes a sequence of LatLngs into an encoded path string.
      The points must be separated by semicolon (;) and the Lat/Lng of a point by a pipe (|).
      @param Map Map to access JavaScript functions.
      @param PointsStr String with the points to encode.
      @return Encoded string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Codifica una secuencia de LatLng en un string codificado.
      Los puntos tiene que estar separados por punto y coma (;) y la Lat/Lng de un punto por una barra vertical (|).
      @param Map Mapa para acceder a las funciones JavaScript.
      @param PointsStr String con los puntos a codificar.
      @return String codificado.
    -------------------------------------------------------------------------------}
    class function EncodePath(Map: TCustomGMMap; PointsStr: string): string;
    {*------------------------------------------------------------------------------
      Decodes an encoded path string into a sequence of LatLngs.
      @param Map Map to access JavaScript functions.
      @param EncodedPath Path to decode.
      @return String with decoded points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Decodifica un string codificado en una secuencia de LatLng.
      @param Map Mapa para acceder a las funciones JavaScript.
      @param EncodedPath Path a decodificar.
      @return String con puntos decodificados.
    -------------------------------------------------------------------------------}
    class function DecodePath(Map: TCustomGMMap; EncodedPath: string): string;
    {*------------------------------------------------------------------------------
      Computes whether the given point lies on or near to a polyline, or the edge of a polygon, within a specified tolerance.
      @param GMPoly GMPolyline or GMPolygon.
      @param Idx Index that specified a Polyline or Polygon.
      @param LatLng LatLng to compute.
      @param Tolerance Tolerance. -1 no tolerance.
      @return True if the point lies on or near to a polyline, or the edge of a polygon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Calcula si el punto dado se encuentra en o cerca de una polilínea, o el borde de un polígono, dentro de una tolerancia especificada.
      @param GMPoly GMPolyline o GMPolygon.
      @param Idx Índice que especifica una Polyline o Polygon.
      @param LatLng LatLng a calcular.
      @param Tolerance Tolerancia. -1 sin tolerancia.
      @return True si el punto se encuentra en o cerca de una polilínea, o el borde de un polígono.
    -------------------------------------------------------------------------------}
    class function IsLocationOnEdge(GMPoly: TGMBasePolyline; Idx: Integer;
      LatLng: TLatLng; Tolerance: Integer): Boolean;
    {*------------------------------------------------------------------------------
      Returns the area of a closed path. The computed area uses the same units as the Radius. The radius defaults to the Earth's radius in meters, in which case the area is in square meters.
      The points must be separated by semicolon (;) and the Lat/Lng of a point by a pipe (|).
      @param Map Map to access JavaScript functions.
      @param PointsStr String with the points.
      @param Radius Radius. -1 default radius.
      @return Area.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el área de una ruta cerrada. El área calculada usa las mismas unidades que Radius. El radio por defecto es el radio de la Tierra en metros, en cuyo caso el área es en metros cuadrados.
      Los puntos tiene que estar separados por punto y coma (;) y la Lat/Lng de un punto por una barra vertical (|).
      @param Map Mapa para acceder a las funciones JavaScript.
      @param PointsStr String con los puntos.
      @param Radius Radio. -1 radio por defecto.
      @return Area.
    -------------------------------------------------------------------------------}
    class function ComputeArea(Map: TCustomGMMap; PointsStr: string;
      Radius: Real = -1): Real;
    {*------------------------------------------------------------------------------
      Returns the distance between two LatLngs.
      @param Map Map to access JavaScript functions.
      @param Origin LatLng origin.
      @param Dest LatLng destination.
      @param Radius Radius. -1 default radius.
      @return Distance between points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la distancia entre dos LatLngs.
      @param Map Mapa para acceder a las funciones JavaScript.
      @param Origin LatLng origen.
      @param Dest LatLng destino.
      @param Radius Radio. -1 radio por defecto.
      @return Distancia entre los puntos.
    -------------------------------------------------------------------------------}
    class function ComputeDistanceBetween(Map: TCustomGMMap; Origin, Dest: TLatLng;
      Radius: Real = -1): Real;
    {*------------------------------------------------------------------------------
      Returns the degree between two LatLng.
      @param Map Map to access JavaScript functions.
      @param Origin LatLng origin.
      @param Dest LatLng destination.
      @return Degree between points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve los grados entre dos LatLng.
      @param Map Mapa para acceder a las funciones JavaScript.
      @param Origin LatLng origen.
      @param Dest LatLng destino.
      @return Grados entre los puntos.
    -------------------------------------------------------------------------------}
    class function ComputeHeading(Map: TCustomGMMap; Origin, Dest: TLatLng): Real;
    {*------------------------------------------------------------------------------
      Returns the length of the given path.
      The points must be separated by semicolon (;) and the Lat/Lng of a point by a pipe (|).
      @param Map Map to access JavaScript functions.
      @param PointsStr String with the points.
      @param Radius Radius. -1 default radius.
      @return Length.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la longitud del camino dado.
      Los puntos tiene que estar separados por punto y coma (;) y la Lat/Lng de un punto por una barra vertical (|).
      @param Map Mapa para acceder a las funciones JavaScript.
      @param PointsStr String con los puntos.
      @param Radius Radio. -1 radio por defecto.
      @return Longitud.
    -------------------------------------------------------------------------------}
    class function ComputeLength(Map: TCustomGMMap; PointsStr: string;
      Radius: Real = -1): Real;
    {*------------------------------------------------------------------------------
      Returns the TLatLng resulting from moving a distance from an origin in the specified heading.
      @param Map Map to access JavaScript functions.
      @param Origin LatLng origin.
      @param Distance Distance to move.
      @param Heading Degree.
      @param Radius Radius. -1 default radius.
      @param Result Resulting TLatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la TLatLng resultante de desplazarse una distancia desde un origen en unos grados específicos.
      @param Map Mapa para acceder a las funciones JavaScript.
      @param Origin LatLng origen.
      @param Distance Distancia a desplazarse.
      @param Heading Grados.
      @param Radius Radio. -1 radio por defecto.
      @param Result TLatLng resultante.
    -------------------------------------------------------------------------------}
    class procedure ComputeOffset(Map: TCustomGMMap; Origin: TLatLng; Distance,
      Heading: Real; Result: TLatLng; Radius: Real = -1);
    {*------------------------------------------------------------------------------
      Returns the TLatLng of origin when provided with a LatLng destination, meters travelled and original heading.
      @param Map Map to access JavaScript functions.
      @param Dest LatLng destination.
      @param Distance Distance moved.
      @param Heading Degree.
      @param Radius Radius. -1 default radius.
      @param Result Resulting TLatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la TLatLng del origen sabiendo la TLatLng destino, los metros desplazados y los grados iniciales.
      @param Map Mapa para acceder a las funciones JavaScript.
      @param Dest LatLng destino.
      @param Distance Distancia desplazada.
      @param Heading Grados.
      @param Radius Radio. -1 radio por defecto.
      @param Result TLatLng resultante.
    -------------------------------------------------------------------------------}
    class procedure ComputeOffsetOrigin(Map: TCustomGMMap; Dest: TLatLng; Distance,
      Heading: Real; Result: TLatLng; Radius: Real = -1);
    {*------------------------------------------------------------------------------
      Returns the signed area of a closed path.
      The points must be separated by semicolon (;) and the Lat/Lng of a point by a pipe (|).
      @param Map Map to access JavaScript functions.
      @param PointsStr String with the points.
      @param Radius Radius. -1 default radius.
      @return Length.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el area de una ruta cerrada.
      Los puntos tiene que estar separados por punto y coma (;) y la Lat/Lng de un punto por una barra vertical (|).
      @param Map Mapa para acceder a las funciones JavaScript.
      @param PointsStr String con los puntos.
      @param Radius Radio. -1 radio por defecto.
      @return Longitud.
    -------------------------------------------------------------------------------}
    class function ComputeSignedArea(Map: TCustomGMMap; PointsStr: string;
      Radius: Real = -1): Real;
    {*------------------------------------------------------------------------------
      Returns the LatLng which lies the given fraction of the way between the origin LatLng and the destination LatLng.
      @param Map Map to access JavaScript functions.
      @param Origin LatLng origin.
      @param Dest LatLng destination.
      @param Fraction Fraction.
      @param Result Resulting TLatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve la LatLng que se encuentra en la fracción dada del camino entre la LatLng origen y la LatLng destino.
      @param Map Mapa para acceder a las funciones JavaScript.
      @param Origin LatLng origen.
      @param Dest LatLng destino.
      @param Fraction Fracción.
      @param Result TLatLng resultante.
    -------------------------------------------------------------------------------}
    class procedure Interpolate(Map: TCustomGMMap; Origin, Dest: TLatLng;
      Fraction: Real; Result: TLatLng);
  end;

  {*------------------------------------------------------------------------------
    Contains some utility methods used in path manipulations.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Contiene algunos métodos útiles que se usan para la manipulación de Path.
  -------------------------------------------------------------------------------}
  TPath = class
  public
    {*------------------------------------------------------------------------------
      Returns the temp directory.
      @return string with the temp directory.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el directorio temporal.
      @return string con el directorio temporal.
    -------------------------------------------------------------------------------}
    class function GetTempPath: string;
    {*------------------------------------------------------------------------------
      Returns a temp file name.
      @return string with the name of the temp file name.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve un fichero temporal.
      @return string con el nombre del fichero temporal.
    -------------------------------------------------------------------------------}
    class function GetTempFileName: string;
  end;

  {*------------------------------------------------------------------------------
    Contains methods of transformations.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Contiene métodos de transformaciones.
  -------------------------------------------------------------------------------}
  TCustomTransform = class
  public
    {*------------------------------------------------------------------------------
      Returns a string that represents a boolean value. This function have sense since some people have localized the original Delphi function.
      @param B Boolean value to convert.
      @param UseBoolStrs Return a string value.
      @return string that represents the boolean value.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa un valor booleano. Esta función se debe dado a que hay gente que ha localizado la función de Delphi.
      @param B Valor booleano a convertir.
      @param UseBoolStrs Devolver un valor string.
      @return cadena que representa el valor booleano.
    -------------------------------------------------------------------------------}
    class function GMBoolToStr(B: Boolean; UseBoolStrs: Boolean = False): string;

    {*------------------------------------------------------------------------------
      Returns a string that represents ccTLD region.
      @param Region TRegion to convert to ccTLD
      @return string with the ccTLD of the region
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa la ccTLD de la región.
      @param Region TRegion a convertir a ccTLD
      @return cadena con el ccTLD de la región
    -------------------------------------------------------------------------------}
    class function RegionToStr(Region: TRegion): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the region.
      @param Region TRegion to convert to string
      @return string with the region
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa la región.
      @param Region TRegion a convertir a cadena
      @return cadena con la región
    -------------------------------------------------------------------------------}
    class function RegionToStr2(Region: TRegion): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the LangCode.
      @param LangCode TLangCode to convert to string
      @return string with the LangCode
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el LangCode.
      @param LangCode TLangCode a convertir a cadena
      @return cadena con el LangCode
    -------------------------------------------------------------------------------}
    class function LangCodeToStr(LangCode: TLangCode): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the TravelMode.
      @param TravelMode TTravelMode to convert to string
      @return string with the TravelMode
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el TravelMode.
      @param TravelMode TTravelMode a convertir a cadena
      @return cadena con el TravelMode
    -------------------------------------------------------------------------------}
    class function TravelModeToStr(TravelMode: TTravelMode): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the UnitSystem.
      @param UnitSystem TUnitSystem to convert to string
      @return string with the UnitSystem
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el UnitSystem.
      @param UnitSystem TUnitSystem a convertir a cadena
      @return cadena con el UnitSystem
    -------------------------------------------------------------------------------}
    class function UnitSystemToStr(UnitSystem: TUnitSystem): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the GeocoderLocationType.
      @param GeocoderLocationType TGeocoderLocationType to convert to string
      @return string with the GeocoderLocationType
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el GeocoderLocationType.
      @param GeocoderLocationType TGeocoderLocationType a convertir a cadena
      @return cadena con el GeocoderLocationType
    -------------------------------------------------------------------------------}
    class function GeocoderLocationTypeToStr(GeocoderLocationType: TGeocoderLocationType): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the GeocoderStatus.
      @param GeocoderStatus TGeocoderStatus to convert to string
      @return string with the GeocoderStatus
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el GeocoderStatus.
      @param GeocoderStatus TGeocoderStatus a convertir a cadena
      @return cadena con el GeocoderStatus
    -------------------------------------------------------------------------------}
    class function GeocoderStatusToStr(GeocoderStatus: TGeocoderStatus): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the LangCode.
      @param LangCode TLangCode to convert to string
      @return string with the LangCode
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el LangCode.
      @param LangCode TLangCode a convertir a cadena
      @return cadena con el LangCode
    -------------------------------------------------------------------------------}
    class function LangCodeToStr2(LangCode: TLangCode): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the LabelColor.
      @param LabelColor TLabelColor to convert to string
      @return string with the LabelColor
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el LabelColor.
      @param LabelColor TLabelColor a convertir a cadena
      @return cadena con el LabelColor
    -------------------------------------------------------------------------------}
    class function LabelColorToStr(LabelColor: TLabelColor): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the TemperatureUnit.
      @param TemperatureUnit TTemperatureUnit to convert to string
      @return string with the TemperatureUnit
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el TemperatureUnit.
      @param TemperatureUnit TTemperatureUnit a convertir a cadena
      @return cadena con el TemperatureUnit
    -------------------------------------------------------------------------------}
    class function TemperatureUnitToStr(TemperatureUnit: TTemperatureUnit): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the WindSpeedUnit.
      @param WindSpeedUnit TWindSpeedUnit to convert to string
      @return string with the WindSpeedUnit
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el WindSpeedUnit.
      @param WindSpeedUnit TWindSpeedUnit a convertir a cadena
      @return cadena con el WindSpeedUnit
    -------------------------------------------------------------------------------}
    class function WindSpeedUnitToStr(WindSpeedUnit: TWindSpeedUnit): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the DirectionsStatus.
      @param DirectionsStatus TDirectionsStatus to convert to string
      @return string with the DirectionsStatus
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el DirectionsStatus.
      @param DirectionsStatus TDirectionsStatus a convertir a cadena
      @return cadena con el DirectionsStatus
    -------------------------------------------------------------------------------}
    class function DirectionsStatusToStr(DirectionsStatus: TDirectionsStatus): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the VehicleType.
      @param VehicleType TVehicleType to convert to string
      @return string with the VehicleType
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el VehicleType.
      @param VehicleType TVehicleType a convertir a cadena
      @return cadena con el VehicleType
    -------------------------------------------------------------------------------}
    class function VehicleTypeToStr(VehicleType: TVehicleType): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the SymbolPath.
      @param SymbolPath TSymbolPath to convert to string
      @return string with the SymbolPath
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el SymbolPath.
      @param SymbolPath TSymbolPath a convertir a cadena
      @return cadena con el SymbolPath
    -------------------------------------------------------------------------------}
    class function SymbolPathToStr(SymbolPath: TSymbolPath): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the Measure.
      @param Measure TMeasure to convert to string
      @return string with the Measure
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el Measure.
      @param Measure TMeasure a convertir a cadena
      @return cadena con el Measure
    -------------------------------------------------------------------------------}
    class function MeasureToStr(Measure: TMeasure): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the MarkerType.
      @param MarkerType TMarkerType to convert to string
      @return string with the MarkerType
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el MarkerType.
      @param MarkerType TMarkerType a convertir a cadena
      @return cadena con el MarkerType
    -------------------------------------------------------------------------------}
    class function MarkerTypeToStr(MarkerType: TMarkerType): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the StyledIcon.
      @param StyledIcon TStyledIcon to convert to string
      @return string with the StyledIcon
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el StyledIcon.
      @param StyledIcon TStyledIcon a convertir a cadena
      @return cadena con el StyledIcon
    -------------------------------------------------------------------------------}
    class function StyledIconToStr(StyledIcon: TStyledIcon): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the ElevationType.
      @param ElevationType TElevationType to convert to string
      @return string with the ElevationType
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el ElevationType.
      @param ElevationType TElevationType a convertir a cadena
      @return cadena con el ElevationType
    -------------------------------------------------------------------------------}
    class function ElevationTypeToStr(ElevationType: TElevationType): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the ElevationStatus.
      @param ElevationStatus TElevationStatus to convert to string
      @return string with the ElevationStatus
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el ElevationStatus.
      @param ElevationStatus TElevationStatus a convertir a cadena
      @return cadena con el ElevationStatus
    -------------------------------------------------------------------------------}
    class function ElevationStatusToStr(ElevationStatus: TElevationStatus): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the MapTypeId.
      @param MapTypeId TMapTypeId to convert to string
      @return string with the MapTypeId
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el MapTypeId.
      @param MapTypeId TMapTypeId a convertir a cadena
      @return cadena con el MapTypeId
    -------------------------------------------------------------------------------}
    class function MapTypeIdToStr(MapTypeId: TMapTypeId): string;
    {*------------------------------------------------------------------------------
      Returns a string with the MapTypeId included into MapTypeIds.
      @param MapTypeIds TMapTypeIds to convert to string
      @param Delimiter Delimiter between MapTypeId
      @return string with the MapTypeIds
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena con los MapTypeId incluidos en MapTypeIds.
      @param MapTypeIds TMapTypeIds a convertir a cadena
      @param Delimiter Delimitador entre MapTypeId
      @return cadena con los MapTypeIds
    -------------------------------------------------------------------------------}
    class function MapTypeIdsToStr(MapTypeIds: TMapTypeIds; Delimiter: Char = ';'): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the Position.
      @param Position TPosition to convert to string
      @return string with the Position
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el Position.
      @param Position TPosition a convertir a cadena
      @return cadena con el Position
    -------------------------------------------------------------------------------}
    class function PositionToStr(Position: TControlPosition): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the MapTypeControlStyle.
      @param MapTypeControlStyle TMapTypeControlStyle to convert to string
      @return string with the MapTypeControlStyle
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el MapTypeControlStyle.
      @param MapTypeControlStyle TMapTypeControlStyle a convertir a cadena
      @return cadena con el MapTypeControlStyle
    -------------------------------------------------------------------------------}
    class function MapTypeControlStyleToStr(MapTypeControlStyle: TMapTypeControlStyle): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the ScaleControlStyle.
      @param ScaleControlStyle TScaleControlStyle to convert to string
      @return string with the ScaleControlStyle
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el ScaleControlStyle.
      @param ScaleControlStyle TScaleControlStyle a convertir a cadena
      @return cadena con el ScaleControlStyle
    -------------------------------------------------------------------------------}
    class function ScaleControlStyleToStr(ScaleControlStyle: TScaleControlStyle): string;
    {*------------------------------------------------------------------------------
      Returns a string that represents the ZoomControlStyle.
      @param ZoomControlStyle TZoomControlStyle to convert to string
      @return string with the ZoomControlStyle
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el ZoomControlStyle.
      @param ZoomControlStyle TZoomControlStyle a convertir a cadena
      @return cadena con el ZoomControlStyle
    -------------------------------------------------------------------------------}
    class function ZoomControlStyleToStr(ZoomControlStyle: TZoomControlStyle): string;

    {*------------------------------------------------------------------------------
      Returns a string that represents the Gradient.
      @param Gradient TGradient to convert to string
      @return string with the Gradient
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena que representa el Gradient.
      @param Gradient TGradient a convertir a cadena
      @return cadena con el Gradient
    -------------------------------------------------------------------------------}
    class function GradientToStr(Gradient: TGradient): string;

    {*------------------------------------------------------------------------------
      Returns the TUnitSystem represented by the string UnitSystem.
      @param UnitSystem string to convert to TUnitSystem
      @return TUnitSystem that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TUnitSystem representado por la cadena UnitSystem.
      @param UnitSystem Cadena a convertir a TUnitSystem
      @return TUnitSystem que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToUnitSystem(UnitSystem: string): TUnitSystem;
    {*------------------------------------------------------------------------------
      Returns the TTravelMode represented by the string TravelMode.
      @param TravelMode string to convert to TTravelMode
      @return TTravelMode that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TTravelMode representado por la cadena TravelMode.
      @param TravelMode Cadena a convertir a TTravelMode
      @return TTravelMode que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToTravelMode(TravelMode: string): TTravelMode;
    {*------------------------------------------------------------------------------
      Returns the TRegion represented by the string Region.
      @param Region string to convert to TRegion
      @return TRegion that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TRegion representado por la cadena Region.
      @param Region Cadena a convertir a TRegion
      @return TRegion que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToRegion2(Region: string): TRegion;
    {*------------------------------------------------------------------------------
      Returns the TGeocoderLocationType represented by the string GeocoderLocationType.
      @param GeocoderLocationType string to convert to TGeocoderLocationType
      @return TGeocoderLocationType that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TGeocoderLocationType representado por la cadena GeocoderLocationType.
      @param GeocoderLocationType Cadena a convertir a TGeocoderLocationType
      @return TGeocoderLocationType que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToGeocoderLocationType(GeocoderLocationType: string): TGeocoderLocationType;
    {*------------------------------------------------------------------------------
      Returns the TGeocoderStatus represented by the string GeocoderStatus.
      @param GeocoderStatus string to convert to TGeocoderStatus
      @return TGeocoderStatus that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TGeocoderStatus representado por la cadena GeocoderStatus.
      @param GeocoderStatus Cadena a convertir a TGeocoderStatus
      @return TGeocoderStatus que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToGeocoderStatus(GeocoderStatus: string): TGeocoderStatus;
    {*------------------------------------------------------------------------------
      Returns the TLangCode represented by the string LangCode.
      @param LangCode string to convert to TLangCode
      @return TLangCode that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TLangCode representado por la cadena LangCode.
      @param LangCode Cadena a convertir a TLangCode
      @return TLangCode que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToLangCode2(LangCode: string): TLangCode;
    {*------------------------------------------------------------------------------
      Returns the TLabelColor represented by the string LabelColor.
      @param LabelColor string to convert to TLabelColor
      @return TLabelColor that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TLabelColor representado por la cadena LabelColor.
      @param LabelColor Cadena a convertir a TLabelColor
      @return TLabelColor que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToLabelColor(LabelColor: string): TLabelColor;
    {*------------------------------------------------------------------------------
      Returns the TTemperatureUnit represented by the string TemperatureUnit.
      @param TemperatureUnit string to convert to TTemperatureUnit
      @return TTemperatureUnit that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TTemperatureUnit representado por la cadena TemperatureUnit.
      @param TemperatureUnit Cadena a convertir a TTemperatureUnit
      @return TTemperatureUnit que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToTemperatureUnit(TemperatureUnit: string): TTemperatureUnit;
    {*------------------------------------------------------------------------------
      Returns the TWindSpeedUnit represented by the string WindSpeedUnit.
      @param WindSpeedUnit string to convert to TWindSpeedUnit
      @return TWindSpeedUnit that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TWindSpeedUnit representado por la cadena WindSpeedUnit.
      @param WindSpeedUnit Cadena a convertir a TWindSpeedUnit
      @return TWindSpeedUnit que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToWindSpeedUnit(WindSpeedUnit: string): TWindSpeedUnit;
    {*------------------------------------------------------------------------------
      Returns the TDirectionsStatus represented by the string DirectionsStatus.
      @param DirectionsStatus string to convert to TDirectionsStatus
      @return TDirectionsStatus that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TDirectionsStatus representado por la cadena DirectionsStatus.
      @param DirectionsStatus Cadena a convertir a TDirectionsStatus
      @return TDirectionsStatus que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToDirectionsStatus(DirectionsStatus: string): TDirectionsStatus;
    {*------------------------------------------------------------------------------
      Returns the TVehicleType represented by the string VehicleType.
      @param VehicleType string to convert to TVehicleType
      @return TVehicleType that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TVehicleType representado por la cadena VehicleType.
      @param VehicleType Cadena a convertir a TVehicleType
      @return TVehicleType que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToVehicleType(VehicleType: string): TVehicleType;
    {*------------------------------------------------------------------------------
      Returns the TSymbolPath represented by the string SymbolPath.
      @param SymbolPath string to convert to TSymbolPath
      @return TSymbolPath that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TSymbolPath representado por la cadena SymbolPath.
      @param SymbolPath Cadena a convertir a TSymbolPath
      @return TSymbolPath que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToSymbolPath(SymbolPath: string): TSymbolPath;
    {*------------------------------------------------------------------------------
      Returns the TMeasure represented by the string Measure.
      @param Measure string to convert to TMeasure
      @return TMeasure that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TMeasure representado por la cadena Measure.
      @param Measure Cadena a convertir a TMeasure
      @return TMeasure que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToMeasure(Measure: string): TMeasure;
    {*------------------------------------------------------------------------------
      Returns the TMarkerType represented by the string MarkerType.
      @param MarkerType string to convert to TMarkerType
      @return TMarkerType that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TMarkerType representado por la cadena MarkerType.
      @param MarkerType Cadena a convertir a TMarkerType
      @return TMarkerType que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToMarkerType(MarkerType: string): TMarkerType;
    {*------------------------------------------------------------------------------
      Returns the TStyledIcon represented by the string StyledIcon.
      @param StyledIcon string to convert to TStyledIcon
      @return TStyledIcon that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TStyledIcon representado por la cadena StyledIcon.
      @param StyledIcon Cadena a convertir a TStyledIcon
      @return TStyledIcon que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToStyledIcon(StyledIcon: string): TStyledIcon;
    {*------------------------------------------------------------------------------
      Returns the TElevationType represented by the string ElevationType.
      @param ElevationType string to convert to TElevationType
      @return TElevationType that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TElevationType representado por la cadena ElevationType.
      @param ElevationType Cadena a convertir a TElevationType
      @return TElevationType que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToElevationType(ElevationType: string): TElevationType;
    {*------------------------------------------------------------------------------
      Returns the TElevationStatus represented by the string ElevationStatus.
      @param ElevationStatus string to convert to TElevationStatus
      @return TElevationStatus that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TElevationStatus representado por la cadena ElevationStatus.
      @param ElevationStatus Cadena a convertir a TElevationStatus
      @return TElevationStatus que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToElevationStatus(ElevationStatus: string): TElevationStatus;
    {*------------------------------------------------------------------------------
      Returns the TMapTypeId represented by the string MapTypeId.
      @param MapTypeId string to convert to TMapTypeId
      @return TMapTypeId that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TMapTypeId representado por la cadena MapTypeId.
      @param MapTypeId Cadena a convertir a TMapTypeId
      @return TMapTypeId que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToMapTypeId(MapTypeId: string): TMapTypeId;
    {*------------------------------------------------------------------------------
      Returns the TControlPosition represented by the string Position.
      @param Position string to convert to TControlPosition
      @return TMapTypeId that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TControlPosition representado por la cadena Position.
      @param Position Cadena a convertir a TControlPosition
      @return TControlPosition que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToPosition(Position: string): TControlPosition;
    {*------------------------------------------------------------------------------
      Returns the TMapTypeControlStyle represented by the string MapTypeControlStyle.
      @param MapTypeControlStyle string to convert to TMapTypeControlStyle
      @return TMapTypeControlStyle that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TMapTypeControlStyle representado por la cadena MapTypeControlStyle.
      @param MapTypeControlStyle Cadena a convertir a TMapTypeControlStyle
      @return TMapTypeControlStyle que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToMapTypeControlStyle(MapTypeControlStyle: string): TMapTypeControlStyle;
    {*------------------------------------------------------------------------------
      Returns the TScaleControlStyle represented by the string ScaleControlStyle.
      @param ScaleControlStyle string to convert to TScaleControlStyle
      @return TScaleControlStyle that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TScaleControlStyle representado por la cadena ScaleControlStyle.
      @param ScaleControlStyle Cadena a convertir a TScaleControlStyle
      @return TScaleControlStyle que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToScaleControlStyle(ScaleControlStyle: string): TScaleControlStyle;
    {*------------------------------------------------------------------------------
      Returns the TZoomControlStyle represented by the string ZoomControlStyle.
      @param ZoomControlStyle string to convert to TZoomControlStyle
      @return TZoomControlStyle that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TZoomControlStyle representado por la cadena ZoomControlStyle.
      @param ZoomControlStyle Cadena a convertir a TZoomControlStyle
      @return TZoomControlStyle que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToZoomControlStyle(ZoomControlStyle: string): TZoomControlStyle;

    {*------------------------------------------------------------------------------
      Returns the TGradient represented by the string Gradient.
      @param Gradient string to convert to TGradient
      @return TGradient that represents the string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el TGradient representado por la cadena Gradient.
      @param Gradient Cadena a convertir a TGradient
      @return TGradient que representa la cadena
    -------------------------------------------------------------------------------}
    class function StrToGradient(Gradient: string): TGradient;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.TypInfo, System.IOUtils, System.SysUtils, System.Classes, Winapi.Windows,
  {$ELSE}
  TypInfo, Windows, SysUtils, Classes,
  {$ENDIF}

  GMRectangle;

{ TPath }

class function TPath.GetTempPath: string;
{$IFDEF DELPHIXE2}
begin
  Result := System.IOUtils.TPath.GetTempPath;
end;
{$ELSE}
var
  Len: Integer;
begin
  Result := ''; // DO NOT LOCALIZE
  SetLastError(ERROR_SUCCESS);

  // get memory for the buffer retaining the temp path (plus null-termination)
  Len := Windows.GetTempPath(0, nil);
  SetLength(Result, Len - 1);
  if Windows.GetTempPath(Len, PChar(Result)) = 0 then
    Result := '';
end;
{$ENDIF}

class function TPath.GetTempFileName: string;
{$IFDEF DELPHIXE2}
begin
  Result := System.IOUtils.TPath.GetTempFileName;
end;
{$ELSE}
var
  TempPath: string;
  ErrCode: Cardinal;
  P: PChar;
begin
  TempPath := TPath.GetTempPath;
  GetMem(P, MAX_PATH);

  SetLastError(ERROR_SUCCESS);
  ErrCode := Windows.GetTempFileName(PChar(TempPath), 'tmp', 0, P); // DO NOT LOCALIZE
  if ErrCode = 0 then
    raise Exception.Create(SysErrorMessage(GetLastError));

  Result := StrPas(P);
  FreeMem(P);
end;
{$ENDIF}

{ TCustomTransform }

class function TCustomTransform.DirectionsStatusToStr(
  DirectionsStatus: TDirectionsStatus): string;
begin
  Result := GetEnumName(TypeInfo(TDirectionsStatus), Ord(DirectionsStatus));
end;

class function TCustomTransform.ElevationStatusToStr(
  ElevationStatus: TElevationStatus): string;
begin
  Result := GetEnumName(TypeInfo(TElevationStatus), Ord(ElevationStatus));
end;

class function TCustomTransform.ElevationTypeToStr(
  ElevationType: TElevationType): string;
begin
  Result := GetEnumName(TypeInfo(TElevationType), Ord(ElevationType));
end;

class function TCustomTransform.GeocoderLocationTypeToStr(
  GeocoderLocationType: TGeocoderLocationType): string;
begin
  Result := GetEnumName(TypeInfo(TGeocoderLocationType), Ord(GeocoderLocationType));
end;

class function TCustomTransform.GeocoderStatusToStr(
  GeocoderStatus: TGeocoderStatus): string;
begin
  Result := GetEnumName(TypeInfo(TGeocoderStatus), Ord(GeocoderStatus));
end;

class function TCustomTransform.GMBoolToStr(B, UseBoolStrs: Boolean): string;
const
  cSimpleBoolStrs: array [boolean] of string = ('0', '-1');
begin
  if UseBoolStrs then
  begin
    if B then Result := 'true'
    else Result := 'false';
  end
  else
    Result := cSimpleBoolStrs[B];
end;

class function TCustomTransform.GradientToStr(Gradient: TGradient): string;
begin
  Result := GetEnumName(TypeInfo(TGradient), Ord(Gradient));
end;

class function TCustomTransform.LabelColorToStr(LabelColor: TLabelColor): string;
begin
  Result := GetEnumName(TypeInfo(TLabelColor), Ord(LabelColor));
end;

class function TCustomTransform.LangCodeToStr(LangCode: TLangCode): string;
begin
  case LangCode of
    lcARABIC: Result := 'ar';
    lcBASQUE: Result := 'eu';
    lcBENGALI: Result := 'bn';
    lcBULGARIAN: Result := 'bg';
    lcCATALAN: Result := 'ca';
    lcCHINESE_SIMPLIFIED: Result := 'zh-CN';
    lcCHINESE_TRADITIONAL: Result := 'zh-TW';
    lcCROATIAN: Result := 'hr';
    lcCZECH: Result := 'cs';
    lcDANISH: Result := 'da';
    lcDUTCH: Result := 'nl';
    lcENGLISH: Result := 'en';
    lcENGLISH_AUSTRALIAN: Result := 'en-AU';
    lcENGLISH_GREAT_BRITAIN: Result := 'en-GB';
    lcFARSI: Result := 'fa';
    lcFILIPINO: Result := 'fil';
    lcFINNISH: Result := 'fi';
    lcFRENCH: Result := 'fr';
    lcGALICIAN: Result := 'gl';
    lcGERMAN: Result := 'de';
    lcGREEK: Result := 'el';
    lcGUJARATI: Result := 'gu';
    lcHEBREW: Result := 'iw';
    lcHINDI: Result := 'hi';
    lcHUNGARIAN: Result := 'hu';
    lcINDONESIAN: Result := 'id';
    lcITALIAN: Result := 'it';
    lcJAPANESE: Result := 'ja';
    lcKANNADA: Result := 'kn';
    lcKOREAN: Result := 'ko';
    lcLATVIAN: Result := 'lv';
    lcLITHUANIAN: Result := 'lt';
    lcMALAYALAM: Result := 'ml';
    lcMARATHI: Result := 'mr';
    lcNORWEGIAN: Result := 'no';
    lcPOLISH: Result := 'pl';
    lcPORTUGUESE: Result := 'pt';
    lcPORTUGUESE_BRAZIL: Result := 'pt-BR';
    lcPORTUGUESE_PORTUGAL: Result := 'pt-PT';
    lcROMANIAN: Result := 'ro';
    lcRUSSIAN: Result := 'ru';
    lcSERBIAN: Result := 'sr';
    lcSLOVAK: Result := 'sk';
    lcSLOVENIAN: Result := 'sl';
    lcSPANISH: Result := 'es';
    lcSWEDISH: Result := 'sv';
    lcTAGALOG: Result := 'tl';
    lcTAMIL: Result := 'ta';
    lcTELUGU: Result := 'te';
    lcTHAI: Result := 'th';
    lcTURKISH: Result := 'tr';
    lcUKRAINIAN: Result := 'uk';
    lcVIETNAMESE: Result := 'vi';
    else Result := '';
  end;
end;

class function TCustomTransform.LangCodeToStr2(LangCode: TLangCode): string;
begin
  Result := GetEnumName(TypeInfo(TLangCode), Ord(LangCode));
end;

class function TCustomTransform.MapTypeControlStyleToStr(
  MapTypeControlStyle: TMapTypeControlStyle): string;
begin
  Result := GetEnumName(TypeInfo(TMapTypeControlStyle), Ord(MapTypeControlStyle));
end;

class function TCustomTransform.MapTypeIdsToStr(MapTypeIds: TMapTypeIds; Delimiter: Char): string;
begin
  Result := '';

  if mtHYBRID in MapTypeIds then
    Result := Result + 'mtHYBRID';

  if mtROADMAP in MapTypeIds then
  begin
    if Result <> '' then Result := Result + Delimiter;
    Result := Result + 'mtROADMAP';
  end;

  if mtSATELLITE in MapTypeIds then
  begin
    if Result <> '' then Result := Result + Delimiter;
    Result := Result + 'mtSATELLITE';
  end;

  if mtTERRAIN in MapTypeIds then
  begin
    if Result <> '' then Result := Result + Delimiter;
    Result := Result + 'mtTERRAIN';
  end;

  if mtOSM in MapTypeIds then
  begin
    if Result <> '' then Result := Result + Delimiter;
    Result := Result + 'mtOSM';
  end;
end;

class function TCustomTransform.MapTypeIdToStr(MapTypeId: TMapTypeId): string;
begin
  Result := GetEnumName(TypeInfo(TMapTypeId), Ord(MapTypeId));
end;

class function TCustomTransform.MarkerTypeToStr(MarkerType: TMarkerType): string;
begin
  Result := GetEnumName(TypeInfo(TMarkerType), Ord(MarkerType));
end;

class function TCustomTransform.MeasureToStr(Measure: TMeasure): string;
begin
  Result := GetEnumName(TypeInfo(TMeasure), Ord(Measure));
end;

class function TCustomTransform.PositionToStr(Position: TControlPosition): string;
begin
  Result := GetEnumName(TypeInfo(TControlPosition), Ord(Position));
end;

class function TCustomTransform.RegionToStr(Region: TRegion): string;
begin
  case Region of
    rAFGHANISTAN: Result := 'af';
    rALAND: Result := 'ax';
    rALBANIA: Result := 'al';
    rALGERIA: Result := 'dz';
    rAMERICAN_SAMOA: Result := 'as';
    rANDORRA: Result := 'ad';
    rANGOLA: Result := 'ao';
    rANGUILLA: Result := 'ai';
    rANTARCTICA: Result := 'aq';
    rANTIGUA_AND_BARBUDA: Result := 'ag';
    rARGENTINA: Result := 'ar';
    rARMENIA: Result := 'am';
    rARUBA: Result := 'aw';
    rASCENSION_ISLAND: Result := 'ac';
    rAUSTRALIA: Result := 'au';
    rAUSTRIA: Result := 'at';
    rAZERBAIJAN: Result := 'az';
    rBAHAMAS: Result := 'bs';
    rBAHRAIN: Result := 'bh';
    rBANGLADESH: Result := 'bd';
    rBARBADOS: Result := 'bb';
    rBELARUS: Result := 'by';
    rBELGIUM: Result := 'be';
    rBELIZE: Result := 'bz';
    rBENIN: Result := 'bj';
    rBERMUDA: Result := 'bm';
    rBHUTAN: Result := 'bt';
    rBOLIVIA: Result := 'bo';
    rBOSNIA_AND_HERZEGOVINA: Result := 'ba';
    rBOTSWANA: Result := 'bw';
    rBRAZIL: Result := 'br';
    rBRITISH_INDIAN_OCEAN_TERRITORY: Result := 'io';
    rBRITISH_VIRGIN_ISLANDS: Result := 'vg';
    rBRUNEI: Result := 'bn';
    rBULGARIA: Result := 'bg';
    rBURKINA_FASO: Result := 'bf';
    rBURUNDI: Result := 'bi';
    rCAMBODIA: Result := 'kh';
    rCAMEROON: Result := 'cm';
    rCANADA: Result := 'ca';
    rCAPE_VERDE: Result := 'cv';
    rCAYMAN_ISLANDS: Result := 'ky';
    rCENTRAL_AFRICAN_REPUBLIC: Result := 'cf';
    rCHAD: Result := 'td';
    rCHILE: Result := 'cl';
    rCHRISTMAS_ISLAND: Result := 'cx';
    rCOCOS_KEELING_ISLANDS: Result := 'cc';
    rCOLOMBIA: Result := 'co';
    rCOMOROS: Result := 'km';
    rCOOK_ISLANDS: Result := 'ck';
    rCOSTA_RICA: Result := 'cr';
    rCOTE_D_IVOIRE: Result := 'ci';
    rCROATIA: Result := 'hr';
    rCUBA: Result := 'cu';
    rCYPRUS: Result := 'cy';
    rCZECH_REPUBLIC: Result := 'cz';
    rDEMOCRATIC_PEOPLE_S_REPUBLIC_OF_KOREA: Result := 'kp';
    rDEMOCRATIC_REPUBLIC_OF_THE_CONGO: Result := 'cd';
    rDENMARK: Result := 'dk';
    rDJIBOUTI: Result := 'dj';
    rDOMINICA: Result := 'dm';
    rDOMINICAN_REPUBLIC: Result := 'do';
    rEAST_TIMOR: Result := 'tl';
    rECUADOR: Result := 'ec';
    rEGYPT: Result := 'eg';
    rEL_SALVADOR: Result := 'sv';
    rEQUATORIAL_GUINEA: Result := 'gq';
    rERITREA: Result := 'er';
    rESTONIA: Result := 'ee';
    rETHIOPIA: Result := 'et';
    rEUROPEAN_UNION: Result := 'eu';
    rFALKLAND_ISLANDS: Result := 'fk';
    rFAROE_ISLANDS: Result := 'fo';
    rFEDERATED_STATES_OF_MICRONESIA: Result := 'fm';
    rFIJI: Result := 'fj';
    rFINLAND: Result := 'fi';
    rFRANCE: Result := 'fr';
    rFRENCH_GUIANA: Result := 'gf';
    rFRENCH_POLYNESIA: Result := 'pf';
    rFRENCH_SOUTHERN_AND_ANTARCTIC_LANDS: Result := 'tf';
    rGABON: Result := 'ga';
    rGEORGIA: Result := 'ge';
    rGERMANY: Result := 'de';
    rGHANA: Result := 'gh';
    rGIBRALTAR: Result := 'gi';
    rGREECE: Result := 'gr';
    rGREENLAND: Result := 'gl';
    rGRENADA: Result := 'gd';
    rGUADELOUPE: Result := 'gp';
    rGUAM: Result := 'gu';
    rGUATEMALA: Result := 'gt';
    rGUERNSEY: Result := 'gg';
    rGUINEA: Result := 'gn';
    rGUINEA_BISSAU: Result := 'gw';
    rGUYANA: Result := 'gy';
    rHAITI: Result := 'ht';
    rHEARD_ISLAND_AND_MCDONALD_ISLANDS: Result := 'hm';
    rHONDURAS: Result := 'hn';
    rHONG_KONG: Result := 'hk';
    rHUNGARY: Result := 'hu';
    rICELAND: Result := 'is';
    rINDIA: Result := 'in';
    rINDONESIA: Result := 'id';
    rIRAN: Result := 'ir';
    rIRAQ: Result := 'iq';
    rISLE_OF_MAN: Result := 'im';
    rISRAEL: Result := 'il';
    rITALY: Result := 'it';
    rJAMAICA: Result := 'jm';
    rJAPAN: Result := 'jp';
    rJERSEY: Result := 'je';
    rJORDAN: Result := 'jo';
    rKAZAKHSTAN: Result := 'kz';
    rKENYA: Result := 'ke';
    rKIRIBATI: Result := 'ki';
    rKUWAIT: Result := 'kw';
    rKYRGYZSTAN: Result := 'kg';
    rLAOS: Result := 'la';
    rLATVIA: Result := 'lv';
    rLEBANON: Result := 'lb';
    rLESOTHO: Result := 'ls';
    rLIBERIA: Result := 'lr';
    rLIBYA: Result := 'ly';
    rLIECHTENSTEIN: Result := 'li';
    rLITHUANIA: Result := 'lt';
    rLUXEMBOURG: Result := 'lu';
    rMACAU: Result := 'mo';
    rMACEDONIA: Result := 'mk';
    rMADAGASCAR: Result := 'mg';
    rMALAWI: Result := 'mw';
    rMALAYSIA: Result := 'my';
    rMALDIVES: Result := 'mv';
    rMALI: Result := 'ml';
    rMALTA: Result := 'mt';
    rMARSHALL_ISLANDS: Result := 'mh';
    rMARTINIQUE: Result := 'mq';
    rMAURITANIA: Result := 'mr';
    rMAURITIUS: Result := 'mu';
    rMAYOTTE: Result := 'yt';
    rMEXICO: Result := 'mx';
    rMOLDOVA: Result := 'md';
    rMONACO: Result := 'mc';
    rMONGOLIA: Result := 'mn';
    rMONTENEGRO: Result := 'me';
    rMONTSERRAT: Result := 'ms';
    rMOROCCO: Result := 'ma';
    rMOZAMBIQUE: Result := 'mz';
    rMYANMAR: Result := 'mm';
    rNAMIBIA: Result := 'na';
    rNAURU: Result := 'nr';
    rNEPAL: Result := 'np';
    rNETHERLANDS: Result := 'nl';
    rNETHERLANDS_ANTILLES: Result := 'an';
    rNEW_CALEDONIA: Result := 'nc';
    rNEW_ZEALAND: Result := 'nz';
    rNICARAGUA: Result := 'ni';
    rNIGER: Result := 'ne';
    rNIGERIA: Result := 'ng';
    rNIUE: Result := 'nu';
    rNORFOLK_ISLAND: Result := 'nf';
    rNORTHERN_MARIANA_ISLANDS: Result := 'mp';
    rNORWAY: Result := 'no';
    rOMAN: Result := 'om';
    rPAKISTAN: Result := 'pk';
    rPALAU: Result := 'pw';
    rPALESTINIAN_TERRITORIES: Result := 'ps';
    rPANAMA: Result := 'pa';
    rPAPUA_NEW_GUINEA: Result := 'pg';
    rPARAGUAY: Result := 'py';
    rPEOPLE_S_REPUBLIC_OF_CHINA: Result := 'cn';
    rPERU: Result := 'pe';
    rPHILIPPINES: Result := 'ph';
    rPITCAIRN_ISLANDS: Result := 'pn';
    rPOLAND: Result := 'pl';
    rPORTUGAL: Result := 'pt';
    rPUERTO_RICO: Result := 'pr';
    rQATAR: Result := 'qa';
    rREPUBLIC_OF_IRELAND_AND_NORTHERN_IRELAND: Result := 'ie';
    rREPUBLIC_OF_KOREA: Result := 'kr';
    rREPUBLIC_OF_THE_CONGO: Result := 'cg';
    rREUNION: Result := 're';
    rROMANIA: Result := 'ro';
    rRUSSIA: Result := 'ru';
    rRWANDA: Result := 'rw';
    rSAINT_HELENA: Result := 'sh';
    rSAINT_KITTS_AND_NEVIS: Result := 'kn';
    rSAINT_LUCIA: Result := 'lc';
    rSAINT_VINCENT_AND_THE_GRENADINES: Result := 'vc';
    rSAINT_PIERRE_AND_MIQUELON: Result := 'pm';
    rSAMOA: Result := 'ws';
    rSAN_MARINO: Result := 'sm';
    rSAO_TOME_AND_PRINCIPE: Result := 'st';
    rSAUDI_ARABIA: Result := 'sa';
    rSENEGAL: Result := 'sn';
    rSERBIA: Result := 'rs';
    rSEYCHELLES: Result := 'sc';
    rSIERRA_LEONE: Result := 'sl';
    rSINGAPORE: Result := 'sg';
    rSLOVAKIA: Result := 'sk';
    rSLOVENIA: Result := 'si';
    rSOLOMON_ISLANDS: Result := 'sb';
    rSOMALIA: Result := 'so';
    rSOUTH_AFRICA: Result := 'za';
    rSOUTH_GEORGIA_AND_THE_SOUTH_SANDWICH_ISLANDS: Result := 'gs';
    rSOUTH_SUDAN: Result := 'ss';
    rSPAIN: Result := 'es';
    rSRI_LANKA: Result := 'lk';
    rSUDAN: Result := 'sd';
    rSURINAME: Result := 'sr';
    rSWAZILAND: Result := 'sz';
    rSWEDEN: Result := 'se';
    rSWITZERLAND: Result := 'ch';
    rSYRIA: Result := 'sy';
    rTAIWAN: Result := 'tw';
    rTAJIKISTAN: Result := 'tj';
    rTANZANIA: Result := 'tz';
    rTHAILAND: Result := 'th';
    rTHE_GAMBIA: Result := 'gm';
    rTOGO: Result := 'tg';
    rTOKELAU: Result := 'tk';
    rTONGA: Result := 'to';
    rTRINIDAD_AND_TOBAGO: Result := 'tt';
    rTUNISIA: Result := 'tn';
    rTURKEY: Result := 'tr';
    rTURKMENISTAN: Result := 'tm';
    rTURKS_AND_CAICOS_ISLANDS: Result := 'tc';
    rTUVALU: Result := 'tv';
    rUGANDA: Result := 'ug';
    rUKRAINE: Result := 'ua';
    rUNITED_ARAB_EMIRATES: Result := 'ae';
    rUNITED_KINGDOM: Result := 'uk';
    rUNITED_STATES_OF_AMERICA: Result := 'us';
    rUNITED_STATES_VIRGIN_ISLANDS: Result := 'vi';
    rURUGUAY: Result := 'uy';
    rUZBEKISTAN: Result := 'uz';
    rVANUATU: Result := 'vu';
    rVATICAN_CITY: Result := 'va';
    rVENEZUELA: Result := 've';
    rVIETNAM: Result := 'vn';
    rWALLIS_AND_FUTUNA: Result := 'wf';
    rWESTERN_SAHARA: Result := 'eh';
    rYEMEN: Result := 'ye';
    rZAMBIA: Result := 'zm';
    rZIMBABWE: Result := 'zw';
    else Result := '';
  end;
end;

class function TCustomTransform.RegionToStr2(Region: TRegion): string;
begin
  Result := GetEnumName(TypeInfo(TRegion), Ord(Region));
end;

class function TCustomTransform.ScaleControlStyleToStr(
  ScaleControlStyle: TScaleControlStyle): string;
begin
  Result := GetEnumName(TypeInfo(TScaleControlStyle), Ord(ScaleControlStyle));
end;

class function TCustomTransform.StrToDirectionsStatus(
  DirectionsStatus: string): TDirectionsStatus;
begin
  Result := TDirectionsStatus(GetEnumValue(TypeInfo(TDirectionsStatus), DirectionsStatus));
end;

class function TCustomTransform.StrToElevationStatus(
  ElevationStatus: string): TElevationStatus;
begin
  Result := TElevationStatus(GetEnumValue(TypeInfo(TElevationStatus), ElevationStatus));
end;

class function TCustomTransform.StrToElevationType(
  ElevationType: string): TElevationType;
begin
  Result := TElevationType(GetEnumValue(TypeInfo(TElevationType), ElevationType));
end;

class function TCustomTransform.StrToGeocoderLocationType(
  GeocoderLocationType: string): TGeocoderLocationType;
begin
  Result := TGeocoderLocationType(GetEnumValue(TypeInfo(TGeocoderLocationType), GeocoderLocationType));
end;

class function TCustomTransform.StrToGeocoderStatus(
  GeocoderStatus: string): TGeocoderStatus;
begin
  Result := TGeocoderStatus(GetEnumValue(TypeInfo(TGeocoderStatus), GeocoderStatus));
end;

class function TCustomTransform.StrToGradient(Gradient: string): TGradient;
begin
  Result := TGradient(GetEnumValue(TypeInfo(TGradient), Gradient));
end;

class function TCustomTransform.StrToLabelColor(LabelColor: string): TLabelColor;
begin
  Result := TLabelColor(GetEnumValue(TypeInfo(TLabelColor), LabelColor));
end;

class function TCustomTransform.StrToLangCode2(LangCode: string): TLangCode;
begin
  Result := TLangCode(GetEnumValue(TypeInfo(TLangCode), LangCode));
end;

class function TCustomTransform.StrToMapTypeControlStyle(
  MapTypeControlStyle: string): TMapTypeControlStyle;
begin
  Result := TMapTypeControlStyle(GetEnumValue(TypeInfo(TMapTypeControlStyle), MapTypeControlStyle));
end;

class function TCustomTransform.StrToMapTypeId(MapTypeId: string): TMapTypeId;
begin
  Result := TMapTypeId(GetEnumValue(TypeInfo(TMapTypeId), MapTypeId));
end;

class function TCustomTransform.StrToMarkerType(MarkerType: string): TMarkerType;
begin
  Result := TMarkerType(GetEnumValue(TypeInfo(TMarkerType), MarkerType));
end;

class function TCustomTransform.StrToMeasure(Measure: string): TMeasure;
begin
  Result := TMeasure(GetEnumValue(TypeInfo(TMeasure), Measure));
end;

class function TCustomTransform.StrToPosition(Position: string): TControlPosition;
begin
  Result := TControlPosition(GetEnumValue(TypeInfo(TControlPosition), Position));
end;

class function TCustomTransform.StrToRegion2(Region: string): TRegion;
begin
  Result := TRegion(GetEnumValue(TypeInfo(TRegion), Region));
end;

class function TCustomTransform.StrToScaleControlStyle(
  ScaleControlStyle: string): TScaleControlStyle;
begin
  Result := TScaleControlStyle(GetEnumValue(TypeInfo(TScaleControlStyle), ScaleControlStyle));
end;

class function TCustomTransform.StrToStyledIcon(StyledIcon: string): TStyledIcon;
begin
  Result := TStyledIcon(GetEnumValue(TypeInfo(TStyledIcon), StyledIcon));
end;

class function TCustomTransform.StrToSymbolPath(SymbolPath: string): TSymbolPath;
begin
  Result := TSymbolPath(GetEnumValue(TypeInfo(TSymbolPath), SymbolPath));
end;

class function TCustomTransform.StrToTemperatureUnit(
  TemperatureUnit: string): TTemperatureUnit;
begin
  Result := TTemperatureUnit(GetEnumValue(TypeInfo(TTemperatureUnit), TemperatureUnit));
end;

class function TCustomTransform.StrToTravelMode(TravelMode: string): TTravelMode;
begin
  Result := TTravelMode(GetEnumValue(TypeInfo(TTravelMode), TravelMode));
end;

class function TCustomTransform.StrToUnitSystem(UnitSystem: string): TUnitSystem;
begin
  Result := TUnitSystem(GetEnumValue(TypeInfo(TUnitSystem), UnitSystem));
end;

class function TCustomTransform.StrToVehicleType(VehicleType: string): TVehicleType;
begin
  Result := TVehicleType(GetEnumValue(TypeInfo(TVehicleType), VehicleType));
end;

class function TCustomTransform.StrToWindSpeedUnit(
  WindSpeedUnit: string): TWindSpeedUnit;
begin
  Result := TWindSpeedUnit(GetEnumValue(TypeInfo(TWindSpeedUnit), WindSpeedUnit));
end;

class function TCustomTransform.StrToZoomControlStyle(
  ZoomControlStyle: string): TZoomControlStyle;
begin
  Result := TZoomControlStyle(GetEnumValue(TypeInfo(TZoomControlStyle), ZoomControlStyle));
end;

class function TCustomTransform.StyledIconToStr(StyledIcon: TStyledIcon): string;
begin
  Result := GetEnumName(TypeInfo(TStyledIcon), Ord(StyledIcon));
end;

class function TCustomTransform.SymbolPathToStr(SymbolPath: TSymbolPath): string;
begin
  Result := GetEnumName(TypeInfo(TSymbolPath), Ord(SymbolPath));
end;

class function TCustomTransform.TemperatureUnitToStr(
  TemperatureUnit: TTemperatureUnit): string;
begin
  Result := GetEnumName(TypeInfo(TTemperatureUnit), Ord(TemperatureUnit));
end;

class function TCustomTransform.TravelModeToStr(TravelMode: TTravelMode): string;
begin
  Result := GetEnumName(TypeInfo(TTravelMode), Ord(TravelMode));
end;

class function TCustomTransform.UnitSystemToStr(UnitSystem: TUnitSystem): string;
begin
  Result := GetEnumName(TypeInfo(TUnitSystem), Ord(UnitSystem));
end;

class function TCustomTransform.VehicleTypeToStr(VehicleType: TVehicleType): string;
begin
  Result := GetEnumName(TypeInfo(TVehicleType), Ord(VehicleType));
end;

class function TCustomTransform.WindSpeedUnitToStr(
  WindSpeedUnit: TWindSpeedUnit): string;
begin
  Result := GetEnumName(TypeInfo(TWindSpeedUnit), Ord(WindSpeedUnit));
end;

class function TCustomTransform.ZoomControlStyleToStr(
  ZoomControlStyle: TZoomControlStyle): string;
begin
  Result := GetEnumName(TypeInfo(TZoomControlStyle), Ord(ZoomControlStyle));
end;

{ TGeometry }

class function TGeometry.CheckPointsStr(PointsStr: string): Boolean;
var
  L,P: TStringList;
  i: Integer;
  R: Double;
  Tmp: string;
begin
  Result := False;
  if PointsStr = '' then Exit;

  L := TStringList.Create;
  P := TStringList.Create;
  try
    L.Delimiter := ';';
    P.Delimiter := '|';
    {$IFDEF DELPHI2005}
    L.StrictDelimiter := True;
    P.StrictDelimiter := True;
    {$ENDIF}
    L.DelimitedText := PointsStr;
    Result := True;
    for i := 0 to L.Count - 1 do
    begin
      P.DelimitedText := L[i];
      if P.Count <> 2 then Result := False;

      Tmp := P[0];
      if {$IFDEF DELPHIXE}FormatSettings.DecimalSeparator{$ELSE}DecimalSeparator{$ENDIF} = ',' then
        Tmp := StringReplace(Tmp, '.', ',', [rfReplaceAll]);
      if not TryStrToFloat(Tmp, R) then Result := False;

      Tmp := P[1];
      if {$IFDEF DELPHIXE}FormatSettings.DecimalSeparator{$ELSE}DecimalSeparator{$ENDIF} = ',' then
        Tmp := StringReplace(Tmp, '.', ',', [rfReplaceAll]);
      if not TryStrToFloat(Tmp, R) then Result := False;
    end;
  finally
    FreeAndNil(L);
    FreeAndNil(P);
  end;
end;

class function TGeometry.ComputeArea(Map: TCustomGMMap; PointsStr: string;
  Radius: Real): Real;
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  Result := 0;
  if not TGeometry.CheckPointsStr(PointsStr) then Exit;

  Params := Format(StrParams, [
                QuotedStr(PointsStr),
                StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll])
                ]);
  THackMap(Map).ExecuteScript('ComputeArea', Params);
  Result := THackMap(Map).FWC.GetFloatField(GeometryForm, GeometryFormComputeArea);
end;

class function TGeometry.ComputeDistanceBetween(Map: TCustomGMMap; Origin,
  Dest: TLatLng; Radius: Real): Real;
const
  StrParams = '%s,%s,%s,%s,%s';
var
  Params: string;
begin
  Params := Format(StrParams, [
                Origin.LatToStr(Map.Precision),
                Origin.LngToStr(Map.Precision),
                Dest.LatToStr(Map.Precision),
                Dest.LngToStr(Map.Precision),
                StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll])
              ]);
  THackMap(Map).ExecuteScript('ComputeDistanceBetween', Params);
  Result := THackMap(Map).FWC.GetFloatField(GeometryForm, GeometryFormComputeDist);
end;

class function TGeometry.ComputeHeading(Map: TCustomGMMap; Origin,
  Dest: TLatLng): Real;
const
  StrParams = '%s,%s,%s,%s';
var
  Params: string;
begin
  Params := Format(StrParams, [
                Origin.LatToStr(Map.Precision),
                Origin.LngToStr(Map.Precision),
                Dest.LatToStr(Map.Precision),
                Dest.LngToStr(Map.Precision)
              ]);
  THackMap(Map).ExecuteScript('ComputeHeading', Params);
  Result := THackMap(Map).FWC.GetFloatField(GeometryForm, GeometryFormComputeHea);
end;

class function TGeometry.ComputeLength(Map: TCustomGMMap; PointsStr: string;
  Radius: Real): Real;
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  Result := 0;
  if not TGeometry.CheckPointsStr(PointsStr) then Exit;

  Params := Format(StrParams, [
                QuotedStr(PointsStr),
                StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll])
                ]);
  THackMap(Map).ExecuteScript('ComputeLength', Params);
  Result := THackMap(Map).FWC.GetFloatField(GeometryForm, GeometryFormComputeLength);
end;

class procedure TGeometry.ComputeOffset(Map: TCustomGMMap; Origin: TLatLng;
  Distance, Heading: Real; Result: TLatLng; Radius: Real);
const
  StrParams = '%s,%s,%s,%s,%s';
var
  Params: string;
begin
  if not Assigned(Result) then Exit;

  Params := Format(StrParams, [
                Origin.LatToStr(Map.Precision),
                Origin.LngToStr(Map.Precision),
                StringReplace(FloatToStr(Distance), ',', '.', [rfReplaceAll]),
                StringReplace(FloatToStr(Heading), ',', '.', [rfReplaceAll]),
                StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll])
              ]);
  THackMap(Map).ExecuteScript('ComputeOffset', Params);
  Result.Lat := Result.StringToReal(THackMap(Map).FWC.GetStringField(GeometryForm, GeometryFormComputeOffLat));
  Result.Lng := Result.StringToReal(THackMap(Map).FWC.GetStringField(GeometryForm, GeometryFormComputeOffLng));
end;

class procedure TGeometry.ComputeOffsetOrigin(Map: TCustomGMMap; Dest: TLatLng;
  Distance, Heading: Real; Result: TLatLng; Radius: Real);
const
  StrParams = '%s,%s,%s,%s,%s';
var
  Params: string;
begin
  if not Assigned(Result) then Exit;

  Params := Format(StrParams, [
                Dest.LatToStr(Map.Precision),
                Dest.LngToStr(Map.Precision),
                StringReplace(FloatToStr(Distance), ',', '.', [rfReplaceAll]),
                StringReplace(FloatToStr(Heading), ',', '.', [rfReplaceAll]),
                StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll])
              ]);
  THackMap(Map).ExecuteScript('ComputeOffsetOrigin', Params);
  Result.Lat := Result.StringToReal(THackMap(Map).FWC.GetStringField(GeometryForm, GeometryFormComputeOffLat));
  Result.Lng := Result.StringToReal(THackMap(Map).FWC.GetStringField(GeometryForm, GeometryFormComputeOffLng));
end;

class function TGeometry.ComputeSignedArea(Map: TCustomGMMap; PointsStr: string;
  Radius: Real): Real;
const
  StrParams = '%s,%s';
var
  Params: string;
begin
  Result := 0;
  if not TGeometry.CheckPointsStr(PointsStr) then Exit;

  Params := Format(StrParams, [
                QuotedStr(PointsStr),
                StringReplace(FloatToStr(Radius), ',', '.', [rfReplaceAll])
                ]);
  THackMap(Map).ExecuteScript('ComputeSignedArea', Params);
  Result := THackMap(Map).FWC.GetFloatField(GeometryForm, GeometryFormComputeSigA);
end;

class function TGeometry.DecodePath(Map: TCustomGMMap; EncodedPath: string): string;
begin
  THackMap(Map).ExecuteScript('DecodePath', QuotedStr(EncodedPath));
  Result := THackMap(Map).FWC.GetStringField(GeometryForm, GeometryFormDecodedPath);
end;

class function TGeometry.EncodePath(Map: TCustomGMMap; PointsStr: string): string;
begin
  if TGeometry.CheckPointsStr(PointsStr) then
  begin
    THackMap(Map).ExecuteScript('EncodePath', QuotedStr(PointsStr));
    Result := THackMap(Map).FWC.GetStringField(GeometryForm, GeometryFormEncodedPath);
  end
  else Result := '';
end;

class procedure TGeometry.Interpolate(Map: TCustomGMMap; Origin, Dest: TLatLng;
  Fraction: Real; Result: TLatLng);
begin

end;

class function TGeometry.IsLocationOnEdge(GMPoly: TGMBasePolyline;
  Idx: Integer; LatLng: TLatLng; Tolerance: Integer): Boolean;
const
  StrParams = '%s,%s,%s,%s,%s';
var
  Params: string;
begin
  Params := Format(StrParams, [
                  IntToStr(THackGMLinkedComponent(GMPoly).IdxList),
                  IntToStr(Idx),
                  LatLng.LatToStr(THackGMLinkedComponent(GMPoly).GetMapPrecision),
                  LatLng.LngToStr(THackGMLinkedComponent(GMPoly).GetMapPrecision),
                  IntToStr(Tolerance)
                  ]);
  THackGMLinkedComponent(GMPoly).ExecuteScript('IsLocationOnEdge', Params);
  Result := THackGMLinkedComponent(GMPoly).GetBoolField(GeometryForm, GeometryFormIsLocationOnEdge);
end;

{ TGMGenFunc }

class function TGMGenFunc.PointsToStr(Points: array of TLatLng;
  Precision: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(Points) do
    if Result <> '' then
      Result := Result + ';' + Points[i].LatToStr(Precision) + '|' + Points[i].LngToStr(Precision)
    else
      Result := Points[i].LatToStr(Precision) + '|' + Points[i].LngToStr(Precision);
end;

class procedure TGMGenFunc.ProcessMessages;
var
  Msg: TMsg;
begin
  Sleep(1);
  while PeekMessage(msg, 0, 0, 0, PM_REMOVE) do
    DispatchMessage(msg);
end;

end.
