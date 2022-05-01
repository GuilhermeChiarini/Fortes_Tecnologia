{#####################################################################
#                     Fortes Tecnologia - Avaliação
######################################################################
# DATE                  NAME                        ACTION
----------------------------------------------------------------------
# 30-04-2022            Guilherme Chiarini          Create forms
######################################################################}

unit uCadBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TfrmBomba = class(TForm)
    pnlFundo: TPanel;
    lbl3: TLabel;
    lbl1: TLabel;
    pnl4: TPanel;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    edtchave: TDBEdit;
    edtBomba: TDBEdit;
    pnl1: TPanel;
    grdBomba: TDBGrid;
    qryBomba: TFDQuery;
    dsBomba: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    chkAtivo: TDBCheckBox;
    qryBombachave: TIntegerField;
    qryBombatdescricao: TStringField;
    qryBombalativo: TStringField;
    cboTanque: TDBLookupComboBox;
    qryTanque: TFDQuery;
    dsTanque: TDataSource;
    lbl2: TLabel;
    qryTanquechave: TIntegerField;
    qryTanquetdescricao: TStringField;
    qryBombanchtanque: TIntegerField;
    qryBombaclcTanque: TStringField;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure qryBombaAfterScroll(DataSet: TDataSet);
    procedure qryBombaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure Controle;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AControle: integer); reintroduce;

  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}

uses Global;

procedure TfrmBomba.btnAlterarClick(Sender: TObject);
begin
  qryBomba.Edit;
  Controle;
end;

procedure TfrmBomba.btnCancelarClick(Sender: TObject);
begin
  qryBomba.Cancel;
  Controle;
end;

procedure TfrmBomba.btnExcluirClick(Sender: TObject);
begin
  Controle;
  if Global.alerta('Deseja realmente excluir a bomba?') then
  BEGIN
    qryBomba.Delete;
    qryBomba.ApplyUpdates(0);
  end;

  qryBomba.Close;
  qryBomba.Open;
end;

procedure TfrmBomba.btnNovoClick(Sender: TObject);
begin
  qryBomba.Close;
  qryBomba.Open;
  qryBomba.Append;

  Controle;
  FocusControl(edtBomba);
end;

procedure TfrmBomba.btnSairClick(Sender: TObject);
begin
  if global.alerta('Deseja realmente sair do "CADASTRO DE BOMBA"?') then
  begin
    close;
  end
  else
  begin
    abort;
  end;
end;

procedure TfrmBomba.btnSalvarClick(Sender: TObject);
const bomba = 'bomba';
begin
  if (qryBomba.State in [dsInsert , dsEdit]) then
  begin
    if qryBomba.FieldByName('TDESCRICAO').AsString = EmptyStr then
    begin
      Global.abortar('Insira o nome da bomba.');
      edtBomba.Color := $006F6FFD;
      FocusControl(edtBomba);
      Abort;
    end;

    if cboTanque.KeyValue = null  then
    begin
      Global.abortar('Insira qual tanque está sendo utilizado essa bomba.');
      FocusControl(cboTanque);
      Abort;
    end;

    if edtchave.Text = emptystr then
    begin
      qryBomba.FieldByName('CHAVE').AsInteger := Global.verificar_gen(bomba);
    end;

    qryBomba.Post;

    if qryBomba.ApplyUpdates(0) <> 0 then
    begin
       Global.abortar('Erro ao gravar bomba.');
       Abort;
    end;

    qryBomba.close;
    qryBomba.open;
  end;

  Controle;
end;

procedure TfrmBomba.Controle;
begin
  if (qryBomba.State in [dsInsert, dsEdit]) then
  begin
    btnSalvar.Enabled := True;
    btnCancelar.Enabled := True;
    btnNovo.Enabled := False;
    btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
    edtBomba.ReadOnly := False;
    chkAtivo.ReadOnly := False;
    cboTanque.Enabled := True;
  end
  else
  begin
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled := True;
    btnAlterar.Enabled := True;
    btnExcluir.Enabled := True;
    edtBomba.ReadOnly := True;
    chkAtivo.ReadOnly := True;
    cboTanque.Enabled := False;
  end;
end;

constructor TfrmBomba.Create(AOwner: TComponent; AControle: integer);
begin
  inherited Create(Aowner);

  qryBomba.Close;
  qryBomba.Open;

  Controle;
end;

procedure TfrmBomba.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if global.alerta('Deseja realmente sair do "CADASTRO DE BOMBA"?') then
    begin
      close;
    end
    else
    begin
      abort;
    end;
  end;
end;

procedure TfrmBomba.qryBombaAfterScroll(DataSet: TDataSet);
begin
  qryTanque.Close;
  qryTanque.Open;
end;

procedure TfrmBomba.qryBombaCalcFields(DataSet: TDataSet);
begin
  qryBomba.FieldByName('clctanque').AsString := global.nome_tanque(qryBomba.FieldByName('nchtanque').AsInteger);
end;

end.
