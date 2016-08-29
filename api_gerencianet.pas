unit api_gerencianet;

interface

uses SynCrtSock, superobject;

Type
  /// <summary>   Classe base, pega o token de autorização (Oauth) e tem o metodo request para comunicar com o servidor da gerencianet </summary>
  TApi_gerencianet_autorizacao = class
  private
    fclient_id:string;
    fclient_secret:string;
    fServidor:string;
    function request(metodo, url, body:string; out outContent:string):integer;
  public
    function obter_token_autorizacao:string;
    constructor create(client_id, client_secret:string; ambiente_teste:boolean = false);
  end;

  TApi_gerencianet_transacao = class(TApi_gerencianet_autorizacao)
  private
  public
    function criar(sJSON:string; out HTTP_code:integer):string;
    function obter(chargeID:string; out HTTP_code:integer):string;
    function metadata(chargeID: string; sJSON:string; out HTTP_code:integer):string;
  end;

implementation

{ TApi_gerencianet_autorizacao }


function TApi_gerencianet_autorizacao.obter_token_autorizacao: string;
var
  http_client: TWinHttp;
  code: integer;
  outHeader, outContent, auth:SockString;
  jContent:ISuperObject;
begin
  auth:='Authorization:Basic ';
  auth:=auth+Base64Encode(fclient_id+':'+fclient_secret);
  http_client := TWinHttp.Create(fServidor, '443', true);
  try
    code:=http_client.Request('/v1/authorize', 'post', 10, auth,'{"grant_type":"client_credentials"}', 'application/json', outHeader, outContent);
    jContent:=SO(UTF8Decode(outContent));
    if (assigned(jContent)) and (jContent.S['access_token'] <> '') then
      Result:=jContent.S['token_type']+' '+jContent.S['access_token']
    else
      Result:=outContent;
  finally
    http_client.Free;
  end;
end;

{ TApi_gerencianet_comun }

constructor TApi_gerencianet_autorizacao.create(client_id, client_secret: string; ambiente_teste:boolean = false);
begin
  fclient_id:=client_id;
  fclient_secret:=client_secret;
  if ambiente_teste then
    fServidor:= 'sandbox.gerencianet.com.br'
  else
    fServidor:= ' api.gerencianet.com.br';
end;


function TApi_gerencianet_autorizacao.request(metodo, url, body: string; out outContent: string): integer;
var
  http_client: TWinHttp;
  outHeader, inHeader:SockString;
  outc:SockString;
begin
  inHeader:='Authorization:'+obter_token_autorizacao;
  http_client := TWinHttp.Create(fServidor, '443', true);
  try
    Result:=http_client.Request(url, metodo, 10, inHeader, body, 'application/json', outHeader, outc);
    outContent:=UTF8Decode(outc);
  finally
    http_client.Free;
  end;
end;

{ TApi_gerencianet_transacao }

function TApi_gerencianet_transacao.criar(sJSON: string; out HTTP_code: integer): string;
begin
  HTTP_code:=request('post', '/v1/charge', sJSON, Result);
end;

function TApi_gerencianet_transacao.metadata(chargeID: string; sJSON: string; out HTTP_code: integer): string;
begin
  HTTP_code:=request('PUT', '/v1/charge/'+chargeID+'/metadata', sJSON, Result);
end;

function TApi_gerencianet_transacao.obter(chargeID: string; out HTTP_code: integer): string;
begin
  HTTP_code:=request('get', '/v1/charge/'+chargeID, '', Result);
end;

end.
