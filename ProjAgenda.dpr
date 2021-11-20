program ProjAgenda;

uses
  Vcl.Forms,
  UntDtModPrincipal in 'UntDtModPrincipal.pas' {DtModPrincipal: TDataModule},
  UntPrincipal in 'UntPrincipal.pas' {FrmPrincipal},
  UntCadEndereco in 'UntCadEndereco.pas' {FormCadEndereco},
  UntCadPessoa in 'UntCadPessoa.pas' {FormCadPessoa},
  UntPesqPessoaEndereco in 'UntPesqPessoaEndereco.pas' {FrmPessoaEndereco},
  UntCadTelefoneTipo in 'UntCadTelefoneTipo.pas' {FormCadTelefoneTipo},
  UntCadTelefone in 'UntCadTelefone.pas' {FormCadTelefone};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtModPrincipal, DtModPrincipal);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.

