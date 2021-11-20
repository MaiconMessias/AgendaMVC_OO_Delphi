unit UntCadTelefoneTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UntUtil,
  UntTelefoneTipoController, UntITelefoneTipo, UntTelefoneTipo;

type
  TFormCadTelefoneTipo = class(TForm)
    pnlBotoesCadEnde: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    pnlHederCadTelefoneTipo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtId: TEdit;
    Label3: TLabel;
    edtTipo: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure limpaCampos();
  public
    { Public declarations }
  end;

var
  FormCadTelefoneTipo: TFormCadTelefoneTipo;
  vUtil: TUtil;
  vTelefoneTipo: ITelefoneTipo;
  vTelefoneTipoController: TTelefoneTipoController;

implementation

{$R *.dfm}

uses UntPrincipal;

procedure TFormCadTelefoneTipo.btnCancelarClick(Sender: TObject);
begin
  TFrmPrincipal(Self.Owner).FDQTelefoneTipo.Cancel;
  limpaCampos();
  vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
  Self.Destroy;
end;

procedure TFormCadTelefoneTipo.btnSalvarClick(Sender: TObject);
begin
  vTelefoneTipo := TTelefoneTipo.Create;
  vTelefoneTipo.Tipo(edtTipo.Text);

  if (vTelefoneTipoController.verificaCampos(vTelefoneTipo)) then begin
    //FDQEndereco.Post;
    // verificar se inclusao ou alteracao
    if (edtId.Text = '') then
      vTelefoneTipoController.inserirAlterarTelefoneTipo(-1, vTelefoneTipo)
    else
      vTelefoneTipoController.inserirAlterarTelefoneTipo(StrToInt(edtId.Text), vTelefoneTipo);

    TFrmPrincipal(Self.Owner).FDQTelefoneTipo.Close();
    TFrmPrincipal(Self.Owner).FDQTelefoneTipo.Open();
    limpaCampos();
    vUtil.alterarPgControl(TFrmPrincipal(Self.Owner).pnlLateral);
    Self.Destroy;
  end else
    ShowMessage('Preencha todos os campos!');

end;


procedure TFormCadTelefoneTipo.FormCreate(Sender: TObject);
begin
  vUtil := TUtil.Create;
  vTelefoneTipoController := TTelefoneTipoController.Create;
end;

procedure TFormCadTelefoneTipo.limpaCampos;
begin
  edtId.Text := '';
  edtTipo.Text := '';
end;

end.
