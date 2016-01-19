unit UWaypointFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TWaypointFrm = class(TForm)
    Label1: TLabel;
    eAddress: TEdit;
    eLng: TEdit;
    Label36: TLabel;
    eLat: TEdit;
    Label37: TLabel;
    cbStopOver: TCheckBox;
    Label2: TLabel;
    eTitle: TEdit;
    bOk: TButton;
  private
  public
  end;

var
  WaypointFrm: TWaypointFrm;

implementation

{$R *.dfm}

end.
