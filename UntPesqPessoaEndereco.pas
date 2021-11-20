unit UntPesqPessoaEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, UntEnderecoController, UntDtModPrincipal,
  UntUtil, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmPessoaEndereco = class(TForm)
    pnlBotoesPessoaEndereco: TPanel;
    btnSair: TButton;
    DBGPessoaEndereco: TDBGrid;
    PnlHeader: TPanel;
    Panel6: TPanel;
    sbPesquisa: TSpeedButton;
    edtPesquisa: TEdit;
    DtSrcPessoaEndereco: TDataSource;
    FDQPessoaEndereco: TFDQuery;
    FDQPessoaEnderecoid: TIntegerField;
    FDQPessoaEndereconome: TWideStringField;
    FDQPessoaEnderecocpf: TLargeintField;
    FDQPessoaEnderecoendereco: TIntegerField;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IdEndereco: integer;
  end;

var
  FrmPessoaEndereco: TFrmPessoaEndereco;
  vEnderecoController: TEnderecoController;
  vUtil: TUtil;

implementation

{$R *.dfm}

uses UntPrincipal;

procedure TFrmPessoaEndereco.btnSairClick(Sender: TObject);
begin
  vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
  vUtil.Destroy;
  Self.Destroy;
end;

procedure TFrmPessoaEndereco.FormShow(Sender: TObject);
begin
  vUtil := TUtil.Create;
  FDQPessoaEndereco.ParamByName('IDENDERECO').AsInteger := IdEndereco;
  FDQPessoaEndereco.Close();
  FDQPessoaEndereco.Open();
end;

end.
