{#####################################################################
#                     Fortes Tecnologia - Avaliação
######################################################################
# DATE                  NAME                        ACTION
----------------------------------------------------------------------
# 30-04-2022            Guilherme Chiarini          Create forms
######################################################################}

unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls,
  dxGDIPlusClasses, Vcl.Buttons, Vcl.StdCtrls, uCadBomba, uCadTanques,
  uRptVendas;

type
  TfrmPrincipal = class(TForm)
    mmMenu: TMainMenu;
    Cadastro1: TMenuItem;
    mnuBomba: TMenuItem;
    Produtos1: TMenuItem;
    Relatrio1: TMenuItem;
    Vendas1: TMenuItem;
    N1: TMenuItem;
    pnlFundo: TPanel;
    pnl1: TPanel;
    imgFundo: TImage;
    pnlMenu: TPanel;
    pnlVendas: TPanel;
    anques1: TMenuItem;
    imgVendas: TImage;
    lbl1: TLabel;
    procedure imgVendasClick(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure mnuBombaClick(Sender: TObject);
    procedure anques1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFrmVendas, uCadaProdutos;

procedure TfrmPrincipal.anques1Click(Sender: TObject);
var tanques: TfrmTanques;
begin
  tanques := TfrmTanques.Create(Self, 0);
  try
    tanques.ShowModal;
  finally
    FreeAndNil(tanques);
  end;
end;

procedure TfrmPrincipal.imgVendasClick(Sender: TObject);
var vendas: TfrmVendas;
begin
  vendas := TfrmVendas.Create(Self, 0);
  try
    vendas.ShowModal;
  finally
    FreeAndNil(vendas);
  end;
end;

procedure TfrmPrincipal.mnuBombaClick(Sender: TObject);
var bomba: TfrmBomba;
begin
  bomba := TfrmBomba.Create(Self, 0);
  try
    bomba.ShowModal;
  finally
    FreeAndNil(bomba)
  end;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
var produtos: TfrmCadProdutos;
begin
  produtos := TfrmCadProdutos.Create(Self, 0);
  try
    produtos.ShowModal;
  finally
    FreeAndNil(produtos);
  end;

end;

procedure TfrmPrincipal.Vendas1Click(Sender: TObject);
var report: TrptVendas;
begin
  report := TrptVendas.Create(nil);
  try
    report.rlVendas.Preview();
  finally
    FreeAndNil(report);
  end;
end;

end.
