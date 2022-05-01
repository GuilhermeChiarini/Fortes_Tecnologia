unit uRptVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, QRCtrls, QuickRpt,
  udataModulo;

type
  TrptVendas = class(TForm)
    qryVendas: TFDQuery;
    dsVendas: TDataSource;
    rlVendas: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel11: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLDBText3: TRLDBText;
    qryVendasnum_venda: TIntegerField;
    qryVendasdata: TWideStringField;
    qryVendasntotal_pagar: TFloatField;
    qryVendasnimposto_total: TFloatField;
    qryVendasnlitros_total: TFloatField;
    qryVendasprod_desc: TWideStringField;
    qryVendasbomba_desc: TStringField;
    qryVendastanque_desc: TStringField;
    RLLabel14: TRLLabel;
    RLDBText4: TRLDBText;
    RLLabel15: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel19: TRLLabel;
    RLDBResult1: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptVendas: TrptVendas;

implementation

{$R *.dfm}

end.
