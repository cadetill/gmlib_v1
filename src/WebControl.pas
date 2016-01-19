{
TCustomWeb class

  ES: Clase base para la manipulación del contenido de un TWebBrowser
  EN: Base class for management the contents of a TWebBrowser

=========================================================================
History:

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con el navegador chromium y FireMonkey
  EN:
    new: documentation
    new: now compatible with chromium browser and FireMonkey

ver 0.1.6
  ES:
    nuevo: Se añade método SaveToJPGFile
  EN:
    new: added SaveToJPGFile method

ver 0.1:
  ES: primera versión
  EN: first version
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

IMPORTANT DEVELOPERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
}
{*------------------------------------------------------------------------------
  The WebControl unit includes the necessary classes to encapsulate the access to a browser.
  This browser can be a TWebBrowser, TChromium or TChromiumFMX (for FireMonkey).
  You can de/activate this browsers into the gmlib.inc file.
  By default, only the TWebBrowser is active.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit WebChronium incluye las clases necesarias para encapsular el acceso a un navegador.
  Este navegador puede ser un TWebBrowser, TChromium o TChromiumFMX (para FireMonkey).
  Puedes des/activar estos navegadores desde el archivo gmlib.inc.
  Por defecto, sólo está activo el TWebBrowser.

  @author Xavier Martinez (cadetill)
  @version 1.5.3
-------------------------------------------------------------------------------}
unit WebControl;

{.$DEFINE CHROMIUM}
{.$DEFINE CHROMIUMFMX}
{$I ..\gmlib.inc}

interface

uses
  {$IFDEF CHROMIUM or CHROMIUMFMX}
  ceflib,
  {$ENDIF}

  {$IFDEF DELPHIXE2}
  System.Classes, System.SysUtils;
  {$ELSE}
  Classes, SysUtils;
  {$ENDIF}

