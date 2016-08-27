unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, api_gerencianet;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edt_cliente_id: TEdit;
    Label1: TLabel;
    edt_client_secret: TEdit;
    Label2: TLabel;
    Panel3: TPanel;
    Button1: TButton;
    Label3: TLabel;
    memo_log: TMemo;
    Splitter2: TSplitter;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  auth:TApi_gerencianet_autorizacao;
begin
  auth:=TApi_gerencianet_autorizacao.create(edt_cliente_id.Text, edt_client_secret.Text);
   memo_log.Lines.Add('obtendo autorização..');
   memo_log.Lines.Add(Format('resposta: %s', [auth.obter_token_autorizacao]));
end;

end.
