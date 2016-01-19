{
GMDirection unit

  ES: Contiene las classes base necesarias para la manipulación de rutas y
      mostrarlas en un mapa de Google Maps.
  EN: Includes the necessary base classes to manage routes and show it into a
      Google Maps map.

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, unirlo a un TGMMap, establecer las
    propiedades de búsqueda y reproducción y hacer una llamada al método Execute
  EN: put the component on the form, link it to a TGMMap, set the request and
    render properties and call the Execute method
=========================================================================
History:

ver 1.3.2
  ES:
    error: corregido método GetWaypointOrder (GC: issue 39)
  EN:
    bug: fixed method GetWaypointOrder (GC: issue 39)

ver 1.0.1
  ES:
    error: JavaScript -> corregido error en función DirectionsToXMLData cuando la
      dirección no devolvía resultados.
  EN:
    bug: JavaScript -> bug fixed on DirectionsToXMLData function when direction not
      retrun results.

ver 1.0.0
  ES:
    error: Error corregido en algunos tipos de datos (TTimeClass.Value,
      TDirectionsLeg.DepartureTime, TDirectionsLeg.ArrivalTime).
    error: Error corregido cuando se usaba la opción de DirectionsRequest.TravelMode=tmTRANSIT
    cambio: se elimina la propiedad TCustomDirectionsResult.DirectionsRender para
      que sea definida en los hijos como TDirectionsRender.
    cambio: se elimina la propiedad TCustomDirectionsRenderer.PolylineOptions para
      que sea definida en los hijos como TPolylineOptions.
    cambio: se elimina la propiedad TCustomGMDirection.DirectionsRender para
      que sea definida en los hijos como TDirectionsRenderer.
    error: se corrige error en TDirectionsStep.Assign.
    error: se corrige error en TCustomDirectionsResult.Assign.
    error: error corregido en TCustomDirections.Execute en la 1era búsqeda.
  EN:
    bug: bug fixed in some data types (TTimeClass.Value,
      TDirectionsLeg.DepartureTime, TDirectionsLeg.ArrivalTime).
    bug: bug fixed when using the option DirectionsRequest.TravelMode=tmTRANSIT
    change: TCustomDirectionsResult.DirectionsRender property is removed to be defined
      in descendents as TDirectionsRender.
    change: TCustomDirectionsRenderer.PolylineOptions property is removed to be defined
      in descendents as TPolylineOptions.
    change: TCustomGMDirection.DirectionsRender property is removed to be defined
      in descendents as TDirectionsRenderer.
    bug: bug fixed into TDirectionsStep.Assign.
    bug: bug fixed into TCustomDirectionsResult.Assign.
    bug: bug fixed into TCustomDirections.Execute on the first request.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey

ver 0.1.8
  ES:
    error: TCustomGMDirection -> no se disparaba el evento OnDirectionsChanged
  EN:
    bug: TCustomGMDirection -> the OnDirectionsChanged event was not triggered

ver 0.1.6
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
  Includes the necessary base classes to manage routes and show it into a Google Maps map.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Contiene las classes bases necesarias para la manipulación de rutas y mostrarlas en un mapa de Google Maps.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMDirection;

{$I ..\gmlib.inc}

interface

uses
  {$IFNDEF DELPHI2009}{$IFNDEF VER260}Controls,{$ENDIF}{$ENDIF}
  {$IFDEF DELPHIXE2}
  System.Classes, System.Contnrs,
  {$ELSE}
  Classes, Contnrs,
  {$ENDIF}
  GMClasses, GMConstants, GMMap;

type
  TDirectionsRequest = class;
  TCustomGMDirection = class;

  {*------------------------------------------------------------------------------
    A representation of distance as a numeric value and a display string.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Distance
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Representación de distancias como un valor numérico y su representación en cadena.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Distance
  -------------------------------------------------------------------------------}
  TDistance = class
  private
    {*------------------------------------------------------------------------------
      The distance in meters.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Distancia en metros.
    -------------------------------------------------------------------------------}
    FValue: Integer;
    {*------------------------------------------------------------------------------
      A string representation of the distance value, using the UnitSystem specified in the request.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Representación del valor de la distancia, usando la UnitSystem especificada en la solicitud.
    -------------------------------------------------------------------------------}
    FText: string;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Text: string read FText;
    property Value: Integer read FValue;
  end;

  {*------------------------------------------------------------------------------
    A representation of duration as a numeric value and a display string.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Duration
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Representación de la duración como un valor numérico y su representación en cadena.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Duration
  -------------------------------------------------------------------------------}
  TDuration = class
  private
    {*------------------------------------------------------------------------------
      The duration in seconds.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Duración en segundos.
    -------------------------------------------------------------------------------}
    FValue: Integer;
    {*------------------------------------------------------------------------------
      A string representation of the duration value.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cadena que representa el valor de la duración.
    -------------------------------------------------------------------------------}
    FText: string;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Text: string read FText;
    property Value: Integer read FValue;
  end;

  {*------------------------------------------------------------------------------
    The transit agency that operates a specific transit line.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitAgency
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Agencia de transporte que opera una línea de transporte específica.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitAgency
  -------------------------------------------------------------------------------}
  TTransitAgency = class
  private
    {*------------------------------------------------------------------------------
      The name of this transit agency.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nombre de la agencia de transporte.
    -------------------------------------------------------------------------------}
    FName: string;
    {*------------------------------------------------------------------------------
      The transit agency's phone number.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de teléfono de la agencia de transporte.
    -------------------------------------------------------------------------------}
    FPhone: string;
    {*------------------------------------------------------------------------------
      The transit agency's URL.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      URL de la agencia de transporte.
    -------------------------------------------------------------------------------}
    FUrl: string;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Name: string read FName;
    property Phone: string read FPhone;
    property Url: string read FUrl;
  end;

  {*------------------------------------------------------------------------------
    A point of a specified transit step.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitStop
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Un punto de un paso de tránsito específico.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitStop
  -------------------------------------------------------------------------------}
  TTransitStop = class
  private
    {*------------------------------------------------------------------------------
      The name of this transit stop.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nombre de esta parada de tránsito.
    -------------------------------------------------------------------------------}
    FName: string;
    {*------------------------------------------------------------------------------
      The location of this stop.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Ubicación de esta parada.
    -------------------------------------------------------------------------------}
    FLocation: TLatLng;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Location: TLatLng read FLocation;
    property Name: string read FName;
  end;

  {*------------------------------------------------------------------------------
    A time of a departure/arribal.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Time
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Hora de un salida/llegada.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Time
  -------------------------------------------------------------------------------}
  TTimeClass = class
  private
    {*------------------------------------------------------------------------------
      The time of this departure or arrival.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Hora de esta salida o llegada.
    -------------------------------------------------------------------------------}
    FValue: TDateTime;
    {*------------------------------------------------------------------------------
      The time zone in which this stop lies. The value is the name of the time zone as defined in the IANA Time Zone Database.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Zona horaria en la que se encuentra esta parada. El valor es el nombre de la zona horaria definida en la base de datos IANA Time Zone.
    -------------------------------------------------------------------------------}
    FTimeZone: string;
    {*------------------------------------------------------------------------------
      A string representing the time's value. The time is displayed in the time zone of the transit stop.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cadena que representa el valor de la hora. La hora se muestra en la zona horaria de la parada.
    -------------------------------------------------------------------------------}
    FText: string;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Text: string read FText;
    property TimeZone: string read FTimeZone;
    property Value: TDateTime read FValue;
  end;

  {*------------------------------------------------------------------------------
    Type of vehicle used, e.g. train or bus.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitVehicle
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Tipo de vehículo usado, ej tren o autobús.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitVehicle
  -------------------------------------------------------------------------------}
  TTransitVehicle = class
  private
    {*------------------------------------------------------------------------------
      A name for this type of TransitVehicle, e.g. "Train" or "Bus".
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nombre para este tipo de TransitVehicle, ej. "Train" o "Bus".
    -------------------------------------------------------------------------------}
    FName: string;
    {*------------------------------------------------------------------------------
      A URL for an icon that corresponds to the type of vehicle used in this region instead of the more general icon.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      URL para un icono que corresponde al tipo de vehículo usado en esta región en lugar del icono más general.
    -------------------------------------------------------------------------------}
    FLocalIcon: string;
    {*------------------------------------------------------------------------------
      A URL for an icon that corresponds to the type of vehicle used on this line.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      URL para el icono que corresponde al tipo de vbehículo usado en esta línea.
    -------------------------------------------------------------------------------}
    FIcon: string;
    {*------------------------------------------------------------------------------
      The type of vehicle used, e.g. train, bus, or ferry.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El tipo de vehículo usado, ej. train, bus, o ferry.
    -------------------------------------------------------------------------------}
    FVehicleType: TVehicleType;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Icon: string read FIcon;
    property LocalIcon: string read FLocalIcon;
    property Name: string read FName;
    property VehicleType: TVehicleType read FVehicleType;
  end;

  {*------------------------------------------------------------------------------
    Details about the TransitLine used in a specified step.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitLine
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Detalles de un Transporte público usado en un paso específico.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitLine
  -------------------------------------------------------------------------------}
  TTransitLine = class
  private
    FAgencie: TObjectList;
    {*------------------------------------------------------------------------------
      The full name of this transit line, e.g. "8 Avenue Local".
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nombre completo de esta línea de transporte público, ej. "8 Avenue Local".
    -------------------------------------------------------------------------------}
    FName: string;
    {*------------------------------------------------------------------------------
      The text color commonly used in signage for this transit line, represented as a hex string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El color del texto de uso común en la señalización de esta línea de transporte público, representado como una cadena hexadecimal.
    -------------------------------------------------------------------------------}
    FTextColor: string;
    {*------------------------------------------------------------------------------
      The type of vehicle used, e.g. train or bus.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El tipo de vehículo usado, ej. train o bus.
    -------------------------------------------------------------------------------}
    FVehicle: TTransitVehicle;
    {*------------------------------------------------------------------------------
      The color commonly used in signage for this transit line, represented as a hex string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El color de uso común en la señalización de esta línea de transporte público, representado como una cadena hexadecimal.
    -------------------------------------------------------------------------------}
    FColor: string;
    {*------------------------------------------------------------------------------
      The URL for an icon associated with this line.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La dirección URL de un icono asociado a esta línea.
    -------------------------------------------------------------------------------}
    FIcon: string;
    {*------------------------------------------------------------------------------
      The short name of this transit line, e.g. "E".
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Nombre corto de la línea de transporte público, ej. "E".
    -------------------------------------------------------------------------------}
    FShortName: string;
    {*------------------------------------------------------------------------------
      The agency's URL which is specific to this transit line.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      URL de la agencia que es específico de esta línea de transporte público.
    -------------------------------------------------------------------------------}
    FUrl: string;
    function GetAgencie(Index: Integer): TTransitAgency;
    function GetCountAgencie: Integer;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    {*------------------------------------------------------------------------------
      The transit agency that operates this transit line.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Agencias que operan en esta línea de transporte público.
    -------------------------------------------------------------------------------}
    property Agencie[Index: Integer]: TTransitAgency read GetAgencie;
    {*------------------------------------------------------------------------------
      Count of number of agencies.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Contador del número de agencias.
    -------------------------------------------------------------------------------}
    property CountAgencie: Integer read GetCountAgencie;
    property Color: string read FColor;
    property Icon: string read FIcon;
    property Name: string read FName;
    property ShortName: string read FShortName;
    property TextColor: string read FTextColor;
    property Url: string read FUrl;
    property Vehicle: TTransitVehicle read FVehicle;
  end;

  {*------------------------------------------------------------------------------
    Details for a specific step.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitDetails
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Detalles de un paso específico.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitDetails
  -------------------------------------------------------------------------------}
  TTransitDetails = class
  private
    {*------------------------------------------------------------------------------
      The arrival stop of this transit step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La parada de la llegada de este paso de tránsito.
    -------------------------------------------------------------------------------}
    FArribalStop: TTransitStop;
    {*------------------------------------------------------------------------------
      The arrival time of this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La hora de llegada de este paso.
    -------------------------------------------------------------------------------}
    FArribalTime: TTimeClass;
    {*------------------------------------------------------------------------------
      The departure stop of this transit step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La parada de salida de este paso de tránsito.
    -------------------------------------------------------------------------------}
    FDepartureStop: TTransitStop;
    {*------------------------------------------------------------------------------
      The departure time of this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La hora de salida de este paso.
    -------------------------------------------------------------------------------}
    FDepartureTime: TTimeClass;
    {*------------------------------------------------------------------------------
      The direction in which to travel on this line, as it is marked on the vehicle or at the departure stop.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La dirección en la que viajar en esta línea, tal como está indicado en el vehículo o en la parada de la salida.
    -------------------------------------------------------------------------------}
    FHeadsign: string;
    {*------------------------------------------------------------------------------
      The number of stops on this step. Includes the arrival stop, but not the departure stop.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Numero de paradas de este paso. Incluye la parada de llegada, pero no la parada de salida.
    -------------------------------------------------------------------------------}
    FNumStops: Integer;
    {*------------------------------------------------------------------------------
      Details about the transit line used in this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Detalles sobre el transporte público usado en este paso.
    -------------------------------------------------------------------------------}
    FLine: TTransitLine;
    {*------------------------------------------------------------------------------
      The expected number of seconds between equivalent vehicles at this stop.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número previsto de segundos entre vehículos equivalentes en esta parada.
    -------------------------------------------------------------------------------}
    FHeadway: Integer;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property ArribalStop: TTransitStop read FArribalStop;
    property ArribalTime: TTimeClass read FArribalTime;
    property DepartureStop: TTransitStop read FDepartureStop;
    property DepartureTime: TTimeClass read FDepartureTime;
    property Headsign: string read FHeadsign;
    property Headway: Integer read FHeadway;
    property Line: TTransitLine read FLine;
    property NumStops: Integer read FNumStops;
  end;

  {*------------------------------------------------------------------------------
    A single DirectionsStep in a DirectionsResult. Some fields may be undefined.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsStep
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Un DirectionsStep en un DirectionsResult. Algunos de los campos pueden no estar informados.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsStep
  -------------------------------------------------------------------------------}
  TDirectionsStep = class
  private
    FPath: TObjectList;
    {*------------------------------------------------------------------------------
      The distance covered by this step. This property may be undefined as the distance may be unknown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Distancia cubierta por este paso. Esta propiedad puede no estar definida dado que la distancia puede no conocerse.
    -------------------------------------------------------------------------------}
    FDistance: TDistance;
    {*------------------------------------------------------------------------------
      The mode of travel used in this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Modo de transporte usado en este paso.
    -------------------------------------------------------------------------------}
    FTravelMode: TTravelMode;
    {*------------------------------------------------------------------------------
      The typical time required to perform this step in seconds and in text form. This property may be undefined as the duration may be unknown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tiempo normal usado para realizar este paso en segundos y en formato texto. Esta propiedad puede no estar definida dado que la duración puede no conocerse.
    -------------------------------------------------------------------------------}
    FDuration: TDuration;
    {*------------------------------------------------------------------------------
      The starting location of this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Localización de salida de este paso.
    -------------------------------------------------------------------------------}
    FStartLocation: TLatLng;
    {*------------------------------------------------------------------------------
      Instructions for this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Instrucciones de este paso.
    -------------------------------------------------------------------------------}
    FInstructions: string;
    {*------------------------------------------------------------------------------
      Transit-specific details about this step. This property will be undefined unless the travel mode of this step is TRANSIT.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Detalles específicos del tránsito acerca de este paso. Esta propiedad no estará definida a menos que el medio de transporte de este paso sea TRANSIT.
    -------------------------------------------------------------------------------}
    FTransit: TTransitDetails;
    {*------------------------------------------------------------------------------
      The ending location of this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Localización de llegada de este paso.
    -------------------------------------------------------------------------------}
    FEndLocation: TLatLng;
    {*------------------------------------------------------------------------------
      Sub-steps of this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Pasos secundarios de este paso.
    -------------------------------------------------------------------------------}
    FSteps: TDirectionsStep;
    function GetPath(Index: integer): TLatLng;
    function GetCountPath: Integer;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Distance: TDistance read FDistance;
    property Duration: TDuration read FDuration;
    property EndLocation: TLatLng read FEndLocation;
    property Instructions: string read FInstructions;
    {*------------------------------------------------------------------------------
      A sequence of LatLngs describing the course of this step.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Secuencia de LatLngs que describen el curso de este paso.
    -------------------------------------------------------------------------------}
    property Path[Index: integer]: TLatLng read GetPath;
    {*------------------------------------------------------------------------------
      Number of Paths.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Numero de Paths.
    -------------------------------------------------------------------------------}
    property CountPath: Integer read GetCountPath;
    property StartLocation: TLatLng read FStartLocation;
    property Steps: TDirectionsStep read FSteps;
    property Transit: TTransitDetails read FTransit;
    property TravelMode: TTravelMode read FTravelMode;
  end;

  {*------------------------------------------------------------------------------
    A single leg consisting of a set of steps in a DirectionsResult. Some fields in the leg may not be returned for all requests.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsLeg
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Una única etapa que consiste en un conjunto de pasos en un DirectionsResult. Algunos campos de la etapa puede no ser devueltos para todas las peticiones.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsLeg
  -------------------------------------------------------------------------------}
  TDirectionsLeg = class
  private
    {*------------------------------------------------------------------------------
      An estimated departure date/time for this leg. Only applicable for TRANSIT requests.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día/Hora estima de salida para esta etapa. Sólo aplicable para peticiones TRANSIT.
    -------------------------------------------------------------------------------}
    FDepartureTime: TTimeClass;
    {*------------------------------------------------------------------------------
      An estimated arrival time for this leg. Only applicable for TRANSIT requests.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Hora de llegada estimada para esta etapa. Sólo aplicable para peticiones TRANSIT.
    -------------------------------------------------------------------------------}
    FArrivalTime: TTimeClass;
    {*------------------------------------------------------------------------------
      The total distance covered by this leg. This property may be undefined as the distance may be unknown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Distancia total cubierta por esta etapa. Esta propiedad puede no estar definida si la distancia no es conocida.
    -------------------------------------------------------------------------------}
    FDistance: TDistance;
    {*------------------------------------------------------------------------------
      The total duration of this leg. This property may be undefined as the duration may be unknown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Duración total para esta etapa. Esta propiedad puede no estar definida si la duración no es conocida.
    -------------------------------------------------------------------------------}
    FDuration: TDuration;
    {*------------------------------------------------------------------------------
      The address of the destination of this leg.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Dirección del destino de esta etapa.
    -------------------------------------------------------------------------------}
    FEndAddress: string;
    {*------------------------------------------------------------------------------
      The address of the origin of this leg.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Dirección del origen de esta etapa.
    -------------------------------------------------------------------------------}
    FStartAddress: string;
    {*------------------------------------------------------------------------------
      Indicates the actual geocoded destination.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica el destino actual geocodificado.
    -------------------------------------------------------------------------------}
    FEndLocation: TLatLng;
    {*------------------------------------------------------------------------------
      Indicates the actual geocoded origin.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica el origen actual geocodificado.
    -------------------------------------------------------------------------------}
    FStartLocation: TLatLng;
    FViaWaypoints: TObjectList;
    FStep: TObjectList;
    function GetViaWaypoints(Index: Integer): TLatLng;
    function GetStep(Index: Integer): TDirectionsStep;
    function GetCountStep: Integer;
    function GetCountViaWaypoints: Integer;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property ArrivalTime: TTimeClass read FArrivalTime;
    property DepartureTime: TTimeClass read FDepartureTime;
    property Distance: TDistance read FDistance;
    property Duration: TDuration read FDuration;
    property EndAddress: string read FEndAddress;
    property StartAddress: string read FStartAddress;
    property EndLocation: TLatLng read FEndLocation;
    property StartLocation: TLatLng read FStartLocation;
    {*------------------------------------------------------------------------------
      An array of waypoints along this leg that were not specified in the original request, either as a result of a user dragging the polyline or selecting an alternate route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de puntos de paso a lo largo de esta etapa que no fueron especificado en la petición inicial, resultado del desplazamiento por parte del usuario de la polilinea o por la selección de una ruta alternativa.
    -------------------------------------------------------------------------------}
    property ViaWaypoints[Index: Integer]: TLatLng read GetViaWaypoints;
    {*------------------------------------------------------------------------------
      An array of DirectionsSteps, each of which contains information about the individual steps in this leg.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de DirectionsSteps, cada uno de los cuales contiene información acerca de los pasos individuales de esta etapa.
    -------------------------------------------------------------------------------}
    property Step[Index: Integer]: TDirectionsStep read GetStep;
    {*------------------------------------------------------------------------------
      Count of ViaWaypoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de ViaWaypoints.
    -------------------------------------------------------------------------------}
    property CountViaWaypoints: Integer read GetCountViaWaypoints;
    {*------------------------------------------------------------------------------
      Count of Steps.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de Steps.
    -------------------------------------------------------------------------------}
    property CountStep: Integer read GetCountStep;
  end;

  {*------------------------------------------------------------------------------
    A single route containing a set of legs in a DirectionsResult.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRoute
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Una única ruta que contiene un conjunto de etapas en un DirectionsResult.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRoute
  -------------------------------------------------------------------------------}
  TDirectionsRoute = class
  private
    {*------------------------------------------------------------------------------
      Route summary.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Resumen de la ruta.
    -------------------------------------------------------------------------------}
    FSumary: string;
    {*------------------------------------------------------------------------------
      The bounds for this route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Límites para la ruta.
    -------------------------------------------------------------------------------}
    FBounds: TLatLngBounds;
    {*------------------------------------------------------------------------------
      Copyrights text to be displayed for this route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Texto del Copyrights a mostrar para esta ruta.
    -------------------------------------------------------------------------------}
    FCopyrights: string;
    FWarning: TStringList;
    FWaypointOrder: TStringList;
    FOverviewPath: TObjectList;
    FLeg: TObjectList;
    function GetLeg(Index: Integer): TDirectionsLeg;
    function GetOverviewPath(Index: Integer): TLatLng;
    function GetWarning(Index: Integer): string;
    function GetWaypointOrder(Index: Integer): Integer;
    function GetCountLeg: Integer;
    function GetCountOverviewPath: Integer;
    function GetCountWarning: Integer;
    function GetCountWaypointOrder: Integer;
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    property Sumary: string read FSumary;
    property Bounds: TLatLngBounds read FBounds;
    property Copyrights: string read FCopyrights;
    {*------------------------------------------------------------------------------
      Warnings to be displayed when showing these directions.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Advertencias a mostrar cuando se muestre esta dirección.
    -------------------------------------------------------------------------------}
    property Warning[Index: Integer]: string read GetWarning;
    {*------------------------------------------------------------------------------
      If optimizeWaypoints was set to true, this field will contain the re-ordered permutation of the input waypoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si optimizeWaypoints está establecida a true, esta propiedad contiene la reordenación de los puntos de paso introducidos.
    -------------------------------------------------------------------------------}
    property WaypointOrder[Index: Integer]: Integer read GetWaypointOrder;
    {*------------------------------------------------------------------------------
      An array of LatLngs representing the entire course of this route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de los LatLng que representan el curso entero de la ruta.
    -------------------------------------------------------------------------------}
    property OverviewPath[Index: Integer]: TLatLng read GetOverviewPath;
    {*------------------------------------------------------------------------------
      An array of DirectionsLegs, each of which contains information about the steps of which it is composed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de DirectionsLegs, cada uno de los cuales contiene información acerca de los pasos de los que se compone.
    -------------------------------------------------------------------------------}
    property Leg[Index: Integer]: TDirectionsLeg read GetLeg;
    {*------------------------------------------------------------------------------
      Number of Warnings.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de Warnings.
    -------------------------------------------------------------------------------}
    property CountWarning: Integer read GetCountWarning;
    {*------------------------------------------------------------------------------
      Number of WaypointOrder.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de WaypointOrder.
    -------------------------------------------------------------------------------}
    property CountWaypointOrder: Integer read GetCountWaypointOrder;
    {*------------------------------------------------------------------------------
      Number of OverviewPath.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de OverviewPath.
    -------------------------------------------------------------------------------}
    property CountOverviewPath: Integer read GetCountOverviewPath;
    {*------------------------------------------------------------------------------
      Number of Legs.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de Legs.
    -------------------------------------------------------------------------------}
    property CountLeg: Integer read GetCountLeg;
  end;

  TCustomDirectionsRenderer = class;
  {*------------------------------------------------------------------------------
    The directions response retrieved from the directions server. Base class.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsResult
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Respuesta Directions devuelta por el servidor de direcciones. Clase base.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsResult
  -------------------------------------------------------------------------------}
  TCustomDirectionsResult = class
  private
    FOwner: TCustomGMDirection;
    FRoutes: TObjectList;
    {*------------------------------------------------------------------------------
      XML response.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      XML de la respuesta.
    -------------------------------------------------------------------------------}
    FXMLData: TStringList;
    {*------------------------------------------------------------------------------
      DirectionsResult Index identifier into the results array.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Índice identificador del DirectionsResult dentro del array de resultados.
    -------------------------------------------------------------------------------}
    FIndex: Integer;
    {*------------------------------------------------------------------------------
      State of the query.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estado de la consulta.
    -------------------------------------------------------------------------------}
    FStatus: TDirectionsStatus;
    {*------------------------------------------------------------------------------
      String that contains the request in format "From to To".
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cadena que contiene la búsqueda realizada en formato "Desde a Hasta".
    -------------------------------------------------------------------------------}
    FFromTo: string;
    function GetCount: Integer;
    function GetRoutes(Index: Integer): TDirectionsRoute;
    procedure OnXMLChange(Sender: TObject);
  protected
    {*------------------------------------------------------------------------------
      Return a formatted string that contains the DirectionsRender property values.
      @return Formatted string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena formateada con los valores de la propiedad DirectionsRender.
      @return Cadena formateada.
    -------------------------------------------------------------------------------}
    function DirectionsRenderToStr: string; virtual; abstract;

    {*------------------------------------------------------------------------------
      Method response to OnDirectionsRenderChange event of the DirectionsRender property.
      @param Sender Object that fired the event.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método de respuesta al evento OnDirectionsRenderChange de la propiedad DirectionsRender.
      @param Sender Objeto que ha generado el evento.
    -------------------------------------------------------------------------------}
    procedure OnDirectionsRenderChange(Sender: TObject);

    {*------------------------------------------------------------------------------
      Internal method to set FFromTo read only property.
      @param Value New value.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método interno para establecer la propiedad FFromTo de sólo lectura.
      @param Value Nuevo valor.
    -------------------------------------------------------------------------------}
    procedure SetFromTo(Value: string);

    {*------------------------------------------------------------------------------
      Create DirectionsRender object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea el objeto DirectionsRender.
    -------------------------------------------------------------------------------}
    procedure CreateDirectionsRenderObject; virtual; abstract;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
      @param aOwner Owner of the object.
      @param Index DirectionsResult Index identifier into the results array.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param aOwner Propietario del objeto.
      @param Index Índice identificador del DirectionsResult dentro del array de resultados.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TCustomGMDirection; Index: Integer); virtual;
    {*------------------------------------------------------------------------------
      Destructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase.
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TObject); virtual;

    {*------------------------------------------------------------------------------
      Shows a specific route.
      @param RouteIndex Route to show.
      @param HiddeOthers True, hides the other routes shown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra una determinada ruta.
      @param RouteIndex Ruta a mostrar.
      @param HiddeOthers A true, oculta las otras rutas mostradas.
    -------------------------------------------------------------------------------}
    procedure ShowRoute(RouteIndex: Integer = 0; HiddeOthers: Boolean = True);

    property Index: Integer read FIndex;
    property XMLData: TStringList read FXMLData;
    property Status: TDirectionsStatus read FStatus;
    property FromTo: string read FFromTo;
    {*------------------------------------------------------------------------------
      An array of DirectionsRoutes, each of which contains information about the legs and steps of which it is composed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de DirectionsRoutes, cada una de las cuales contiene información acerca de las etapas y los pasos de los que está compuesta.
    -------------------------------------------------------------------------------}
    property Routes[Index: Integer]: TDirectionsRoute read GetRoutes;
    {*------------------------------------------------------------------------------
      Number of Routes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de Routes.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
  end;

  {*------------------------------------------------------------------------------
    Internal class with information of a point in geographical coordinates and/or an address.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna con información de un punto de coordenadas geográficas y/o una dirección.
  -------------------------------------------------------------------------------}
  TLatLngStr = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Point in geographical coordinates.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Punto de coordenadas geográficas.
    -------------------------------------------------------------------------------}
    FLatLng: TLatLng;
    {*------------------------------------------------------------------------------
      String with the address of a place.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cadena con la dirección de un lugar.
    -------------------------------------------------------------------------------}
    FAddress: string;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
    -------------------------------------------------------------------------------}
    constructor Create; virtual;
    {*------------------------------------------------------------------------------
      Destructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase.
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
    {*------------------------------------------------------------------------------
      This method returns Address if it is informed, otherwise LatLng.
      @return String with Address or LatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este método devuelve Address si está informado o LatLng en caso contrario.
      @return Cadena con Adress o LatLng.
    -------------------------------------------------------------------------------}
    function ToString: string; {$IFDEF DELPHI2009}override;{$ELSE}virtual;{$ENDIF}
  published
    property LatLng: TLatLng read FLatLng write FLatLng;
    property Address: string read FAddress write FAddress;
  end;

  {*------------------------------------------------------------------------------
    The directions response retrieved from the directions server. Base class.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Respuesta Directions devuelta por el servidor de direcciones. Clase base.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#TransitOptions
  -------------------------------------------------------------------------------}
  TTransitOptions = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      The desired arrival time for the route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Hora de llegada deseada para la ruta.
    -------------------------------------------------------------------------------}
    FArrivalTime: TTime;
    {*------------------------------------------------------------------------------
      The desired departure time for the route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Hora de salida deseada para la ruta.
    -------------------------------------------------------------------------------}
    FDepartureTime: TTime;
    {*------------------------------------------------------------------------------
      The desired arrival date for the route
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día de llegada deseado para la ruta.
    -------------------------------------------------------------------------------}
    FArrivalDate: TDate;
    {*------------------------------------------------------------------------------
      The desired departure date for the route.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Día de salida deseado para la ruta.
    -------------------------------------------------------------------------------}
    FDepartureDate: TDate;
    procedure SetArrivalDate(const Value: TDate);
    procedure SetArrivalTime(const Value: TTime);
    procedure SetDepartureDate(const Value: TDate);
    procedure SetDepartureTime(const Value: TTime);
  public
    {*------------------------------------------------------------------------------
      Constructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
    -------------------------------------------------------------------------------}
    constructor Create; virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    property ArrivalTime: TTime read FArrivalTime write SetArrivalTime;
    property ArrivalDate: TDate read FArrivalDate write SetArrivalDate;
    property DepartureTime: TTime read FDepartureTime write SetDepartureTime;
    property DepartureDate: TDate read FDepartureDate write SetDepartureDate;
  end;

  {*------------------------------------------------------------------------------
    An intermediate waypoints for calculating a route.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Punto de paso intermedio para el cálculo de una ruta.
  -------------------------------------------------------------------------------}
  TWaypoint = class(TCollectionItem)
  private
    {*------------------------------------------------------------------------------
      If true, indicates that this waypoint is a stop between the origin and destination.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      A true indica que este punto de paso es una parada entre el origen y el destino.
    -------------------------------------------------------------------------------}
    FStopOver: Boolean;
    {*------------------------------------------------------------------------------
      Address or point in geographical coordinates of waypoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Dirección o punto de coordenadas grográficas del punto de paso.
    -------------------------------------------------------------------------------}
    FLocation: TLatLngStr;
    {*------------------------------------------------------------------------------
      Description for this waypoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Descripción para el punto de paso.
    -------------------------------------------------------------------------------}
    FTitle: string;
    procedure SetTitle(const Value: string);
  protected
    {*------------------------------------------------------------------------------
      Returns the name of the collection item as it appears in the collection editor. See Delphi documentation for more details.
      @return String with the name
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el nombre del item de la colección tal y como aparecerá en el editor de la colección. Ver la documentación de Delphi para más detalles.
      @return Cadena con el nombre
    -------------------------------------------------------------------------------}
    function GetDisplayName: string; override;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param Collection Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param Collection Propietario
    -------------------------------------------------------------------------------}
    constructor Create(Collection: TCollection); override;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    property Location: TLatLngStr read FLocation write FLocation;
    property StopOver: Boolean read FStopOver write FStopOver default False;
    property Title: string read FTitle write SetTitle;
  end;

  {*------------------------------------------------------------------------------
    Collection of waypoint for a route.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Colección de puntos de paso de una ruta.
  -------------------------------------------------------------------------------}
  TWaypointsList = class(TCollection)
  private
    FOwner: TPersistent;

    function GetItems(I: Integer): TWaypoint;
    procedure SetItems(I: Integer; const Value: TWaypoint);
  protected
    {*------------------------------------------------------------------------------
      Return the owner of the collection.
      @return Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el propietario de la colección.
      @return Propietario.
    -------------------------------------------------------------------------------}
    function GetOwner: TPersistent; override;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
      @param AOwner Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param AOwner Propietario.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TPersistent); virtual;

    {*------------------------------------------------------------------------------
      Creates a new TWaypoint instance and adds it to the Items array.
      @return New item.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TWaypoint y la añade en el array de Items.
      @return Nuevo elemento.
    -------------------------------------------------------------------------------}
    function Add: TWaypoint;
    {*------------------------------------------------------------------------------
      Creates a new TWaypoint instance and adds it to the Items array.
      @param Index Position to insert.
      @return New item.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TWaypoint y la añade en el array de Items.
      @param Index Posición en la que insertar.
      @return Nuevo elemento.
    -------------------------------------------------------------------------------}
    function Insert(Index: Integer): TWaypoint;
    {*------------------------------------------------------------------------------
      Deletes a single item from the collection.
      @param Index Position to delete.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra un elemento de la colección.
      @param Index Posición a borrar.
    -------------------------------------------------------------------------------}
    procedure Delete(Index: Integer);
    {*------------------------------------------------------------------------------
      Moves a item to a new position into Items array.
      @param CurIndex Index of Item to move.
      @param NewIndex Destination index.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mueve un item a una nueva posición dentro del array de Items.
      @param CurIndex Índice del elemento a mover.
      @param NewIndex Índice destino.
    -------------------------------------------------------------------------------}
    procedure Move(CurIndex, NewIndex: Integer);
    {*------------------------------------------------------------------------------
      Deletes all items from the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los elementos de la colección.
    -------------------------------------------------------------------------------}
    procedure Clear;

    {*------------------------------------------------------------------------------
      Lists the items in the collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de elementos en la colección.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TWaypoint read GetItems write SetItems; default;
  end;

  {*------------------------------------------------------------------------------
    The directions response retrieved from the directions server. Base class.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRequest
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Respuesta Directions devuelta por el servidor de direcciones. Clase base.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRequest
  -------------------------------------------------------------------------------}
  TDirectionsRequest = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Location of destination. This can be specified as either a string to be geocoded or a LatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Localización del destino. Puede especificarse como una cadena que será geocodificada o un LatLng.
    -------------------------------------------------------------------------------}
    FDestination: TLatLngStr;
    {*------------------------------------------------------------------------------
      Array of intermediate waypoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de puntos de paso intermedios.
    -------------------------------------------------------------------------------}
    FWaypointsList: TWaypointsList;
    {*------------------------------------------------------------------------------
      Location of origin. This can be specified as either a string to be geocoded or a LatLng.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Localización del origen. Puede especificarse como una cadena que será geocodificada o un LatLng.
    -------------------------------------------------------------------------------}
    FOrigin: TLatLngStr;
    {*------------------------------------------------------------------------------
      If set to true, the DirectionService will attempt to re-order the supplied intermediate waypoints to minimize overall cost of the route. If waypoints are optimized, inspect DirectionsRoute.waypoint_order in the response to determine the new ordering.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, DirectionService intentará reordenar los puntos de paso intermedios suministrados para minimizar el coste global de la ruta. Si se optimizan los puntos de paso, se tendrá que mirar TDirectionsRoute.WaypointOrder en la respuesta para determinar la nueva ordenación.
    -------------------------------------------------------------------------------}
    FOptimizeWaypoints: Boolean;
    {*------------------------------------------------------------------------------
      Type of routing requested.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tipo de ruta solicitada.
    -------------------------------------------------------------------------------}
    FTravelMode: TTravelMode;
    {*------------------------------------------------------------------------------
      Settings that apply only to requests where TravelMode is TRANSIT.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Configuración que sólo aplicará a las solicitudes cuando TravelMode sea TRANSIT.
    -------------------------------------------------------------------------------}
    FTransitOpt: TTransitOptions;
    {*------------------------------------------------------------------------------
      Preferred unit system to use when displaying distance.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Sistema de unidades preferido a utilizar para mostrar la distancia.
    -------------------------------------------------------------------------------}
    FUnitSystem: TUnitSystem;
    {*------------------------------------------------------------------------------
      If true, instructs the Directions service to avoid highways where possible.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el servicio Directions evitará las autopistas siempre que sea posible.
    -------------------------------------------------------------------------------}
    FAvoidHighways: Boolean;
    {*------------------------------------------------------------------------------
      Region code used as a bias for geocoding requests.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Código de la región usado como influencia para las solicitudes de geocodificación.
    -------------------------------------------------------------------------------}
    FRegion: TRegion;
    {*------------------------------------------------------------------------------
      If true, instructs the Directions service to avoid toll roads where possible.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el servicio Directions evitará las carreteras de peaje siempre que sea posible.
    -------------------------------------------------------------------------------}
    FAvoidTolls: Boolean;
    {*------------------------------------------------------------------------------
      Whether or not route alternatives should be provided.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si debe o no proveer rutas alternativas.
    -------------------------------------------------------------------------------}
    FProvideRouteAlt: Boolean;

    FOwner: TPersistent;

    function GetCount: Integer;
    function GetWaypoint(I: Integer): TWaypoint;
    procedure SetWaypointsList(const Value: TWaypointsList);
  protected
    {*------------------------------------------------------------------------------
      Return the owner of the collection.
      @return Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el propietario de la colección.
      @return Propietario
    -------------------------------------------------------------------------------}
    function GetOwner: TPersistent; override;
  public
    {*------------------------------------------------------------------------------
      Constructor class.
      @param AOwner Owner.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase.
      @param AOwner Propietario.
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TPersistent); virtual;
    {*------------------------------------------------------------------------------
      Destructor class.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase.
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido.
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Number of waypoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de puntos de paso intermedios.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
    {*------------------------------------------------------------------------------
      Array of intermediate waypoints.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de puntos de paso intermedios.
    -------------------------------------------------------------------------------}
    property Waypoints[I: Integer]: TWaypoint read GetWaypoint; default;
  published
    property AvoidHighways: Boolean read FAvoidHighways write FAvoidHighways default False;
    property AvoidTolls: Boolean read FAvoidTolls write FAvoidTolls default False;
    property Destination: TLatLngStr read FDestination write FDestination;
    property OptimizeWaypoints: Boolean read FOptimizeWaypoints write FOptimizeWaypoints default False;
    property Origin: TLatLngStr read FOrigin write FOrigin;
    property ProvideRouteAlt: Boolean read FProvideRouteAlt write FProvideRouteAlt default True;
    property Region: TRegion read FRegion write FRegion default r_NO_REGION;
    property TransitOpt: TTransitOptions read FTransitOpt write FTransitOpt;
    property TravelMode: TTravelMode read FTravelMode write FTravelMode default tmDRIVING;
    property UnitSystem: TUnitSystem read FUnitSystem write FUnitSystem default usMETRIC;
    property WaypointsList: TWaypointsList read FWaypointsList write SetWaypointsList;
  end;

  {*------------------------------------------------------------------------------
    Route marker options.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#MarkerOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Opciones para el marcador de una ruta.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#MarkerOptions
  -------------------------------------------------------------------------------}
  TMarkerOptions = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      If true, the marker can be dragged.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece como true, el marcador se puede desplazar.
    -------------------------------------------------------------------------------}
    FDraggable: Boolean;
    {*------------------------------------------------------------------------------
      Icon to show for the marker.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Icono a mostrar para el marcador.
    -------------------------------------------------------------------------------}
    FIcon: string;
    {*------------------------------------------------------------------------------
      If true, the marker shadow will not be displayed.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, no se mostrará la sombra del marcador.
    -------------------------------------------------------------------------------}
    FFlat: Boolean;
    {*------------------------------------------------------------------------------
      If true, the marker receives mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, el marcador recibirá eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      This event is fired when a TMarkerOptions property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia una propiedad de TMarkerOptions.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
    procedure SetClickable(const Value: Boolean);
    procedure SetDraggable(const Value: Boolean);
    procedure SetFlat(const Value: Boolean);
    procedure SetIcon(const Value: string);
  protected
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TPersistent); virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    property Clickable: Boolean read FClickable write SetClickable default True;
    property Draggable: Boolean read FDraggable write SetDraggable default False;
    property Flat: Boolean read FFlat write SetFlat default True;
    property Icon: string read FIcon write SetIcon;
  end;

  {*------------------------------------------------------------------------------
    Route polyline options.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#PolylineOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Opciones para la polilinea de una ruta.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#PolylineOptions
  -------------------------------------------------------------------------------}
  TCustomPolylineOptions = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      The stroke width in pixels.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Anchura del trazo en píxeles.
    -------------------------------------------------------------------------------}
    FStrokeWeight: Integer;
    {*------------------------------------------------------------------------------
      When true, render each edge as a geodesic.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cuando se establece a true, devuelve cada borde como una geodésica.
    -------------------------------------------------------------------------------}
    FGeodesic: Boolean;
    {*------------------------------------------------------------------------------
      Indicates whether this Polyline handles mouse events.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Indica si la Polilinea recibirá los eventos del ratón.
    -------------------------------------------------------------------------------}
    FClickable: Boolean;
    {*------------------------------------------------------------------------------
      The stroke opacity between 0.0 and 1.0
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opacidad del trazo entre 0.0 y 1.0.
    -------------------------------------------------------------------------------}
    FStrokeOpacity: Real;
    {*------------------------------------------------------------------------------
      This event is fired when a TCustomPolylineOptions property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia una propiedad de TCustomPolylineOptions.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
    procedure SetStrokeOpacity(const Value: Real);
    procedure SetStrokeWeight(const Value: Integer);
    procedure SetClickable(const Value: Boolean);
    procedure SetGeodesic(const Value: Boolean);
  protected
    {*------------------------------------------------------------------------------
      This method returns the stroke color (StrokeColor property defined into its descendents).
      @return String with the color in RGB format
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Método que devuelve el color asignado al trazo (propiedad StrokeColor definida en los descendientes).
      @return Cadena con el color en formato RGB
    -------------------------------------------------------------------------------}
    function GetStrokeColor: string; virtual; abstract;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TPersistent); virtual;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    property Clickable: Boolean read FClickable write SetClickable default True;
    property Geodesic: Boolean read FGeodesic write SetGeodesic default False;
    property StrokeOpacity: Real read FStrokeOpacity write SetStrokeOpacity; // 0 to 1
    property StrokeWeight: Integer read FStrokeWeight write SetStrokeWeight default 2; // 1 to 10
  end;

  {*------------------------------------------------------------------------------
    Defines the properties that can be set on a DirectionsRenderer object.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRendererOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Define las propiedades que pueden ser establecidas en un objeto DirectionsRenderer.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRendererOptions
  -------------------------------------------------------------------------------}
  TCustomDirectionsRenderer = class(TPersistent)
  private
    {*------------------------------------------------------------------------------
      Suppress the rendering of polylines.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Suprime el procesamiento de polilíneas.
    -------------------------------------------------------------------------------}
    FSuppressPolylines: Boolean;
    {*------------------------------------------------------------------------------
      Suppress the rendering of markers.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Suprime el procesamiento de marcadores.
    -------------------------------------------------------------------------------}
    FSuppressMarkers: Boolean;
    {*------------------------------------------------------------------------------
      Suppress the rendering of the BicyclingLayer when bicycling directions are requested.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Suprime el procesamiento de BicyclingLayer cuando se solicita cómo llegar en bicicleta.
    -------------------------------------------------------------------------------}
    FSuppressBicyclingLayer: Boolean;
    {*------------------------------------------------------------------------------
      Options for the markers.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones para los marcadores.
    -------------------------------------------------------------------------------}
    FMarkerOptions: TMarkerOptions;
    {*------------------------------------------------------------------------------
      If true, allows the user to drag and modify the paths of routes rendered by this DirectionsRenderer.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, permite al usuario desplazar y modificar el camuno de las rutas procesadas por DirectionsRenderer.
    -------------------------------------------------------------------------------}
    FDraggable: Boolean;
    {*------------------------------------------------------------------------------
      Suppress the rendering of info windows.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Suprime el procesamiento de las ventanas de información.
    -------------------------------------------------------------------------------}
    FSuppressInfoWindows: Boolean;
    {*------------------------------------------------------------------------------
      If false, the input map is centered and zoomed to the bounding box of this set of directions.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a false, el mapa se centra y se le aplica el zoom necesario para mostrar el conjunto de direcciones.
    -------------------------------------------------------------------------------}
    FPreserveViewport: Boolean;
    {*------------------------------------------------------------------------------
      This event is fired when a TMarkerOptions property changes.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando cambia una propiedad de TMarkerOptions.
    -------------------------------------------------------------------------------}
    FOnChange: TNotifyEvent;
    procedure SetDraggable(const Value: Boolean);
    procedure SetPreserveViewport(const Value: Boolean);
    procedure SetSuppressBicyclingLayer(const Value: Boolean);
    procedure SetSuppressInfoWindows(const Value: Boolean);
    procedure SetSuppressMarkers(const Value: Boolean);
    procedure SetSuppressPolylines(const Value: Boolean);
  protected
    {*------------------------------------------------------------------------------
      This method picks up the OnChange event from MarkerOptions object.
      @param Sender Object that fired the event.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este método recoge el evento OnChange del objeto MarkerOptions.
      @param Sender Objeto que ha generado el evento.
    -------------------------------------------------------------------------------}
    procedure OnMarkerOptionsChange(Sender: TObject);
    {*------------------------------------------------------------------------------
      This method picks up the OnChange event from PolylineOptions object.
      @param Sender Object that fired the event.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este método recoge el evento OnChange del objeto PolylineOptions.
      @param Sender Objeto que ha generado el evento.
    -------------------------------------------------------------------------------}
    procedure OnPolylineOptionsChange(Sender: TObject);

    {*------------------------------------------------------------------------------
      Create the PolylinaOptions object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea el objeto PolylineOptions.
    -------------------------------------------------------------------------------}
    procedure CreatePolylineOptions; virtual; abstract;
    {*------------------------------------------------------------------------------
      Return a formatted string that contains the PolylineOptions property values.
      @return Formatted string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena formateada con los valores de la propiedad PolylineOptions.
      @return Cadena formateada.
    -------------------------------------------------------------------------------}
    function PolylineOptionsToStr: string; virtual; abstract;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  public
    {*------------------------------------------------------------------------------
      Constructor class
      @param aOwner Owner
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param aOwner Propietario
    -------------------------------------------------------------------------------}
    constructor Create(aOwner: TObject); virtual;
    {*------------------------------------------------------------------------------
      Destructor class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Assign method copies the contents of another similar object.
      @param Source object to copy content
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método Assign copia el contenido de un objeto similar.
      @param Source objeto a copiar el contenido
    -------------------------------------------------------------------------------}
    procedure Assign(Source: TPersistent); override;
  published
    property Draggable: Boolean read FDraggable write SetDraggable default False;
    property MarkerOptions: TMarkerOptions read FMarkerOptions write FMarkerOptions;
    property PreserveViewport: Boolean read FPreserveViewport write SetPreserveViewport default False;
    property SuppressBicyclingLayer: Boolean read FSuppressBicyclingLayer write SetSuppressBicyclingLayer default False;
    property SuppressInfoWindows: Boolean read FSuppressInfoWindows write SetSuppressInfoWindows default False;
    property SuppressMarkers: Boolean read FSuppressMarkers write SetSuppressMarkers default False;
    property SuppressPolylines: Boolean read FSuppressPolylines write SetSuppressPolylines default False;
  end;

  {*------------------------------------------------------------------------------
    Base class for computing directions between two or more places.
    More information at
    - https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsService
    - https://developers.google.com/maps/documentation/javascript/directions
    - https://developers.google.com/maps/documentation/directions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para gestionar direcciones entre dos o más lugares.
    Más información en
    - https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsService
    - https://developers.google.com/maps/documentation/javascript/directions
    - https://developers.google.com/maps/documentation/directions
  -------------------------------------------------------------------------------}
  TCustomGMDirection = class(TGMObjects)
  private
    {*------------------------------------------------------------------------------
      Properties that can be set on a DirectionsRequest object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Propiedades que pueden establecerse al objeto DirectionsRequest.
    -------------------------------------------------------------------------------}
    FDirectionsRequest: TDirectionsRequest;
    {*------------------------------------------------------------------------------
      If true, the route will be displayed automatically when processing.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, se mostrará la ruta automáticamente al procesarla.
    -------------------------------------------------------------------------------}
    FAutoShow: Boolean;
    {*------------------------------------------------------------------------------
      If true, hides the other routes shown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Si se establece a true, oculta las otras rutas mostradas.
    -------------------------------------------------------------------------------}
    FHiddeOthers: Boolean;

    {*------------------------------------------------------------------------------
      This event is fired when there is a change in the route showed on the map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Este evento se dispara cuando se produce algún cambio en la ruta mostrada en el mapa.
    -------------------------------------------------------------------------------}
    FOnDirectionsChanged: TNotifyEvent;

    function GetCount: Integer;
    function GetDirectionResult(I: Integer): TCustomDirectionsResult;
  protected
    {*------------------------------------------------------------------------------
      Internal counter (internal use only).
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Contador interno (sólo uso interno).
    -------------------------------------------------------------------------------}
    FCountDirResult: Integer;
    {*------------------------------------------------------------------------------
      List of DirectionsResults objects (internal use only).
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de objectos DirectionsResult (sólo uso interno).
    -------------------------------------------------------------------------------}
    FDirectionsResult: TObjectList;

    function GetAPIUrl: string; override;

    procedure DeleteMapObjects; override;
    procedure ShowElements; override;
    procedure EventFired(EventType: TEventType; Params: array of const); override;

    {*------------------------------------------------------------------------------
      Return a formatted string that contains the DirectionsRender property values.
      @return Formatted string.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve una cadena formateada con los valores de la propiedad DirectionsRender.
      @return Cadena formateada.
    -------------------------------------------------------------------------------}
    function DirectionsRenderToStr: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      Create the DirectionsRender object.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea el objecto DirectionsRender.
    -------------------------------------------------------------------------------}
    procedure CreateDirectionsRenderObject; virtual; abstract;

    {*------------------------------------------------------------------------------
      Retrieves data from a call to the Execute method creating the TDirectionsResult object.
      @return Index of the new TDirectionsResult.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Recupera los datos de una llamada al método Execute creando el objeto TDirectionsResult.
      @return Indice del nuevo TDirectionsResult.
    -------------------------------------------------------------------------------}
    function GetRetournedData: Integer; virtual; abstract;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    {*------------------------------------------------------------------------------
      Calculate the route request.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Realiza el cálculo de la ruta.
    -------------------------------------------------------------------------------}
    procedure Execute; virtual;

    {*------------------------------------------------------------------------------
      Creates a new TWaypoint instance and adds it to the DirectionsRequest.Waypoints array.
      @return New item.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea una nueva instancia de TWaypoint y la añade en el array de DirectionsRequest.Waypoints.
      @return Nuevo elemento.
    -------------------------------------------------------------------------------}
    function AddWaypoint: TWaypoint;
    {*------------------------------------------------------------------------------
      Deletes a single item from the collection DirectionsRequest.Waypoints.
      @param Index Position to delete.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra un elemento de la colección DirectionsRequest.Waypoints.
      @param Index Posición a borrar.
    -------------------------------------------------------------------------------}
    procedure DeleteWaypoint(Index: Integer);
    {*------------------------------------------------------------------------------
      Moves a item to a new position into DirectionsRequest.Waypoints array.
      @param CurIndex Index of Item to move.
      @param NewIndex Destination index.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Mueve un item a una nueva posición dentro del array de DirectionsRequest.Waypoints.
      @param CurIndex Índice del elemento a mover.
      @param NewIndex Índice destino.
    -------------------------------------------------------------------------------}
    procedure MoveWaypoint(CurIndex, NewIndex: Integer);
    {*------------------------------------------------------------------------------
      Deletes all items from the DirectionsRequest.Waypoints collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los elementos de la colección DirectionsRequest.Waypoints.
    -------------------------------------------------------------------------------}
    procedure ClearWaypoint;

    {*------------------------------------------------------------------------------
      Shows a specific route.
      @param ResultIndex Index of the DirectionsResult array.
      @param RouteIndex Index of the DirectionsResult.Routes array.
      @param HiddeOthers If true, hides the other routes shown.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Muestra una ruta especificada.
      @param ResultIndex Índice dentro del array DirectionsResult.
      @param RouteIndex Índice dentro del array DirectionsResult.Routes.
      @param HiddeOthers A true, oculta las otras rutas mostradas.
    -------------------------------------------------------------------------------}
    procedure ShowRoute(ResultIndex, RouteIndex: Integer; HiddeOthers: Boolean = True);
    {*------------------------------------------------------------------------------
      Delete a specific route.
      @param ResultIndex Index of the DirectionsResult array.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra una ruta especificada.
      @param ResultIndex Índice dentro del array DirectionsResult.
    -------------------------------------------------------------------------------}
    procedure Delete(ResultIndex: Integer);

    {*------------------------------------------------------------------------------
      Number of results.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de resultados.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
    {*------------------------------------------------------------------------------
      Results array.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de resultados.
    -------------------------------------------------------------------------------}
    property DirectionsResult[I: Integer]: TCustomDirectionsResult read GetDirectionResult; default;
  published
    property AutoShow: Boolean read FAutoShow write FAutoShow default True;
    property HiddeOthers: Boolean read FHiddeOthers write FHiddeOthers default True;
    property DirectionsRequest: TDirectionsRequest read FDirectionsRequest write FDirectionsRequest;
    property OnDirectionsChanged: TNotifyEvent read FOnDirectionsChanged write FOnDirectionsChanged;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils, System.DateUtils, Xml.XMLIntf, Xml.XMLDoc,
  {$ELSE}
  SysUtils, DateUtils, XMLIntf, XMLDoc,
  {$ENDIF}
  Lang, GMFunctions;

{ TCustomGMDirection }

function TCustomGMDirection.AddWaypoint: TWaypoint;
begin
  Result := FDirectionsRequest.FWaypointsList.Add;
end;

procedure TCustomGMDirection.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomGMDirection then
  begin
    Map := TCustomGMDirection(Source).Map;
    AutoShow := TCustomGMDirection(Source).AutoShow;
    HiddeOthers := TCustomGMDirection(Source).HiddeOthers;
    DirectionsRequest.Assign(TCustomGMDirection(Source).DirectionsRequest);
    FDirectionsResult.Assign(TCustomGMDirection(Source).FDirectionsResult);
  end;
end;

procedure TCustomGMDirection.ClearWaypoint;
begin
  FDirectionsRequest.FWaypointsList.Clear;
end;

constructor TCustomGMDirection.Create(aOwner: TComponent);
begin
  inherited;

  FCountDirResult := 0;
  FAutoShow := True;
  FHiddeOthers := True;
  FDirectionsRequest := TDirectionsRequest.Create(Self);
  FDirectionsResult := TObjectList.Create;

  CreateDirectionsRenderObject;
end;

procedure TCustomGMDirection.Delete(ResultIndex: Integer);
begin
  if ResultIndex >= Count then
    raise Exception.Create(GetTranslateText('Índice fuera de rango', Language));

  ExecuteScript('DeleteObject', Format('%d,%d', [IdxList, DirectionsResult[ResultIndex].Index]));
  FDirectionsResult.Delete(ResultIndex);
end;

procedure TCustomGMDirection.DeleteMapObjects;
begin
  ExecuteScript('DeleteObjects', IntToStr(IdxList));
end;

procedure TCustomGMDirection.DeleteWaypoint(Index: Integer);
begin
  FDirectionsRequest.FWaypointsList.Delete(Index);
end;

destructor TCustomGMDirection.Destroy;
begin
  if Assigned(FDirectionsRequest) then FreeAndNil(FDirectionsRequest);
  if Assigned(FDirectionsResult) then FreeAndNil(FDirectionsResult);

  inherited;
end;

function TCustomGMDirection.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference#DirectionsService';
end;

function TCustomGMDirection.GetCount: Integer;
begin
  Result := FDirectionsResult.Count;
end;

function TCustomGMDirection.GetDirectionResult(I: Integer): TCustomDirectionsResult;
begin
  Result := TCustomDirectionsResult(FDirectionsResult[i]);
end;

procedure TCustomGMDirection.MoveWaypoint(CurIndex, NewIndex: Integer);
begin
  FDirectionsRequest.FWaypointsList.Move(CurIndex, NewIndex);
end;

procedure TCustomGMDirection.ShowElements;
begin
end;

procedure TCustomGMDirection.ShowRoute(ResultIndex, RouteIndex: Integer;
  HiddeOthers: Boolean);
begin
  if ResultIndex >= Count then
    raise Exception.Create(GetTranslateText('Índice fuera de rango', Language));

  TCustomDirectionsResult(FDirectionsResult[ResultIndex]).ShowRoute(RouteIndex, HiddeOthers);
end;

procedure TCustomGMDirection.EventFired(EventType: TEventType;
  Params: array of const);
var
  Idx: Integer;
  i: Integer;
begin
  inherited;

  if EventType = etDirectionsChanged then
  begin
    if High(Params) <> 1 then
      raise Exception.Create(GetTranslateText('Número de parámetros incorrecto', Map.Language));

    {$IFDEF DELPHI2010}
    if Params[0].VType <> vtUnicodeString then
    {$ELSE}
    if Params[0].VType <> vtAnsiString then
    {$ENDIF}
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    if Params[1].VType <> vtInteger then
      raise Exception.Create(GetTranslateText('Tipo de parámetro incorrecto', Map.Language));

    // ES: buscamos indice en TCustomDirectionsResult // EN: search index in TCustomDirectionsResult
    Idx := -1;
    for i := 0 to Count - 1 do
      if TCustomDirectionsResult(FDirectionsResult[i]).FIndex = Params[1].VInteger then
      begin
        Idx := i;
        Break;
      end;

    if Idx = -1 then
      raise Exception.Create(GetTranslateText('Valor de parámetro incorrecto', Map.Language));

    {$IFDEF DELPHI2010}
    TCustomDirectionsResult(FDirectionsResult[Idx]).FXMLData.Text := string(PChar(Params[0].VUnicodeString));
    {$ELSE}
    TCustomDirectionsResult(FDirectionsResult[Idx]).FXMLData.Text := string(PChar(Params[0].VAnsiString));
    {$ENDIF}

    if Assigned(FOnDirectionsChanged) then FOnDirectionsChanged(Self);
  end;
end;

procedure TCustomGMDirection.Execute;
  function WaypointsToStr: string;
  const
    WayP = '%s~|~%s~|~%s~|~%s';
  var
    i: Integer;
  begin
    Result := '';
    for i := 0 to DirectionsRequest.Count - 1 do
    begin
      if i <> 0 then Result := Result + '$|$';

      Result := Result + Format(WayP, [GetConvertedString(DirectionsRequest[i].Location.Address),
                                       DirectionsRequest[i].Location.LatLng.LatToStr,
                                       DirectionsRequest[i].Location.LatLng.LngToStr,
                                       LowerCase(TCustomTransform.GMBoolToStr(DirectionsRequest[i].StopOver, True))])
    end;
  end;
const
  StrParams = '%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s';
var
  Params: string;
  Dep, Arr: string;
begin
  if not Assigned(Map) then
    raise Exception.Create(GetTranslateText('Mapa no asignado', Language));

  Inc(FCountDirResult);
  Dep := '';
  Arr := '';
  if EncodeDate(1970, 1, 1) <> DirectionsRequest.TransitOpt.ArrivalDate then
    Arr := FormatDateTime('mm/dd/yyyy hh:nn:ss', Trunc(DirectionsRequest.TransitOpt.ArrivalDate) + (DirectionsRequest.TransitOpt.ArrivalTime - Trunc(DirectionsRequest.TransitOpt.ArrivalTime)));
  if EncodeDate(1970, 1, 1) <> DirectionsRequest.TransitOpt.DepartureDate then
    Dep := FormatDateTime('mm/dd/yyyy hh:nn:ss', Trunc(DirectionsRequest.TransitOpt.DepartureDate) + (DirectionsRequest.TransitOpt.DepartureTime - Trunc(DirectionsRequest.TransitOpt.DepartureTime)));

  Params := Format(StrParams, [
                  LowerCase(TCustomTransform.GMBoolToStr(DirectionsRequest.AvoidHighways, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(DirectionsRequest.AvoidTolls, True)),
                  QuotedStr(GetConvertedString(DirectionsRequest.Destination.Address)),
                  DirectionsRequest.Destination.LatLng.LatToStr(GetMapPrecision),
                  DirectionsRequest.Destination.LatLng.LngToStr(GetMapPrecision),
                  LowerCase(TCustomTransform.GMBoolToStr(DirectionsRequest.OptimizeWaypoints, True)),
                  QuotedStr(GetConvertedString(DirectionsRequest.Origin.Address)),
                  DirectionsRequest.Origin.LatLng.LatToStr(GetMapPrecision),
                  DirectionsRequest.Origin.LatLng.LngToStr(GetMapPrecision),
                  LowerCase(TCustomTransform.GMBoolToStr(DirectionsRequest.ProvideRouteAlt, True)),
                  QuotedStr(TCustomTransform.RegionToStr(DirectionsRequest.Region)),
                  QuotedStr(Arr),
                  QuotedStr(Dep),
                  QuotedStr(TCustomTransform.TravelModeToStr(DirectionsRequest.TravelMode)),
                  QuotedStr(TCustomTransform.UnitSystemToStr(DirectionsRequest.UnitSystem)),
                  QuotedStr(WaypointsToStr),
                  LowerCase(TCustomTransform.GMBoolToStr(HiddeOthers, True)),
                  LowerCase(TCustomTransform.GMBoolToStr(AutoShow, True)),
                  DirectionsRenderToStr,
                  IntToStr(IdxList),
                  IntToStr(FCountDirResult)
                  ]);

  ExecuteScript('GetDirections', Params);

  repeat
    TGMGenFunc.ProcessMessages;
  until (GetIntegerField(DirectionsForm, DirectionsFormResponse) = 1);
  GetRetournedData;
end;

{ TLatLngStr }

procedure TLatLngStr.Assign(Source: TPersistent);
begin
  if Source is TLatLngStr then
  begin
    LatLng.Assign(TLatLngStr(Source).LatLng);
    Address := TLatLngStr(Source).Address;
  end
  else
    inherited Assign(Source);
end;

constructor TLatLngStr.Create;
begin
  FLatLng := TLatLng.Create;
  FAddress := '';
end;

destructor TLatLngStr.Destroy;
begin
  if Assigned(FLatLng) then FreeAndNil(FLatLng);

  inherited;
end;

function TLatLngStr.ToString: string;
begin
  if FAddress <> '' then Result := FAddress
  else Result := LatLng.ToStr(0);
end;

{ TTransitOptions }

procedure TTransitOptions.Assign(Source: TPersistent);
begin
  if Source is TTransitOptions then
  begin
    ArrivalTime := TTransitOptions(Source).ArrivalTime;
    ArrivalDate := TTransitOptions(Source).ArrivalDate;
    DepartureTime := TTransitOptions(Source).DepartureTime;
    DepartureDate := TTransitOptions(Source).DepartureDate;
  end
  else
    inherited Assign(Source);
end;

constructor TTransitOptions.Create;
begin
  FArrivalTime := EncodeTime(0, 0, 0, 1);
  FDepartureTime := EncodeTime(0, 0, 0, 1);
  FArrivalDate := EncodeDate(1970, 1, 1);
  FDepartureDate := EncodeDate(1970, 1, 1);
end;

procedure TTransitOptions.SetArrivalDate(const Value: TDate);
begin
  if FArrivalDate = Value then Exit;

  FArrivalDate := Value;
  if FArrivalDate < EncodeDate(1970, 1, 1) then
    FArrivalDate := EncodeDate(1970, 1, 1);
end;

procedure TTransitOptions.SetArrivalTime(const Value: TTime);
begin
  if FArrivalTime = Value then Exit;

  FArrivalTime := Value;
  if FArrivalTime < EncodeTime(0, 0, 0, 1) then
    FArrivalTime := EncodeTime(0, 0, 0, 1);
end;

procedure TTransitOptions.SetDepartureDate(const Value: TDate);
begin
  if FDepartureDate = Value then Exit;

  FDepartureDate := Value;
  if FDepartureDate < EncodeDate(1970, 1, 1) then
    FDepartureDate := EncodeDate(1970, 1, 1);
end;

procedure TTransitOptions.SetDepartureTime(const Value: TTime);
begin
  if FDepartureTime = Value then Exit;

  FDepartureTime := Value;
  if FDepartureTime < EncodeTime(0, 0, 0, 1) then
    FDepartureTime := EncodeTime(0, 0, 0, 1);
end;

{ TWaypoint }

procedure TWaypoint.Assign(Source: TPersistent);
begin
  if Source is TWaypoint then
  begin
    Location.Assign(TWaypoint(Source).Location);
    StopOver := TWaypoint(Source).StopOver;
  end
  else
    inherited Assign(Source);
end;

constructor TWaypoint.Create(Collection: TCollection);
begin
  inherited;

  FLocation := TLatLngStr.Create;
  FStopOver := False;
end;

destructor TWaypoint.Destroy;
begin
  if Assigned(FLocation) then FreeAndNil(FLocation);

  inherited;
end;

function TWaypoint.GetDisplayName: string;
begin
  if Length(FTitle) > 0 then
  begin
    if Length(FTitle) > 20 then
      Result := Copy(FTitle, 0, 20) + '...'
    else
      Result := FTitle;
  end
  else
  begin
    if Length(FLocation.Address) > 0 then
    begin
      if Length(FLocation.Address) > 20 then
        Result := Copy(FLocation.Address, 0, 20) + '...'
      else
        Result := FLocation.Address;
      FTitle := Result;
    end
    else
    begin
      Result := inherited GetDisplayName;
      FTitle := Result;
    end;
  end;
end;

procedure TWaypoint.SetTitle(const Value: string);
begin
  FTitle := Value;

  if FTitle = '' then GetDisplayName;
end;

{ TWaypointsList }

function TWaypointsList.Add: TWaypoint;
begin
  Result := TWaypoint(inherited Add);
end;

procedure TWaypointsList.Clear;
begin
  inherited Clear;
end;

constructor TWaypointsList.Create(aOwner: TPersistent);
begin
  inherited Create(TWaypoint);

  FOwner := aOwner;
end;

procedure TWaypointsList.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

function TWaypointsList.GetItems(I: Integer): TWaypoint;
begin
  Result := TWaypoint(inherited Items[I]);
end;

function TWaypointsList.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TWaypointsList.Insert(Index: Integer): TWaypoint;
begin
  Result := TWaypoint(inherited Insert(Index));
end;

procedure TWaypointsList.Move(CurIndex, NewIndex: Integer);
begin
  Items[CurIndex].Index := NewIndex;
end;

procedure TWaypointsList.SetItems(I: Integer; const Value: TWaypoint);
begin
  inherited SetItem(I, Value);
end;

{ TDirectionsRoute }

procedure TDirectionsRoute.Assign(Source: TObject);
begin
  if Source is TDirectionsRoute then
  begin
    FSumary := TDirectionsRoute(Source).Sumary;
    FCopyrights := TDirectionsRoute(Source).Copyrights;
    FBounds.Assign(TDirectionsRoute(Source).Bounds);
    FWarning.Assign(TDirectionsRoute(Source).FWarning);
    FWaypointOrder.Assign(TDirectionsRoute(Source).FWaypointOrder);
    FOverviewPath.Assign(TDirectionsRoute(Source).FOverviewPath);
    FLeg.Assign(TDirectionsRoute(Source).FLeg);
  end;
end;

constructor TDirectionsRoute.Create;
begin
  FSumary := '';
  FBounds := TLatLngBounds.Create;
  FCopyrights := '';
  FWarning := TStringList.Create;
  FWaypointOrder := TStringList.Create;
  FOverviewPath := TObjectList.Create;
  FLeg := TObjectList.Create;
end;

destructor TDirectionsRoute.Destroy;
begin
  if Assigned(FBounds) then FreeAndNil(FBounds);
  if Assigned(FWarning) then FreeAndNil(FWarning);
  if Assigned(FWaypointOrder) then FreeAndNil(FWaypointOrder);
  if Assigned(FOverviewPath) then FreeAndNil(FOverviewPath);
  if Assigned(FLeg) then FreeAndNil(FLeg);

  inherited;
end;

function TDirectionsRoute.GetCountLeg: Integer;
begin
  Result := FLeg.Count;
end;

function TDirectionsRoute.GetCountOverviewPath: Integer;
begin
  Result := FOverviewPath.Count;
end;

function TDirectionsRoute.GetCountWarning: Integer;
begin
  Result := FWarning.Count;
end;

function TDirectionsRoute.GetCountWaypointOrder: Integer;
begin
  Result := FWaypointOrder.Count;
end;

function TDirectionsRoute.GetLeg(Index: Integer): TDirectionsLeg;
begin
  Result := nil;
  if Assigned(FLeg[Index]) then
    Result := TDirectionsLeg(FLeg[Index]);
end;

function TDirectionsRoute.GetOverviewPath(Index: Integer): TLatLng;
begin
  Result := nil;
  if Assigned(FOverviewPath[Index]) then
    Result := TLatLng(FOverviewPath[Index]);
end;

function TDirectionsRoute.GetWarning(Index: Integer): string;
begin
  Result := '';
  if FWarning.Count >= Index then
    Result := FWarning[Index];
end;

function TDirectionsRoute.GetWaypointOrder(Index: Integer): Integer;
begin
  Result := -1;
  if FWaypointOrder.Count >= Index then
    Result := StrToInt(FWaypointOrder[Index]);
end;

{ TDirectionsRequest }

procedure TDirectionsRequest.Assign(Source: TPersistent);
begin
  if Source is TDirectionsRequest then
  begin
    AvoidHighways := TDirectionsRequest(Source).AvoidHighways;
    AvoidTolls := TDirectionsRequest(Source).AvoidTolls;
    Destination.Assign(TDirectionsRequest(Source).Destination);
    OptimizeWaypoints := TDirectionsRequest(Source).OptimizeWaypoints;
    Origin.Assign(TDirectionsRequest(Source).Origin);
    ProvideRouteAlt := TDirectionsRequest(Source).ProvideRouteAlt;
    Region := TDirectionsRequest(Source).Region;
    TransitOpt.Assign(TDirectionsRequest(Source).TransitOpt);
    TravelMode := TDirectionsRequest(Source).TravelMode;
    UnitSystem := TDirectionsRequest(Source).UnitSystem;
    WaypointsList.Assign(TDirectionsRequest(Source).WaypointsList);
  end
  else
    inherited Assign(Source);
end;

constructor TDirectionsRequest.Create(aOwner: TPersistent);
begin
  inherited Create;

  FAvoidHighways := False;
  FAvoidTolls := False;
  FDestination := TLatLngStr.Create;
  FOptimizeWaypoints := False;
  FOrigin := TLatLngStr.Create;
  FProvideRouteAlt := True;
  FRegion := r_NO_REGION;
  FTransitOpt := TTransitOptions.Create;
  FTravelMode := tmDRIVING;
  FUnitSystem := usMETRIC;
  FOwner := aOwner;
  FWaypointsList := TWaypointsList.Create(Self);
end;

destructor TDirectionsRequest.Destroy;
begin
  if Assigned(FDestination) then FreeAndNil(FDestination);
  if Assigned(FOrigin) then FreeAndNil(FOrigin);
  if Assigned(FTransitOpt) then FreeAndNil(FTransitOpt);
  if Assigned(FWaypointsList) then FreeAndNil(FWaypointsList);

  inherited;
end;

function TDirectionsRequest.GetCount: Integer;
begin
  Result := FWaypointsList.Count;
end;

function TDirectionsRequest.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

function TDirectionsRequest.GetWaypoint(I: Integer): TWaypoint;
begin
  Result := TWaypoint(FWaypointsList[i]);
end;

procedure TDirectionsRequest.SetWaypointsList(const Value: TWaypointsList);
begin
  FWaypointsList.Assign(Value);
end;

{ TDistance }

procedure TDistance.Assign(Source: TObject);
begin
  if Source is TDistance then
  begin
    FText := TDistance(Source).Text;
    FValue := TDistance(Source).Value;
  end;
end;

constructor TDistance.Create;
begin
  FText := '';
  FValue := 0;
end;

{ TDuration }

procedure TDuration.Assign(Source: TObject);
begin
  if Source is TDistance then
  begin
    FText := TDistance(Source).Text;
    FValue := TDistance(Source).Value;
  end;
end;

constructor TDuration.Create;
begin
  FText := '';
  FValue := 0;
end;

{ TDirectionsStep }

procedure TDirectionsStep.Assign(Source: TObject);
begin
  if Source is TDirectionsStep then
  begin
    FDistance.Assign(TDirectionsStep(Source).Distance);
    FDuration.Assign(TDirectionsStep(Source).Duration);
    FEndLocation.Assign(TDirectionsStep(Source).EndLocation);
    FInstructions := TDirectionsStep(Source).Instructions;
    FPath.Assign(TDirectionsStep(Source).FPath);
    FStartLocation.Assign(TDirectionsStep(Source).StartLocation);
    FTransit.Assign(TDirectionsStep(Source).Transit);
    FTravelMode := TDirectionsStep(Source).TravelMode;
    if Assigned(TDirectionsStep(Source).FSteps) then
      FSteps.Assign(TDirectionsStep(Source).FSteps);
  end;
end;

constructor TDirectionsStep.Create;
begin
  FDistance := TDistance.Create;
  FDuration := TDuration.Create;
  FEndLocation := TLatLng.Create;
  FInstructions := '';
  FPath := TObjectList.Create;
  FStartLocation := TLatLng.Create;
  FTransit := TTransitDetails.Create;
  FTravelMode := tmDRIVING;
end;

destructor TDirectionsStep.Destroy;
begin
  if Assigned(FDistance) then FreeAndNil(FDistance);
  if Assigned(FDuration) then FreeAndNil(FDuration);
  if Assigned(FEndLocation) then FreeAndNil(FEndLocation);
  if Assigned(FPath) then FreeAndNil(FPath);
  if Assigned(FStartLocation) then FreeAndNil(FStartLocation);
  if Assigned(FSteps) then FreeAndNil(FSteps);
  if Assigned(FTransit) then FreeAndNil(FTransit);

  inherited;
end;

function TDirectionsStep.GetCountPath: Integer;
begin
  Result := FPath.Count;
end;

function TDirectionsStep.GetPath(Index: integer): TLatLng;
begin
  Result := nil;
  if Assigned(FPath[Index]) then
    Result := TLatLng(FPath[Index]);
end;

{ TTransitDetails }

procedure TTransitDetails.Assign(Source: TObject);
begin
  if Source is TTransitDetails then
  begin
    FArribalStop.Assign(TTransitDetails(Source).ArribalStop);
    FArribalTime.Assign(TTransitDetails(Source).ArribalTime);
    FDepartureStop.Assign(TTransitDetails(Source).DepartureStop);
    FDepartureTime.Assign(TTransitDetails(Source).DepartureTime);
    FHeadsign := TTransitDetails(Source).Headsign;
    FHeadway := TTransitDetails(Source).Headway;
    FLine.Assign(TTransitDetails(Source).Line);
    FNumStops := TTransitDetails(Source).NumStops;
  end;
end;

constructor TTransitDetails.Create;
begin
  FArribalStop := TTransitStop.Create;
  FArribalTime := TTimeClass.Create;
  FDepartureStop := TTransitStop.Create;
  FDepartureTime := TTimeClass.Create;
  FHeadsign := '';
  FHeadway := 0;
  FLine := TTransitLine.Create;
  FNumStops := 0;
end;

destructor TTransitDetails.Destroy;
begin
  if Assigned(FArribalStop) then FreeAndNil(FArribalStop);
  if Assigned(FArribalTime) then FreeAndNil(FArribalTime);
  if Assigned(FDepartureStop) then FreeAndNil(FDepartureStop);
  if Assigned(FDepartureTime) then FreeAndNil(FDepartureTime);
  if Assigned(FLine) then FreeAndNil(FLine);

  inherited;
end;

{ TTransitStop }

procedure TTransitStop.Assign(Source: TObject);
begin
  if Source is TTransitStop then
  begin
    FLocation.Assign(TTransitStop(Source).Location);
    FName := TTransitStop(Source).Name;
  end;
end;

constructor TTransitStop.Create;
begin
  FLocation := TLatLng.Create;
  FName := '';
end;

destructor TTransitStop.Destroy;
begin
  if Assigned(FLocation) then FreeAndNil(FLocation);

  inherited;
end;

{ TTimeClass }

procedure TTimeClass.Assign(Source: TObject);
begin
  if Source is TTimeClass then
  begin
    FText := TTimeClass(Source).Text;
    FTimeZone := TTimeClass(Source).TimeZone;
    FValue := TTimeClass(Source).Value;
  end;
end;

constructor TTimeClass.Create;
begin
  FText := '';
  FTimeZone := '';
  FValue := EncodeTime(0, 0, 0, 1);
end;

{ TTransitLine }

procedure TTransitLine.Assign(Source: TObject);
begin
  if Source is TTransitLine then
  begin
    FAgencie.Assign(TTransitLine(Source).FAgencie);
    FColor := TTransitLine(Source).Color;
    FIcon := TTransitLine(Source).Icon;
    FName := TTransitLine(Source).Name;
    FShortName := TTransitLine(Source).ShortName;
    FTextColor := TTransitLine(Source).TextColor;
    FUrl := TTransitLine(Source).Url;
    FVehicle.Assign(TTransitLine(Source).Vehicle);
  end;
end;

constructor TTransitLine.Create;
begin
  FAgencie := TObjectList.Create;
  FColor := '';
  FIcon := '';
  FName := '';
  FShortName := '';
  FTextColor := '';
  FUrl := '';
  FVehicle := TTransitVehicle.Create;
end;

destructor TTransitLine.Destroy;
begin
  if Assigned(FAgencie) then FreeAndNil(FAgencie);
  if Assigned(FVehicle) then FreeAndNil(FVehicle);

  inherited;
end;

function TTransitLine.GetAgencie(Index: Integer): TTransitAgency;
begin
  Result := nil;
  if Assigned(FAgencie[Index]) then
    Result := TTransitAgency(FAgencie[Index]);
end;

function TTransitLine.GetCountAgencie: Integer;
begin
  Result := FAgencie.Count;
end;

{ TTransitAgency }

procedure TTransitAgency.Assign(Source: TObject);
begin
  if Source is TTransitAgency then
  begin
    FName := TTransitAgency(Source).Name;
    FPhone := TTransitAgency(Source).Phone;
    FUrl := TTransitAgency(Source).Url;
  end;
end;

constructor TTransitAgency.Create;
begin
  FName := '';
  FPhone := '';
  FUrl := '';
end;

{ TTransitVehicle }

procedure TTransitVehicle.Assign(Source: TObject);
begin
  if Source is TTransitVehicle then
  begin
    FIcon := TTransitVehicle(Source).Icon;
    FLocalIcon := TTransitVehicle(Source).LocalIcon;
    FName := TTransitVehicle(Source).Name;
    FVehicleType := TTransitVehicle(Source).VehicleType;
  end;
end;

constructor TTransitVehicle.Create;
begin
  FIcon := '';
  FLocalIcon := '';
  FName := '';
  FVehicleType := vtOTHER;
end;

{ TMarkerOptions }

procedure TMarkerOptions.Assign(Source: TPersistent);
begin
  if Source is TMarkerOptions then
  begin
    Clickable := TMarkerOptions(Source).Clickable;
    Draggable := TMarkerOptions(Source).Draggable;
    Flat := TMarkerOptions(Source).Flat;
    Icon := TMarkerOptions(Source).Icon;
  end
  else inherited;
end;

constructor TMarkerOptions.Create(aOwner: TPersistent);
begin
  FClickable := True;
  FDraggable := False;
  FFlat := True;
  FIcon := '';
end;

procedure TMarkerOptions.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TMarkerOptions.SetDraggable(const Value: Boolean);
begin
  if FDraggable = Value then Exit;

  FDraggable := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TMarkerOptions.SetFlat(const Value: Boolean);
begin
  if FFlat = Value then Exit;

  FFlat := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TMarkerOptions.SetIcon(const Value: string);
begin
  if FIcon = Value then Exit;

  FIcon := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TCustomPolylineOptions }

procedure TCustomPolylineOptions.Assign(Source: TPersistent);
begin
  if Source is TCustomPolylineOptions then
  begin
    Clickable := TCustomPolylineOptions(Source).Clickable;
    Geodesic := TCustomPolylineOptions(Source).Geodesic;
    StrokeOpacity := TCustomPolylineOptions(Source).StrokeOpacity;
    StrokeWeight := TCustomPolylineOptions(Source).StrokeWeight;
  end
  else inherited;
end;

constructor TCustomPolylineOptions.Create(aOwner: TPersistent);
begin
  FClickable := True;
  FGeodesic := False;
  FStrokeOpacity := 0.5;
  FStrokeWeight := 2;
end;

procedure TCustomPolylineOptions.SetClickable(const Value: Boolean);
begin
  if FClickable = Value then Exit;

  FClickable := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomPolylineOptions.SetGeodesic(const Value: Boolean);
begin
  if FGeodesic = Value then Exit;

  FGeodesic := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomPolylineOptions.SetStrokeOpacity(const Value: Real);
begin
  if FStrokeOpacity = Value then Exit;

  FStrokeOpacity := Value;
  if FStrokeOpacity < 0 then FStrokeOpacity := 0;
  if FStrokeOpacity > 1 then FStrokeOpacity := 1;
  FStrokeOpacity := Trunc(FStrokeOpacity * 100) / 100;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomPolylineOptions.SetStrokeWeight(const Value: Integer);
begin
  if FStrokeWeight = Value then Exit;

  FStrokeWeight := Value;
  if FStrokeWeight < 1 then FStrokeWeight := 1;
  if FStrokeWeight > 10 then FStrokeWeight := 10;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TCustomDirectionsRenderer }