type
  {*------------------------------------------------------------------------------
    TCustomWeb class is the base class for all those who want to access a web page loaded in a browser.
    This browser is passed by parametre in the constructor.
    The constructor must be reintroduced for their children to accept the browser that want.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    La clase TCustomWeb es la clase base para todas las clases que quieran acceder a una página web cargada en un navegador.
    El navegador se pasa por parámetro en el constructor.
    El constructor debe ser reintroducido por los descendientes de esta clase para especificar qué navegador deben usar.
  -------------------------------------------------------------------------------}
  TCustomWeb = class(TObject)
  private
  protected
    {*------------------------------------------------------------------------------
      Browser
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Navegador
    -------------------------------------------------------------------------------}
    FWebBrowser: TComponent;
    {*------------------------------------------------------------------------------
      List of all links into web page (not used at the moment)
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de todos los enlaces dentro de la página (no usado en este momento)
    -------------------------------------------------------------------------------}
    FLinks: TStringList;
    {*------------------------------------------------------------------------------
      List of all forms into web page. Initialized with WebFormNames method.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de todos los formularios dentro de la página. Se inicializa con el método WebFormNames.
    -------------------------------------------------------------------------------}
    FForms: TStringList;
    {*------------------------------------------------------------------------------
      List of all fields into a specific form. Initialized with WebFormFields method
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Lista de todos los campos de un formulario especificado. Se inicializa con el método WebFormFields.
    -------------------------------------------------------------------------------}
    FFields: TStringList;

    {*------------------------------------------------------------------------------
      Set a browser
      @param Browser browser to set
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece un navegador
      @param Browser navegador a establecer
    -------------------------------------------------------------------------------}
    procedure SetBrowser(Browser: TComponent); virtual;

    {*------------------------------------------------------------------------------
      WebFormFieldValue function return the value of a field in a form
      @param FormIdx is the index of the form into the Forms TStringList
      @param FieldName is the name of field to return value
      @return string containing the value. If not exist Form or Field, return a empty string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función WebFormFieldValue devuelve el valor del campo del formulario indicado
      @param FormIdx índice del formulario dentro del TStringList Forms
      @param FieldName nombre del campo del que se quiere recuperar el valor
      @return string con el valor. Si Form o Field no existen, devuelve un string vacío
    -------------------------------------------------------------------------------}
    function WebFormFieldValue(const FormIdx: Integer; const FieldName: string): string; overload; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebFormFieldValue function return the value of a field in a form
      @param FormName is the name of the form (it must exist into the Forms TStringList)
      @param FieldName is the name of field to return value
      @return string containing the value. If not exist Form or Field, return a empty string
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función WebFormFieldValue devuelve el valor del campo del formulario indicado
      @param FormName es el nombre del formulario dentro del TStringList Forms
      @param FieldName nombre del campo del que se quiere recuperar el valor
      @return string con el valor. Si Form o Field no existen, devuelve un string vacío
    -------------------------------------------------------------------------------}
    function WebFormFieldValue(const FormName: string; const FieldName: string): string; overload;
  public
    {*------------------------------------------------------------------------------
      Constructor of the class
      @param WebBrowser is the browser to manipulate
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param WebBrowser es el navegador a manipular
    -------------------------------------------------------------------------------}
    constructor Create(WebBrowser: TComponent); virtual;
    {*------------------------------------------------------------------------------
      Destructor of the class
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Destructor de la clase
    -------------------------------------------------------------------------------}
    destructor Destroy; override;

    {*------------------------------------------------------------------------------
      Clear procedure initialize TStringList properties
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento Clear inicializa las propiedades TStringList
    -------------------------------------------------------------------------------}
    procedure Clear;
    {*------------------------------------------------------------------------------
      WebFormNames procedure initializes Forms property with all forms of the loaded page into the browser
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormNames inicializa la propiedad Forms con todos los formularios de la página cargada en el navegador
    -------------------------------------------------------------------------------}
    procedure WebFormNames; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebFormFields procedure initializes Fields property with all fields of the specified form
      @param FormName indicates the name of a form included into the Forms TStringList property
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormFields inicializa la propiedad Fields con todos los campos del formulario especificado
      @param FormName indica el nombre del formulario dentro de la propiedad Forms de tipo TStringList
    -------------------------------------------------------------------------------}
    procedure WebFormFields(const FormName: string); overload;
    {*------------------------------------------------------------------------------
      WebFormFields procedure initializes Fields property with all fields of the specified form
      @param FormIdx indicates the index of the Forms TStringList property
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormFields inicializa la propiedad Fields con todos los campos del formulario especificado
      @param FormIdx indica el índice dentro de la propiedad Forms de tipo TStringList
    -------------------------------------------------------------------------------}
    procedure WebFormFields(const FormIdx: Integer); overload; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebFormSetFieldValue procedure sets a NewValue into the FieldName of the FormNumber
      @param FormNumber is the index of the form into Forms property
      @param FieldName is name of the field to set value
      @param NewValue is the value to set into FieldName
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormSetFieldValue establece el valor NewValue en el campo FieldName de FormNumber
      @param FormIdx es el índice del formulario dentro de la propiedad Forms
      @param FieldName es el nombre del campo al que se le quiere establecer el valor
      @param NewValue es el valor a establecer en FieldName
    -------------------------------------------------------------------------------}
    procedure WebFormSetFieldValue(const FormIdx: Integer; const FieldName, NewValue: string); overload; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebFormSetFieldValue procedure sets a NewValue into the FieldName of the FormName
      @param FormName is the name of the form into Forms property
      @param FieldName is the name of the field to set value
      @param NewValue is the value to set into FieldName
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormSetFieldValue establece el valor NewValue en el campo FieldName de FormNumber
      @param FormName es el nombre del formulario dentro de la propiedad Forms
      @param FieldName es el nombre del campo al que se le quiere establecer el valor
      @param NewValue es el valor a establecer en FieldName
    -------------------------------------------------------------------------------}
    procedure WebFormSetFieldValue(const FormName, FieldName, NewValue: string); overload;
    {*------------------------------------------------------------------------------
      WebFormSubmit procedure submit a form
      @param FormIdx is the index of the form into the Forms TStringList to submit
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormSubmit envía un formulario
      @param FormIdx es el índice dentro de la propiedad Forms de tipo TStringList a enviar
    -------------------------------------------------------------------------------}
    procedure WebFormSubmit(const FormIdx: Integer); overload; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebFormSubmit procedure submit a form
      @param FormName is the name of the form to submit (it must exist into the Forms TStringList)
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El procedimiento WebFormSubmit envía un formulario
      @param FormName es el nombre dentro de la propiedad Forms de tipo TStringList a enviar
    -------------------------------------------------------------------------------}
    procedure WebFormSubmit(const FormName: string); overload;
    {*------------------------------------------------------------------------------
      GetStringField function return the string value of a field in a form
      Is not necessari to call WebFormNames procedure before call this method. WebFormNames is called into this method.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the string value to return by default if FormName or FieldName not exist
      @return string containing the value. If FormName or FieldName not exist, return DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetStringField devuelve el valor string de un campo de un formulario
      No es necesario hacer una llamada al procedimiento WebFormNames antes de llamar a este método. WebFormNames se llama desde este método.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return string que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetStringField(const FormName, FieldName: string; DefaultValue: string = ''): string;
    {*------------------------------------------------------------------------------
      GetIntegerField function return the integer value of a field in a form.
      Is not necessari to call WebFormNames procedure before call this method. WebFormNames is called into this method.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the integer value to return by default if form or field not exist
      @return integer containing the value. If Form or Field not exist, return the DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetIntegerField devuelve el valor integer de un campo de un formulario
      No es necesario hacer una llamada al procedimiento WebFormNames antes de llamar a este método. WebFormNames se llama desde este método.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return integer que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetIntegerField(const FormName, FieldName: string; DefaultValue: Integer = 0): Integer;
    {*------------------------------------------------------------------------------
      GetFloatField function return the real value of a field in a form.
      Is not necessari to call WebFormNames procedure before call this method. WebFormNames is called into this method.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the float value to return by default if form or field not exist
      @return real containing the value. If Form or Field not exist, return the DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetFloatField devuelve el valor real de un campo de un formulario
      No es necesario hacer una llamada al procedimiento WebFormNames antes de llamar a este método. WebFormNames se llama desde este método.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return real que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetFloatField(const FormName, FieldName: string; DefaultValue: Real = 0): Real;
    {*------------------------------------------------------------------------------
      GetBoolField function return the boolean value of a field in a form.
      Is not necessari to call WebFormNames procedure before call this method. WebFormNames is called into this method.
      @param FormName is the name of the form
      @param FieldName is the name of field to return value
      @param DefaultValue is the boolean value to return by default if form or field not exist
      @return boolean containing the value. If Form or Field not exist, return the DefaultValue
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función GetBoolField devuelve el valor boolean de un campo de un formulario
      No es necesario hacer una llamada al procedimiento WebFormNames antes de llamar a este método. WebFormNames se llama desde este método.
      @param FormName nombre del formulario
      @param FieldName nombre del campo a devolver el valor
      @param DefaultValue valor a devolver por defecto si FormName o FieldName no existen
      @return boolean que contiene el valor. Si FormName o FieldName no existen, devolverá DefaultValue
    -------------------------------------------------------------------------------}
    function GetBoolField(const FormName, FieldName: string; DefaultValue: Boolean = False): Boolean;
    {*------------------------------------------------------------------------------
      WebHTMLCode function return the HTML code of the loaded page
      @return string containing then HTML code
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La función WebHTMLCode devuelve el código HTML de la página cargada
      @return string que contiene el código HTML
    -------------------------------------------------------------------------------}
    function WebHTMLCode: string; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebPrintWithoutDialog method print the loaded page directly
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método WebPrintWithoutDialog imprime la página cargada directamente
    -------------------------------------------------------------------------------}
    procedure WebPrintWithoutDialog; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebPrintWithDialog method show the print dialog before print the loaded page
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método WebPrintWithDialog muestra el cuadro de diálogo de impresión antes de imprimir la página cargada
    -------------------------------------------------------------------------------}
    procedure WebPrintWithDialog; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebPrintPageSetup method show the page setup dialog before print the loaded page
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método WebPrintPageSetup muestra el cuadro de diálogo de configuración de página antes de imprimir la página cargada
    -------------------------------------------------------------------------------}
    procedure WebPrintPageSetup; virtual; abstract;
    {*------------------------------------------------------------------------------
      WebPreview method shows a preview before print the loaded page
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método WebPreview muestra una vista previa antes de imprimir la página cargada
    -------------------------------------------------------------------------------}
    procedure WebPreview; virtual; abstract;
    {*------------------------------------------------------------------------------
      SaveToJPGFile method create a JPG image with de page loaded
      @param FileName is the JPG file name
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      El método SaveToJPGFile crea una imagen JPG de la página cargada
      @param FileName es el nombre del archivo JPG
    -------------------------------------------------------------------------------}
    procedure SaveToJPGFile(FileName: TFileName = ''); virtual; abstract;

    {*------------------------------------------------------------------------------
      Forms property have all forms of a loaded page into the browser.
      Call WebFormNames method to initialize it.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad Forms contiene todos los formularios de la página cargada en el navegador.
      Realiza una llamada al método WebFormNames para inicializarla.
    -------------------------------------------------------------------------------}
    property Forms: TStringList read FForms;
    {*------------------------------------------------------------------------------
      Fields property have all fields of a specified form.
      Call WebFormFields method to initialize it.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad Fields contiene todos los campos del formulario especificado.
      Realiza una llamada al método WebFormFields para inicializarla.
    -------------------------------------------------------------------------------}
    property Fields: TStringList read FFields;
    {*------------------------------------------------------------------------------
      Links property have all links of a loaded page into the browser.
      Call WebLinks procedure to initialize it
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      La propiedad Links contiene todos los enlaces de la pátina cargada en el navegador.
      Realiza una llamada al método WebLinks para inicializarla.
    -------------------------------------------------------------------------------}
    property Links: TStringList read FLinks;
  end;

  {$IFDEF CHROMIUM}
  {*------------------------------------------------------------------------------
    TCustomWebChromium is the base class for Chromium borwsers.
    For that the compiler take into account this class, must be activated in the gmlib.inc file.
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    La clase TCustomWebChromium es la clase base para los navegadores Chromium.
    Para que el compilador tenga en cuenta esta clase debes activarla en el fichero gmlib.inc
  -------------------------------------------------------------------------------}
  TCustomWebChromium = class(TCustomWeb)
  private
    function GetField(Node: ICefDomNode; FieldName: string): ICefDomNode;
  protected
    {*------------------------------------------------------------------------------
      Returns the page loaded forms separated by commas.
      @param Node HTML element where to search forms
      @return Forms found
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve los formularios de la página cargada separados por comas.
      @param Node Elemento HTML donde buscar los formularios
      @return Formularios encontrados
    -------------------------------------------------------------------------------}
    function GetFormsName(Node: ICefDomNode): string;
    {*------------------------------------------------------------------------------
      Returns the form fields specified by node.
      @param Node HTML element where to search fields
      @return Fields found
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve los campos del formulario especificado por el nodo.
      @param Node Elemento HTML donde buscar los campos
      @return Campos encontrados
    -------------------------------------------------------------------------------}
    function GetFieldsName(Node: ICefDomNode): string;
    {*------------------------------------------------------------------------------
      Returns the form fields specified by node.
      @param Form node where search the field
      @param FieldName Field name
      @return Field value
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Devuelve el valor de un campo.
      @param Node Nodo del formulario donde buscar el campo
      @param FieldName Nombre del campo
      @return Valor del campo
    -------------------------------------------------------------------------------}
    function GetFieldValue(Node: ICefDomNode; FieldName: string): string;
    {*------------------------------------------------------------------------------
      Sets a value into a fields.
      @param Form node where search the field
      @param FieldName Field name
      @param NewValue New value
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece un valor a un campo.
      @param Node Nodo del formulario donde buscar el campo
      @param FieldName Nombre del campo
      @param NewValue Nuevo valor
    -------------------------------------------------------------------------------}
    procedure SetFieldValue(Node: ICefDomNode; FieldName, NewValue: string);
  end;
  {$ENDIF}

