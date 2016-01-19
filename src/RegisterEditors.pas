unit RegisterEditors;

{$I ..\gmlib.inc}

interface

  procedure Register;

implementation

uses
  DesignEditors, DesignIntf, ToolsAPI,
  {$IFDEF DELPHIX2}
  System.Classes, Winapi.Windows,
  {$ELSE}
  Classes, Windows,
  {$ENDIF}
  UAboutFrm, GMClasses, GMEditors, GMLinkedComponents;

procedure Register;
{$IFDEF DELPHI2005}
var
  Bmp: HBITMAP;
{$ENDIF}
begin
  RegisterPropertyEditor(TypeInfo(TAboutFrm), nil, '', TAboutGMLib);

  RegisterComponentEditor(TGMBase, TGMBaseEditor);
  RegisterComponentEditor(TGMLinkedComponent, TGMLinkedComponentEditor);

  {$IFDEF DELPHI2005}
  ForceDemandLoadState(dlDisable);
  if Assigned(SplashScreenServices) then
  begin
    Bmp := LoadBitmap(FindResourceHInstance(HInstance), 'TGMMap');
    try
      SplashScreenServices.AddPluginBitmap('GoogleMaps Library 1.5.3 Final', Bmp, False, 'Licence LGPL');
    finally
      DeleteObject(Bmp);
    end;
  end;
  {$ENDIF}
end;

end.
