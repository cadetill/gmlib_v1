program TGeometryClassDemo;

uses
  Vcl.Forms,
  UMainGeoFrm in 'UMainGeoFrm.pas' {MainGeoFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainGeoFrm, MainGeoFrm);
  Application.Run;
end.