procedure TCustomDirectionsRenderer.Assign(Source: TPersistent);
begin
  if Source is TCustomDirectionsRenderer then
  begin
    Draggable := TCustomDirectionsRenderer(Source).Draggable;
    MarkerOptions.Assign(TCustomDirectionsRenderer(Source).MarkerOptions);
    PreserveViewport := TCustomDirectionsRenderer(Source).PreserveViewport;
    SuppressBicyclingLayer := TCustomDirectionsRenderer(Source).SuppressBicyclingLayer;
    SuppressInfoWindows := TCustomDirectionsRenderer(Source).SuppressInfoWindows;
    SuppressMarkers := TCustomDirectionsRenderer(Source).SuppressMarkers;
    SuppressPolylines := TCustomDirectionsRenderer(Source).SuppressPolylines;
  end
  else inherited;
end;

constructor TCustomDirectionsRenderer.Create(aOwner: TObject);
begin
  FDraggable := False;
  FMarkerOptions := TMarkerOptions.Create(Self);
  FMarkerOptions.OnChange := OnMarkerOptionsChange;
  FPreserveViewport := False;
  FSuppressBicyclingLayer := False;
  FSuppressInfoWindows := False;
  FSuppressMarkers := False;
  FSuppressPolylines := False;
  CreatePolylineOptions;
