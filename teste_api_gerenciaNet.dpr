program teste_api_gerenciaNet;

uses
  Vcl.Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  SynCrtSock in 'SynCrtSock.pas',
  SynCrypto in 'SynCrypto.pas',
  api_gerencianet in 'api_gerencianet.pas',
  superobject in 'superobject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
