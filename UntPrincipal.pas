unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UntPessoa,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UntUtil, UntPessoaController, UntEnderecoController,
  UntTelefoneTipoController, UntTelefoneController;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    pnlFundo: TPanel;
    pnlLateral: TPanel;
    SBtnSair: TSpeedButton;
    sbListaTelefone: TSpeedButton;
    sbListaEndereco: TSpeedButton;
    sbListaPessoa: TSpeedButton;
    sbMenu: TSpeedButton;
    sbListaTpContato: TSpeedButton;
    Panel3: TPanel;
    PageCtrlLista: TPageControl;
    TabSPessoa: TTabSheet;
    TabSEndereco: TTabSheet;
    TabSTelefone: TTabSheet;
    TabSTelefoneTipo: TTabSheet;
    DBNavPessoa: TDBNavigator;
    pnlPesquisa: TPanel;
    edtPesquisaPessoa: TEdit;
    SBtnPesquisaPessoa: TSpeedButton;
    DBGEndereco: TDBGrid;
    DBNavEndereco: TDBNavigator;
    pnlHeader: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    sbPesquisaEndereco: TSpeedButton;
    edtPesquisaEndereco: TEdit;
    FDQEndereco: TFDQuery;
    DtSrcEndereco: TDataSource;
    FDQEnderecoid: TIntegerField;
    FDQEnderecologradouro: TWideStringField;
    FDQEndereconumero: TBCDField;
    FDQEnderecocep: TBCDField;
    FDQEnderecobairro: TWideStringField;
    FDQEnderecocidade: TWideStringField;
    FDQEnderecoestado: TWideStringField;
    FDQPessoa: TFDQuery;
    DtSrcPessoa: TDataSource;
    FDQPessoaid: TIntegerField;
    FDQPessoanome: TWideStringField;
    FDQPessoacpf: TLargeintField;
    FDQPessoaendereco: TIntegerField;
    DBGPessoa: TDBGrid;
    DBNavTelefoneTipo: TDBNavigator;
    PnlHeaderTelefoneTipo: TPanel;
    Panel7: TPanel;
    sbtnPesquisaTelefoneTipo: TSpeedButton;
    edtPesquisaTelefoneTipo: TEdit;
    DBGTelefoneTipo: TDBGrid;
    FDQTelefoneTipo: TFDQuery;
    DtSrcTelefoneTipo: TDataSource;
    FDQTelefoneTipoid: TIntegerField;
    FDQTelefoneTipotipo: TWideStringField;
    DBGtelefone: TDBGrid;
    pnlHeaderTelefone: TPanel;
    Panel8: TPanel;
    sbtnPesquisaTelefone: TSpeedButton;
    edtPesquisaTelefone: TEdit;
    DBNavTelefone: TDBNavigator;
    FDQTelefone: TFDQuery;
    DtSrcTelefone: TDataSource;
    FDQTelefoneid: TIntegerField;
    FDQTelefonenumero: TBCDField;
    FDQTelefoneddd: TBCDField;
    FDQTelefonetipo2: TIntegerField;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure sbMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbListaPessoaClick(Sender: TObject);
    procedure sbListaEnderecoClick(Sender: TObject);
    procedure sbListaTelefoneClick(Sender: TObject);
    procedure sbListaTpContatoClick(Sender: TObject);
    procedure SBtnSairClick(Sender: TObject);
    procedure TabSPessoaHide(Sender: TObject);
    procedure TabSEnderecoHide(Sender: TObject);
    procedure FDQEnderecoBeforeInsert(DataSet: TDataSet);
    procedure FDQEnderecoBeforeEdit(DataSet: TDataSet);
    procedure sbPesquisaEnderecoClick(Sender: TObject);
    procedure FDQPessoaBeforeInsert(DataSet: TDataSet);
    procedure FDQPessoaBeforeEdit(DataSet: TDataSet);
    procedure SBtnPesquisaPessoaClick(Sender: TObject);
    procedure TabSTelefoneTipoHide(Sender: TObject);
    procedure sbtnPesquisaTelefoneTipoClick(Sender: TObject);
    procedure FDQTelefoneTipoBeforeInsert(DataSet: TDataSet);
    procedure FDQTelefoneTipoBeforeEdit(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FDQTelefoneBeforeInsert(DataSet: TDataSet);
    procedure TabSTelefoneHide(Sender: TObject);
    procedure FDQTelefoneBeforeEdit(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure verificaPesquisa();
    procedure visualizarPesquisas();
  end;

var
  FrmPrincipal: TFrmPrincipal;
  pEspandido: boolean;
  vUtil: TUtil;
  vPessoaController: TPessoaController;
  vEnderecoController: TEnderecoController;
  vTelefoneTipoController: TTelefoneTipoController;
  vTelefoneController: TTelefoneController;


implementation

{$R *.dfm}

uses UntDtModPrincipal, UntCadEndereco, UntCadPessoa, UntCadTelefoneTipo,
  UntCadTelefone;

var
  FormCadEndereco: TFormCadEndereco;
  FormCadPessoa: TFormCadPessoa;
  FormCadTelefoneTipo: TFormCadTelefoneTipo;
  FormCadTelefone: TFormCadTelefone;

procedure TFrmPrincipal.FDQEnderecoBeforeEdit(DataSet: TDataSet);
begin
  FormCadEndereco := TFormCadEndereco.Create(Self);
  with FormCadEndereco do begin
    edtId.Text := FDQEndereco.FieldByName('ID').AsString;
    edtLogradouro.Text := FDQEndereco.FieldByName('LOGRADOURO').AsString;
    edtNumeroEnde.Text := FDQEndereco.FieldByName('NUMERO').AsString;
    edtCepEnde.Text := FDQEndereco.FieldByName('CEP').AsString;
    edtBairroEnde.Text := FDQEndereco.FieldByName('BAIRRO').AsString;
    edtCidadeEnde.Text := FDQEndereco.FieldByName('CIDADE').AsString;
    edtEstadoEnde.Text := FDQEndereco.FieldByName('ESTADO').AsString;
    btnPessoaEndereco.Enabled := true;
    Parent := PageCtrlLista;
    Show;
  end;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQEnderecoBeforeInsert(DataSet: TDataSet);
begin
  FormCadEndereco := TFormCadEndereco.Create(Self);
  with FormCadEndereco do begin
    btnPessoaEndereco.Enabled := false;
    Parent := PageCtrlLista;
    Show;
  end;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQPessoaBeforeEdit(DataSet: TDataSet);
begin
  FormCadPessoa := TFormCadPessoa.Create(Self);
  with FormCadPessoa do begin
    edtId.Text := FDQPessoa.FieldByName('ID').AsString;
    edtNome.Text := FDQPessoa.FieldByName('NOME').AsString;
    edtCpf.Text := FDQPessoa.FieldByName('CPF').AsString;
    FDQEndereco.Close();
    FDQEndereco.Open();
    FDQEndereco.Locate('id', FDQPessoa
                             .FieldByName('ENDERECO').AsString, []);
    Parent := PageCtrlLista;
    Show;
  end;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQPessoaBeforeInsert(DataSet: TDataSet);
begin
  FormCadPessoa := TFormCadPessoa.Create(Self);
  with FormCadPessoa do begin
    Parent := PageCtrlLista;
    Show;
  end;
  FDQEndereco.Close();
  FDQEndereco.Open();
  FormCadPessoa.DBLkupCmbBEndereco.ListFieldIndex := -1;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQTelefoneBeforeEdit(DataSet: TDataSet);
begin
  FormCadTelefone := TFormCadTelefone.Create(Self);
  with FormCadTelefone do begin
    edtId.Text := FDQTelefone.FieldByName('ID').AsString;
    edtNumero.Text := FDQTelefone.FieldByName('NUMERO').AsString;
    edtDDD.Text := FDQTelefone.FieldByName('DDD').AsString;
    FDQTelefoneTipo.Close();
    FDQTelefoneTipo.Open();
    FDQTelefoneTipo.Locate('id', FDQTelefone
                                   .FieldByName('TIPO').AsString, []);
    Parent := PageCtrlLista;
    Show;
  end;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQTelefoneBeforeInsert(DataSet: TDataSet);
begin
  FormCadTelefone := TFormCadTelefone.Create(Self);
  with FormCadTelefone do begin
    Parent := PageCtrlLista;
    Show;
  end;
  FDQTelefoneTipo.Close();
  FDQTelefoneTipo.Open();
  FormCadTelefone.DBLkupCmbBTelefoneTipo.ListFieldIndex := -1;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQTelefoneTipoBeforeEdit(DataSet: TDataSet);
begin
  FormCadTelefoneTipo := TFormCadTelefoneTipo.Create(Self);
  with FormCadTelefoneTipo do begin
    edtId.Text := FDQTelefoneTipo.FieldByName('ID').AsString;
    edtTipo.Text := FDQTelefoneTipo.FieldByName('TIPO').AsString;
    Parent := PageCtrlLista;
    Show;
  end;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FDQTelefoneTipoBeforeInsert(DataSet: TDataSet);
begin
  FormCadTelefoneTipo := TFormCadTelefoneTipo.Create(Self);
  with FormCadTelefoneTipo do begin
    Parent := PageCtrlLista;
    Show;
  end;
  vUtil.alterarPgControl(pnlLateral);
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  vUtil.Destroy;
  vPessoaController.Destroy;
  vEnderecoController.Destroy;
  vTelefoneTipoController.Destroy;
  vTelefoneController.Destroy;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  pnlLateral.Width := 49;
  vUtil := TUtil.Create;
  vPessoaController := TPessoaController.Create;
  vEnderecoController := TEnderecoController.Create;
  vTelefoneTipoController := TTelefoneTipoController.Create;
  vTelefoneController := TTelefoneController.Create;
end;

procedure TFrmPrincipal.sbMenuClick(Sender: TObject);
begin
   if (pEspandido) then
     pnlLateral.Width := 49
   else
     pnlLateral.Width := 169;

   pEspandido := not pEspandido;
end;

procedure TFrmPrincipal.SBtnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  DtModPrincipal.frxReportPessoa.ShowReport(true);
end;

procedure TFrmPrincipal.SBtnPesquisaPessoaClick(Sender: TObject);
begin
  verificaPesquisa();
end;

procedure TFrmPrincipal.sbtnPesquisaTelefoneTipoClick(Sender: TObject);
begin
  verificaPesquisa();
end;

procedure TFrmPrincipal.sbPesquisaEnderecoClick(Sender: TObject);
begin
  verificaPesquisa();
end;

procedure TFrmPrincipal.sbListaTelefoneClick(Sender: TObject);
begin
  visualizarPesquisas();
  PageCtrlLista.ActivePageIndex := 2;
  verificaPesquisa();
end;

procedure TFrmPrincipal.sbListaEnderecoClick(Sender: TObject);
begin
  visualizarPesquisas();
  PageCtrlLista.ActivePageIndex := 1;
  // Para pesquisar todos descomentar codigo abaixo:
  // edtPesquisaEndereco.Text := '';
  verificaPesquisa();
end;

procedure TFrmPrincipal.sbListaPessoaClick(Sender: TObject);
begin
  visualizarPesquisas();
  PageCtrlLista.ActivePageIndex := 0;
  // Para pesquisar todos descomentar codigo abaixo:
  // edtPesquisaPessoa.Text := '';
  verificaPesquisa();
end;

procedure TFrmPrincipal.sbListaTpContatoClick(Sender: TObject);
begin
  visualizarPesquisas();
  PageCtrlLista.ActivePageIndex := 3;
  verificaPesquisa();
end;

procedure TFrmPrincipal.TabSEnderecoHide(Sender: TObject);
begin
  FDQEndereco.Close();
end;

procedure TFrmPrincipal.TabSTelefoneHide(Sender: TObject);
begin
  FDQTelefone.Close();
end;

procedure TFrmPrincipal.TabSTelefoneTipoHide(Sender: TObject);
begin
  FDQTelefoneTipo.Close();
end;

procedure TFrmPrincipal.TabSPessoaHide(Sender: TObject);
begin
  FDQPessoa.Close();
end;

procedure TFrmPrincipal.verificaPesquisa;
begin
  case PageCtrlLista.ActivePageIndex of
     0: begin
       vPessoaController.pesquisar(FDQPessoa, edtPesquisaPessoa);
       // Seta comando para preencher combo da tela de cadastro de pessoas
       with FDQEndereco do begin
         Close;
         SQL.Text := 'SELECT * FROM ENDERECO ORDER BY ID ASC';
       end;
     end;
     1: begin
       vEnderecoController.pesquisar(FDQEndereco, edtPesquisaEndereco);
     end;
     2: begin
       vTelefoneController.pesquisar(FDQTelefone, edtPesquisaTelefone);
     end;
     3: begin
       vTelefoneTipoController.pesquisar(FDQTelefoneTipo, edtPesquisaTelefoneTipo)
     end;
  end;
end;

procedure TFrmPrincipal.visualizarPesquisas;
begin
  if (not PageCtrlLista.Visible) then
    PageCtrlLista.Visible := true;
end;

end.
