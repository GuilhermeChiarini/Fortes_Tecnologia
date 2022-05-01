{#####################################################################
#                     Fortes Tecnologia - Avaliação
######################################################################
# DATE                  NAME                        ACTION
----------------------------------------------------------------------
# 30-04-2022            Guilherme Chiarini          Create forms
######################################################################}

unit uFrmVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Global, udataModulo;

type
  TfrmVendas = class(TForm)
    pnlFundo: TPanel;
    pnlMenu: TPanel;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryVendas: TFDQuery;
    pnlVendas: TPanel;
    lblCodVenda: TLabel;
    edtCoddbVenda: TDBEdit;
    grd1: TDBGrid;
    cboNumBomba: TDBLookupComboBox;
    lblBomba: TLabel;
    edtLitros: TDBEdit;
    cboTipoCombustivel: TDBLookupComboBox;
    lblTipoCombustivel: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    edtValorLitrounit: TDBEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    dsVendas: TDataSource;
    qryBomba: TFDQuery;
    qryBombachave: TIntegerField;
    qryBombatdescricao: TStringField;
    qryBombalativo: TStringField;
    qryBombanchtanque: TIntegerField;
    qryBombaclcTanque: TStringField;
    dsBomba: TDataSource;
    qryProdutos: TFDQuery;
    qryProdutosChave: TIntegerField;
    qryProdutostdescricao: TStringField;
    qryProdutosnvalor: TFloatField;
    qryProdutosnimposto: TFloatField;
    dsProdutos: TDataSource;
    qryVendaschave: TIntegerField;
    qryVendasddata_venda: TDateTimeField;
    qryVendasnchbomba: TIntegerField;
    qryVendasnchproduto: TIntegerField;
    qryVendasnlitros_total: TFloatField;
    qryVendasnlitros_unit: TFloatField;
    qryVendasnimposto_total: TFloatField;
    qryVendasnimposto_unit: TFloatField;
    qryVendasntotal_pagar: TFloatField;
    edtTotalPagar: TEdit;
    edtTotalImposto: TEdit;
    qryVendasclcBomba: TStringField;
    qryVendasclcProduto: TStringField;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure qryVendasAfterScroll(DataSet: TDataSet);
    procedure qryBombaAfterScroll(DataSet: TDataSet);
    procedure edtLitrosExit(Sender: TObject);
    procedure qryVendasCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Controle;
    procedure calcular;

  public
    { Public declarations }

    constructor Create(AOwner: TComponent; AControle: integer); reintroduce;
  end;



var
  frmVendas: TfrmVendas;

implementation

{$R *.dfm}

{ TfrmVendas }

procedure TfrmVendas.btnAlterarClick(Sender: TObject);
begin
  qryVendas.Edit;
  Controle;
end;

procedure TfrmVendas.btnCancelarClick(Sender: TObject);
begin
  qryVendas.Cancel;
  Controle;
end;

procedure TfrmVendas.btnExcluirClick(Sender: TObject);
begin
  Controle;
  if Global.alerta('Deseja realmente excluir a venda?') then
  BEGIN
    qryVendas.Delete;
    qryVendas.ApplyUpdates(0);
  end;

  qryVendas.Close;
  qryVendas.Open;
end;

procedure TfrmVendas.btnNovoClick(Sender: TObject);
begin
  qryVendas.Close;
  qryVendas.Open;
  qryVendas.Append;

  Controle;
  FocusControl(cboNumBomba);
end;

procedure TfrmVendas.btnSairClick(Sender: TObject);
begin
  if global.alerta('Deseja realmente sair do "PEDIDO DE VENDA"?') then
  begin
    close;
  end
  else
  begin
    abort;
  end;
end;

procedure TfrmVendas.btnSalvarClick(Sender: TObject);
const vendas = 'vendas';
var imposto: Double;
begin
  if (qryVendas.State in [dsInsert , dsEdit]) then
  begin
    if cboNumBomba.KeyValue = null  then
    begin
      Global.abortar('Insira o Nº da Bomba.');
      FocusControl(cboNumBomba);
      Abort;
    end;

    if cboTipoCombustivel.KeyValue = null  then
    begin
      Global.abortar('Insira o Tipo de Combustível.');
      FocusControl(cboTipoCombustivel);
      Abort;
    end;

    if edtLitros.Text = EmptyStr then
    begin
      Global.abortar('Insira a quantidade de litros abastecido.');
      edtLitros.Color := $006F6FFD;
      FocusControl(edtLitros);
      Abort;
    end;

    imposto := (qryVendas.FieldByName('nlitros_total').AsFloat * qryProdutos.FieldByName('nvalor').AsFloat) * (qryProdutos.FieldByName('nimposto').AsFloat / 100);

    qryVendas.FieldByName('ddata_venda').AsDateTime := Now;
    qryVendas.FieldByName('nlitros_unit').AsFloat := qryProdutos.FieldByName('nvalor').AsFloat;
    qryVendas.FieldByName('nimposto_total').AsFloat := imposto;
    qryVendas.FieldByName('nimposto_unit').AsFloat := qryProdutos.FieldByName('nimposto').AsFloat / 100;
    qryVendas.FieldByName('ntotal_pagar').AsFloat := (qryVendas.FieldByName('nlitros_total').AsFloat * qryProdutos.FieldByName('nvalor').AsFloat) + imposto;

    if edtCoddbVenda.Text = emptystr then
    begin
      qryVendas.FieldByName('CHAVE').AsInteger := Global.verificar_gen(vendas);
    end;

    qryVendas.Post;

    if qryVendas.ApplyUpdates(0) <> 0 then
    begin
       Global.abortar('Erro ao gravar a venda.');
       Abort;
    end;

    qryVendas.close;
    qryVendas.open;
  end;

  Controle;
end;

procedure TfrmVendas.calcular;
var imposto: Double;
begin
  imposto := (qryVendas.FieldByName('nlitros_total').AsFloat * qryProdutos.FieldByName('nvalor').AsFloat) * (qryProdutos.FieldByName('nimposto').AsFloat / 100);
  edtTotalImposto.Text := Formatfloat('#####0.00', imposto);
  edtTotalPagar.Text :=  Formatfloat('#####0.00',(qryVendas.FieldByName('nlitros_total').AsFloat * qryProdutos.FieldByName('nvalor').AsFloat) + imposto);
end;

procedure TfrmVendas.Controle;
begin
  if (qryVendas.State in [dsInsert, dsEdit]) then
  begin
    btnSalvar.Enabled := True;
    btnCancelar.Enabled := True;
    btnNovo.Enabled := False;
    btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
    cboNumBomba.Enabled := True;
    cboTipoCombustivel.Enabled := True;
    edtLitros.ReadOnly := False;
  end
  else
  begin
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled := True;
    btnAlterar.Enabled := True;
    btnExcluir.Enabled := True;
    cboNumBomba.Enabled := False;
    cboTipoCombustivel.Enabled := False;
    edtLitros.ReadOnly := True;
  end;
end;

constructor TfrmVendas.Create(AOwner: TComponent; AControle: integer);
begin
  inherited Create(Aowner);

  qryVendas.Close;
  qryVendas.Open();

  Controle;
end;

procedure TfrmVendas.edtLitrosExit(Sender: TObject);
begin
  calcular;
end;

procedure TfrmVendas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if global.alerta('Deseja realmente sair do "PEDIDO DE VENDA"?') then
    begin
      close;
    end
    else
    begin
      abort;
    end;
  end;
end;

procedure TfrmVendas.qryBombaAfterScroll(DataSet: TDataSet);
begin
  qryProdutos.Close;
  qryProdutos.ParamByName('nchbomba').AsInteger := qryBomba.FieldByName('chave').AsInteger;
  qryProdutos.Open;
end;

procedure TfrmVendas.qryVendasAfterScroll(DataSet: TDataSet);
begin
  qryBomba.Close;
  qryBomba.Open;

  qryProdutos.Close;
  qryProdutos.ParamByName('nchbomba').AsInteger := qryBomba.FieldByName('chave').AsInteger;
  qryProdutos.Open;

  calcular;
end;

procedure TfrmVendas.qryVendasCalcFields(DataSet: TDataSet);
begin
  qryVendas.FieldByName('clcBomba').AsString := Global.nome_bomba(qryVendas.FieldByName('nchbomba').AsInteger);
  qryVendas.FieldByName('clcProduto').AsString := Global.nome_produto(qryVendas.FieldByName('nchproduto').AsInteger)
end;

end.