end;

destructor TCustomDirectionsRenderer.Destroy;
begin
  if Assigned(FMarkerOptions) then FreeAndNil(FMarkerOptions);

  inherited;
end;

procedure TCustomDirectionsRenderer.OnMarkerOptionsChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.OnPolylineOptionsChange(Sender: TObject);
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.SetDraggable(const Value: Boolean);
begin
  if FDraggable = Value then Exit;

  FDraggable := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.SetPreserveViewport(const Value: Boolean);
begin
  if FPreserveViewport = Value then Exit;

  FPreserveViewport := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.SetSuppressBicyclingLayer(const Value: Boolean);
begin
  if FSuppressBicyclingLayer = Value then Exit;

  FSuppressBicyclingLayer := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.SetSuppressInfoWindows(const Value: Boolean);
begin
  if FSuppressInfoWindows = Value then Exit;

  FSuppressInfoWindows := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.SetSuppressMarkers(const Value: Boolean);
begin
  if FSuppressMarkers = Value then Exit;

  FSuppressMarkers := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TCustomDirectionsRenderer.SetSuppressPolylines(const Value: Boolean);
begin
  if FSuppressPolylines = Value then Exit;

  FSuppressPolylines := Value;
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ TCustomDirectionsResult }

procedure TCustomDirectionsResult.Assign(Source: TObject);
begin
  if Source is TCustomDirectionsResult then
  begin
    FRoutes.Assign(TCustomDirectionsResult(Source).FRoutes);
    FXMLData.Assign(TCustomDirectionsResult(Source).FXMLData);
    FStatus := TCustomDirectionsResult(Source).FStatus;
    FFromTo := TCustomDirectionsResult(Source).FFromTo;
  end;
