{
GMElevation unit

  ES: contiene las clases bases necesarias para calcular elevaciones de terreno
      de un conjunto de LatLng
  EN: includes the base classes needed for calculate a terrain elevations of a
      set of LatLng

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap, establecer
      las lat/lng y ejecutar
  EN: put the component into a form, link to a TGMMap, establish the lat/lng and
      execute
=========================================================================
History:

ver 1.0.0
  ES:
    error: error corregido en TCustomGMElevation.Execute en la 1era búsqeda.
  EN:
    bug: bug fixed into TCustomGMElevation.Execute on the first request.

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey

ver 0.1.8:
  ES- primera versión
  EN- first version
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
  The GMElevation unit includes the base classes needed for calculate a terrain elevations of a set of LatLng.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMElevation contiene las clases bases necesarias para calcular elevaciones de terreno de un conjunto de LatLng.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit GMElevation;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes, System.Contnrs, Data.DB,
  {$ELSE}
  Classes, Contnrs, DB,
  {$ENDIF}
  GMMap, GMClasses, GMConstants, GMMarker, GMPolyline;

type
  {*------------------------------------------------------------------------------
    The result of an ElevationService request.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationResult
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Resultado de una llamada a ElevationService.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationResult
  -------------------------------------------------------------------------------}
  TElevationResult = class
  private
    {*------------------------------------------------------------------------------
      The location of this elevation result.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Ubicación de este resultado de la elevación.
    -------------------------------------------------------------------------------}
    FLocation: TLatLng;
    {*------------------------------------------------------------------------------
      The distance, in meters, between sample points from which the elevation was interpolated.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Distancia, en metros, entre los puntos de muestreo de la elevación interpolada.
    -------------------------------------------------------------------------------}
    FResolution: Real;
    {*------------------------------------------------------------------------------
      The elevation of this point on Earth, in meters above sea level.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Elevación del punto terrestre, en metro sobre el nivel del mar.
    -------------------------------------------------------------------------------}
    FElevation: Real;
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

    property Location: TLatLng read FLocation;
    property Elevation: Real read FElevation;
    property Resolution: Real read FResolution;
  end;

  {*------------------------------------------------------------------------------
    Class for elevations collection.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para la colección de elevaciones.
  -------------------------------------------------------------------------------}
  TElevationResults = class
  private
    FElevationResult: TObjectList;
    FStatus: TElevationStatus;
    function GetItems(Index: Integer): TElevationResult;
    function GetCount: Integer;

    procedure ParseElevations(Elevations: string);
    function AddElevationResult(Elevation, Resolution, Lat, Lng: string): Integer;
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
      Deletes all items from the elevations collection.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los elementos de la colección de elevaciones.
    -------------------------------------------------------------------------------}
    procedure Clear;

    {*------------------------------------------------------------------------------
      The status returned by the ElevationService upon completion of an elevation request.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Estado devuelto por ElevationService tras la finalización de una solicitud de elevación.
    -------------------------------------------------------------------------------}
    property Status: TElevationStatus read FStatus;
    {*------------------------------------------------------------------------------
      Elevations list.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de elevaciones.
    -------------------------------------------------------------------------------}
    property Items[Index: Integer]: TElevationResult read GetItems; default;
    {*------------------------------------------------------------------------------
      Count of elevations.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de elevaciones.
    -------------------------------------------------------------------------------}
    property Count: Integer read GetCount;
  end;

  {*------------------------------------------------------------------------------
    Base class for calculating elevations.
    More information at:
    https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationService
    https://developers.google.com/maps/documentation/javascript/elevation
    https://developers.google.com/maps/documentation/elevation/index
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para el cálculo de elevaciones.
    Más información en:
    https://developers.google.com/maps/documentation/javascript/reference?hl=en#ElevationService
    https://developers.google.com/maps/documentation/javascript/elevation
    https://developers.google.com/maps/documentation/elevation/index
  -------------------------------------------------------------------------------}
  TCustomGMElevation = class(TGMObjects, ILinePoint)
  private
    {*------------------------------------------------------------------------------
      The path along which to collect elevation values.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Camino a lo largo del cual recoger el valor de las elevaciones.
    -------------------------------------------------------------------------------}
    FLinePoints: TLinePoints;
    {*------------------------------------------------------------------------------
      The number of equidistant points along the given path for which to retrieve elevation data, including the endpoints. The number of samples must be a value between 2 and 512 inclusive. Valid only for ElevationType = etAlongPath.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Número de puntos equidistantes a lo largo del camino dado para los que recuperar el valor de la elevación, incluido el punto final. El numero de muestras debe ser un valor entre 2 y 512 incluidos. Sólo aplicable a ElevationType = etAlongPath.
    -------------------------------------------------------------------------------}
    FSamples: Integer;
    {*------------------------------------------------------------------------------
      Elevations type search.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Tipo de búsqueda para las elevaciones.
    -------------------------------------------------------------------------------}
    FElevationType: TElevationType;
    {*------------------------------------------------------------------------------
      Search result.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Resultado de la búsqueda.
    -------------------------------------------------------------------------------}
    FElevationResult: TElevationResults;
    function GetCountLinePoints: Integer;
    function GetItems(I: Integer): TLinePoint;
    procedure SetSamples(const Value: Integer);
  protected
    function GetAPIUrl: string; override;
    procedure DeleteMapObjects; override;
    procedure ShowElements; override;
    procedure EventFired(EventType: TEventType; Params: array of const); override;

    { ILinePoint }
    procedure LinePointChanged;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Creates a new LinePoint point.
      @param LatLng The Lat/Lng of the point.
      @return New TLinePoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea un nuevo punto LinePoint.
      @param Lat Latitud/Longitud del punto.
      @return Nuevo TLinePoint.
    -------------------------------------------------------------------------------}
    function AddLatLng(LatLng: TLatLng): TLinePoint; overload;
    {*------------------------------------------------------------------------------
      Creates a new LinePoint point.
      @param Lat Point latitude.
      @param Lng Point longitude.
      @return New TLinePoint.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Crea un nuevo punto LinePoint.
      @param Lat Latitud del punto.
      @param Lng Longitud del punto.
      @return Nuevo TLinePoint.
    -------------------------------------------------------------------------------}
    function AddLatLng(Lat, Lng: Real): TLinePoint; overload;
    {*------------------------------------------------------------------------------
      Adds points from CSV file.
      @param LatColumn Column with latitude.
      @param LngColumn Column with longitude.
      @param FileName CSV file name.
      @param Delimiter Delimiter used into CSV file (usually "," or ";").
      @param DeleteBeforeLoad If true, delete all existing points before load CSV file.
      @param WithRownTitle If true, the first row of CSV file contain the column titles.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Añade puntos desde un archivo CSV.
      @param LatColumn Columna con la latitud.
      @param LngColumn Columna con la longitud.
      @param FileName Nombre del fichero CSV.
      @param Delimiter Delimitador usado en el fichero CSV (usualmente "," o ";").
      @param DeleteBeforeLoad Si true, elimina todos los puntos existentes antes de cargar el archivo CSV.
      @param WithRownTitle Si true, la primera fila del archivo CSV contendrá el título de las columnas.
    -------------------------------------------------------------------------------}
    procedure AddLatLngFromCSV(LatColumn, LngColumn: Integer; FileName: string;
      Delimiter: Char = ','; DeleteBeforeLoad: Boolean = True; WithRownTitle: Boolean = True);
    {*------------------------------------------------------------------------------
      Adds points from DataSet.
      @param DataSet DataSet where get the data.
      @param LatField Field with latitude.
      @param LngField Field with longitude.
      @param DeleteBeforeLoad If true, delete all existing points before load DataSet.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Añade puntos desde un DataSet.
      @param DataSet DataSet de donde obtener los datos.
      @param LatField Campo con la latitud.
      @param LngField Campo con la longitud.
      @param DeleteBeforeLoad Si true, elimina todos los puntos existentes antes de cargar el DataSet.
    -------------------------------------------------------------------------------}
    procedure AddLatLngFromDataSet(DataSet: TDataSet; LatField, LngField: string;
      DeleteBeforeLoad: Boolean = True);
    {*------------------------------------------------------------------------------
      Adds points from TBasePolyline (TPolygon or TPolyline).
      @param Poly TBasePolyline where get the data.
      @param DeleteBeforeLoad If true, delete all existing points before load TBasePolyline.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Añade puntos desde un TBasePolyline (TPolygon o TPolyline).
      @param Poly TBasePolyline de donde obtener los datos.
      @param DeleteBeforeLoad Si true, elimina todos los puntos existentes antes de cargar el TBasePolyline.
    -------------------------------------------------------------------------------}
    procedure AddLatLngFromPoly(Poly: TBasePolyline; DeleteBeforeLoad: Boolean = True); virtual;
    {*------------------------------------------------------------------------------
      Deletes all points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra todos los puntos.
    -------------------------------------------------------------------------------}
    procedure Clear;
    {*------------------------------------------------------------------------------
      Deletes a specified points.
      @param Index Index of the point to delete.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Borra un punto específico.
      @param Index Índice del punto a borrar.
    -------------------------------------------------------------------------------}
    procedure DelLatLng(Index: Integer);

    {*------------------------------------------------------------------------------
      Search the elevations according to the specified parameters.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Busca las elevaciones según los parámetros especificados.
    -------------------------------------------------------------------------------}
    procedure Execute;

    {*------------------------------------------------------------------------------
      Count of points.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Cantidad de puntos.
    -------------------------------------------------------------------------------}
    property CountLinePoints: Integer read GetCountLinePoints;
    {*------------------------------------------------------------------------------
      Array with the collection items.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array con la colección de elementos.
    -------------------------------------------------------------------------------}
    property Items[I: Integer]: TLinePoint read GetItems; default;
    property ElevationResult: TElevationResults read FElevationResult;
  published
    property LinePoints: TLinePoints read FLinePoints write FLinePoints;
    property Samples: Integer read FSamples write SetSamples default 2;
    property ElevationType: TElevationType read FElevationType write FElevationType default etForLocations;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}
  Lang, GMFunctions;

