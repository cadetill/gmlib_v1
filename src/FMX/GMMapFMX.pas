{
GMMapFMX unit

  ES: incluye el componente para usar el mapa de Google Maps
  EN: includes the component to use the Google Maps map

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
ES: IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

EN: IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================
Copyright (©) 2012, by Xavier Martinez (cadetill)
web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  The GMMapFMX unit includes the classes that manages the map specialized in a particular browser.
  This browser can be a TChromiumFMX.
  You can de/activate this browser into the gmlib.inc file.
  By default it isn't active.
  HOW TO USE: put the component into a form, link to a browser, activate it and call DoMap method (usually when AfterPageLoaded event is fired with First parameter to True).

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMMapFMX incluye las clases que gestionan el mapa especializados en un determinado navegador.
  Este navegador puede ser un TChromiumFMX.
  Puedes des/activar este navegador desde el archivo gmlib.inc.
  Por defecto no está activo.
  MODO DE USO: poner el componente en el formulario, linkarlo a un navegador, activarlo y ejecutar el método DoMap (usualmente en el evento AfterPageLoaded cuando el parámetro First es True).

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMMapFMX;

{.$DEFINE CHROMIUMFMX}
{$I ..\gmlib.inc}

interface

{$IFDEF CHROMIUMFMX}
uses
  ceflib, cefgui, ceffmx,
  FMX.Types, System.UITypes, FMX.Dialogs, System.Classes, System.SysUtils,

  GMMap, GMFunctionsFMX;

type
  {*------------------------------------------------------------------------------
    Internal class containing the visual properties of Google Maps map.
    This class extends TCustomVisualProp to add BGColor property (into VCL is TColor and into FMX is TAlphaColor).
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase interna que contendrá las propiedades visuales de un mapa de Google Maps.
    Esta clase extiende TCustomVisualProp para añadir la propiedad BGColor (en la VCL es de tipo TColor y en FMX es de tipo TAlphaColor).
  -------------------------------------------------------------------------------}
  TVisualProp = class(TCustomVisualProp)
  private
    FBGColor: TAlphaColor;
  protected
    function GetBckgroundColor: string; override;
  public
    constructor Create; override;

    procedure Assign(Source: TPersistent); override;
  published
    {*------------------------------------------------------------------------------
      Color used for the background of the Map when tiles have not yet loaded.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color usado de fondo del Mapa cuando los mosaicos aun no han sido cargados.
    -------------------------------------------------------------------------------}
    property BGColor: TAlphaColor read FBGColor write FBGColor default clSilver;    // backgroundColor
  end;

  {*------------------------------------------------------------------------------
    Base class for classes that want to access the map using FMX.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para las clases que quieran acceder al mapa mediante FMX.
  -------------------------------------------------------------------------------}
  TCustomGMMapFMX = class(TCustomGMMap)
  private
    {*------------------------------------------------------------------------------
      Visual configuration options.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones de configucación visual.
    -------------------------------------------------------------------------------}
    FVisualProp: TVisualProp; // ES: evento de TWebBrowser - EN: event of TWebBrowser

    // internal variables
    FTimer: TTimer;          // ES: TTimer para el control de eventos - EN: TTimer for events control
  protected
    function VisualPropToStr: string; override;

    procedure SetEnableTimer(State: Boolean); override;
    procedure SetIntervalTimer(Interval: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SaveToJPGFile(FileName: TFileName = ''); override;
  published
    property VisualProp: TVisualProp read FVisualProp write FVisualProp;
  end;

  {*------------------------------------------------------------------------------
    Class to access to Google Maps map specialized for TChromiumFMX browser.
    See the TCustomGMMap class for properties and events description.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para el acceso al mapa de Google Maps especializada para el navegador TChromiumFMX.
    Ver la clase TCustomGMMap para la descripción de las propiedades y eventos.
  -------------------------------------------------------------------------------}
  TGMMapChr = class(TCustomGMMapFMX)
  private
    // internal variables
    OldOnLoadEnd: TOnLoadEnd;
    FTChr: TTimer;
    FStarTime: TDateTime;

    procedure OnTimerChr(Sender: TObject);
    procedure OnLoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
    procedure SetWebBrowser(const Value: TChromiumFMX);
    function GetWebBrowser: TChromiumFMX;
  protected
    procedure BrowserEventsControl; override;
    function ExecuteScript(NameFunct, Params: string): Boolean; override;

    procedure LoadBaseWeb; override;
    procedure LoadBlankPage; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    {*------------------------------------------------------------------------------
      Browser where display the Google Maps map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Navegador donde se mostrará el mapa de Google Maps.
    -------------------------------------------------------------------------------}
    property WebBrowser: TChromiumFMX read GetWebBrowser write SetWebBrowser;
  end;
{$ENDIF}

implementation

{$IFDEF CHROMIUMFMX}
uses
  System.DateUtils,
  WebControlFMX, Lang;

{ TGMMapChr }

procedure TGMMapChr.BrowserEventsControl;
begin
  if not (FWebBrowser is TChromiumFMX) then Exit;

  TChromiumFMX(FWebBrowser).OnLoadEnd := OldOnLoadEnd;

  OldOnLoadEnd := nil;
end;

constructor TGMMapChr.Create(AOwner: TComponent);
begin
  inherited;

  FWC := TWebChromiumFMX.Create(nil);
  OldOnLoadEnd := nil;
  FTChr := TTimer.Create(Self);
  FTChr.Enabled := False;
  FTChr.OnTimer := OnTimerChr;
  FTChr.Interval := 10;
  FStarTime := Now;
end;

destructor TGMMapChr.Destroy;
begin
  if Assigned(FTChr) then FreeAndNil(FTChr);

  inherited;
end;

function TGMMapChr.ExecuteScript(NameFunct, Params: string): Boolean;
const
  Param = '%s(%s)';
begin
  Result := Check;

  if not (FWebBrowser is TChromiumFMX) then Exit;

  if not Result then Exit;

  if TChromiumFMX(FWebBrowser).Browser <> nil then
    TChromiumFMX(FWebBrowser).Browser.MainFrame.ExecuteJavaScript(Format(Param, [NameFunct, Params]), '', 0);

  if MapIsNull then
    raise Exception.Create(GetTranslateText('El mapa todavía no ha sido creado', Language));
end;

function TGMMapChr.GetWebBrowser: TChromiumFMX;
begin
  Result := nil;
  if FWebBrowser is TChromiumFMX then
    Result := TChromiumFMX(FWebBrowser);
end;

procedure TGMMapChr.LoadBaseWeb;
begin
  if not Assigned(FWebBrowser) then Exit;
  if not (FWebBrowser is TChromiumFMX) then Exit;

  // cargamos página inicial
  if Assigned(TChromiumFMX(FWebBrowser).Browser) then
    TChromiumFMX(FWebBrowser).Browser.MainFrame.LoadString(GetBaseHTMLCode, 'http:\\localhost');
end;

procedure TGMMapChr.LoadBlankPage;
begin
  if not (FWebBrowser is TChromiumFMX) then Exit;

  TChromiumFMX(FWebBrowser).Browser.MainFrame.LoadUrl('about:blank');
end;

procedure TGMMapChr.OnLoadEnd(Sender: TObject; const browser: ICefBrowser;
  const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
begin
  if Assigned(OldOnLoadEnd) then OldOnLoadEnd(Sender, browser, frame, httpStatusCode, Result);

  if Assigned(frame) then
  begin
    FDocLoaded := True;
    if Active and Assigned(AfterPageLoaded) then AfterPageLoaded(Self, True);
  end;
end;

procedure TGMMapChr.OnTimerChr(Sender: TObject);
begin
  if Active and Assigned(FWebBrowser) and Assigned(TChromiumFMX(FWebBrowser).Browser) then
  begin
    FTChr.Enabled := False;
    LoadBaseWeb;
  end;

  if Now > IncSecond(FStarTime, 3) then FTChr.Enabled := False;
end;

procedure TGMMapChr.SetWebBrowser(const Value: TChromiumFMX);
begin
  if FWebBrowser = Value then Exit;

  if (Value <> FWebBrowser) and Assigned(FWebBrowser) then
  begin
    TChromiumFMX(FWebBrowser).OnLoadEnd := OldOnLoadEnd;
  end;

  FWebBrowser := Value;
  TWebChromiumFMX(FWC).SetBrowser(TChromiumFMX(FWebBrowser));

  if csDesigning in ComponentState then Exit;

  if Assigned(FWebBrowser) then
  begin
    OldOnLoadEnd := TChromiumFMX(FWebBrowser).OnLoadEnd;

    TChromiumFMX(FWebBrowser).OnLoadEnd := OnLoadEnd;

//    if Active then LoadBaseWeb;
    if Active then
    begin
      FStarTime := Now;
      FTChr.Enabled := True;
    end;
  end;
end;

{ TCustomGMMapFMX }

constructor TCustomGMMapFMX.Create(AOwner: TComponent);
begin
  inherited;

  VisualProp := TVisualProp.Create;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := 200;
  FTimer.OnTimer := OnTimer;
end;

destructor TCustomGMMapFMX.Destroy;
begin
  if Assigned(FTimer) then FreeAndNil(FTimer);

  inherited;
end;

procedure TCustomGMMapFMX.SetEnableTimer(State: Boolean);
begin
  inherited;

  if Assigned(FTimer) then FTimer.Enabled := State;
end;

procedure TCustomGMMapFMX.SetIntervalTimer(Interval: Integer);
begin
  inherited;

  if Assigned(FTimer) then FTimer.Interval := Interval;
end;

function TCustomGMMapFMX.VisualPropToStr: string;
begin
  Result := FVisualProp.ToStr;
end;

procedure TCustomGMMapFMX.SaveToJPGFile(FileName: TFileName);
var
  SD: TSaveDialog;
begin
  inherited;

  if not Assigned(FWebBrowser) or not Assigned(FWC) then Exit;

  if FileName = '' then
  begin
    SD := TSaveDialog.Create(nil);
    try
      SD.Filter := '*.jpg|*.jpg';
      SD.DefaultExt := '*.jpg';
      if SD.Execute then FileName := SD.FileName;
    finally
      FreeAndNil(SD);
    end;
  end;

  FWC.SaveToJPGFile(FileName);
end;

{ TVisualProp }

procedure TVisualProp.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TVisualProp then
    BGColor := TVisualProp(Source).BGColor;
end;

constructor TVisualProp.Create;
begin
  inherited;

  FBGColor := clSilver;
end;

function TVisualProp.GetBckgroundColor: string;
begin
  Result := TTransform.TColorToStr(FBGColor);
end;

{$ENDIF}
end.
