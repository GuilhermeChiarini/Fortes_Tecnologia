object frmTanques: TfrmTanques
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tanques'
  ClientHeight = 534
  ClientWidth = 645
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
    Width = 645
    Height = 534
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -235
    ExplicitWidth = 630
    object lbl3: TLabel
      Left = 66
      Top = 53
      Width = 58
      Height = 18
      Caption = 'Tanque'
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
      Width = 44
      Height = 18
      Caption = 'Cod.:'
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
      Width = 643
      Height = 48
      Align = alTop
      BorderWidth = 1
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 628
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
        Left = 184
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
        Left = 535
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
      DataSource = dsTanque
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edtTanque: TDBEdit
      Left = 66
      Top = 74
      Width = 343
      Height = 24
      DataField = 'tdescricao'
      DataSource = dsTanque
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object pnl1: TPanel
      Left = 1
      Top = 120
      Width = 643
      Height = 413
      Align = alBottom
      BorderStyle = bsSingle
      TabOrder = 3
      ExplicitTop = 110
      ExplicitWidth = 633
      object grdBomba: TDBGrid
        Left = 1
        Top = 1
        Width = 639
        Height = 409
        Align = alClient
        DataSource = dsTanque
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
            FieldName = 'chave'
            Title.Caption = 'C'#243'd. Tanque'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tdescricao'
            Width = 390
            Visible = True
          end>
      end
    end
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
  object qryTanque: TFDQuery
    CachedUpdates = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      'select *'
      '  from tanque')
    Left = 319
    Top = 159
    object qryTanquechave: TIntegerField
      FieldName = 'chave'
      Origin = 'chave'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTanquetdescricao: TStringField
      DisplayLabel = 'Tanque'
      FieldName = 'tdescricao'
      Origin = 'tdescricao'
    end
  end
  object dsTanque: TDataSource
    DataSet = qryTanque
    Left = 367
    Top = 159
  end
end
