object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'API gerenciaNet'
  ClientHeight = 713
  ClientWidth = 1017
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 411
    Width = 1017
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 269
    ExplicitWidth = 747
  end
  object Panel1: TPanel
    Left = 0
    Top = 414
    Width = 1017
    Height = 299
    Align = alBottom
    TabOrder = 0
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 1015
      Height = 13
      Align = alTop
      Caption = 'Log'
      ExplicitWidth = 17
    end
    object memo_log: TMemo
      Left = 1
      Top = 14
      Width = 1015
      Height = 284
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 956
      ExplicitHeight = 209
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1017
    Height = 65
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 958
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Client ID'
    end
    object Label2: TLabel
      Left = 311
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Client Secret'
    end
    object edt_cliente_id: TEdit
      Left = 8
      Top = 27
      Width = 297
      Height = 21
      TabOrder = 0
    end
    object edt_client_secret: TEdit
      Left = 311
      Top = 27
      Width = 314
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 631
      Top = 21
      Width = 107
      Height = 25
      Caption = 'obter autorize'
      TabOrder = 2
      OnClick = Button1Click
    end
    object rg_ambiente: TRadioGroup
      Left = 744
      Top = 10
      Width = 233
      Height = 50
      Caption = 'Ambiente'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Desenvolvimento'
        'Produ'#231#227'o')
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 1017
    Height = 346
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 421
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1015
      Height = 344
      ActivePage = tab_transacao
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 419
      object tab_transacao: TTabSheet
        Caption = 'Transa'#231#227'o'
        ExplicitWidth = 281
        ExplicitHeight = 165
        object pgTransacao: TPageControl
          Left = 0
          Top = 0
          Width = 1007
          Height = 316
          ActivePage = tab_transacao_criar
          Align = alClient
          TabOrder = 0
          ExplicitHeight = 391
          object tab_transacao_criar: TTabSheet
            Caption = 'Criar'
            ExplicitLeft = 28
            ExplicitTop = 16
            ExplicitWidth = 612
            ExplicitHeight = 266
            object Label4: TLabel
              Left = 392
              Top = 5
              Width = 44
              Height = 13
              Caption = 'chargeID'
            end
            object Button2: TButton
              Left = 302
              Top = 24
              Width = 75
              Height = 25
              Caption = 'Criar'
              TabOrder = 0
              OnClick = Button2Click
            end
            object memo_trancacao_criar: TMemo
              Left = 16
              Top = 24
              Width = 273
              Height = 233
              Lines.Strings = (
                '{'
                '  "items": ['
                '    {'
                '      "name": "Servi'#231'o de limpeza",'
                '      "value": 800,'
                '      "amount": 1'
                '    }'
                '  ]'
                '}')
              TabOrder = 1
            end
            object btn_transacao_comando: TButton
              Left = 605
              Top = 22
              Width = 75
              Height = 25
              Caption = 'Executar'
              TabOrder = 2
              OnClick = btn_transacao_comandoClick
            end
            object edt_chargeID: TEdit
              Left = 392
              Top = 24
              Width = 201
              Height = 21
              TabOrder = 3
            end
            object rg_transacao_comando: TRadioGroup
              Left = 392
              Top = 64
              Width = 185
              Height = 201
              Caption = 'Comando'
              ItemIndex = 0
              Items.Strings = (
                'get'
                'metadata'
                'billet'
                'cancel'
                'pay'
                'billet/resend'
                'history')
              TabOrder = 4
              OnClick = rg_transacao_comandoClick
            end
            object memo_transacao_json: TMemo
              Left = 608
              Top = 72
              Width = 257
              Height = 193
              TabOrder = 5
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'TabSheet1'
            ImageIndex = 1
            ExplicitLeft = -60
            ExplicitTop = 0
            ExplicitHeight = 363
          end
        end
      end
    end
  end
end
