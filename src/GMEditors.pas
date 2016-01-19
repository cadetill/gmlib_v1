{
GMEditors

  ES: unit con la definición de los editores para los componentes
  EN: unit with the definition of the editors for components

=========================================================================
History:

ver 0.1:
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

Copyright (©) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
unit GMEditors;

interface

uses
  DesignIntf, DesignEditors;

type
  // http://delphi.about.com/library/bluc/text/uc092501c.htm
  TAboutGMLib = class(TPropertyEditor)
  public
    procedure Edit; override;
    function GetValue: string; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

  // http://delphi.about.com/library/bluc/text/uc092501b.htm
  TGMBaseEditor = class(TComponentEditor)
  public
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

  TGMLinkedComponentEditor = class(TGMBaseEditor)
  public
    procedure Edit; override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

implementation

uses
  UAboutFrm, GMConstants, ColnEdit, GMLinkedComponents;


{ TAboutGMLib }

procedure TAboutGMLib.Edit;
begin
  inherited;

  with TAboutFrm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

function TAboutGMLib.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paReadOnly];
end;

function TAboutGMLib.GetValue: string;
begin
  Result := GMLIB_Version;
end;

{ TGMBaseEditor }

procedure TGMBaseEditor.ExecuteVerb(Index: Integer);
begin
  inherited;

  with TAboutFrm.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

function TGMBaseEditor.GetVerb(Index: Integer): string;
begin
  Result := AboutGMLibTxt;
end;

function TGMBaseEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

{ TGMLinkedComponentEditor }

procedure TGMLinkedComponentEditor.Edit;
begin
  ShowCollectionEditor(Designer, Component, TGMLinkedComponent(Component).VisualObjects, 'VisualObjects');
end;

procedure TGMLinkedComponentEditor.ExecuteVerb(Index: Integer);
begin
  if Index <= inherited GetVerbCount - 1 then
    inherited ExecuteVerb(Index)
  else
  begin
    Dec(Index, inherited GetVerbCount);
    case Index of
      0: ShowCollectionEditor(Designer, Component, TGMLinkedComponent(Component).VisualObjects, 'VisualObjects');
    end;
  end;
end;

function TGMLinkedComponentEditor.GetVerb(Index: Integer): string;
begin
  if Index <= inherited GetVerbCount - 1 then
    Result := inherited GetVerb(Index)
  else
  begin
    Dec(Index, inherited GetVerbCount);
    case Index of
      0: Result := MEditor;
    end;
  end;
end;

function TGMLinkedComponentEditor.GetVerbCount: Integer;
begin
  Result := inherited GetVerbCount + 1;
end;

end.
