program ProjAgenda;

uses
  Vcl.Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  UntDtModPrincipal in 'UntDtModPrincipal.pas' {DtModPrincipal: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDtModPrincipal, DtModPrincipal);
  Application.Run;
end.