{ TCustomGMElevation }

function TCustomGMElevation.AddLatLng(LatLng: TLatLng): TLinePoint;
begin
  Result := AddLatLng(LatLng.Lat, LatLng.Lng);
end;

function TCustomGMElevation.AddLatLng(Lat, Lng: Real): TLinePoint;
begin
  Result := FLinePoints.Add;
  Result.Lat := Lat;
  Result.Lng := Lng;
end;

procedure TCustomGMElevation.AddLatLngFromCSV(LatColumn, LngColumn: Integer;
  FileName: string; Delimiter: Char; DeleteBeforeLoad, WithRownTitle: Boolean);
var
  L1, L2: TStringList;
  i: Integer;
  Point: TLinePoint;
  Stop: Boolean;
begin
  if not FileExists(FileName) then
    raise Exception.Create(GetTranslateText('El fichero no existe', Language));

  if DeleteBeforeLoad then FLinePoints.Clear;

  L1 := TStringList.Create;
  L2 := TStringList.Create;
  try
    L1.LoadFromFile(FileName);
    if WithRownTitle then L1.Delete(0);

    L2.Delimiter := Delimiter;
    {$IFDEF DELPHI2005}
    L2.StrictDelimiter := True;
    {$ENDIF}

    for i := 0 to L1.Count - 1 do
    begin
      L2.DelimitedText := L1[i];

      if (LatColumn > L2.Count) or (LngColumn > L2.Count) then
        raise Exception.Create(GetTranslateText('El número de columna es incorrecto', Language));

      Point := LinePoints.Add;
      Point.Lat := Point.StringToReal(L2[LatColumn]);
      Point.Lng := Point.StringToReal(L2[LngColumn]);

      Stop := False;
      if Stop then Break;
    end;
  finally
    if Assigned(L1) then FreeAndNil(L1);
    if Assigned(L2) then FreeAndNil(L2);
  end;
