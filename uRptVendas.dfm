object rptVendas: TrptVendas
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 811
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlVendas: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 177
      Width = 718
      Height = 22
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      object RLDBText1: TRLDBText
        Left = 3
        Top = 5
        Width = 59
        Height = 14
        DataField = 'num_venda'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 71
        Top = 5
        Width = 82
        Height = 14
        Alignment = taCenter
        AutoSize = False
        DataField = 'data'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 156
        Top = 5
        Width = 106
        Height = 14
        AutoSize = False
        DataField = 'bomba_desc'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 265
        Top = 5
        Width = 106
        Height = 14
        AutoSize = False
        DataField = 'tanque_desc'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 372
        Top = 5
        Width = 106
        Height = 14
        AutoSize = False
        DataField = 'prod_desc'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 481
        Top = 5
        Width = 46
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'nlitros_total'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 533
        Top = 5
        Width = 65
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'nimposto_total'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 601
        Top = 5
        Width = 112
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'ntotal_pagar'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 199
      Width = 718
      Height = 26
      BandType = btSummary
      Color = 14737632
      ParentColor = False
      Transparent = False
      object RLLabel19: TRLLabel
        Left = 547
        Top = 6
        Width = 47
        Height = 16
        Caption = 'TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLDBResult1: TRLDBResult
        Left = 590
        Top = 6
        Width = 125
        Height = 16
        Alignment = taRightJustify
        DataField = 'ntotal_pagar'
        DataSource = dsVendas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 122
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 1
        Top = 3
        Width = 334
        Height = 29
        Caption = 'FORTES TECNOLOGIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw2: TRLDraw
        Left = 1
        Top = 35
        Width = 130
        Height = 84
      end
      object RLLabel3: TRLLabel
        AlignWithMargins = True
        Left = 5
        Top = 81
        Width = 122
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'COMBUST'#205'VEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        AlignWithMargins = True
        Left = 5
        Top = 58
        Width = 122
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'VENDAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 645
        Top = 18
        Width = 69
        Height = 16
        Alignment = taRightJustify
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 594
        Top = 3
        Width = 48
        Height = 16
        Caption = 'P'#225'gina:'
      end
      object RLLabel13: TRLLabel
        Left = 607
        Top = 18
        Width = 35
        Height = 16
        Caption = 'Data:'
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 668
        Top = 0
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Info = itPageNumber
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 160
      Width = 718
      Height = 17
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel9: TRLLabel
        Left = 3
        Top = 3
        Width = 66
        Height = 14
        Caption = 'Cod. Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 70
        Top = 3
        Width = 83
        Height = 14
        Alignment = taCenter
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 156
        Top = 2
        Width = 106
        Height = 14
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 268
        Top = 2
        Width = 44
        Height = 14
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel15: TRLLabel
        Left = 371
        Top = 2
        Width = 47
        Height = 14
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel16: TRLLabel
        Left = 533
        Top = 2
        Width = 65
        Height = 14
        Alignment = taRightJustify
        Caption = 'R$ Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel17: TRLLabel
        Left = 601
        Top = 2
        Width = 112
        Height = 14
        Alignment = taRightJustify
        Caption = 'R$ Total venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 481
        Top = 2
        Width = 46
        Height = 14
        Alignment = taRightJustify
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLDraw1: TRLDraw
      Left = 171
      Top = 73
      Width = 582
      Height = 84
    end
    object RLLabel4: TRLLabel
      Left = 175
      Top = 78
      Width = 197
      Height = 16
      Caption = 'Endere'#231'o: Av. Dos Trabalhadores'
    end
    object RLLabel5: TRLLabel
      Left = 175
      Top = 96
      Width = 95
      Height = 16
      Caption = 'Bairro: Taquaral'
    end
    object RLLabel6: TRLLabel
      Left = 175
      Top = 116
      Width = 99
      Height = 16
      Caption = 'CEP: 13840-000'
    end
    object RLLabel7: TRLLabel
      Left = 175
      Top = 136
      Width = 159
      Height = 16
      Caption = 'CNPJ: 12.456.588/0001-10'
    end
    object RLLabel8: TRLLabel
      Left = 479
      Top = 78
      Width = 110
      Height = 16
      Caption = 'Cidade: Campinas'
    end
  end
  object qryVendas: TFDQuery
    Active = True
    Connection = DM.CONEXAO
    SQL.Strings = (
      '     select v.chave as num_venda,'
      '      '#9#9#9'strftime('#39'%Y-%m-%d'#39',v.ddata_venda) as data,'
      #9'          v.ntotal_pagar,'
      '      '#9#9#9'v.nimposto_total,'
      '      '#9#9#9'v.nlitros_total,'
      '      '#9#9#9'prod.chave ||" - "|| prod.tdescricao as prod_desc,'
      '            b.tdescricao as bomba_desc,'
      #9#9#9'      t.tdescricao as tanque_desc'
      '       from vendas v'
      '  left join produtos prod on prod.chave = v.nchproduto'
      '  left join bomba b on b.chave = v.nchbomba'
      '  left join tanque t on t.chave = b.nchtanque')
    Left = 400
    Top = 296
    object qryVendasnum_venda: TIntegerField
      FieldName = 'num_venda'
      Origin = 'chave'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryVendasdata: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = 'data'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryVendasntotal_pagar: TFloatField
      FieldName = 'ntotal_pagar'
      Origin = 'ntotal_pagar'
      DisplayFormat = '0.00'
    end
    object qryVendasnimposto_total: TFloatField
      FieldName = 'nimposto_total'
      Origin = 'nimposto_total'
      DisplayFormat = '0.00'
    end
    object qryVendasnlitros_total: TFloatField
      FieldName = 'nlitros_total'
      Origin = 'nlitros_total'
      DisplayFormat = '0.00'
    end
    object qryVendasprod_desc: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'prod_desc'
      Origin = 'prod_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryVendasbomba_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'bomba_desc'
      Origin = 'tdescricao'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryVendastanque_desc: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tanque_desc'
      Origin = 'tdescricao'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 456
    Top = 296
  end
end
