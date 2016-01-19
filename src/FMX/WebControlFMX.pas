{
TWebChromiumFMX class

  ES: Clase para la manipulación del contenido de un navegador TChromiumFMX
  EN: Class for management the contents of a browser TChromiumFMX

=========================================================================
History:

ver 1.0.1
  ES:
    error: TWebChromiumFMX -> método WebFormFieldValue corregido (GC: issue 6).
  EN:
    bug: TWebChromiumFMX -> WebFormFieldValue method (GC: issue 6).

ver 0.1.9
  ES:
    nuevo: documentación
    nuevo: se hace compatible con el navegador chromium y FireMonkey
  EN:
    new: documentation
    new: now compatible with chromium browser and FireMonkey
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, envíame un correo a:
  gmlib@cadetill.com

IMPORTANT DEVELOPERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
}
{*------------------------------------------------------------------------------
  The WebControlFMX unit includes the necessary classes to encapsulate the access to a browser with FMX framework.
  This browser can be a TChromiumFMX.
  You can de/activate this browsers into the gmlib.inc file.
  By default, only the TWebBrowser is active.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit WebControlFMX incluye las clases necesarias para encapsular el acceso a un navegador mediante el framework de la FMX.
  Este navegador puede ser un TChromiumFMX.
  Puedes des/activar estos navegadores desde el archivo gmlib.inc.
  Por defecto, sólo está activo el TWebBrowser.

  @author Xavier Martinez (cadetill)
  @version 1.5.0
-------------------------------------------------------------------------------}
unit WebControlFMX;

{.$DEFINE CHROMIUMFMX}
{$I ..\gmlib.inc}

interface

{$IFDEF CHROMIUMFMX}
uses
  ceffmx,
  System.SysUtils,
  WebControl;

type
  {*------------------------------------------------------------------------------
    TWebChromiumFMX class is a specialization of TCustomWeb for a TChromiumFMX browser.
    For that the compiler take into account this class, must be activated in the file gmlib.inc
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    La clase TWebChromiumFMX es una especialización de TCustomWeb para el navegador TChromiumFMX.
    Para que el compilador tenga en cuenta esta clase debes activarla en el fichero gmlib.inc
  -------------------------------------------------------------------------------}
  TWebChromiumFMX = class(TCustomWebChromium)
  protected
    function WebFormFieldValue(const FormIdx: Integer; const FieldName: string): string; overload; override;
  public
    {*------------------------------------------------------------------------------
      Constructor of the class
      @param WebBrowser is the browser to manipulate
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Constructor de la clase
      @param WebBrowser es el navegador a manipular
    -------------------------------------------------------------------------------}
    constructor Create(WebBrowser: TChromiumFMX); reintroduce; virtual;

    procedure WebFormNames; override;
    procedure WebFormFields(const FormIdx: Integer); overload; override;
    procedure WebFormSetFieldValue(const FormIdx: Integer;
      const FieldName, NewValue: string); overload; override;
    procedure WebFormSubmit(const FormIdx: Integer); overload; override;
    function WebHTMLCode: string; override;
    procedure WebPrintWithoutDialog; override;
    procedure WebPrintWithDialog; override;
    procedure WebPrintPageSetup; override;
    procedure WebPreview; override;
    procedure SaveToJPGFile(FileName: TFileName = ''); override;
    {*------------------------------------------------------------------------------
      Set a browser
      @param Browser browser to set
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Establece un navegador
      @param Browser navegador a establecer
    -------------------------------------------------------------------------------}
    procedure SetBrowser(Browser: TChromiumFMX); reintroduce; virtual;
  end;
{$ENDIF}

implementation

{$IFDEF CHROMIUMFMX}
uses
  ceflib,
  FMX.Types, FMX.Forms;

{ TWebChromiumFMX }

constructor TWebChromiumFMX.Create(WebBrowser: TChromiumFMX);
begin
  inherited Create(WebBrowser);
end;

procedure TWebChromiumFMX.SaveToJPGFile(FileName: TFileName);
var
   bmp: FMX.Types.TBitmap;
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');

  bmp := FMX.Types.TBitMap.Create(0,0);
  try
    ceffmx.CefGetBitmap(TChromiumFMX(FWebBrowser).Browser, PET_VIEW, bmp);
    bmp.SaveToFile(FileName);
  finally
    FreeAndNil(bmp);
  end;
end;

procedure TWebChromiumFMX.SetBrowser(Browser: TChromiumFMX);
begin
  FWebBrowser := Browser;
end;

procedure TWebChromiumFMX.WebFormFields(const FormIdx: Integer);
var
  Finish: Boolean;
  FormName: string;
