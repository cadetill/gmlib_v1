program GMInfoWin_Demo;

uses
  Forms,
  UGMInfoWinFrm in 'UGMInfoWinFrm.pas' {GMInfoWinFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGMInfoWinFrm, GMInfoWinFrm);
  Application.Run;
end.
