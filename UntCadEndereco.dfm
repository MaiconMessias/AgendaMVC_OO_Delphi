object FormCadEndereco: TFormCadEndereco
  Left = 0
  Top = 0
  Align = alClient
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'FormCadEndereco'
  ClientHeight = 299
  ClientWidth = 1043
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 18
    Top = 127
    Width = 70
    Height = 19
    Caption = 'N'#250'mero:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 217
    Top = 126
    Width = 38
    Height = 19
    Caption = 'CEP:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 32
    Top = 165
    Width = 56
    Height = 19
    Caption = 'Bairro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 366
    Top = 165
    Width = 61
    Height = 19
    Caption = 'Estado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 26
    Top = 204
    Width = 62
    Height = 19
    Caption = 'Cidade:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 156
    Top = 83
    Width = 99
    Height = 19
    Caption = 'Logradouro:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 65
    Top = 86
    Width = 23
    Height = 19
    Caption = 'Id:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtBairroEnde: TEdit
    Left = 94
    Top = 162
    Width = 261
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtCepEnde: TEdit
    Left = 261
    Top = 123
    Width = 101
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtCidadeEnde: TEdit
    Left = 94
    Top = 201
    Width = 261
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object edtEstadoEnde: TEdit
    Left = 433
    Top = 162
    Width = 173
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object edtNumeroEnde: TEdit
    Left = 94
    Top = 124
    Width = 101
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object pnlBotoesCadEnde: TPanel
    Left = 0
    Top = 258
    Width = 1043
    Height = 41
    Align = alBottom
    TabOrder = 5
    ExplicitTop = 249
    ExplicitWidth = 795
    object btnCancelarEnde: TButton
      Left = 304
      Top = 1
      Width = 299
      Height = 39
      Align = alLeft
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCancelarEndeClick
    end
    object btnSalvarEnde: TButton
      Left = 1
      Top = 1
      Width = 303
      Height = 39
      Align = alLeft
      Caption = 'Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSalvarEndeClick
    end
    object btnPessoaEndereco: TButton
      Left = 603
      Top = 1
      Width = 190
      Height = 39
      Align = alLeft
      Caption = 'Pessoas por Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnPessoaEnderecoClick
    end
    object btnRelatPorPessoa: TButton
      Left = 793
      Top = 1
      Width = 248
      Height = 39
      Align = alLeft
      Caption = 'Relat'#243'rio Pessoas por Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnRelatPorPessoaClick
    end
  end
  object pnlHederCadEnde: TPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    ExplicitWidth = 795
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 1043
      Height = 72
      Align = alClient
      Alignment = taCenter
      Caption = 'Cadastro de Endere'#231'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 260
      ExplicitHeight = 31
    end
  end
  object edtLogradouro: TEdit
    Left = 261
    Top = 83
    Width = 261
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object edtId: TEdit
    Left = 94
    Top = 83
    Width = 47
    Height = 27
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
end
