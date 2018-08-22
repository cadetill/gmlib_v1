{
GMMapVCL unit

  ES: incluye el componente para usar el mapa de Google Maps
  EN: includes the component to use the Google Maps map

=========================================================================
History:

ver 1.3.0
  ES:
    nuevo: nueva función GetIEVersion en la clase TGMMap
  EN:
    new: new function GetIEVersion into TGMMap class.

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
  The GMMapVCL unit includes the classes that manages the map specialized in a particular browser.
  This browsers can be a TWebBrowser or TChromium.
  You can de/activate this browsers into the gmlib.inc file.
  By default, only the TGMMap (TWebBrowser) is active.
  HOW TO USE: put the component into a form, link to a browser, activate it and call DoMap method (usually when AfterPageLoaded event is fired with First parameter to True).

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit GMMapVCL incluye las clases que gestionan el mapa especializados en un determinado navegador.
  Estos navegadores pueden ser un TWebBrowser o TChromium.
  Puedes des/activar estos navegadores desde el archivo gmlib.inc.
  Por defecto, sólo está activo el TGMMap (TWebBrowser).
  MODO DE USO: poner el componente en el formulario, linkarlo a un navegador, activarlo y ejecutar el método DoMap (usualmente en el evento AfterPageLoaded cuando el parámetro First es True).

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit GMMapVCL;

{$DEFINE WEBBROWSER}
{.$DEFINE CHROMIUM}
{$I ..\gmlib.inc}

interface

uses
  {$IFDEF WEBBROWSER}
  SHDocVw,
    {$IFDEF DELPHIXE2}
    Vcl.ExtCtrls,
    {$ELSE}
    ExtCtrls,
    {$ENDIF}
  {$ENDIF}

  {$IFDEF CHROMIUM}
  cefvcl, ceflib, cefgui,
  {$ENDIF}

  {$IFDEF DELPHIXE2}
  System.SysUtils, System.Classes, Vcl.Dialogs, Vcl.Graphics,
  {$ELSE}
  SysUtils, Classes, Dialogs, Graphics,
  {$ENDIF}

  GMMap, GMFunctionsVCL;

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
    FBGColor: TColor;
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
    property BGColor: TColor read FBGColor write FBGColor default clSilver;    // backgroundColor
  end;

  {*------------------------------------------------------------------------------
    Base class for classes that want to access the map using VCL.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase base para las clases que quieran acceder al mapa mediante VCL.
  -------------------------------------------------------------------------------}
  TCustomGMMapVCL = class(TCustomGMMap)
  private
    {*------------------------------------------------------------------------------
      Visual configuration options.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Opciones de configucación visual.
    -------------------------------------------------------------------------------}
    FVisualProp: TVisualProp; // ES: evento de TWebBrowser - EN: event of TWebBrowser

    // internal variables
    FTimer: TTimer;    // ES: TTimer para el control de eventos - EN: TTimer for events control
  protected
    function VisualPropToStr: string; override;

    procedure SetEnableTimer(State: Boolean); override;
    procedure SetIntervalTimer(Interval: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    procedure SaveToJPGFile(FileName: TFileName = ''); override;
    procedure SaveHTML(FileName: TFileName = ''); override;
  published
    property VisualProp: TVisualProp read FVisualProp write FVisualProp;
  end;

  {$IFDEF WEBBROWSER}
  {*------------------------------------------------------------------------------
    Class to access to Google Maps map specialized for TWebBrowser browser.
    See the TCustomGMMap class for properties and events description.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#Map
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para el acceso al mapa de Google Maps especializada para el navegador TWebBrowser.
    Ver la clase TCustomGMMap para la descripción de las propiedades y eventos.
    Más información en https://developers.google.com/maps/documentation/javascript/reference?hl=en#Map
  -------------------------------------------------------------------------------}
  TGMMap = class(TCustomGMMapVCL)
  private
    // internal variables
    CurDispatch: IDispatch;  // ES: variable para el control de la carga de la página web - EN: variable for control of load web page
    OldBeforeNavigate2: TWebBrowserBeforeNavigate2;     // ES: evento de TWebBrowser - EN: event of TWebBrowser
    OldDocumentComplete: TWebBrowserDocumentComplete;   // ES: evento de TWebBrowser - EN: event of TWebBrowser
    OldNavigateComplete2: TWebBrowserNavigateComplete2;

    // ES: eventos del TWebBrowser para el control de la carga de la página
    // EN: events of TWebBrowser to control the load page
    {$IFDEF DELPHIXE2}
    procedure BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      const URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure DocumentComplete(ASender: TObject; const pDisp: IDispatch;
      const URL: OleVariant);
    procedure NavigateComplete2(ASender: TObject; const pDisp: IDispatch;
      const URL: OleVariant);
    {$ELSE}
    procedure BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure DocumentComplete(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    procedure NavigateComplete2(ASender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    {$ENDIF}
    function GetWebBrowser: TWebBrowser;
    procedure SetWebBrowser(const Value: TWebBrowser);
  protected
    procedure BrowserEventsControl; override;
    function ExecuteScript(NameFunct, Params: string): Boolean; override;

    procedure LoadBaseWeb; override;
    procedure LoadBlankPage; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Assign(Source: TPersistent); override;

    function GetIEVersion: string;
  published
    {*------------------------------------------------------------------------------
      Browser where display the Google Maps map.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Navegador donde se mostrará el mapa de Google Maps.
    -------------------------------------------------------------------------------}
    property WebBrowser: TWebBrowser read GetWebBrowser write SetWebBrowser;
  end;
  {$ENDIF}

  {$IFDEF CHROMIUM}
  {*------------------------------------------------------------------------------
    Class to access to Google Maps map specialized for TChromium browser.
    See the TCustomGMMap class for properties and events description.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase para el acceso al mapa de Google Maps especializada para el navegador TChromium.
    Ver la clase TCustomGMMap para la descripción de las propiedades y eventos.
  -------------------------------------------------------------------------------}
  TGMMapChr = class(TCustomGMMapVCL)
  private
    // internal variables
    OldOnLoadEnd: TOnLoadEnd;
    FTChr: TTimer;
    FStarTime: TDateTime;

    procedure OnTimerChr(Sender: TObject);
    procedure OnLoadEnd(Sender: TObject; const browser: ICefBrowser;
      const frame: ICefFrame; httpStatusCode: Integer; out Result: Boolean);
    procedure SetWebBrowser(const Value: TChromium);
    function GetWebBrowser: TChromium;
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
      Browser where display the Google Maps map
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Navegador donde se mostrará el mapa de Google Maps
    -------------------------------------------------------------------------------}
    property WebBrowser: TChromium read GetWebBrowser write SetWebBrowser;
  end;
  {$ENDIF}

implementation

uses
  {$IFDEF WEBBROWSER}
    MSHTML,
    {$IFDEF DELPHIXE2}
    Winapi.ActiveX, System.Win.Registry, Winapi.Windows,
    {$ELSE}
    ActiveX, Registry, Windows,
    {$ENDIF}
  {$ENDIF}

  {$IFDEF DELPHIXE2}
  Vcl.Forms, System.DateUtils,
  {$ELSE}
  Forms, DateUtils,
  {$ENDIF}

  Lang, WebControlVCL;

{ TGMMap }

{$IFDEF WEBBROWSER}
procedure TGMMap.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TGMMap then
  begin
    VisualProp.Assign(TGMMap(Source).VisualProp);
  end;
end;

{$IFDEF DELPHIXE2}
procedure TGMMap.BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  const URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
{$ELSE}
procedure TGMMap.BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
{$ENDIF}
begin
  if Assigned(OldBeforeNavigate2) then OldBeforeNavigate2(ASender, pDisp, URL, Flags, TargetFrameName, PostData, Headers, Cancel);

  //CurDispatch := nil;
  //FDocLoaded := False;
end;

procedure TGMMap.BrowserEventsControl;
begin
  if not (FWebBrowser is TWebBrowser) then Exit;

  TWebBrowser(FWebBrowser).OnBeforeNavigate2 := OldBeforeNavigate2;
  TWebBrowser(FWebBrowser).OnDocumentComplete := OldDocumentComplete;
  TWebBrowser(FWebBrowser).OnNavigateComplete2 := OldNavigateComplete2;

  OldBeforeNavigate2 := nil;
  OldDocumentComplete := nil;
  OldNavigateComplete2 := nil;
end;

constructor TGMMap.Create(AOwner: TComponent);
begin
  inherited;

  FWC := TWebControl.Create(nil);
end;

destructor TGMMap.Destroy;
begin
  if Assigned(FVisualProp) then FreeAndNil(FVisualProp);

  inherited;
end;

{$IFDEF DELPHIXE2}
procedure TGMMap.DocumentComplete(ASender: TObject; const pDisp: IDispatch;
  const URL: OleVariant);
{$ELSE}
procedure TGMMap.DocumentComplete(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
{$ENDIF}
begin
  if Assigned(OldDocumentComplete) then OldDocumentComplete(ASender, pDisp, URL);

  if not FDocLoaded and (pDisp = CurDispatch) then  // si son iguales, la página se ha cargado
  begin
    FDocLoaded := True;
    CurDispatch := nil;
    if Active and Assigned(AfterPageLoaded) then AfterPageLoaded(Self, True);
  end;
end;

function TGMMap.ExecuteScript(NameFunct, Params: string): Boolean;
var
  Doc2: IHTMLDocument2;
  Win2: IHTMLWindow2;
begin
  Result := Check;

  if not (FWebBrowser is TWebBrowser) then Exit;

  if not Result then Exit;

  Doc2 := TWebBrowser(FWebBrowser).Document as IHTMLDocument2;
  Win2 := Doc2.parentWindow;

  Win2.execScript(NameFunct + '(' + Params + ')', 'JavaScript');

  if MapIsNull then
    raise Exception.Create(GetTranslateText('El mapa todavía no ha sido creado', Language));
end;

function TGMMap.GetIEVersion: string;
var
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('Software\Microsoft\Internet Explorer') then
    try
      Result := Reg.ReadString('svcVersion');
      if Result = '' then
        Result := Reg.ReadString('Version');
    finally
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
  if Result = '' then
    Result := '0';
end;

function TGMMap.GetWebBrowser: TWebBrowser;
begin
  Result := nil;
  if FWebBrowser is TWebBrowser then
    Result := TWebBrowser(FWebBrowser);
end;

procedure TGMMap.LoadBaseWeb;
var
  StringStream: TStringStream;
  PersistStreamInit: IPersistStreamInit;
  StreamAdapter: IStream;
begin
  if not Assigned(FWebBrowser) then Exit;
  if not (FWebBrowser is TWebBrowser) then Exit;

  // creación del TStringStream con el string que contiene la página web
  StringStream := TStringStream.Create(GetBaseHTMLCode);
  try
    // nos aseguramos de tener algún contenido en Document
    if not Assigned(TWebBrowser(FWebBrowser).Document) then LoadBlankPage;

    // acceder a la interfaz IPersistStreamInit de Document
    if TWebBrowser(FWebBrowser).Document.QueryInterface(IPersistStreamInit, PersistStreamInit) = S_OK then
    begin
      // borrar datos actuales
      if PersistStreamInit.InitNew = S_OK then
      begin
        // creación y inicialización del IStream
        StreamAdapter:= TStreamAdapter.Create(StringStream);
        // carga de la página web mediante IPersistStreamInit
        PersistStreamInit.Load(StreamAdapter);
      end;
    end;
  finally
    StringStream.Free;
  end;
end;

procedure TGMMap.LoadBlankPage;
begin
  if not (FWebBrowser is TWebBrowser) then Exit;

  FDocLoaded := False;
  TWebBrowser(FWebBrowser).Navigate('about:blank');
end;

{$IFDEF DELPHIXE2}
procedure TGMMap.NavigateComplete2(ASender: TObject; const pDisp: IDispatch;
  const URL: OleVariant);
{$ELSE}
procedure TGMMap.NavigateComplete2(ASender: TObject; const pDisp: IDispatch;
  var URL: OleVariant);
{$ENDIF}
begin
  if Assigned(OldNavigateComplete2) then OldNavigateComplete2(ASender, pDisp, URL);

  if CurDispatch = nil then
    CurDispatch := pDisp;
end;

procedure TGMMap.SetWebBrowser(const Value: TWebBrowser);
begin
  if FWebBrowser = Value then Exit;

  if (Value <> FWebBrowser) and Assigned(FWebBrowser) then
  begin
    TWebBrowser(FWebBrowser).OnBeforeNavigate2 := OldBeforeNavigate2;
    TWebBrowser(FWebBrowser).OnDocumentComplete := OldDocumentComplete;
    TWebBrowser(FWebBrowser).OnNavigateComplete2 := OldNavigateComplete2;
  end;

  FWebBrowser := Value;
  TWebControl(FWC).SetBrowser(TWebBrowser(FWebBrowser));

  if csDesigning in ComponentState then Exit;

  if Assigned(FWebBrowser) then
  begin
    OldBeforeNavigate2 := TWebBrowser(FWebBrowser).OnBeforeNavigate2;
    OldDocumentComplete := TWebBrowser(FWebBrowser).OnDocumentComplete;
    OldNavigateComplete2 := TWebBrowser(FWebBrowser).OnNavigateComplete2;

    TWebBrowser(FWebBrowser).OnBeforeNavigate2 := BeforeNavigate2;
    TWebBrowser(FWebBrowser).OnDocumentComplete := DocumentComplete;
    TWebBrowser(FWebBrowser).OnNavigateComplete2 := NavigateComplete2;

    if Active then LoadBaseWeb;
  end;
end;

{$ENDIF}

{ TGMMapChr }

{$IFDEF CHROMIUM}
procedure TGMMapChr.BrowserEventsControl;
begin
  if not (FWebBrowser is TChromium) then Exit;

  TChromium(FWebBrowser).OnLoadEnd := OldOnLoadEnd;

  OldOnLoadEnd := nil;
end;

constructor TGMMapChr.Create(AOwner: TComponent);
begin
  inherited;

  FWC := TWebChromium.Create(nil);
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

  if not (FWebBrowser is TChromium) then Exit;

  if not Result then Exit;

  if Assigned(TChromium(FWebBrowser).Browser) then
    TChromium(FWebBrowser).Browser.MainFrame.ExecuteJavaScript(Format(Param, [NameFunct, Params]), '', 0);

  if MapIsNull then
    raise Exception.Create(GetTranslateText('El mapa todavía no ha sido creado', Language));
end;

function TGMMapChr.GetWebBrowser: TChromium;
begin
  Result := nil;
  if FWebBrowser is TChromium then
    Result := TChromium(FWebBrowser);
end;

procedure TGMMapChr.LoadBaseWeb;
begin
  if not Assigned(FWebBrowser) then Exit;
  if not (FWebBrowser is TChromium) then Exit;

  // cargamos página inicial
  if Assigned(TChromium(FWebBrowser).Browser) then
    TChromium(FWebBrowser).Browser.MainFrame.LoadString(GetBaseHTMLCode, 'http:\\localhost');
end;

procedure TGMMapChr.LoadBlankPage;
begin
  if not (FWebBrowser is TChromium) then Exit;

  TChromium(FWebBrowser).Browser.MainFrame.LoadUrl('about:blank');
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
  if Active and Assigned(FWebBrowser) and Assigned(TChromium(FWebBrowser).Browser) then
  begin
    FTChr.Enabled := False;
    LoadBaseWeb;
  end;

  if Now > IncSecond(FStarTime, 3) then FTChr.Enabled := False;
end;

procedure TGMMapChr.SetWebBrowser(const Value: TChromium);
begin
  if FWebBrowser = Value then Exit;

  if (Value <> FWebBrowser) and Assigned(FWebBrowser) then
  begin
    TChromium(FWebBrowser).OnLoadEnd := OldOnLoadEnd;
  end;

  FWebBrowser := Value;
  TWebChromium(FWC).SetBrowser(TChromium(FWebBrowser));

  if csDesigning in ComponentState then Exit;

  if Assigned(FWebBrowser) then
  begin
    OldOnLoadEnd := TChromium(FWebBrowser).OnLoadEnd;

    TChromium(FWebBrowser).OnLoadEnd := OnLoadEnd;

//    if Active then LoadBaseWeb;
    if Active then
    begin
      FStarTime := Now;
      FTChr.Enabled := True;
    end;
  end;
end;

{$ENDIF}

{ TCustomGMMapVCL }

procedure TCustomGMMapVCL.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TCustomGMMap then
  begin
    VisualProp.Assign(TCustomGMMapVCL(Source).VisualProp);
  end;
end;

constructor TCustomGMMapVCL.Create(AOwner: TComponent);
begin
  inherited;

  VisualProp := TVisualProp.Create;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := 200;
  FTimer.OnTimer := OnTimer;
end;

destructor TCustomGMMapVCL.Destroy;
begin
  if Assigned(FTimer) then FreeAndNil(FTimer);

  inherited;
end;

procedure TCustomGMMapVCL.SaveHTML(FileName: TFileName);
var
  SD: TSaveDialog;
  L: TStringList;
begin
  inherited;

  if not Assigned(FWebBrowser) or not Assigned(FWC) then Exit;

  if FileName = '' then
  begin
    SD := TSaveDialog.Create(nil);
    try
      SD.Filter := '*.html|*.html';
      SD.DefaultExt := '*.html';
      if SD.Execute then FileName := SD.FileName;
    finally
      FreeAndNil(SD);
    end;
  end;

  L := TStringList.Create;
  try
    L.Text := FWC.WebHTMLCode;
    L.SaveToFile(FileName);
  finally
    FreeAndNil(L);
  end;
end;

procedure TCustomGMMapVCL.SaveToJPGFile(FileName: TFileName);
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

procedure TCustomGMMapVCL.SetEnableTimer(State: Boolean);
begin
  inherited;

  if Assigned(FTimer) then FTimer.Enabled := State;
end;

procedure TCustomGMMapVCL.SetIntervalTimer(Interval: Integer);
begin
  inherited;

  if Assigned(FTimer) then FTimer.Interval := Interval;
end;

function TCustomGMMapVCL.VisualPropToStr: string;
begin
  Result := FVisualProp.ToStr;
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

end.
