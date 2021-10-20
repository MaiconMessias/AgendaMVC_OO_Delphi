unit UntPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UntPessoa,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Vcl.ComCtrls, Data.DB,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UntIEndereco, UntEndereco, UntUtil, UntEnderecoController;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    pnlFundo: TPanel;
    pnlLateral: TPanel;
    SpeedButton1: TSpeedButton;
    sbListaContato: TSpeedButton;
    sbListaEndereco: TSpeedButton;
    sbListaPessoa: TSpeedButton;
    sbMenu: TSpeedButton;
    sbListaTpContato: TSpeedButton;
    Panel3: TPanel;
    PageCtrlLista: TPageControl;
    TabSPessoa: TTabSheet;
    TabSEndereco: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    pnlPesquisa: TPanel;
    edtPesquisa: TEdit;
    SpeedButton5: TSpeedButton;
    DBGEndereco: TDBGrid;
    DBNavEndereco: TDBNavigator;
    Panel4: TPanel;
    SpeedButton7: TSpeedButton;
    Edit1: TEdit;
    pnlHeader: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    sbPesquisar: TSpeedButton;
    edtPesquisar: TEdit;
    PgCtrlCad: TPageControl;
    Label1: TLabel;
    TabSCadEndereco: TTabSheet;
    edtIdPessoa: TEdit;
    Label2: TLabel;
    edtLogradouro: TEdit;
    Label3: TLabel;
    edtNumeroEnde: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtCepEnde: TEdit;
    edtBairroEnde: TEdit;
    Label6: TLabel;
    edtEstadoEnde: TEdit;
    Label7: TLabel;
    edtCidadeEnde: TEdit;
    Label8: TLabel;
    btnSalvarEnde: TButton;
    btnCancelarEnde: TButton;
    FDQEndereco: TFDQuery;
    DtSrcEndereco: TDataSource;
    FDQEnderecoid: TIntegerField;
    FDQEnderecologradouro: TWideStringField;
    FDQEndereconumero: TBCDField;
    FDQEnderecocep: TBCDField;
    FDQEnderecobairro: TWideStringField;
    FDQEnderecocidade: TWideStringField;
    FDQEnderecoestado: TWideStringField;
    pnlHederCadEnde: TPanel;
    pnlBotoesCadEnde: TPanel;
    procedure sbMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbListaPessoaClick(Sender: TObject);
    procedure sbListaEnderecoClick(Sender: TObject);
    procedure sbListaContatoClick(Sender: TObject);
    procedure sbListaTpContatoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabSPessoaHide(Sender: TObject);
    procedure TabSEnderecoHide(Sender: TObject);
    procedure FDQEnderecoBeforeInsert(DataSet: TDataSet);
    procedure btnCancelarEndeClick(Sender: TObject);
    procedure btnSalvarEndeClick(Sender: TObject);
    procedure FDQEnderecoBeforeEdit(DataSet: TDataSet);
    procedure sbPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCampos();
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  pEspandido: boolean;
  vEndereco: IEndereco;
  vUtil: TUtil;
  vEndecoController: TEnderecoController;

implementation

{$R *.dfm}

uses UntDtModPrincipal;

procedure TForm1.btnCancelarEndeClick(Sender: TObject);
begin
  FDQEndereco.Cancel;
  limpaCampos();
  vUtil.alterarPgControl(PageCtrlLista, PgCtrlCad, pnlLateral);
end;

