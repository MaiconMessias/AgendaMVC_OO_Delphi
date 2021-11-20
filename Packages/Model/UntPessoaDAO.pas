unit UntPessoaDAO;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Vcl.StdCtrls, UntDtPrincipal, UntIPessoa;

type
  TPessoaDAO = class
    class function inserirAlterarPessoa(pId: integer; pPessoa: IPessoa): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
  end;

implementation

{ TPessoaDAO }

class function TPessoaDAO.inserirAlterarPessoa(pId: integer;
                                       pPessoa: IPessoa): boolean;
var
  dtModule: TDataModule1;
begin
  dtModule := UntDtPrincipal.TDataModule1.Create(nil);
  with dtModule do begin
    FDConPrincipal.Connected := true;
    if (pId = -1) then begin
      with FDQPessoa do begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO PESSOA (NOME, CPF, ENDERECO) ' +
                                'VALUES (:NOME, :CPF, :ENDERECO)';
        ParamByName('NOME').AsString := pPessoa.getNome();
        ParamByName('CPF').AsInteger := StrToInt(pPessoa.getCpf());
        ParamByName('ENDERECO').AsInteger := pPessoa.getEndereco();
        ExecSQL;
      end;
      result := true;
    end else begin
      with FDQPessoa do begin
        SQL.Clear;
        SQL.Text := 'UPDATE PESSOA SET NOME = :NOME, CPF = :CPF, ENDERECO = :ENDERECO ' +
                                                    'WHERE ID = :ID';
        ParamByName('NOME').AsString := pPessoa.getNome();
        ParamByName('CPF').AsInteger := StrToInt(pPessoa.getCpf());
        ParamByName('ENDERECO').AsInteger := pPessoa.getEndereco();
        ParamByName('ID').AsInteger := pId;
        ExecSQL;
        result := true;
      end;
    end;

  end;
end;

class procedure TPessoaDAO.pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
begin
   with FDQuery do begin
     Close();
     SQL.Clear;
     if (edtPesquisa.Text <> '') then begin
       SQL.Text := 'SELECT * FROM PESSOA WHERE NOME LIKE :PPESQUISA';
       ParamByName('PPESQUISA').AsString := '%' + edtPesquisa.Text + '%';
     end else
       SQL.Text := 'SELECT * FROM PESSOA ORDER BY ID ASC';
     Open();
   end;

end;

end.
