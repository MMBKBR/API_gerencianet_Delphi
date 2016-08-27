object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'API gerenciaNet'
  ClientHeight = 713
  ClientWidth = 958
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
    Width = 958
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 269
    ExplicitWidth = 747
  end
  object Panel1: TPanel
    Left = 0
    Top = 489
    Width = 958
    Height = 224
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 280
    ExplicitWidth = 855
    object Label3: TLabel
      Left = 1
      Top = 1
      Width = 956
      Height = 16
      Align = alTop
      Caption = 'Log'
      ExplicitWidth = 745
    end
    object memo_log: TMemo
      Left = 1
      Top = 17
      Width = 956
      Height = 206
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
      ExplicitTop = 14
      ExplicitWidth = 745
      ExplicitHeight = 103
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 958
    Height = 65
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 665
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
      Text = 'Client_Id_86569dcffd3efb9e93c97779e07b2aa34419b95a'
    end
    object edt_client_secret: TEdit
      Left = 311
      Top = 27
      Width = 314
      Height = 21
      TabOrder = 1
      Text = 'Client_Secret_a41bafe3bbd9c145c8367c953e432f9800029a69'
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
  end
  object Panel3: TPanel
    Left = 0
    Top = 65
    Width = 958
    Height = 421
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 256
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end