procedure TForm1.btnSalvarEndeClick(Sender: TObject);
begin
  vEndereco := TEndereco.Create;
  vEndereco.Logradouro(edtLogradouro.Text);

  if edtNumeroEnde.Text = '' then
    vEndereco.Numero(-1)
  else
    vEndereco.Numero(StrToInt(edtNumeroEnde.Text));

  if edtCepEnde.Text = '' then
    vEndereco.Cep(-1)
  else
    vEndereco.Cep(StrToInt(edtCepEnde.Text));

  vEndereco.Bairro(edtBairroEnde.Text);
  vEndereco.Cidade(edtCidadeEnde.Text);
  vEndereco.Estado(edtEstadoEnde.Text);

  if (vEndecoController.verificaCampos(vEndereco)) then begin
    //FDQEndereco.Post;
    // verificar se inclusao ou alteracao
    if (edtIdPessoa.Text = '') then
      vEndecoController.inserirAlterarEndereco(-1, vEndereco)
    else
      vEndecoController.inserirAlterarEndereco(StrToInt(edtIdPessoa.Text), vEndereco);

    FDQEndereco.Close();
    FDQEndereco.Open();
    limpaCampos();
    vUtil.alterarPgControl(PageCtrlLista, PgCtrlCad, pnlLateral);
  end else
    ShowMessage('Preencha todos os campos!');
end;

procedure TForm1.FDQEnderecoBeforeEdit(DataSet: TDataSet);
begin
  edtIdPessoa.Text := FDQEndereco.FieldByName('ID').AsString;
  edtLogradouro.Text := FDQEndereco.FieldByName('LOGRADOURO').AsString;
  edtNumeroEnde.Text := FDQEndereco.FieldByName('NUMERO').AsString;
  edtCepEnde.Text := FDQEndereco.FieldByName('CEP').AsString;
  edtBairroEnde.Text := FDQEndereco.FieldByName('BAIRRO').AsString;
  edtCidadeEnde.Text := FDQEndereco.FieldByName('CIDADE').AsString;
  edtEstadoEnde.Text := FDQEndereco.FieldByName('ESTADO').AsString;
  vUtil.alterarPgControl(PageCtrlLista, PgCtrlCad, pnlLateral);
end;

procedure TForm1.FDQEnderecoBeforeInsert(DataSet: TDataSet);
begin
   vUtil.alterarPgControl(PageCtrlLista, PgCtrlCad, pnlLateral);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  pnlLateral.Width := 49;
  vUtil := TUtil.Create;
  vEndecoController := TEnderecoController.Create;
end;

procedure TForm1.sbMenuClick(Sender: TObject);
begin
   if (pEspandido) then
     pnlLateral.Width := 49
   else
     pnlLateral.Width := 169;

   pEspandido := not pEspandido;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm1.sbPesquisarClick(Sender: TObject);
begin
  case PageCtrlLista.ActivePageIndex of
     1: begin
       with FDQEndereco do begin
         Close();
         SQL.Clear;
         if (edtPesquisar.Text <> '') then begin
           SQL.Text := 'SELECT * FROM ENDERECO WHERE LOGRADOURO LIKE :PPESQUISA';
           ParamByName('PPESQUISA').AsString := '%' + edtPesquisar.Text + '%';
         end else
           SQL.Text := 'SELECT * FROM ENDERECO ORDER BY ID ASC';
         Open();
       end;
     end;
     2: begin

     end;
  end;
end;

procedure TForm1.sbListaContatoClick(Sender: TObject);
begin
  PageCtrlLista.ActivePageIndex := 2;
end;

procedure TForm1.sbListaEnderecoClick(Sender: TObject);
begin
  PageCtrlLista.ActivePageIndex := 1;
  FDQEndereco.Close();
  FDQEndereco.Open();
end;

procedure TForm1.sbListaPessoaClick(Sender: TObject);
begin
  PageCtrlLista.ActivePageIndex := 0;
end;

procedure TForm1.sbListaTpContatoClick(Sender: TObject);
begin
  PageCtrlLista.ActivePageIndex := 3;
end;

procedure TForm1.TabSEnderecoHide(Sender: TObject);
begin
  FDQEndereco.Close();
end;

procedure TForm1.TabSPessoaHide(Sender: TObject);
begin
  showmessage('saiu');
end;

procedure TForm1.limpaCampos;
begin
  edtIdPessoa.Text := '';
  edtLogradouro.Text := '';
  edtNumeroEnde.Text := '';
  edtCepEnde.Text := '';
  edtBairroEnde.Text := '';
  edtCidadeEnde.Text := '';
  edtEstadoEnde.Text := '';
  edtPesquisar.Text := '';
end;

end.