implementation

{ TCustomWeb }

procedure TCustomWeb.Clear;
begin
  FFields.Clear;
  FForms.Clear;
  FLinks.Clear;
end;

constructor TCustomWeb.Create(WebBrowser: TComponent);
begin
  FWebBrowser := WebBrowser;

  FForms := TStringList.Create;
  FFields := TStringList.Create;
  FLinks := TStringList.Create;
end;

destructor TCustomWeb.Destroy;
begin
  if Assigned(FLinks) then FreeAndNil(FLinks);
  if Assigned(FFields) then FreeAndNil(FFields);
  if Assigned(FForms) then FreeAndNil(FForms);

  inherited;
end;

function TCustomWeb.GetBoolField(const FormName, FieldName: string;
  DefaultValue: Boolean): Boolean;
var
  Def: Integer;
begin
  if DefaultValue then Def := 1
  else Def := 0;
  Result := GetIntegerField(FormName, FieldName, Def) = 1;
end;

function TCustomWeb.GetFloatField(const FormName, FieldName: string;
  DefaultValue: Real): Real;
var
  Temp: string;
  Val: Extended;
begin
  Result := DefaultValue;

  Temp := GetStringField(FormName, FieldName, '');
  if {$IFDEF DELPHIXE}FormatSettings.DecimalSeparator{$ELSE}DecimalSeparator{$ENDIF} = ',' then
    Temp := StringReplace(Temp, '.', ',', [rfReplaceAll]);
  if (Temp <> '') and TryStrToFloat(Temp, Val) then
    Result := Val;