begin
  Fields.Clear;
  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');
  if FForms.Count = 0 then
    raise Exception.Create('Property Forms not initialized or empty.');
  if (FormIdx < 0) or (FormIdx >= FForms.Count) then
    raise Exception.Create('Index out of bounds.');

  FormName := FForms[FormIdx];
  Finish := False;

  TChromiumFMX(FWebBrowser).Browser.MainFrame.VisitDomProc(
    procedure (const doc: ICefDomDocument)
    begin
      FFields.CommaText := GetFieldsName(doc.GetElementById(FormName));
      Finish := True;
    end
  );

  repeat Application.ProcessMessages until (Finish);
end;

function TWebChromiumFMX.WebFormFieldValue(const FormIdx: Integer;
  const FieldName: string): string;
var
  Finish: Boolean;
  FormName: string;
  Temp: string;
begin
  inherited;

  Temp := '';

  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');
  if FForms.Count = 0 then
    raise Exception.Create('Property Forms not initialized or empty.');
  if (FormIdx < 0) or (FormIdx >= FForms.Count) then
    raise Exception.Create('Index out of bounds.');

  FormName := FForms[FormIdx];

  TChromiumFMX(FWebBrowser).Browser.MainFrame.VisitDomProc(
    procedure (const doc: ICefDomDocument)
    begin
      Temp := GetFieldValue(doc.GetElementById(FormName), FieldName);
      Finish := True;
    end
  );

  repeat Application.ProcessMessages until (Finish);
  Result := Temp;

  if Pos('&nbsp;', Result) > 0 then
    Result := ReplaceText(Result, '&nbsp;', ' ');
end;

procedure TWebChromiumFMX.WebFormNames;
var
  Finish: Boolean;
begin
  FForms.Clear;
  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');

  Finish := False;
  TChromiumFMX(FWebBrowser).Browser.MainFrame.VisitDomProc(
        procedure (const doc: ICefDomDocument)
        begin
          FForms.CommaText := GetFormsName(doc.Body);
          Finish := True;
        end
  );
  repeat Application.ProcessMessages until (Finish);
end;

procedure TWebChromiumFMX.WebFormSetFieldValue(const FormIdx: Integer;
  const FieldName, NewValue: string);
var
  Finish: Boolean;
  FormName: string;
begin
  inherited;

  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');
  if FForms.Count = 0 then
    raise Exception.Create('Property Forms not initialized or empty.');
  if (FormIdx < 0) or (FormIdx >= FForms.Count) then
    raise Exception.Create('Index out of bounds.');

  FormName := FForms[FormIdx];

  TChromiumFMX(FWebBrowser).Browser.MainFrame.VisitDomProc(
    procedure (const doc: ICefDomDocument)
    begin
      SetFieldValue(doc.GetElementById(FormName), FieldName, NewValue);
      Finish := True;
    end
  );

  repeat Application.ProcessMessages until (Finish);
end;

procedure TWebChromiumFMX.WebFormSubmit(const FormIdx: Integer);
var
  FormName: string;
begin
  inherited;

  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');
  if FForms.Count = 0 then
    raise Exception.Create('Property Forms not initialized or empty.');
  if (FormIdx < 0) or (FormIdx >= FForms.Count) then
    raise Exception.Create('Index out of bounds.');

  FormName := FForms[FormIdx];

  if TChromiumFMX(FWebBrowser).Browser <> nil then
    TChromiumFMX(FWebBrowser).Browser.MainFrame.ExecuteJavaScript(
      'document.forms["' + FormName + '"].submit();', '', 0);
end;

function TWebChromiumFMX.WebHTMLCode: string;
begin
  Result := '';
  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');

  if TChromiumFMX(FWebBrowser).Browser = nil then Exit;
  Result := TChromiumFMX(FWebBrowser).Browser.MainFrame.Source;
end;

procedure TWebChromiumFMX.WebPreview;
begin
  raise Exception.Create('This method is not implemented for this class. Call WebPrintWithDialog in his stead.');
end;

procedure TWebChromiumFMX.WebPrintPageSetup;
begin
  raise Exception.Create('This method is not implemented for this class. Call WebPrintWithDialog in his stead.');
end;

procedure TWebChromiumFMX.WebPrintWithDialog;
begin
  if not Assigned(FWebBrowser) then
    raise Exception.Create('WebBrowser not assigned');
  if not (FWebBrowser is TChromiumFMX) then
    raise Exception.Create('The WebBrowser property is not a TChromiumFMX.');

  if TChromiumFMX(FWebBrowser).Browser <> nil then
    TChromiumFMX(FWebBrowser).Browser.MainFrame.Print;
end;

procedure TWebChromiumFMX.WebPrintWithoutDialog;
begin
  raise Exception.Create('This method is not implemented for this class. Call WebPrintWithDialog in his stead.');
end;
{$ENDIF}

end.
