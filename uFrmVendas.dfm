object frmVendas: TfrmVendas
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Vendas de Combustiveis'
  ClientHeight = 612
  ClientWidth = 820
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
    Width = 820
    Height = 612
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lblBomba: TLabel
      Left = 202
      Top = 65
      Width = 79
      Height = 19
      Caption = 'N'#186' Bomba:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTipoCombustivel: TLabel
      Left = 151
      Top = 97
      Width = 130
      Height = 19
      Caption = 'Tipo Combust'#237'vel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 236
      Top = 127
      Width = 45
      Height = 19
      Caption = 'Litros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 482
      Top = 127
      Width = 49
      Height = 19
      Caption = 'R$ / L:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 157
      Top = 187
      Width = 124
      Height = 19
      Caption = 'R$ Total a pagar:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 192
      Top = 157
      Width = 89
      Height = 19
      Caption = 'R$ Imposto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlMenu: TPanel
      Left = 1
      Top = 1
      Width = 818
      Height = 56
      Align = alTop
      TabOrder = 1
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
        Left = 366
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Excluir'
        TabOrder = 4
        OnClick = btnExcluirClick
      end
      object btnSair: TButton
        Left = 725
        Top = 12
        Width = 87
        Height = 25
        Caption = 'Sair'
        TabOrder = 5
        OnClick = btnSairClick
      end
    end
    object pnlVendas: TPanel
      Left = 3
      Top = 60
      Width = 142
      Height = 49
      BevelOuter = bvNone
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 4
      object lblCodVenda: TLabel
        Left = 4
        Top = 3
        Width = 81
        Height = 19
        Caption = 'Venda n'#186':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCoddbVenda: TDBEdit
        Left = 6
        Top = 20
        Width = 130
        Height = 25
        TabStop = False
        BevelInner = bvNone
        BevelOuter = bvNone
        BiDiMode = bdRightToLeftNoAlign
        BorderStyle = bsNone
        Color = clMoneyGreen
        DataField = 'chave'
        DataSource = dsVendas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHotLight
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBiDiMode = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object grd1: TDBGrid
      Left = 1
      Top = 216
      Width = 818
      Height = 395
      TabStop = False
      Align = alBottom
      DataSource = dsVendas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'chave'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ddata_venda'
          Title.Alignment = taCenter
          Width = 129
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nchbomba'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'clcBomba'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nchproduto'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'clcProduto'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nlitros_total'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nlitros_unit'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nimposto_total'
          Title.Alignment = taCenter
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nimposto_unit'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ntotal_pagar'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    object cboNumBomba: TDBLookupComboBox
      Left = 287
      Top = 63
      Width = 186
      Height = 25
      DataField = 'nchbomba'
      DataSource = dsVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'chave'
      ListField = 'tdescricao'
      ListSource = dsBomba
      ParentFont = False
      TabOrder = 0
    end
    object edtLitros: TDBEdit
      Left = 287
      Top = 125
      Width = 186
      Height = 25
      Color = 50787
      DataField = 'nlitros_total'
      DataSource = dsVendas
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = edtLitrosExit
    end
    object edtValorLitrounit: TDBEdit
      Left = 537
      Top = 125
      Width = 101
      Height = 25
      TabStop = False
      DataField = 'nvalor'
      DataSource = dsProdutos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtTotalPagar: TEdit
      Left = 287
      Top = 186
      Width = 186
      Height = 25
      Alignment = taRightJustify
      Color = 8421631
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '0.00'
    end
    object edtTotalImposto: TEdit
      Left = 287
      Top = 156
      Width = 186
      Height = 25
      Alignment = taRightJustify
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = '0.00'
    end
  end
  object cboTipoCombustivel: TDBLookupComboBox
    Left = 287
    Top = 94
    Width = 186
    Height = 25
    DataField = 'nchproduto'
    DataSource = dsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    KeyField = 'Chave'
    ListField = 'tdescricao'
    ListSource = dsProdutos
    ParentFont = False
    TabOrder = 1
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 376
    Top = 304
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 240
    Top = 304
  end
  object qryVendas: TFDQuery
    AfterScroll = qryVendasAfterScroll
    OnCalcFields = qryVendasCalcFields
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select *'
      ' from vendas')
    Left = 488
    Top = 304
    object qryVendaschave: TIntegerField
      DisplayLabel = 'Cod. Venda'
      DisplayWidth = 15
      FieldName = 'chave'
      Origin = 'chave'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendasddata_venda: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Data venda'
      DisplayWidth = 22
      FieldName = 'ddata_venda'
      Origin = 'ddata_venda'
    end
    object qryVendasnchbomba: TIntegerField
      DisplayLabel = 'Cod. Bomba'
      DisplayWidth = 12
      FieldName = 'nchbomba'
      Origin = 'nchbomba'
      Required = True
      Visible = False
    end
    object qryVendasclcBomba: TStringField
      DisplayLabel = 'Bomba'
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = 'clcBomba'
      Calculated = True
    end
    object qryVendasnchproduto: TIntegerField
      DisplayLabel = 'Cod. Produto'
      DisplayWidth = 15
      FieldName = 'nchproduto'
      Origin = 'nchproduto'
      Required = True
    end
    object qryVendasclcProduto: TStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 21
      FieldKind = fkCalculated
      FieldName = 'clcProduto'
      Calculated = True
    end
    object qryVendasnlitros_total: TFloatField
      DisplayLabel = 'Litros'
      DisplayWidth = 15
      FieldName = 'nlitros_total'
      Origin = 'nlitros_total'
      DisplayFormat = '0.00'
    end
    object qryVendasnlitros_unit: TFloatField
      DisplayLabel = 'Unit R$ / L '
      DisplayWidth = 15
      FieldName = 'nlitros_unit'
      Origin = 'nlitros_unit'
      DisplayFormat = '0.00'
    end
    object qryVendasnimposto_total: TFloatField
      DisplayLabel = 'Imposto'
      DisplayWidth = 17
      FieldName = 'nimposto_total'
      Origin = 'nimposto_total'
      currency = True
    end
    object qryVendasnimposto_unit: TFloatField
      DisplayWidth = 14
      FieldName = 'nimposto_unit'
      Origin = 'nimposto_unit'
      Visible = False
      currency = True
    end
    object qryVendasntotal_pagar: TFloatField
      DisplayLabel = 'R$ Total'
      DisplayWidth = 16
      FieldName = 'ntotal_pagar'
      Origin = 'ntotal_pagar'
      currency = True
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 544
    Top = 304
  end
  object qryBomba: TFDQuery
    AfterScroll = qryBombaAfterScroll
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select *   from bomba where lativo = '#39'T'#39)
    Left = 487
    Top = 359
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
    Left = 543
    Top = 359
  end
  object qryProdutos: TFDQuery
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select prod.*'
      '  from produtos prod'
      'inner join prod_bomba pb on pb.nchproduto = prod.chave'
      'inner join bomba b on b.chave = pb.nchbomba'
      'where pb.nchbomba = :nchbomba')
    Left = 487
    Top = 407
    ParamData = <
      item
        Name = 'NCHBOMBA'
        ParamType = ptInput
      end>
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
    Top = 407
  end
end