end;

function TCustomWeb.GetIntegerField(const FormName, FieldName: string;
  DefaultValue: Integer): Integer;
var
  Temp: string;
  Val: Integer;
begin
  Result := DefaultValue;

  Temp := GetStringField(FormName, FieldName, '');
  if (Temp <> '') and TryStrToInt(Temp, Val) then
    Result := Val;
end;

function TCustomWeb.GetStringField(const FormName, FieldName: string;
  DefaultValue: string): string;
begin
  Result := DefaultValue;

  WebFormNames;
  if Forms.IndexOf(FormName) = -1 then Exit;
  WebFormFields(FormName);
  if Fields.IndexOf(FieldName) <> -1 then
    Result := Trim(WebFormFieldValue(Forms.IndexOf(FormName), FieldName));
end;

procedure TCustomWeb.SetBrowser(Browser: TComponent);
begin
  FWebBrowser := Browser;
end;

procedure TCustomWeb.WebFormFields(const FormName: string);
begin
  WebFormFields(FForms.IndexOf(FormName));
end;

procedure TCustomWeb.WebFormSetFieldValue(const FormName, FieldName,
  NewValue: string);
begin
  WebFormSetFieldValue(FForms.IndexOf(FormName), FieldName, NewValue);
end;

procedure TCustomWeb.WebFormSubmit(const FormName: string);
begin
  WebFormSubmit(FForms.IndexOf(FormName));