end;

constructor TCustomDirectionsResult.Create(aOwner: TCustomGMDirection; Index: Integer);
begin
  FRoutes := TObjectList.Create;
  FXMLData := TStringList.Create;
  FXMLData.OnChange := OnXMLChange;
  FOwner := aOwner;
  FIndex := Index;

  CreateDirectionsRenderObject;
end;

destructor TCustomDirectionsResult.Destroy;
begin
  if Assigned(FRoutes) then FreeAndNil(FRoutes);
  if Assigned(FXMLData) then FreeAndNil(FXMLData);

  inherited;
end;

function TCustomDirectionsResult.GetCount: Integer;
begin
  Result := FRoutes.Count;
end;

function TCustomDirectionsResult.GetRoutes(Index: Integer): TDirectionsRoute;
begin
  Result := nil;
  if Assigned(FRoutes[Index]) then
    Result := TDirectionsRoute(FRoutes[Index]);
end;

procedure TCustomDirectionsResult.OnDirectionsRenderChange(Sender: TObject);
const
  StrParams = '%s,%s,%s';
var
  Params: string;
begin
  if not Assigned(FOwner) then Exit;

  Params := Format(StrParams, [
                  DirectionsRenderToStr,
                  IntToStr(FOwner.IdxList),
                  IntToStr(FIndex)
                  ]);

  FOwner.ExecuteScript('DirectionsSetDirRenderOptions', Params);
