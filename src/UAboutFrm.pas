{
unit UAboutFrm

  ES: formulario Acerca de
  EN: form About

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
unit UAboutFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TAboutFrm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lVersion: TLabel;
    Label5: TLabel;
    lMail: TLabel;
    lWeb: TLabel;
    Image2: TImage;
    Label6: TLabel;
    lWeb2: TLabel;
    Label7: TLabel;
    lBugs: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure lMailClick(Sender: TObject);
    procedure lWebClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Image2Click(Sender: TObject);
  private
  public
    constructor Create(aOwner: TComponent); override;
  end;

var
  AboutFrm: TAboutFrm;

implementation

uses
  GMConstants, ShellAPI;

{$R *.dfm}

{ TAboutFrm }

constructor TAboutFrm.Create(aOwner: TComponent);
begin
  inherited;

  lVersion.Caption := GMLIB_VerText;
end;

procedure TAboutFrm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TAboutFrm.Image2Click(Sender: TObject);
begin
  ShellExecute(Handle,'open', PChar('http://www.gnu.org/licenses/lgpl.html'), nil, nil, SW_SHOWNORMAL) ;
end;

procedure TAboutFrm.lWebClick(Sender: TObject);
begin
  if not (Sender is TLabel) then Exit;

  ShellExecute(Handle, 'open', PChar(TLabel(Sender).Caption), nil, nil, SW_SHOW);
end;

procedure TAboutFrm.lMailClick(Sender: TObject);
var
  Subject,
  Body,
  Mail: string;
begin
  Subject := '(GMLib)-';
  Body := '';
  Mail := 'mailto:' + (lMail.Hint) + '?subject=' + Subject + '&body=' + Body ;
  ShellExecute(Handle,'open', PChar(Mail), nil, nil, SW_SHOWNORMAL) ;
end;

end.
