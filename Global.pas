{#####################################################################
#                     Fortes Tecnologia - Avaliação
######################################################################
# DATE                  NAME                        ACTION
----------------------------------------------------------------------
# 30-04-2022            Guilherme Chiarini          Create forms
######################################################################}

unit Global;

interface

uses sysutils, StrUtils, Data.SqlExpr, winapi.windows, Vcl.Controls, Vcl.Menus, Vcl.ExtCtrls, Vcl.MPlayer,
     Vcl.DBCtrls, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart,
     Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, System.MaskUtils, jpeg, WinInet, Vcl.Forms,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, dateutils,
     FireDAC.Comp.Client, udataModulo;

function aviso(AMensagem:string): string;
function alerta(AMensagem:string): Boolean;
function abortar(AMensagem: string): string;
function verificar_gen(Sequence: string): integer;
function nome_tanque(AchTanque: Integer): string;
function nome_bomba(AchBomba: Integer): string;
function nome_produto(AchProduto: Integer): string;

implementation

function aviso(AMensagem:string): string;
begin
  Result := '';

  Application.MessageBox(PChar(AMensagem), PChar('Aviso'), MB_OK +  MB_ICONINFORMATION);

  Result := 'msg';
end;

function alerta(AMensagem: string): Boolean;
begin
  Result := False;

  if Application.MessageBox(PChar(AMensagem), PChar('Alerta'), MB_YESNO + MB_ICONWARNING) = IDYES then
  begin
    Result := True;
  end;
end;

function abortar(AMensagem: string): string;
begin
  Result := '';

  Application.MessageBox(PChar(AMensagem), PChar('Erro'), MB_OK + MB_ICONSTOP);

  Result := 'msg';
end;

function verificar_gen(Sequence: string): integer;
  var qrySequence : TFDQuery;
begin
  Result := 0;
  qrySequence := TFDQuery.Create(nil);
  try
    qrySequence.Connection := DM.CONEXAO;
    qrySequence.Close;

    qrySequence.SQL.Clear;
    qrySequence.SQL.Add('select max(chave) nextval from '+Sequence);
    qrySequence.Open;

    if qrySequence.FieldByName('nextval').IsNull then
    begin
      Result := 1;
    end
    else
    begin
      Result := qrySequence.FieldByName('nextval').AsInteger + 1;
    end;
  finally
    qrySequence.Free;
  end;
end;

function nome_tanque(AchTanque: Integer): string;
var qryTanque: TFDQuery;
begin
  Result := '';

  qryTanque := TFDQuery.Create(nil);
  try
    qryTanque.Connection := dm.CONEXAO;
    qryTanque.Close;
    qryTanque.sql.Clear;

    qryTanque.SQL.Add('select tdescricao from tanque where chave  = :nchtanque');
    qryTanque.ParamByName('nchtanque').AsInteger := AchTanque;
    qryTanque.Open;

    Result := qryTanque.FieldByName('tdescricao').AsString;
  finally
    FreeAndNil(qryTanque);
  end;
end;

function nome_bomba(AchBomba: Integer): string;
var qryBomba: TFDQuery;
begin
  Result := '';

  qryBomba := TFDQuery.Create(nil);
  try
    qryBomba.Connection := dm.CONEXAO;
    qryBomba.Close;
    qryBomba.sql.Clear;

    qryBomba.SQL.Add('select tdescricao from bomba where chave  = :nchbomba');
    qryBomba.ParamByName('nchbomba').AsInteger := AchBomba;
    qryBomba.Open;

    Result := qryBomba.FieldByName('tdescricao').AsString;
  finally
    FreeAndNil(qryBomba);
  end;
end;

function nome_produto(AchProduto: Integer): string;
var qryProd: TFDQuery;
begin
  Result := '';

  qryProd := TFDQuery.Create(nil);
  try
    qryProd.Connection := dm.CONEXAO;
    qryProd.Close;
    qryProd.sql.Clear;

    qryProd.SQL.Add('select tdescricao from produtos where chave = :nchproduto');
    qryProd.ParamByName('nchproduto').AsInteger := AchProduto;
    qryProd.Open;

    Result := qryProd.FieldByName('tdescricao').AsString;
  finally
    FreeAndNil(qryProd);
  end;
end;

end.
