program TGeometryClassDemo;

uses
  Forms,
  UMainGeoFrm in 'UMainGeoFrm.pas' {MainGeoFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainGeoFrm, MainGeoFrm);
  Application.Run;
end.