end;

procedure TCustomDirectionsResult.OnXMLChange(Sender: TObject);
var
  XML: IXMLDocument;

  procedure ParseNodes(Node: IXMLNode);
    procedure GetLatLng(LatLng: TLatLng; Node: IXMLNode);
    begin
      while Assigned(Node) do
      begin
        if SameText(Node.NodeName, LBL_D_LAT) then
          LatLng.Lat := LatLng.StringToReal(Node.NodeValue);

        if SameText(Node.NodeName, LBL_D_LNG) then
          LatLng.Lng := LatLng.StringToReal(Node.NodeValue);

        Node := Node.NextSibling;
      end;
    end;

    procedure GetLatLngBounds(LatLngBounds: TLatLngBounds; Node: IXMLNode);
    begin
      while Assigned(Node) do
      begin
        if SameText(Node.NodeName, LBL_D_SOUTHWEST) and (Node.ChildNodes.Count = 2) then
          GetLatLng(LatLngBounds.SW, Node.ChildNodes.First);

        if SameText(Node.NodeName, LBL_D_NORTHEAST) and (Node.ChildNodes.Count = 2) then
          GetLatLng(LatLngBounds.NE, Node.ChildNodes.First);

        Node := Node.NextSibling;
      end;
    end;

    function GetADateTime(Value: string): TDateTime;
    var
      L: TStringList;
      D,M,Y,H,N,S: Integer;
    begin
      L := TStringList.Create;
      try
        L.CommaText := Value;
        Result := EncodeDateTime(1970,1,1,0,0,0,0);
        if L.Count = 6 then
        begin
          if TryStrToInt(L[0], D) and TryStrToInt(L[1], M) and TryStrToInt(L[2], Y) and
             TryStrToInt(L[3], H) and TryStrToInt(L[4], N) and TryStrToInt(L[5], S) then
            Result := EncodeDateTime(Y,M,D,H,N,S,0);
        end;
      finally
        FreeAndNil(L);
      end;
    end;

    procedure GetTTime(Time: TTimeClass; Node: IXMLNode);
    begin
      while Assigned(Node) do
      begin
        // ES: etiqueta "text" (sólo una)   // EN: "text" tag (only one)
        if SameText(Node.NodeName, LBL_D_TEXT) then Time.FText := Node.NodeValue;

        // ES: etiqueta "time_zone" (sólo una)   // EN: "time_zone" tag (only one)
        if SameText(Node.NodeName, LBL_D_TIMEZONE) then Time.FTimeZone := Node.NodeValue;

        // ES: etiqueta "value" (sólo una)   // EN: "value" tag (only one)
        if SameText(Node.NodeName, LBL_D_VALUE) then Time.FValue := GetADateTime(Node.NodeValue);

        Node := Node.NextSibling;
      end;
    end;

    function ParseRouteNode(Node: IXMLNode): TDirectionsRoute;
      function ParseLegNode(Node: IXMLNode): TDirectionsLeg;
        procedure GetDuration(Duration: TDuration; Node: IXMLNode);
        begin
          while Assigned(Node) do
          begin
            if SameText(Node.NodeName, LBL_D_TEXT) then Duration.FText := Node.NodeValue;
            if SameText(Node.NodeName, LBL_D_VALUE) then Duration.FValue := Node.NodeValue;

            Node := Node.NextSibling;
          end;
        end;
        procedure GetDistance(Distance: TDistance; Node: IXMLNode);
        begin
          while Assigned(Node) do
          begin
            if SameText(Node.NodeName, LBL_D_TEXT) then Distance.FText := Node.NodeValue;
            if SameText(Node.NodeName, LBL_D_VALUE) then Distance.FValue := Node.NodeValue;

            Node := Node.NextSibling;
          end;
        end;

        function ParseStepNode(Node: IXMLNode): TDirectionsStep;
          procedure ParseTransit(Transit: TTransitDetails; Node: IXMLNode);
            procedure GetTransitStop(TStop: TTransitStop; Node: IXMLNode);
            begin
              while Assigned(Node) do
              begin
                // ES: etiqueta "location" (sólo una)   // EN: "location" tag (only one)
                if SameText(Node.NodeName, LBL_D_LOCATION) and (Node.ChildNodes.Count = 2) then
                  GetLatLng(TStop.Location, Node.ChildNodes.First);

                // ES: etiqueta "name" (sólo una)   // EN: "name" tag (only one)
                if SameText(Node.NodeName, LBL_D_NAME) then TStop.FName := Node.NodeValue;

                Node := Node.NextSibling;
              end;
            end;
            procedure GetTransitLine(TLine: TTransitLine; Node: IXMLNode);
              procedure GetTransitVehicle(TVehicle: TTransitVehicle; Node: IXMLNode);
              begin
                while Assigned(Node) do
                begin
                  // ES: etiqueta "icon" (sólo una)   // EN: "icon" tag (only one)
                  if SameText(Node.NodeName, LBL_D_ICON) then TVehicle.FIcon := Node.NodeValue;

                  // ES: etiqueta "local_icon" (sólo una)   // EN: "local_icon" tag (only one)
                  if SameText(Node.NodeName, LBL_D_LOCALICON) then TVehicle.FLocalIcon := Node.NodeValue;

                  // ES: etiqueta "name" (sólo una)   // EN: "name" tag (only one)
                  if SameText(Node.NodeName, LBL_D_NAME) then TVehicle.FName := Node.NodeValue;

                  // ES: etiqueta "type" (sólo una)   // EN: "type" tag (only one)
                  if SameText(Node.NodeName, LBL_D_TYPE) then TVehicle.FVehicleType := TCustomTransform.StrToVehicleType(Node.NodeValue);

                  Node := Node.NextSibling;
                end;
              end;
              function GetTransitAgency(Node: IXMLNode): TTransitAgency;
              begin
                Result := TTransitAgency.Create;

                while Assigned(Node) do
                begin
                  // ES: etiqueta "name" (sólo una)   // EN: "name" tag (only one)
                  if SameText(Node.NodeName, LBL_D_NAME) then Result.FName := Node.NodeValue;

                  // ES: etiqueta "phone" (sólo una)   // EN: "phone" tag (only one)
                  if SameText(Node.NodeName, LBL_D_PHONE) then Result.FPhone := Node.NodeValue;

                  // ES: etiqueta "url" (sólo una)   // EN: "url" tag (only one)
                  if SameText(Node.NodeName, LBL_D_URL) then Result.FUrl := Node.NodeValue;

                  Node := Node.NextSibling;
                end;
              end;
            begin
              while Assigned(Node) do
              begin
                // ES: etiqueta "color" (sólo una)   // EN: "color" tag (only one)
                if SameText(Node.NodeName, LBL_D_COLOR) then TLine.FColor := Node.NodeValue;

                // ES: etiqueta "icon" (sólo una)   // EN: "icon" tag (only one)
                if SameText(Node.NodeName, LBL_D_ICON) then TLine.FIcon := Node.NodeValue;

                // ES: etiqueta "name" (sólo una)   // EN: "name" tag (only one)
                if SameText(Node.NodeName, LBL_D_NAME) then TLine.FName := Node.NodeValue;

                // ES: etiqueta "short_name" (sólo una)   // EN: "short_name" tag (only one)
                if SameText(Node.NodeName, LBL_D_SHORTNAME) then TLine.FShortName := Node.NodeValue;

                // ES: etiqueta "text_color" (sólo una)   // EN: "text_color" tag (only one)
                if SameText(Node.NodeName, LBL_D_TEXTCOLOR) then TLine.FTextColor := Node.NodeValue;

                // ES: etiqueta "url" (sólo una)   // EN: "url" tag (only one)
                if SameText(Node.NodeName, LBL_D_URL) then TLine.FUrl := Node.NodeValue;

                // ES: etiqueta "vehicle" (sólo una)   // EN: "vehicle" tag (only one)
                if SameText(Node.NodeName, LBL_D_VEHICLE) and (Node.ChildNodes.Count > 0) then
                  GetTransitVehicle(TLine.FVehicle, Node.ChildNodes.First);

                // ES: etiqueta "agencies" (ninguna, una o varias)  // EN: "agencies" (none, one or more)
                if SameText(Node.NodeName, LBL_D_AGENCIES) and (Node.ChildNodes.Count > 0) then
                  TLine.FAgencie.Add(GetTransitAgency(Node.ChildNodes.First));

                Node := Node.NextSibling;
              end;
            end;
          begin
            while Assigned(Node) do
            begin
              // ES: etiqueta "arrival_stop" (sólo una)   // EN: "arrival_stop" tag (only one)
              if SameText(Node.NodeName, LBL_D_ARRIVALSTOP) and (Node.ChildNodes.Count > 0) then
                GetTransitStop(Transit.FArribalStop, Node.ChildNodes.First);

              // ES: etiqueta "arrival_time" (sólo una)   // EN: "arrival_time" tag (only one)
              if SameText(Node.NodeName, LBL_D_ARRIVALTIME) and (Node.ChildNodes.Count > 0) then
                GetTTime(Transit.FArribalTime, Node.ChildNodes.First);

              // ES: etiqueta "departure_stop" (sólo una)   // EN: "departure_stop" tag (only one)
              if SameText(Node.NodeName, LBL_D_DEPARTURESTOP) and (Node.ChildNodes.Count > 0) then
                GetTransitStop(Transit.FDepartureStop, Node.ChildNodes.First);

              // ES: etiqueta "departure_time" (sólo una)   // EN: "departure_time" tag (only one)
              if SameText(Node.NodeName, LBL_D_DEPARTURETIME) and (Node.ChildNodes.Count > 0) then
                GetTTime(Transit.FDepartureTime, Node.ChildNodes.First);

              // ES: etiqueta "headsign" (sólo una)   // EN: "headsign" tag (only one)
              if SameText(Node.NodeName, LBL_D_HEADSIGN) then Transit.FHeadsign := Node.NodeValue;

              // ES: etiqueta "headway" (sólo una)   // EN: "headway" tag (only one)
              if SameText(Node.NodeName, LBL_D_HEADWAY) then Transit.FHeadway := Node.NodeValue;

              // ES: etiqueta "num_stops" (sólo una)   // EN: "num_stops" tag (only one)
              if SameText(Node.NodeName, LBL_D_NUMSTOPS) then Transit.FNumStops := Node.NodeValue;

              // ES: etiqueta "line" (sólo una)   // EN: "line" tag (only one)
              if SameText(Node.NodeName, LBL_D_LINE) and (Node.ChildNodes.Count > 0) then
                GetTransitLine(Transit.FLine, Node.ChildNodes.First);

              Node := Node.NextSibling;
            end;
          end;
        var
          LL: TLatLng;
        begin
          Result := TDirectionsStep.Create;
          while Assigned(Node) do
          begin
            // ES: etiqueta "distance" (sólo una)   // EN: "distance" tag (only one)
            if SameText(Node.NodeName, LBL_D_DISTANCE) and (Node.ChildNodes.Count = 2) then
              GetDistance(Result.FDistance, Node.ChildNodes.First);

            // ES: etiqueta "duration" (sólo una)   // EN: "duration" tag (only one)
            if SameText(Node.NodeName, LBL_D_DURATION) and (Node.ChildNodes.Count = 2) then
              GetDuration(Result.FDuration, Node.ChildNodes.First);

            // ES: etiqueta "end_location" (sólo una)   // EN: "end_location" tag (only one)
            if SameText(Node.NodeName, LBL_D_ENDLOCATION) and (Node.ChildNodes.Count = 2) then
              GetLatLng(Result.FEndLocation, Node.ChildNodes.First);

            // ES: etiqueta "start_location" (sólo una)   // EN: "start_location" tag (only one)
            if SameText(Node.NodeName, LBL_D_STARTLOCATION) and (Node.ChildNodes.Count = 2) then
              GetLatLng(Result.FStartLocation, Node.ChildNodes.First);

            // ES: etiqueta "instructions" (sólo una)   // EN: "instructions" tag (only one)
            if SameText(Node.NodeName, LBL_D_INSTRUCTIONS) then Result.FInstructions := Node.NodeValue;

            // ES: etiqueta "path" (ninguna, una o varias)   // EN: "path" tag (ninguna, una o varias)
            if SameText(Node.NodeName, LBL_D_PATH) and (Node.ChildNodes.Count = 2) then
            begin
              LL := TLatLng.Create;
              GetLatLng(LL, Node.ChildNodes.First);
              Result.FPath.Add(LL);
            end;

            // ES: etiqueta "steps" (sólo una)  // EN: "steps" (only one)
            if SameText(Node.NodeName, LBL_D_STEPS) and (Node.ChildNodes.Count > 0) then
            begin
              Result.FSteps := TDirectionsStep.Create;
              Result.FSteps.Assign(ParseStepNode(Node.ChildNodes.First));
            end;

            // ES: etiqueta "travel_mode" (sólo una)   // EN: "travel_mode" tag (only one)
            if SameText(Node.NodeName, LBL_D_TRAVELMODE) then Result.FTravelMode := TCustomTransform.StrToTravelMode(Node.NodeValue);

            // ES: etiqueta "transit" (ninguna, una o varias)  // EN: "transit" (none, one or more)
            if SameText(Node.NodeName, LBL_D_TRANSIT) and (Node.ChildNodes.Count > 0) then
              ParseTransit(Result.FTransit, Node.ChildNodes.First);

            Node := Node.NextSibling;
          end;
        end;
      var
        LL: TLatLng;
      begin
        Result := TDirectionsLeg.Create;

        while Assigned(Node) do
        begin
          // ES: etiqueta "arrival_time" (sólo una)   // EN: "arrival_time" tag (only one)
          if SameText(Node.NodeName, LBL_D_ARRIVALTIME) and (Node.ChildNodes.Count = 2) then
            GetTTime(Result.FArrivalTime, Node.ChildNodes.First);

          // ES: etiqueta "departure_time" (sólo una)   // EN: "departure_time" tag (only one)
          if SameText(Node.NodeName, LBL_D_DEPARTURETIME) and (Node.ChildNodes.Count = 2) then
            GetTTime(Result.FDepartureTime, Node.ChildNodes.First);

          // ES: etiqueta "distance" (sólo una)   // EN: "distance" tag (only one)
          if SameText(Node.NodeName, LBL_D_DISTANCE) and (Node.ChildNodes.Count = 2) then
            GetDistance(Result.FDistance, Node.ChildNodes.First);

          // ES: etiqueta "duration" (sólo una)   // EN: "duration" tag (only one)
          if SameText(Node.NodeName, LBL_D_DURATION) and (Node.ChildNodes.Count = 2) then
            GetDuration(Result.FDuration, Node.ChildNodes.First);

          // ES: etiqueta "end_address" (sólo una)   // EN: "end_address" tag (only one)
          if SameText(Node.NodeName, LBL_D_ENDADDRESS) then Result.FEndAddress := Node.NodeValue;

          // ES: etiqueta "start_address" (sólo una)   // EN: "start_address" tag (only one)
          if SameText(Node.NodeName, LBL_D_STARTADDRESS) then Result.FStartAddress := Node.NodeValue;

          // ES: etiqueta "end_location" (sólo una)   // EN: "end_location" tag (only one)
          if SameText(Node.NodeName, LBL_D_ENDLOCATION) and (Node.ChildNodes.Count = 2) then
            GetLatLng(Result.FEndLocation, Node.ChildNodes.First);

          // ES: etiqueta "start_location" (sólo una)   // EN: "start_location" tag (only one)
          if SameText(Node.NodeName, LBL_D_STARTLOCATION) and (Node.ChildNodes.Count = 2) then
            GetLatLng(Result.FStartLocation, Node.ChildNodes.First);

          // ES: etiqueta "via_waypoints" (ninguna, una o varias)   // EN: "via_waypoints" tag (ninguna, una o varias)
          if SameText(Node.NodeName, LBL_D_VIAWAYPOINTS) and (Node.ChildNodes.Count = 2) then
          begin
            LL := TLatLng.Create;
            GetLatLng(LL, Node.ChildNodes.First);
            Result.FViaWaypoints.Add(LL);
          end;

          // ES: etiqueta "step" (ninguna, una o varias)  // EN: "step" (none, one or more)
          if SameText(Node.NodeName, LBL_D_STEP) and (Node.ChildNodes.Count > 0) then
            Result.FStep.Add(ParseStepNode(Node.ChildNodes.First));

          Node := Node.NextSibling;
        end;
      end;
    var
      LL: TLatLng;
    begin
      Result := TDirectionsRoute.Create;

      while Assigned(Node) do
      begin
        // ES: etiqueta "summary" (sólo una)   // EN: "summary" tag (only one)
        if SameText(Node.NodeName, LBL_D_SUMMARY) then Result.FSumary := Node.NodeValue;

        // ES: etiqueta "copyrights" (sólo una)   // EN: "copyrights" tag (only one)
        if SameText(Node.NodeName, LBL_D_COPYRIGHTS) then Result.FCopyrights := Node.NodeValue;

        // ES: etiqueta "bounds" (sólo una)   // EN: "bounds" tag (only one)
        if SameText(Node.NodeName, LBL_D_BOUNDS) and (Node.ChildNodes.Count = 2) then
          GetLatLngBounds(Result.Bounds, Node.ChildNodes.First);

        // ES: etiqueta "warning" (ninguna, una o varias)   // EN: "warning" tag (ninguna, una o varias)
        if SameText(Node.NodeName, LBL_D_WARNING) then Result.FWarning.Add(Node.NodeValue);

        // ES: etiqueta "waypoint_order" (ninguna, una o varias)   // EN: "waypoint_order" tag (ninguna, una o varias)
        if SameText(Node.NodeName, LBL_D_WAYPOINTORDER) then Result.FWaypointOrder.Add(Node.NodeValue);

        // ES: etiqueta "overview_path" (ninguna, una o varias)   // EN: "overview_path" tag (ninguna, una o varias)
        if SameText(Node.NodeName, LBL_D_OVERVIEWPATH) and (Node.ChildNodes.Count = 2) then
        begin
          LL := TLatLng.Create;
          GetLatLng(LL, Node.ChildNodes.First);
          Result.FOverviewPath.Add(LL);
        end;

        // ES: etiqueta "leg" (ninguna, una o varias)  // EN: "leg" (none, one or more)
        if SameText(Node.NodeName, LBL_D_LEG) and (Node.ChildNodes.Count > 0) then
          Result.FLeg.Add(ParseLegNode(Node.ChildNodes.First));

        Node := Node.NextSibling;
      end;
    end;
  begin
    // ES: nos posicionamos en "DirectionsResponse" // EN: go to "DirectionsResponse" tag
    while Assigned(Node) and not SameText(Node.NodeName, LBL_D_DIRECTIONSRESPONSE) do
      Node := Node.NextSibling;

    if not Assigned(Node) or (Node.ChildNodes.Count = 0) then Exit;
    Node := Node.ChildNodes.First;

    while Assigned(Node) do
    begin
      // ES: etiqueta "status" (sólo una)   // EN: "status" tag (only one)
      if SameText(Node.NodeName, LBL_D_STATUS) then
        FStatus := TCustomTransform.StrToDirectionsStatus(Node.NodeValue);

      // ES: etiqueta "route" (ninguna, una o varias)  // EN: "route" (none, one or more)
      if SameText(Node.NodeName, LBL_D_ROUTE) and (Node.ChildNodes.Count > 0) then
        FRoutes.Add(ParseRouteNode(Node.ChildNodes.First));

      Node := Node.NextSibling;
    end;
  end;
