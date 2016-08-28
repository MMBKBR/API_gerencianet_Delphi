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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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
  auth:=TApi_gerencianet_autorizacao.create(edt_cliente_id.Text, edt_client_secret.Text, rg_ambiente.ItemIndex =0);
   memo_log.Lines.Add('obtendo autorização..');
   memo_log.Lines.Add(Format('resposta: %s', [auth.obter_token_autorizacao]));
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  transacao:TApi_gerencianet_transacao;
  jtransacao:ISuperObject;
  r:Integer;
  resposta:string;
begin
  transacao:=TApi_gerencianet_transacao.create(edt_cliente_id.Text, edt_client_secret.Text, rg_ambiente.ItemIndex =0);
  jtransacao:=SO(memo_trancacao_criar.Lines.Text);
  resposta:=transacao.criar(jtransacao, r);
  memo_log.Lines.Add('enviando comando..');
  memo_log.Lines.Add(Format('resposta: %s', [resposta]));

end;

end.
