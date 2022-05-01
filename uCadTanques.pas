{#####################################################################
#                     Fortes Tecnologia - Avaliação
######################################################################
# DATE                  NAME                        ACTION
----------------------------------------------------------------------
# 30-04-2022            Guilherme Chiarini          Create forms
######################################################################}

unit uCadTanques;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls, Global;

type
  TfrmTanques = class(TForm)
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
    edtTanque: TDBEdit;
    pnl1: TPanel;
    grdBomba: TDBGrid;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    qryTanque: TFDQuery;
    qryTanquechave: TIntegerField;
    qryTanquetdescricao: TStringField;
    dsTanque: TDataSource;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure Controle;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AControle: integer); reintroduce;

  end;

var
  frmTanques: TfrmTanques;

implementation

{$R *.dfm}

{ TfrmTanques }

procedure TfrmTanques.btnAlterarClick(Sender: TObject);
begin
  qryTanque.Edit;
  Controle;
end;

procedure TfrmTanques.btnCancelarClick(Sender: TObject);
begin
  qryTanque.Cancel;
  Controle;
end;

procedure TfrmTanques.btnExcluirClick(Sender: TObject);
begin
  Controle;
  if Global.alerta('Deseja realmente excluir o tanque?') then
  BEGIN
    qryTanque.Delete;
    qryTanque.ApplyUpdates(0);
  end;

  qryTanque.Close;
  qryTanque.Open;
end;

procedure TfrmTanques.btnNovoClick(Sender: TObject);
begin
  qryTanque.Close;
  qryTanque.Open;
  qryTanque.Append;

  Controle;
  FocusControl(edtTanque);
end;

procedure TfrmTanques.btnSairClick(Sender: TObject);
begin
  if global.alerta('Deseja realmente sair do "CADASTRO DE TANQUES"?') then
  begin
    close;
  end
  else
  begin
    abort;
  end;
end;

procedure TfrmTanques.btnSalvarClick(Sender: TObject);
const tanque = 'tanque';
begin
  if (qryTanque.State in [dsInsert , dsEdit]) then
  begin
    if qryTanque.FieldByName('TDESCRICAO').AsString = EmptyStr then
    begin
      Global.abortar('Insira o nome do tanque.');
      edtTanque.Color := $006F6FFD;
      FocusControl(edtTanque);
      Abort;
    end;

    if edtchave.Text = emptystr then
    begin
      qryTanque.FieldByName('CHAVE').AsInteger := Global.verificar_gen(tanque);
    end;

    qryTanque.Post;

    if qryTanque.ApplyUpdates(0) <> 0 then
    begin
       Global.abortar('Erro ao gravar tanque.');
       Abort;
    end;

    qryTanque.close;
    qryTanque.open;
  end;

  Controle;
end;

procedure TfrmTanques.Controle;
begin
  if (qryTanque.State in [dsInsert, dsEdit]) then
  begin
    btnSalvar.Enabled := True;
    btnCancelar.Enabled := True;
    btnNovo.Enabled := False;
    btnAlterar.Enabled := False;
    btnExcluir.Enabled := False;
    edtTanque.ReadOnly := False;
  end
  else
  begin
    btnSalvar.Enabled := False;
    btnCancelar.Enabled := False;
    btnNovo.Enabled := True;
    btnAlterar.Enabled := True;
    btnExcluir.Enabled := True;
    edtTanque.ReadOnly := True;
  end;
end;

constructor TfrmTanques.Create(AOwner: TComponent; AControle: integer);
begin
  inherited Create(Aowner);

  qryTanque.Close;
  qryTanque.Open;

  Controle;
end;

procedure TfrmTanques.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if global.alerta('Deseja realmente sair do "CADASTRO DE TANQUES"?') then
    begin
      close;
    end
    else
    begin
      abort;
    end;
  end;
end;

end.
