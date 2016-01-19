program SimpleGMInfoWin;

uses
  Vcl.Forms,
  UMainSIWFrm in 'UMainSIWFrm.pas' {MainSIWFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainSIWFrm, MainSIWFrm);
  Application.Run;
end.
