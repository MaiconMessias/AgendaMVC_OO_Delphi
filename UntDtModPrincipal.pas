unit UntDtModPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.PG, frxClass, frxDBSet;

type
  TDtModPrincipal = class(TDataModule)
    FDConnPrincipal: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    frxReportPessoa: TfrxReport;
    frxDBDtsetPessoa: TfrxDBDataset;
    FDQPessoaPorEnde: TFDQuery;
    frxReportPessoaPorEnde: TfrxReport;
    frxDBDtsetPessoaPorEnde: TfrxDBDataset;
    DtSrcPessoaPorEnde: TDataSource;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DtModPrincipal: TDtModPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UntPrincipal;

{$R *.dfm}

procedure TDtModPrincipal.DataModuleDestroy(Sender: TObject);
begin
  FDConnPrincipal.Connected := false;
end;

end.
