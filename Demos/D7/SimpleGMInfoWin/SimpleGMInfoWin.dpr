program SimpleGMInfoWin;

uses
  Forms,
  UMainSIWFrm in 'UMainSIWFrm.pas' {MainSIWFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainSIWFrm, MainSIWFrm);
  Application.Run;
end.