end;

function TCustomWeb.WebFormFieldValue(const FormName,
  FieldName: string): string;
begin
  WebFormFieldValue(FForms.IndexOf(FormName), FieldName);
end;

{$IFDEF CHROMIUM}
{ TCustomWebChromium }

function TCustomWebChromium.GetField(Node: ICefDomNode;
  FieldName: string): ICefDomNode;
begin
  Result := nil;
  if not Assigned(Node) then Exit;
  if not Node.HasChildren then Exit;

  Node := Node.FirstChild;
  repeat
    if SameText(Node.GetElementAttribute('name'), FieldName) then
    begin
      Result := Node;
      Break;
    end;
    if Node.HasChildren then
    begin
      Result := GetField(Node, FieldName);
      if Assigned(Result) then Break;
    end;

    Node := Node.NextSibling;
  until not Assigned(Node);
end;

function TCustomWebChromium.GetFieldsName(Node: ICefDomNode): string;
var
  Str: string;
begin
  Result := '';
  if not Assigned(Node) then Exit;
  if not Node.HasChildren then Exit;

  Node := Node.FirstChild;
  repeat
    if SameText(Node.ElementTagName, 'INPUT') or
       SameText(Node.ElementTagName, 'SELECT')or
       SameText(Node.ElementTagName, 'TEXTAREA') then
    begin
      if Result <> '' then Result := Result + ',';
      Result := Result + Node.GetElementAttribute('name');
    end;
    if Node.HasChildren then
      Str := GetFieldsName(Node);
    if Str <> '' then
    begin
      if Result <> '' then Result := Result + ',';
      Result := Result + Str;
    end;
    Node := Node.NextSibling;
  until not Assigned(Node);
end;

function TCustomWebChromium.GetFieldValue(Node: ICefDomNode;
  FieldName: string): string;
begin
  Node := GetField(Node, FieldName);
  if not Assigned(Node) then Exit;
  Result := Node.GetElementAttribute('value');
end;

function TCustomWebChromium.GetFormsName(Node: ICefDomNode): string;
var
  Str: string;
begin
  Result := '';
  if not Assigned(Node) then Exit;
  repeat
    if SameText(Node.ElementTagName, 'FORM') then
    begin
      if Result <> '' then Result := Result + ',';
      Result := Result + Node.GetElementAttribute('name');
    end;

    if Node.HasChildren then
    begin
      Str := GetFormsName(Node.FirstChild);
      if Str <> '' then
      begin
        if Result <> '' then Result := Result + ',';
        Result := Result + Str;
      end;
    end;

    Node := Node.NextSibling;
  until not Assigned(Node);
end;

procedure TCustomWebChromium.SetFieldValue(Node: ICefDomNode; FieldName,
  NewValue: string);
begin
  Node := GetField(Node, FieldName);
  if not Assigned(Node) then Exit;
  Node.SetElementAttribute('value', NewValue);
end;
{$ENDIF}

end.
