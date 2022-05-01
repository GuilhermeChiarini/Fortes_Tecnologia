object DM: TDM
  OldCreateOrder = False
  Height = 223
  Width = 243
  object CONEXAO: TFDConnection
    Params.Strings = (
      'Database=E:\Fortes_Tecnologia\database\Fortes_gas.db'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 48
    Top = 120
  end
  object qry1: TFDQuery
    Connection = CONEXAO
    SQL.Strings = (
      'select *'
      ' from produtos')
    Left = 136
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 160
    Top = 120
  end
end
