object DtModPrincipal: TDtModPrincipal
  OnDestroy = DataModuleDestroy
  Height = 323
  Width = 454
  PixelsPerInch = 96
  object FDConnPrincipal: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=n'
      'Database=agenda'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\windows10\Desktop\Projetos Delphi XE 11\Agenda\Win32\De' +
      'bug\libpq.dll'
    Left = 152
    Top = 24
  end
  object frxReportPessoa: TfrxReport
    Version = '2021.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44519.902061701390000000
    ReportOptions.LastChange = 44519.968031342590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 96
    Datasets = <
      item
        DataSet = frxDBDtsetPessoa
        DataSetName = 'frxDBDtsetPessoa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015770000000000000
        Top = 128.504020000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Top = 7.559060000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 7.559060000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDtsetPessoa
        DataSetName = 'frxDBDtsetPessoa'
        RowCount = 0
        object frxDBDtsetPessoanome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 61.354360000000000000
          Top = 6.118120000000000000
          Width = 415.748300000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBDtsetPessoa
          DataSetName = 'frxDBDtsetPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDtsetPessoa."nome"]')
          ParentFont = False
        end
        object frxDBDtsetPessoacpf: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 510.118430000000000000
          Top = 6.118120000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'cpf'
          DataSet = frxDBDtsetPessoa
          DataSetName = 'frxDBDtsetPessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDtsetPessoa."cpf"]')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = 9.448825000000000000
          Width = 302.362400000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Pesquisa de Pessoas')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDtsetPessoa: TfrxDBDataset
    UserName = 'frxDBDtsetPessoa'
    CloseDataSource = False
    DataSource = FrmPrincipal.DtSrcPessoa
    BCDToCurrency = False
    Left = 40
    Top = 168
  end
  object FDQPessoaPorEnde: TFDQuery
    Connection = FDConnPrincipal
    SQL.Strings = (
      'SELECT NOME, CPF FROM PESSOA WHERE ENDERECO = :ID_ENDE')
    Left = 320
    Top = 32
    ParamData = <
      item
        Name = 'ID_ENDE'
        DataType = ftInteger
        ParamType = ptInput
        Value = 8
      end>
  end
  object frxReportPessoaPorEnde: TfrxReport
    Version = '2021.2.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44519.980599236110000000
    ReportOptions.LastChange = 44519.980599236110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 232
    Datasets = <
      item
        DataSet = frxDBDtsetPessoaPorEnde
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 132.283550000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 11.338590000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 11.338590000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 52.913420000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 230.551330000000000000
          Top = 11.338590000000000000
          Width = 211.653680000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pessoa por endere'#231'o')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDtsetPessoaPorEnde
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1nome: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 11.338590000000000000
          Width = 381.732530000000000000
          Height = 18.897650000000000000
          DataField = 'nome'
          DataSet = frxDBDtsetPessoaPorEnde
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."nome"]')
          ParentFont = False
        end
        object frxDBDataset1cpf: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 472.441250000000000000
          Top = 11.338590000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'cpf'
          DataSet = frxDBDtsetPessoaPorEnde
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."cpf"]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDtsetPessoaPorEnde: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DtSrcPessoaPorEnde
    BCDToCurrency = False
    Left = 320
    Top = 160
  end
  object DtSrcPessoaPorEnde: TDataSource
    DataSet = FDQPessoaPorEnde
    Left = 320
    Top = 96
  end
end
