program Forte_gas;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  udataModulo in 'udataModulo.pas' {DM: TDataModule},
  uFrmVendas in 'uFrmVendas.pas' {frmVendas},
  uCadaProdutos in 'uCadaProdutos.pas' {frmCadProdutos},
  Global in 'Global.pas',
  uCadBomba in 'uCadBomba.pas' {frmBomba},
  uCadTanques in 'uCadTanques.pas' {frmTanques},
  uRptVendas in 'uRptVendas.pas' {rptVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TrptVendas, rptVendas);
  Application.Run;
end.
