unit UntCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  UntUtil, UntIPessoa, UntPessoa, UntPessoaController, Vcl.DBCtrls;

type
  TFormCadPessoa = class(TForm)
    edtId: TEdit;
    edtNome: TEdit;
    pnlHederCadEnde: TPanel;
    Label1: TLabel;
    pnlBotoesCadEnde: TPanel;
    btnCancelarEnde: TButton;
    btnSalvarEnde: TButton;
    edtCpf: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    DBLkupCmbBEndereco: TDBLookupComboBox;
    procedure btnCancelarEndeClick(Sender: TObject);
    procedure btnSalvarEndeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLkupCmbBEnderecoDropDown(Sender: TObject);
    procedure DBLkupCmbBEnderecoCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure limpaCampos();
  end;

var
  FormCadPessoa: TFormCadPessoa;
  vUtil: TUtil;
  vPessoa: IPessoa;
  vPessoaController: TPessoaController;


implementation

{$R *.dfm}

uses UntPrincipal;

procedure TFormCadPessoa.btnCancelarEndeClick(Sender: TObject);
begin
  TFrmPrincipal(Self.Owner).FDQPessoa.Cancel;
  limpaCampos();
  vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
  TFrmPrincipal(Self.Owner).FDQEndereco.Close();
  Self.Destroy;
end;

procedure TFormCadPessoa.btnSalvarEndeClick(Sender: TObject);
begin
  vPessoa := TPessoa.Create();
  vPessoa.Nome(edtNome.Text);

  if edtCpf.Text = '' then
    vPessoa.Cpf('-1')
  else
    vPessoa.Cpf(edtCpf.Text);

  if DBLkupCmbBEndereco.Text = '' then
    vPessoa.Endereco(-1)
  else
    vPessoa.Endereco(DBLkupCmbBEndereco.ListSource
                       .DataSet.FieldByName('ID').AsInteger);

  if (vPessoaController.verificaCampos(vPessoa)) then begin
    //FDQEndereco.Post;
    // verificar se inclusao ou alteracao
    if (edtId.Text = '') then
      vPessoaController.inserirAlterarPessoa(-1, vPessoa)
    else
      vPessoaController.inserirAlterarPessoa(StrToInt(edtId.Text), vPessoa);

    TFrmPrincipal(Self.Owner).FDQPessoa.Close();
    TFrmPrincipal(Self.Owner).FDQPessoa.Open();
    limpaCampos();
    vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
    TFrmPrincipal(Self.Owner).FDQEndereco.Close();
    Self.Destroy;
  end else
    ShowMessage('Preencha todos os campos!');

end;

procedure TFormCadPessoa.DBLkupCmbBEnderecoCloseUp(Sender: TObject);
begin
    if (DBLkupCmbBEndereco.Text = '') then begin
      DBLkupCmbBEndereco.DataSource := TFrmPrincipal(Self.Owner).DtSrcPessoa;
      DBLkupCmbBEndereco.DataField := 'endereco';
    end;
end;

procedure TFormCadPessoa.DBLkupCmbBEnderecoDropDown(Sender: TObject);
begin
  // Evitar entrar no modo de edicao quando for alterado o endereco
  if (DBLkupCmbBEndereco.DataField <> '') then begin
    DBLkupCmbBEndereco.DataSource := nil;
    DBLkupCmbBEndereco.DataField := '';
  end;
end;

procedure TFormCadPessoa.FormCreate(Sender: TObject);
begin
  vUtil := TUtil.Create();
  vPessoaController := TPessoaController.Create();
end;

procedure TFormCadPessoa.limpaCampos;
begin
  edtId.Text := '';
  edtNome.Text := '';
  edtCPF.Text := '';
  //DBLkupCmbBEndereco.ListFieldIndex := -1;
end;

end.