end;

procedure TCustomGMElevation.AddLatLngFromDataSet(DataSet: TDataSet; LatField,
  LngField: string; DeleteBeforeLoad: Boolean);
var
  Bkm: TBookmark;
  Point: TLinePoint;
begin
  if not DataSet.Active then DataSet.Open;

  if DeleteBeforeLoad then FLinePoints.Clear;

  DataSet.DisableControls;
  Bkm := DataSet.GetBookmark;
  try
    DataSet.First;
    while not DataSet.Eof do
    begin
      Point := LinePoints.Add;
      Point.Lat := DataSet.FieldByName(LatField).AsFloat;
      Point.Lng := DataSet.FieldByName(LngField).AsFloat;

      DataSet.Next;
    end;
  finally
    DataSet.GotoBookmark(Bkm);
    DataSet.FreeBookmark(Bkm);
    DataSet.EnableControls;
  end;
end;

procedure TCustomGMElevation.AddLatLngFromPoly(Poly: TBasePolyline;
  DeleteBeforeLoad: Boolean);
var
  Point: TLinePoint;
  i: Integer;
begin
  if DeleteBeforeLoad then FLinePoints.Clear;

  for i := 0 to Poly.CountLinePoints - 1 do
  begin
    Point := LinePoints.Add;
    Point.Assign(Poly[i]);
  end;

//  if (Poly is TPolygon) and (Poly.CountLinePoints > 0) then  //<- dependence of framework
//  begin
//    Point := LinePoints.Add;
//    Point.Assign(Poly[0]);
//  end;
end;

procedure TCustomGMElevation.Clear;
begin
  FLinePoints.Clear;
  FElevationResult.Clear;
end;

constructor TCustomGMElevation.Create(aOwner: TComponent);
begin
  inherited;

  FLinePoints := TLinePoints.Create(Self, TLinePoint);
  FSamples := 2;
  FElevationType := etForLocations;
  FElevationResult := TElevationResults.Create;
end;

procedure TCustomGMElevation.DeleteMapObjects;
begin
  inherited;

end;

procedure TCustomGMElevation.DelLatLng(Index: Integer);
begin
  FLinePoints.Delete(Index);
end;

