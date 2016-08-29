unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, api_gerencianet, Vcl.ComCtrls, superobject;

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
    PageControl1: TPageControl;
    tab_transacao: TTabSheet;
    pgTransacao: TPageControl;
    tab_transacao_criar: TTabSheet;
    Button2: TButton;
    memo_trancacao_criar: TMemo;
    rg_ambiente: TRadioGroup;
    TabSheet1: TTabSheet;
    btn_transacao_comando: TButton;
    edt_chargeID: TEdit;
    Label4: TLabel;
    rg_transacao_comando: TRadioGroup;
    memo_transacao_json: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_transacao_comandoClick(Sender: TObject);
    procedure rg_transacao_comandoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btn_transacao_comandoClick(Sender: TObject);
var
  transacao: TApi_gerencianet_transacao;
  r: Integer;
  resposta: string;
begin
  transacao := TApi_gerencianet_transacao.create(edt_cliente_id.Text, edt_client_secret.Text,
    rg_ambiente.ItemIndex = 0);
  try
    case rg_transacao_comando.ItemIndex of
      0:
        begin
          resposta := SO(transacao.obter(edt_chargeID.Text, r)).AsJSon(true, false);
        end;
      1:
        begin
          resposta := SO(transacao.metadata(edt_chargeID.Text, memo_transacao_json.Lines.Text, r)).AsJSon(true, false);
        end;
      2:
        begin
        end;
      3:
        begin
        end;
      4:
        begin
        end;
      5:
        begin
        end;
      6:
        begin
        end;
    end;
    memo_log.Lines.Add('enviando comando..');
    memo_log.Lines.Add(Format('resposta: %s', [resposta]));
  finally
    transacao.Free;
  end;

end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  auth: TApi_gerencianet_autorizacao;
begin
  auth := TApi_gerencianet_autorizacao.create(edt_cliente_id.Text, edt_client_secret.Text, rg_ambiente.ItemIndex = 0);
  memo_log.Lines.Add('obtendo autorização..');
  memo_log.Lines.Add(Format('resposta: %s', [auth.obter_token_autorizacao]));
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  transacao: TApi_gerencianet_transacao;
  r: Integer;
  resposta: string;
begin
  transacao := TApi_gerencianet_transacao.create(edt_cliente_id.Text, edt_client_secret.Text,
    rg_ambiente.ItemIndex = 0);
  try
    resposta := transacao.criar(memo_trancacao_criar.Lines.Text, r);
    memo_log.Lines.Add('enviando comando..');
    memo_log.Lines.Add(Format('resposta: %s', [resposta]));
  finally
    transacao.Free;
  end;

end;

procedure TfrmPrincipal.rg_transacao_comandoClick(Sender: TObject);
begin
  case rg_transacao_comando.ItemIndex of
  0:memo_transacao_json.Lines.Clear;
  1:memo_transacao_json.Lines.Text:=so('{"notification_url": "","custom_id": ""}').AsJSon(true, false);
  2:memo_transacao_json.Lines.Text:=so('{"expire_at": ""}').AsJSon(true, false);
  3:memo_transacao_json.Lines.Clear;
  4:memo_transacao_json.Lines.Text:=so('{"payment": {"credit_card": {"customer": {"name": "","cpf": "","email": "","birth": "",'+
      '"phone_number": ""},"installments": 1,"payment_token": "","billing_address": {"street": "","number": 0,"neighborhood": '+
      '"","zipcode": "","city": "","complement": "","state": ""}}}}').AsJSon(true, false);
  5:memo_transacao_json.Lines.Text:=so('{"email": ""}').AsJSon(true, false);
  6:memo_transacao_json.Lines.Text:=so('{"description": ""}').AsJSon(true, false);
  end;
end;

end.
