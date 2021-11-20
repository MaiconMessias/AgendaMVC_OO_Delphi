unit UntCadTelefone;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, UntUtil, UntITelefone, UntTelefone, UntTelefoneController;

type
  TFormCadTelefone = class(TForm)
    DBLkupCmbBTelefoneTipo: TDBLookupComboBox;
    edtDDD: TEdit;
    edtId: TEdit;
    edtNumero: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnlBotoesCadEnde: TPanel;
    btnCancelarEnde: TButton;
    btnSalvarEnde: TButton;
    pnlHederCadEnde: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarEndeClick(Sender: TObject);
    procedure DBLkupCmbBTelefoneTipoDropDown(Sender: TObject);
    procedure DBLkupCmbBTelefoneTipoCloseUp(Sender: TObject);
    procedure btnSalvarEndeClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCampos();
  public
    { Public declarations }
  end;

var
  FormCadTelefone: TFormCadTelefone;
  vUtil: TUtil;
  vTelefone: ITelefone;
  vTelefoneController: TTelefoneController;

implementation

{$R *.dfm}

uses UntPrincipal;

procedure TFormCadTelefone.btnCancelarEndeClick(Sender: TObject);
begin
  TFrmPrincipal(Self.Owner).FDQTelefone.Cancel;
  limpaCampos();
  vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
  TFrmPrincipal(Self.Owner).FDQTelefoneTipo.Close();
  Self.Destroy;
end;

procedure TFormCadTelefone.btnSalvarEndeClick(Sender: TObject);
begin
  vTelefone := TTelefone.Create();

  if edtNumero.Text = '' then
    vTelefone.Numero(-1)
  else
    vTelefone.Numero(StrToInt(edtNumero.Text));

  if edtDDD.Text = '' then
    vTelefone.DDD(-1)
  else
    vTelefone.DDD(StrToInt(edtDDD.Text));

  if DBLkupCmbBTelefoneTipo.Text = '' then
    vTelefone.Tipo(-1)
  else
    vTelefone.Tipo(DBLkupCmbBTelefoneTipo.ListSource
                       .DataSet.FieldByName('ID').AsInteger);

  if (vTelefoneController.verificaCampos(vTelefone)) then begin
    //FDQEndereco.Post;
    // verificar se inclusao ou alteracao
    if (edtId.Text = '') then
      vTelefoneController.inserirAlterarTelefone(-1, vTelefone)
    else
      vTelefoneController.inserirAlterarTelefone(StrToInt(edtId.Text), vTelefone);

    TFrmPrincipal(Self.Owner).FDQTelefone.Close();
    TFrmPrincipal(Self.Owner).FDQTelefone.Open();
    limpaCampos();
    vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
    TFrmPrincipal(Self.Owner).FDQTelefoneTipo.Close();
    Self.Destroy;
  end else
    ShowMessage('Preencha todos os campos!');

end;

procedure TFormCadTelefone.DBLkupCmbBTelefoneTipoCloseUp(Sender: TObject);
begin
    if (DBLkupCmbBTelefoneTipo.Text = '') then begin
      DBLkupCmbBTelefoneTipo.DataSource := TFrmPrincipal(Self.Owner).DtSrcTelefone;
      DBLkupCmbBTelefoneTipo.DataField := 'tipo';
    end;
end;

procedure TFormCadTelefone.DBLkupCmbBTelefoneTipoDropDown(Sender: TObject);
begin
  // Evitar entrar no modo de edicao quando for alterado o endereco
  if (DBLkupCmbBTelefoneTipo.DataField <> '') then begin
    DBLkupCmbBTelefoneTipo.DataSource := nil;
    DBLkupCmbBTelefoneTipo.DataField := '';
  end;
end;

procedure TFormCadTelefone.FormCreate(Sender: TObject);
begin
  vUtil := TUtil.Create;
  vTelefoneController := TTelefoneController.Create;
end;

procedure TFormCadTelefone.limpaCampos;
begin
  edtId.Text := '';
  edtNumero.Text := '';
  edtDDD.Text := '';
end;

end.
