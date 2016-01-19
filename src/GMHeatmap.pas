{
GMHeatmap unit

  ES: contiene las clases bases necesarias para mostrar mapas de calor en un
      mapa de Google Maps mediante el componente TGMHeatmap
  EN: includes the base classes needed to show head maps on Google Map map using
      the component TGMHeatmap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, linkarlo a un TGMMap y poner los
      datos a mostrar. Añadir una entrada en el registro de Windows en la clave
      HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION\MiAplicacion.exe = (DWORD) xxxxxx
      donde xxxxxx es un valor según la tabla http://msdn.microsoft.com/en-us/library/ie/ee330730%28v=vs.85%29.aspx#browser_emulation
  EN: put the component into a form, link to a TGMMap and put the data to
      show. Add a registry entry at the key
      HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION\MiAplicacion.exe = (DWORD) xxxxxx
      where xxxxxx is a value according to this table http://msdn.microsoft.com/en-us/library/ie/ee330730%28v=vs.85%29.aspx#browser_emulation
=========================================================================
History:

ver 1.3.0
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
unit GMHeatmap;

{$I ..\gmlib.inc}

interface

uses
  {$IFDEF DELPHIXE2}
  System.Classes,
  {$ELSE}
  Classes,
  {$ENDIF}

  GMMap, GMClasses, GMConstants;

type
  {*------------------------------------------------------------------------------
    Base class for heat map.
    More information at https://developers.google.com/maps/documentation/javascript/reference#HeatmapLayer
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para los mapas de calor.
    Más información en https://developers.google.com/maps/documentation/javascript/reference#HeatmapLayer
  -------------------------------------------------------------------------------}
  TGMHeatmap = class(TGMObjects, ILinePoint)
  private
    FOpacity: Real;
    FRadius: Integer;
    FDissipating: Boolean;
    FShow: Boolean;
    FMaxIntensity: Real;
    FData: TLinePoints;
    FGradient: TGradient;
    function GetItems(I: Integer): TLinePoint;
    procedure SetShow(const Value: Boolean);
    function GetCount: Integer;
    procedure SetDissipating(const Value: Boolean);
    procedure SetMaxIntensity(const Value: Real);
    procedure SetOpacity(const Value: Real);
    procedure SetRadius(const Value: Integer);
    procedure SetGradient(const Value: TGradient);
  protected
    procedure HideHeapmap; virtual;
    procedure ShowHeapmap; virtual;

    function PolylineToStr: string;

    function GetAPIUrl: string; override;
    procedure DeleteMapObjects; override;
    procedure ShowElements; override;
    procedure EventFired(EventType: TEventType; Params: array of const); override;

    { ILinePoint }
    procedure LinePointChanged;
  public
    constructor Create(aOwner: TComponent); override;
    destructor Destroy; override;

    procedure LoadFromCSV(LatColumn, LngColumn: Integer; FileName: string;
      Delimiter: Char = ','; DeleteBeforeLoad: Boolean = True;
      WithRownTitle: Boolean = True);

    procedure Clear;

    property Count: Integer read GetCount;
    property Items[I: Integer]: TLinePoint read GetItems; default;
  published
    property Show: Boolean read FShow write SetShow default False;
    property Data: TLinePoints read FData write FData;
    property Dissipating: Boolean read FDissipating write SetDissipating default False;
    property MaxIntensity: Real read FMaxIntensity write SetMaxIntensity;
    property Opacity: Real read FOpacity write SetOpacity;
    property Radius: Integer read FRadius write SetRadius default 15;
    property Gradient: TGradient read FGradient write SetGradient default grHot;
  end;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils,
  {$ELSE}
  SysUtils,
  {$ENDIF}

  Lang, GMFunctions;

{ TGMHeatmap }

procedure TGMHeatmap.Clear;
begin
  FData.Clear;
end;

constructor TGMHeatmap.Create(aOwner: TComponent);
begin
  inherited;

  FData := TLinePoints.Create(Self, TLinePoint);
  FDissipating := False;
  FMaxIntensity := 0;
  FOpacity := 0.6;
  FRadius := 15;
  FGradient := grHot;
end;

procedure TGMHeatmap.DeleteMapObjects;
begin
  //inherited;
end;

destructor TGMHeatmap.Destroy;
begin
  if Assigned(FData) then FreeAndNil(FData);

  inherited;
end;

procedure TGMHeatmap.EventFired(EventType: TEventType;
  Params: array of const);
begin
  //inherited;
end;

function TGMHeatmap.GetAPIUrl: string;
begin
  Result := 'https://developers.google.com/maps/documentation/javascript/reference#HeatmapLayer';
end;

function TGMHeatmap.GetCount: Integer;
begin
  Result := FData.Count;
end;

function TGMHeatmap.GetItems(I: Integer): TLinePoint;
begin
  Result := TLinePoint(FData[i]);
end;

procedure TGMHeatmap.HideHeapmap;
begin
  ExecuteScript('HeapmapHide', IntToStr(IdxList));
end;

procedure TGMHeatmap.LinePointChanged;
begin
  Show := False;
end;

procedure TGMHeatmap.LoadFromCSV(LatColumn, LngColumn: Integer;
  FileName: string; Delimiter: Char; DeleteBeforeLoad, WithRownTitle: Boolean);
var
  L1, L2: TStringList;
  i: Integer;
  Point: TLinePoint;
begin
  if not FileExists(FileName) then
    raise Exception.Create(GetTranslateText('El fichero no existe', Language));

  if DeleteBeforeLoad then Clear;

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

      Point := FData.Add;
      Point.Lat := Point.StringToReal(L2[LatColumn]);
      Point.Lng := Point.StringToReal(L2[LngColumn]);
    end;

    if FShow then ShowHeapmap;
  finally
    if Assigned(L1) then FreeAndNil(L1);
    if Assigned(L2) then FreeAndNil(L2);
  end;
end;

function TGMHeatmap.PolylineToStr: string;
var
  Points: array of TLatLng;
  i: Integer;
begin
  Result := '';

  if not Assigned(Map) then Exit;

  SetLength(Points, Count);
  for i := 0 to FData.Count - 1 do
    Points[i] := FData[i].GetLatLng;
  Result := TGMGenFunc.PointsToStr(Points, GetMapPrecision);
end;

procedure TGMHeatmap.SetDissipating(const Value: Boolean);
begin
  if FDissipating = Value then Exit;

  FDissipating := Value;
  Show := False;
end;

procedure TGMHeatmap.SetGradient(const Value: TGradient);
begin
  if FGradient = Value then Exit;

  FGradient := Value;
  Show := False;
end;

procedure TGMHeatmap.SetMaxIntensity(const Value: Real);
begin
  if FMaxIntensity = Value then Exit;

  FMaxIntensity := Value;
  Show := False;
end;

procedure TGMHeatmap.SetOpacity(const Value: Real);
begin
  if FOpacity = Value then Exit;

  FOpacity := Value;
  if FOpacity < 0 then FOpacity := 0;
  if FOpacity > 1 then FOpacity := 1;
  FOpacity := Trunc(FOpacity * 100) / 100;
  Show := False;
end;

procedure TGMHeatmap.SetRadius(const Value: Integer);
begin
  if FRadius = Value then Exit;

  FRadius := Value;
  Show := False;
end;

procedure TGMHeatmap.SetShow(const Value: Boolean);
begin
  if FShow = Value then Exit;

  FShow := Value;
  if FShow then ShowHeapmap
  else HideHeapmap;
end;

procedure TGMHeatmap.ShowElements;
begin
  //inherited;
end;

procedure TGMHeatmap.ShowHeapmap;
const
  StrParams = '%s,%s,%s,%s,%s,%s';
var
  Params: string;
begin
  if csDesigning in ComponentState then Exit;

  if not Assigned(Map) then
    raise Exception.Create(GetTranslateText('Mapa no asignado', Language));

  Params := Format(StrParams, [
                  IntToStr(IdxList),
                  QuotedStr(PolylineToStr),
                  LowerCase(TCustomTransform.GMBoolToStr(FDissipating, True)),
                  StringReplace(FloatToStr(FMaxIntensity), ',', '.', [rfReplaceAll]),
                  StringReplace(FloatToStr(FOpacity), ',', '.', [rfReplaceAll]),
                  IntToStr(FRadius),
                  QuotedStr(TCustomTransform.GradientToStr(FGradient))
                  ]);
  ExecuteScript('HeapmapShow', Params);
end;

end.