begin
  if FXMLData.Text = '' then Exit;

  FRoutes.Clear;
  {$IFDEF DELPHI2010}
  XML := LoadXMLData(FXMLData.Text);
  {$ELSE}
  XML := LoadXMLData(AnsiToUtf8(FXMLData.Text));
  {$ENDIF}
  try
    XML.Active := True;

    ParseNodes(XML.ChildNodes.First);
  finally
    XML := nil;
  end;
end;

procedure TCustomDirectionsResult.SetFromTo(Value: string);
begin
  FFromTo := Value;
end;

procedure TCustomDirectionsResult.ShowRoute(RouteIndex: Integer; HiddeOthers: Boolean);
const
  StrParams = '%d,%d,%d,%s';
begin
  if RouteIndex >= Count then
  begin
    if Assigned(FOwner) then
      raise Exception.Create(GetTranslateText('Índice fuera de rango', FOwner.Language))
    else
      raise Exception.Create(GetTranslateText('Índice fuera de rango', English));
  end;

  if Assigned(FOwner) then
    FOwner.ExecuteScript('DirectionsShowRoute', Format(StrParams, [FOwner.IdxList, FIndex, RouteIndex, LowerCase(TCustomTransform.GMBoolToStr(HiddeOthers, True))]));
end;

{ TDirectionsLeg }

