object frmCadProdutos: TfrmCadProdutos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cadastro de Produtos'
  ClientHeight = 530
  ClientWidth = 699
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 530
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lbl3: TLabel
      Left = 66
      Top = 53
      Width = 70
      Height = 18
      Caption = 'Produto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbl1: TLabel
      Left = 14
      Top = 53
      Width = 38
      Height = 18
      Caption = 'Cod:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbl2: TLabel
      Left = 415
      Top = 53
      Width = 131
      Height = 18
      Caption = 'R$ / Litro Valor:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object lbl4: TLabel
      Left = 553
      Top = 53
      Width = 98
      Height = 18
      Caption = '% Imposto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object pnl4: TPanel
      Left = 1
      Top = 1
      Width = 697
      Height = 48
      Align = alTop
      BorderWidth = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object btnNovo: TButton
        Left = 10
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnSalvar: TButton
        Left = 99
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Salvar'
        TabOrder = 1
        OnClick = btnSalvarClick
      end
      object btnCancelar: TButton
        Left = 188
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
      end
      object btnAlterar: TButton
        Left = 277
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Alterar'
        TabOrder = 3
        OnClick = btnAlterarClick
      end
      object btnExcluir: TButton
        Left = 370
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
      end
      object btnSair: TButton
        Left = 595
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Sair'
        TabOrder = 5
        OnClick = btnSairClick
      end
    end
    object edtchave: TDBEdit
      Left = 11
      Top = 74
      Width = 50
      Height = 24
      DataField = 'chave'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtNomeProduto: TDBEdit
      Left = 66
      Top = 74
      Width = 343
      Height = 24
      DataField = 'tdescricao'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object edtValor: TDBEdit
      Left = 414
      Top = 74
      Width = 132
      Height = 24
      DataField = 'nvalor'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtImposto: TDBEdit
      Left = 551
      Top = 74
      Width = 132
      Height = 24
      DataField = 'nimposto'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object pnl1: TPanel
      Left = 1
      Top = 128
      Width = 697
      Height = 401
      Align = alBottom
      BorderStyle = bsSingle
      TabOrder = 5
      object lbl5: TLabel
        Left = 4
        Top = 231
        Width = 63
        Height = 18
        Caption = 'Bomba:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
      object grdProduto: TDBGrid
        Left = 1
        Top = 1
        Width = 693
        Height = 202
        Align = alTop
        DataSource = dsProdutos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Chave'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tdescricao'
            Width = 390
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nvalor'
            Title.Alignment = taCenter
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nimposto'
            Title.Alignment = taCenter
            Width = 73
            Visible = True
          end>
      end
      object pnl5: TPanel
        Left = 1
        Top = 203
        Width = 693
        Height = 22
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = 'Bombas vinculada ao produto:'
        Color = 12615680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
      end
      object cboBomba: TDBLookupComboBox
        Left = 4
        Top = 251
        Width = 198
        Height = 25
        DataField = 'nchbomba'
        DataSource = dsprod_bomba
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'chave'
        ListField = 'tdescricao'
        ListSource = dsBomba
        ParentFont = False
        TabOrder = 2
      end
      object grd1: TDBGrid
        Left = 4
        Top = 282
        Width = 443
        Height = 79
        DataSource = dsprod_bomba
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nchbomba'
            Title.Caption = 'Cod. Bomba'
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'clcbomba'
            Title.Caption = 'Bomba'
            Width = 328
            Visible = True
          end>
      end
      object btnExclBomba: TButton
        Left = 360
        Top = 365
        Width = 87
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExclBombaClick
      end
      object btnAltBomba: TButton
        Left = 270
        Top = 365
        Width = 87
        Height = 25
        Caption = 'Alterar'
        TabOrder = 5
        OnClick = btnAltBombaClick
      end
      object btnCancelBomba: TButton
        Left = 181
        Top = 365
        Width = 87
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 6
        OnClick = btnCancelBombaClick
      end
      object btnSalvarbomba: TButton
        Left = 92
        Top = 365
        Width = 87
        Height = 25
        Caption = 'Salvar'
        TabOrder = 7
        OnClick = btnSalvarbombaClick
      end
      object btnNovoBomba: TButton
        Left = 3
        Top = 365
        Width = 87
        Height = 25
        Caption = 'Novo'
        TabOrder = 8
        OnClick = btnNovoBombaClick
      end
      object edtchave1: TDBEdit
        Left = 704
        Top = 360
        Width = 121
        Height = 19
        TabStop = False
        DataField = 'chave'
        DataSource = dsprod_bomba
        ReadOnly = True
        TabOrder = 9
      end
    end
  end
  object qryProdutos: TFDQuery
    AfterScroll = qryProdutosAfterScroll
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select *'
      '  from produtos')
    Left = 455
    Top = 151
    object qryProdutosChave: TIntegerField
      DisplayLabel = 'C'#243'd. Produto'
      DisplayWidth = 12
      FieldName = 'Chave'
      Origin = 'Chave'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutostdescricao: TStringField
      DisplayLabel = 'Produto'
      FieldName = 'tdescricao'
      Origin = 'tdescricao'
    end
    object qryProdutosnvalor: TFloatField
      DisplayLabel = 'R$ Valor / L'
      FieldName = 'nvalor'
      Origin = 'nvalor'
      currency = True
    end
    object qryProdutosnimposto: TFloatField
      DisplayLabel = '% Imposto'
      FieldName = 'nimposto'
      Origin = 'nimposto'
      DisplayFormat = '0.00%'
    end
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 543
    Top = 151
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 447
    Top = 223
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 479
    Top = 223
  end
  object qryBomba: TFDQuery
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select *'
      '  from bomba'
      'where lativo = '#39'T'#39)
    Left = 463
    Top = 287
    object qryBombachave: TIntegerField
      FieldName = 'chave'
      Origin = 'chave'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryBombatdescricao: TStringField
      FieldName = 'tdescricao'
      Origin = 'tdescricao'
    end
    object qryBombalativo: TStringField
      FieldName = 'lativo'
      Origin = 'lativo'
      Size = 1
    end
    object qryBombanchtanque: TIntegerField
      FieldName = 'nchtanque'
      Origin = 'nchtanque'
      Required = True
    end
    object qryBombaclcTanque: TStringField
      FieldKind = fkCalculated
      FieldName = 'clcTanque'
      Calculated = True
    end
  end
  object dsBomba: TDataSource
    DataSet = qryBomba
    Left = 519
    Top = 287
  end
  object qryprod_Bomba: TFDQuery
    OnCalcFields = qryprod_BombaCalcFields
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select * '
      '  from prod_bomba'
      'where nchproduto = :nchproduto'
      '')
    Left = 497
    Top = 400
    ParamData = <
      item
        Name = 'NCHPRODUTO'
        ParamType = ptInput
      end>
    object qryprod_Bombachave: TIntegerField
      FieldName = 'chave'
      Origin = 'chave'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryprod_Bombanchproduto: TIntegerField
      FieldName = 'nchproduto'
      Origin = 'nchproduto'
      Required = True
    end
    object qryprod_Bombanchbomba: TIntegerField
      FieldName = 'nchbomba'
      Origin = 'nchbomba'
      Required = True
    end
    object qryprod_Bombaclcbomba: TStringField
      FieldKind = fkCalculated
      FieldName = 'clcbomba'
      Calculated = True
    end
  end
  object dsprod_bomba: TDataSource
    DataSet = qryprod_Bomba
    Left = 553
    Top = 400
  end
end
