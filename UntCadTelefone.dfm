object FormCadTelefone: TFormCadTelefone
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'Cadastro de Telefones'
  ClientHeight = 209
  ClientWidth = 604
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
  object Label2: TLabel
    Left = 81
    Top = 94
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
  object Label3: TLabel
    Left = 300
    Top = 93
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
  object Label4: TLabel
    Left = 179
    Top = 93
    Width = 42
    Height = 19
    Caption = 'DDD:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 61
    Top = 131
    Width = 42
    Height = 19
    Caption = 'Tipo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBLkupCmbBTelefoneTipo: TDBLookupComboBox
    Left = 110
    Top = 130
    Width = 187
    Height = 27
    DataField = 'tipo'
    DataSource = FrmPrincipal.DtSrcTelefone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'id'
    ListField = 'tipo'
    ListSource = FrmPrincipal.DtSrcTelefoneTipo
    ParentFont = False
    TabOrder = 0
    OnCloseUp = DBLkupCmbBTelefoneTipoCloseUp
    OnDropDown = DBLkupCmbBTelefoneTipoDropDown
  end
  object edtDDD: TEdit
    Left = 222
    Top = 91
    Width = 59
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtId: TEdit
    Left = 110
    Top = 91
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
    TabOrder = 2
  end
  object edtNumero: TEdit
    Left = 376
    Top = 90
    Width = 131
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object pnlBotoesCadEnde: TPanel
    Left = 0
    Top = 168
    Width = 604
    Height = 41
    Align = alBottom
    TabOrder = 4
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
  end
  object pnlHederCadEnde: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 604
      Height = 72
      Align = alClient
      Alignment = taCenter
      Caption = 'Cadastro de Telefones'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 259
      ExplicitHeight = 31
    end
  end
end
