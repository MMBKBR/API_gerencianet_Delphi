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
    Top = 486
    Width = 1017
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 269
    ExplicitWidth = 747
  end
  object Panel1: TPanel
    Left = 0
    Top = 489
    Width = 1017
    Height = 224
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 958
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
      Height = 209
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitWidth = 956
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
    Height = 421
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 958
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 1015
      Height = 419
      ActivePage = tab_transacao
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 956
      object tab_transacao: TTabSheet
        Caption = 'Transa'#231#227'o'
        ExplicitWidth = 281
        ExplicitHeight = 165
        object pgTransacao: TPageControl
          Left = 0
          Top = 0
          Width = 1007
          Height = 391
          ActivePage = tab_transacao_criar
          Align = alClient
          TabOrder = 0
          ExplicitTop = 3
          ExplicitWidth = 620
          ExplicitHeight = 294
          object tab_transacao_criar: TTabSheet
            Caption = 'Criar'
            ExplicitLeft = 28
            ExplicitTop = 16
            ExplicitWidth = 612
            ExplicitHeight = 266
            object Button2: TButton
              Left = 312
              Top = 48
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
              Height = 289
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
          end
        end
      end
    end
  end
end