procedure TDirectionsLeg.Assign(Source: TObject);
begin
  if Source is TDirectionsLeg then
  begin
    FArrivalTime.Assign(TDirectionsLeg(Source).ArrivalTime);
    FDepartureTime.Assign(TDirectionsLeg(Source).DepartureTime);
    FDistance.Assign(TDirectionsLeg(Source).Distance);
    FDuration.Assign(TDirectionsLeg(Source).Duration);
    FEndLocation.Assign(TDirectionsLeg(Source).EndLocation);
    FStartLocation.Assign(TDirectionsLeg(Source).StartLocation);
    FViaWaypoints.Assign(TDirectionsLeg(Source).FViaWaypoints);
    FStep.Assign(TDirectionsLeg(Source).FStep);
    FEndAddress := TDirectionsLeg(Source).EndAddress;
    FStartAddress := TDirectionsLeg(Source).StartAddress;
  end;
end;

constructor TDirectionsLeg.Create;
begin
  FArrivalTime := TTimeClass.Create;
  FDepartureTime := TTimeClass.Create;
  FDistance := TDistance.Create;
  FDuration := TDuration.Create;
  FEndAddress := '';
  FStartAddress := '';
  FEndLocation := TLatLng.Create;
  FStartLocation := TLatLng.Create;
  FViaWaypoints := TObjectList.Create;
  FStep := TObjectList.Create;
