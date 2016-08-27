unit api_gerencianet;

interface

uses SynCrtSock, superobject;

Type
  /// <summary>   Classe que pega o token de autorização (Oauth) </summary>
  TApi_gerencianet_autorizacao = class
  private
    fclient_id:string;
    fclient_secret:string;
  public
    function obter_token_autorizacao:string;
    constructor create(client_id, client_secret:string);
  end;

implementation

{ TApi_gerencianet_autorizacao }

constructor TApi_gerencianet_autorizacao.create(client_id, client_secret: string);
begin
  fclient_id:=client_id;
  fclient_secret:=client_secret;
end;

function TApi_gerencianet_autorizacao.obter_token_autorizacao: string;
var
  http_client: TWinHttp;
  code: integer;
  outHeader, outContent, auth:SockString;
  jContent:ISuperObject;
begin
  auth:='Authorization:Basic ';
  auth:=auth+Base64Encode(fclient_id+':'+fclient_secret);
  http_client := TWinHttp.Create('sandbox.gerencianet.com.br', '443', true);
  try
    code:=http_client.Request('/v1/authorize', 'post', 10, auth,'{"grant_type":"client_credentials"}', 'application/json', outHeader, outContent);
    jContent:=SO(outContent);
    if (assigned(jContent)) and (jContent.S['access_token'] <> '') then
      Result:=jContent.S['token_type']+' '+jContent.S['access_token']
    else
      Result:=outContent;
  finally
    http_client.Free;
  end;
end;

end.
