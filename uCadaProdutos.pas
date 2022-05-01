{#####################################################################
#                     Fortes Tecnologia - Avaliação
######################################################################
# DATE                  NAME                        ACTION
----------------------------------------------------------------------
# 30-04-2022            Guilherme Chiarini          Create forms
######################################################################}

unit uCadaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, udataModulo,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadProdutos = class(TForm)
    pnlFundo: TPanel;
    pnl4: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtchave: TDBEdit;
    qryProdutos: TFDQuery;
    dsProdutos: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    lbl3: TLabel;
    edtNomeProduto: TDBEdit;
    qryProdutosChave: TIntegerField;
    qryProdutosnvalor: TFloatField;
    qryProdutosnimposto: TFloatField;
    qryProdutostdescricao: TStringField;
    lbl1: TLabel;
    lbl2: TLabel;
    edtValor: TDBEdit;
    edtImposto: TDBEdit;
    lbl4: TLabel;
    pnl1: TPanel;
    grdProduto: TDBGrid;
    qryBomba: TFDQuery;
    qryBombachave: TIntegerField;
    qryBombatdescricao: TStringField;
    qryBombalativo: TStringField;
    qryBombanchtanque: TIntegerField;
    qryBombaclcTanque: TStringField;
    dsBomba: TDataSource;
    pnl5: TPanel;
    lbl5: TLabel;
    cboBomba: TDBLookupComboBox;
    grd1: TDBGrid;
    btnExclBomba: TButton;
    btnAltBomba: TButton;
    btnCancelBomba: TButton;
    btnSalvarbomba: TButton;
    btnNovoBomba: TButton;
    qryprod_Bomba: TFDQuery;
    dsprod_bomba: TDataSource;
    qryprod_Bombachave: TIntegerField;
    qryprod_Bombanchproduto: TIntegerField;
    qryprod_Bombanchbomba: TIntegerField;
    qryprod_Bombaclcbomba: TStringField;
    edtchave1: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSairClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure qryProdutosAfterScroll(DataSet: TDataSet);
    procedure btnNovoBombaClick(Sender: TObject);
    procedure btnSalvarbombaClick(Sender: TObject);
    procedure btnCancelBombaClick(Sender: TObject);
    procedure btnAltBombaClick(Sender: TObject);
    procedure btnExclBombaClick(Sender: TObject);
    procedure qryprod_BombaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Controle;
    procedure Controle_Bomba;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AControle: integer); reintroduce;

  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

uses Global;

{ TfrmCadProdutos }

procedure TfrmCadProdutos.Controle_Bomba;
begin
  if (qryprod_Bomba.State in [dsInsert, dsEdit]) then
  begin
    btnSalvarbomba.Enabled := True;
    btnCancelBomba.Enabled := True;
    btnNovoBomba.Enabled := False;
    btnAltBomba.Enabled := False;
    btnExclBomba.Enabled := False;
    cboBomba.Enabled := True;
  end
  else
  begin
    btnSalvarbomba.Enabled := False;
    btnCancelBomba.Enabled := False;
    btnNovoBomba.Enabled := True;
    btnAltBomba.Enabled := True;
    btnExclBomba.Enabled := True;
    cboBomba.Enabled := False;
  end;

  qryBomba.Close;
  qryBomba.Open();
end;

procedure TfrmCadProdutos.btnAltBombaClick(Sender: TObject);
begin
  qryprod_Bomba.Edit;
  Controle_Bomba;
end;

procedure TfrmCadProdutos.btnAlterarClick(Sender: TObject);
begin
  qryProdutos.Edit;
  Controle;
end;

procedure TfrmCadProdutos.btnCancelarClick(Sender: TObject);
begin
  qryProdutos.Cancel;
  Controle;
end;

procedure TfrmCadProdutos.btnCancelBombaClick(Sender: TObject);
begin
  qryprod_Bomba.Cancel;
  Controle_Bomba;
end;

procedure TfrmCadProdutos.btnExclBombaClick(Sender: TObject);
begin
  Controle_Bomba;
  if Global.alerta('Deseja realmente excluir a bomba?') then
  BEGIN
    qryprod_Bomba.Delete;
    qryprod_Bomba.ApplyUpdates(0);
  end;

  qryprod_Bomba.Close;
  qryprod_Bomba.Open;
end;

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
  Controle;
  if Global.alerta('Deseja realmente excluir o produto?') then
  BEGIN
    qryProdutos.Delete;
    qryProdutos.ApplyUpdates(0);
  end;

  qryProdutos.Close;
  qryProdutos.Open;
end;

procedure TfrmCadProdutos.btnNovoBombaClick(Sender: TObject);
begin
  qryprod_Bomba.Close;
  qryprod_Bomba.ParamByName('nchproduto').AsInteger := qryProdutos.FieldByName('chave').AsInteger;
  qryprod_Bomba.Open;
  qryprod_Bomba.Append;

  Controle_bomba;
end;