destructor TCustomGMElevation.Destroy;
begin
  if Assigned(FLinePoints) then FreeAndNil(FLinePoints);
  if Assigned(FElevationResult) then FreeAndNil(FElevationResult);

  inherited;
end;

procedure TCustomGMElevation.EventFired(EventType: TEventType;
  Params: array of const);
begin
  inherited;

end;

procedure TCustomGMElevation.Execute;
const
  StrParams = '%s,%s,%s';
var
  Params: string;
  Tmp: string;
  Points: array of TLatLng;
  i: Integer;
begin
  if not Assigned(Map) then
    raise Exception.Create(GetTranslateText('Mapa no asignado', Language));

  SetLength(Points, CountLinePoints);
  for i := 0 to LinePoints.Count - 1 do
    Points[i] := LinePoints[i].GetLatLng;
  Params := Format(StrParams, [
                  QuotedStr(TCustomTransform.ElevationTypeToStr(FElevationType)),
                  QuotedStr(TGMGenFunc.PointsToStr(Points, GetMapPrecision)),
                  IntToStr(Samples)
                  ]);
  ExecuteScript('GetElevations', Params);

  repeat
    TGMGenFunc.ProcessMessages;
  until (GetIntegerField(ElevationsForm, ElevationsFormResponse) = 1);
  ElevationResult.Clear;
  Tmp := GetStringField(ElevationsForm, ElevationsFormStatus);
  ElevationResult.FStatus := TCustomTransform.StrToElevationStatus('es' + Tmp);
  Tmp := GetStringField(ElevationsForm, ElevationsFormElevations);
  ElevationResult.ParseElevations(Tmp);
end;

function TCustomGMElevation.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference#ElevationService';
end;

function TCustomGMElevation.GetCountLinePoints: Integer;
begin
  Result := LinePoints.Count;
end;

function TCustomGMElevation.GetItems(I: Integer): TLinePoint;
begin
  Result := TLinePoint(FLinePoints[i]);
end;

procedure TCustomGMElevation.LinePointChanged;
begin

end;

procedure TCustomGMElevation.SetSamples(const Value: Integer);
begin
  if FSamples = Value then Exit;

  FSamples := Value;
  if FSamples < 2 then FSamples := 2;
  if FSamples > 512 then FSamples := 512;
end;

procedure TCustomGMElevation.ShowElements;
begin
end;

{ TElevationResults }

function TElevationResults.AddElevationResult(Elevation, Resolution, Lat,
  Lng: string): Integer;
var
  ElevRes: TElevationResult;
begin
  ElevRes := TElevationResult.Create;
  ElevRes.FLocation.Lat := ElevRes.FLocation.StringToReal(Lat);
  ElevRes.FLocation.Lng := ElevRes.FLocation.StringToReal(Lng);
  ElevRes.FResolution := ElevRes.FLocation.StringToReal(Resolution);
  ElevRes.FElevation := ElevRes.FLocation.StringToReal(Elevation);
  Result := FElevationResult.Add(ElevRes);
end;

procedure TElevationResults.Clear;
begin
  FStatus := esNO_REQUEST;
  FElevationResult.Clear;
end;

constructor TElevationResults.Create;
begin
  FElevationResult := TObjectList.Create;
end;

destructor TElevationResults.Destroy;
begin
  if Assigned(FElevationResult) then FreeAndNil(FElevationResult);

  inherited;
end;

function TElevationResults.GetCount: Integer;
begin
  Result := FElevationResult.Count;
end;

function TElevationResults.GetItems(Index: Integer): TElevationResult;
begin
  Result := TElevationResult(FElevationResult[Index]);
end;

procedure TElevationResults.ParseElevations(Elevations: string);
var
  T1, T2: TStringList;
  i: Integer;
begin
  T1 := TStringList.Create;
  T2 := TStringList.Create;
  try
    T1.Delimiter := ';';
    T2.Delimiter := '|';
    {$IFDEF DELPHI2005}
    T1.StrictDelimiter := True;
    T2.StrictDelimiter := True;
    {$ENDIF}

    T1.DelimitedText := Elevations;
    for i := 0 to T1.Count - 1 do
    begin
      T2.DelimitedText := T1[i];
      if T2.Count <> 4 then Continue;

      AddElevationResult(T2[0], T2[1], T2[2], T2[3]);
    end;
  finally
    if Assigned(T1) then FreeAndNil(T1);
    if Assigned(T2) then FreeAndNil(T2);
  end;
end;

{ TElevationResult }

constructor TElevationResult.Create;
begin
  FLocation := TLatLng.Create;
  FResolution := 0;
  FElevation := 0;
end;

destructor TElevationResult.Destroy;
begin
  if Assigned(FLocation) then FreeAndNil(FLocation);

  inherited;
end;

end.
