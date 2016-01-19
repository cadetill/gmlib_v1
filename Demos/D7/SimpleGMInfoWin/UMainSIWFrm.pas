unit UMainSIWFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, GMMap, GMLinkedComponents, GMInfoWindow,
  GMClasses, GMMapVCL, OleCtrls, SHDocVw, StdCtrls, ExtCtrls;

type
  TMainSIWFrm = class(TForm)
    Panel1: TPanel;
    bDo: TButton;
    WebBrowser1: TWebBrowser;
    GMMap1: TGMMap;
    GMInfoWindow1: TGMInfoWindow;
    Memo1: TMemo;
    procedure bDoClick(Sender: TObject);
    procedure GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainSIWFrm: TMainSIWFrm;

implementation

{$R *.dfm}

procedure TMainSIWFrm.bDoClick(Sender: TObject);
begin
  // At design-time
  //   - bDo.Enabled := False
  //   - GMInfoWindow1.Map := GMMap1
  //   - GMMap1.WebBrowser := WebBrowser1
  //   - GMMap1.Active := True
  //   - GMMap1.RequiredProp.Center.Lat := 41,39963248
  //   - GMMap1.RequiredProp.Center.Lng := 2,16794777
  // At run-time
  //   - Event GMMap1.AfterPageLoaded
  GMInfoWindow1.Add(GMMap1.RequiredProp.Center.Lat, GMMap1.RequiredProp.Center.Lng, 'A InfoWindows Test');
end;

procedure TMainSIWFrm.GMMap1AfterPageLoaded(Sender: TObject; First: Boolean);
begin
  if First then
  begin
    GMMap1.DoMap;
    bDo.Enabled := True;
  end;
end;

end.