procedure TfrmCadProdutos.btnNovoClick(Sender: TObject);
begin
  qryProdutos.Close;
  qryProdutos.Open;
  qryProdutos.Append;

  Controle;
  FocusControl(edtNomeProduto);
end;

procedure TfrmCadProdutos.btnSairClick(Sender: TObject);
begin
  if global.alerta('Deseja realmente sair do "CADASTRO DE PRODUTO"?') then
  begin
    close;
  end
  else
  begin
    abort;
  end;
end;

procedure TfrmCadProdutos.btnSalvarbombaClick(Sender: TObject);
const prod_bomba = 'prod_bomba';
begin
  if (qryprod_Bomba.State in [dsInsert , dsEdit]) then
  begin
    if cboBomba.KeyValue = null then
    begin
      Global.abortar('Insira a bomba ao produto.');
      FocusControl(cboBomba);
      Abort;
    end;

    qryprod_Bomba.FieldByName('nchproduto').AsInteger := qryProdutos.FieldByName('Chave').AsInteger;

    if edtchave1.Text = emptystr then
    begin
      qryprod_Bomba.FieldByName('CHAVE').AsInteger := Global.verificar_gen(prod_bomba);
    end;

    qryprod_Bomba.Post;

    if qryprod_Bomba.ApplyUpdates(0) <> 0 then
    begin
       Global.abortar('Erro ao gravar bomba vinculada ao produto.');
       Abort;
    end;

    qryprod_Bomba.close;
    qryprod_Bomba.open;
  end;

  Controle_Bomba;
end;

procedure TfrmCadProdutos.btnSalvarClick(Sender: TObject);
const produtos = 'produtos';
begin
  if (qryProdutos.State in [dsInsert , dsEdit]) then
  begin
    if qryProdutos.FieldByName('TDESCRICAO').AsString = EmptyStr then
    begin
      Global.abortar('Insira o nome do produto.');
      edtNomeProduto.Color := $006F6FFD;
      FocusControl(edtNomeProduto);
      Abort;
    end;

    if (qryProdutos.FieldByName('nvalor').AsFloat = 0) or (qryProdutos.FieldByName('nvalor').AsFloat < 0) then
    begin
      Global.abortar('Valor do produto não pode ser igual ou menor que 0,00.');
      edtValor.Color := $006F6FFD;
      FocusControl(edtValor);
      Abort;
    end;

    if cboBomba.KeyValue = null then
    begin
      Global.abortar('Insira a bomba ao produto.');
      FocusControl(cboBomba);
      Abort;
    end;

    if edtchave.Text = emptystr then
    begin
      qryProdutos.FieldByName('CHAVE').AsInteger := Global.verificar_gen(produtos);
    end;

    qryProdutos.Post;

    if qryProdutos.ApplyUpdates(0) <> 0 then
    begin
       Global.abortar('Erro ao gravar Produto.');
       Abort;
    end;

    qryProdutos.close;
    qryProdutos.open;
  end;

  Controle;
end;

procedure TfrmCadProdutos.Controle;
begin
  if (qryProdutos.State in [dsInsert, dsEdit]) then
  begin
    btnSalvar.Enabled := True;
    btnCancelar.Enabled := True;
    btnNovo.Enabled := False;
    btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
    edtNomeProduto.ReadOnly := False;
    edtValor.ReadOnly := False;
    edtImposto.ReadOnly := False;
    cboBomba.Enabled := True;
  end
  else
  begin
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled := True;
    btnAlterar.Enabled := True;
    btnExcluir.Enabled := True;
    edtNomeProduto.ReadOnly := True;
    edtValor.ReadOnly := True;
    edtImposto.ReadOnly := True;
    cboBomba.Enabled := False;
  end;
end;

constructor TfrmCadProdutos.Create(AOwner: TComponent; AControle: integer);
begin
  inherited Create(Aowner);

  qryProdutos.Close;
  qryProdutos.Open;

  qryprod_Bomba.Close;
  qryprod_Bomba.ParamByName('nchproduto').AsInteger := qryProdutos.FieldByName('chave').AsInteger;
  qryprod_Bomba.Open;

  Controle;
  Controle_Bomba;
end;

procedure TfrmCadProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if global.alerta('Deseja realmente sair do "CADASTRO DE PRODUTO"?') then
    begin
      close;
    end
    else
    begin
      abort;
    end;
  end;
end;

procedure TfrmCadProdutos.qryProdutosAfterScroll(DataSet: TDataSet);
begin
  qryprod_Bomba.Close;
  qryprod_Bomba.ParamByName('nchproduto').AsInteger := qryProdutos.FieldByName('chave').AsInteger;
  qryprod_Bomba.Open;
end;

procedure TfrmCadProdutos.qryprod_BombaCalcFields(DataSet: TDataSet);
begin
  qryprod_Bomba.FieldByName('clcbomba').AsString := Global.nome_bomba(qryprod_Bomba.FieldByName('nchbomba').AsInteger);
end;

end.
