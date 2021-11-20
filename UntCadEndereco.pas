unit UntCadEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  UntIEndereco, UntEndereco, UntUtil, UntEnderecoController, Vcl.DBCtrls,
  UntPesqPessoaEndereco;

type
  TFormCadEndereco = class(TForm)
    edtBairroEnde: TEdit;
    edtCepEnde: TEdit;
    edtCidadeEnde: TEdit;
    edtEstadoEnde: TEdit;
    edtNumeroEnde: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    pnlBotoesCadEnde: TPanel;
    btnCancelarEnde: TButton;
    btnSalvarEnde: TButton;
    pnlHederCadEnde: TPanel;
    Label1: TLabel;
    edtLogradouro: TEdit;
    Label3: TLabel;
    edtId: TEdit;
    Label2: TLabel;
    btnPessoaEndereco: TButton;
    btnRelatPorPessoa: TButton;
    procedure btnCancelarEndeClick(Sender: TObject);
    procedure btnSalvarEndeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPessoaEnderecoClick(Sender: TObject);
    procedure btnRelatPorPessoaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limpaCampos();
  end;

var
  FormCadEndereco: TFormCadEndereco;
  FormPessoaEndereco: TFrmPessoaEndereco;
  vUtil: TUtil;
  vEndereco: IEndereco;
  vEnderecoController: TEnderecoController;

implementation

{$R *.dfm}

uses UntPrincipal, UntDtModPrincipal;

procedure TFormCadEndereco.btnCancelarEndeClick(Sender: TObject);
begin
  TFrmPrincipal(Self.Owner).FDQEndereco.Cancel;
  limpaCampos();
  vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
  Self.Destroy;
end;

procedure TFormCadEndereco.btnSalvarEndeClick(Sender: TObject);
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

  if (vEnderecoController.verificaCampos(vEndereco)) then begin
    //FDQEndereco.Post;
    // verificar se inclusao ou alteracao
    if (edtId.Text = '') then
      vEnderecoController.inserirAlterarEndereco(-1, vEndereco)
    else
      vEnderecoController.inserirAlterarEndereco(StrToInt(edtId.Text), vEndereco);

    TFrmPrincipal(Self.Owner).FDQEndereco.Close();
    TFrmPrincipal(Self.Owner).FDQEndereco.Open();
    limpaCampos();
    vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
    Self.Destroy;
  end else
    ShowMessage('Preencha todos os campos!');

end;

procedure TFormCadEndereco.btnRelatPorPessoaClick(Sender: TObject);
begin
   with DtModPrincipal do begin
     FDQPessoaPorEnde.Close;
     FDQPessoaPorEnde.ParamByName('ID_ENDE').AsInteger := StrToInt(edtId.Text);
     FDQPessoaPorEnde.Open;
     frxReportPessoaPorEnde.ShowReport(true);
   end;
end;

procedure TFormCadEndereco.btnPessoaEnderecoClick(Sender: TObject);
begin
  FrmPessoaEndereco := TFrmPessoaEndereco.Create(TFrmPrincipal(Self.Owner));
  with FrmPessoaEndereco do begin
    IdEndereco := StrToInt(edtId.Text);
    Parent := TFrmPrincipal(Self.Owner).PageCtrlLista;
    Show;
  end;
  TFrmPrincipal(Self.Owner).FDQEndereco.Cancel;
  limpaCampos();
  Self.Destroy;
end;

procedure TFormCadEndereco.FormCreate(Sender: TObject);
begin
  vUtil := TUtil.Create;
  vEnderecoController := TEnderecoController.Create;
end;

procedure TFormCadEndereco.limpaCampos;
begin
  edtId.Text := '';
  edtLogradouro.Text := '';
  edtNumeroEnde.Text := '';
  edtCepEnde.Text := '';
  edtBairroEnde.Text := '';
  edtCidadeEnde.Text := '';
  edtEstadoEnde.Text := '';
end;

end.