end;

destructor TDirectionsLeg.Destroy;
begin
  if Assigned(FArrivalTime) then FreeAndNil(FArrivalTime);
  if Assigned(FDepartureTime) then FreeAndNil(FDepartureTime);
  if Assigned(FDistance) then FreeAndNil(FDistance);
  if Assigned(FDuration) then FreeAndNil(FDuration);
  if Assigned(FEndLocation) then FreeAndNil(FEndLocation);
  if Assigned(FStartLocation) then FreeAndNil(FStartLocation);
  if Assigned(FViaWaypoints) then FreeAndNil(FViaWaypoints);
  if Assigned(FStep) then FreeAndNil(FStep);

  inherited;
end;

function TDirectionsLeg.GetCountStep: Integer;
begin
  Result := FStep.Count;
end;

function TDirectionsLeg.GetCountViaWaypoints: Integer;
begin
  Result := FViaWaypoints.Count;
end;

function TDirectionsLeg.GetStep(Index: Integer): TDirectionsStep;
begin
  Result := nil;
  if Assigned(FStep[Index]) then
    Result := TDirectionsStep(FStep[Index]);
end;

function TDirectionsLeg.GetViaWaypoints(Index: Integer): TLatLng;
begin
  Result := nil;
  if Assigned(FViaWaypoints[Index]) then
    Result := TLatLng(FViaWaypoints[Index]);
end;

end.

