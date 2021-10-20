unit UntEnderecoDAO;

interface

uses
  UntDtPrincipal, UntIEndereco;

type
  TEnderecoDAO = class
    class function inserirAlterarEndereco(pId: integer; pEndereco: IEndereco): boolean;
  end;

implementation

{ TEnderecoDAO }

class function TEnderecoDAO.inserirAlterarEndereco(pId: integer; pEndereco: IEndereco): boolean;
var
  dtModule: TDataModule1;
begin
  dtModule := UntDtPrincipal.TDataModule1.Create(nil);
  with dtModule do begin
    FDConPrincipal.Connected := true;
    if (pId = -1) then begin
      FDQEndereco.SQL.Clear;
      FDQEndereco.SQL.Text := 'INSERT INTO ENDERECO (LOGRADOURO, NUMERO, CEP,' +
                              'BAIRRO, CIDADE, ESTADO) ' +
                              'VALUES (:LOGRADOURO, :NUMERO, :CEP,' +
                              ':BAIRRO, :CIDADE, :ESTADO)';
      FDQEndereco.ParamByName('LOGRADOURO').AsString := pEndereco.getLogradouro;
      FDQEndereco.ParamByName('NUMERO').AsInteger := pEndereco.getNumero;
      FDQEndereco.ParamByName('CEP').AsInteger := pEndereco.getCep;
      FDQEndereco.ParamByName('BAIRRO').AsString := pEndereco.getBairro;
      FDQEndereco.ParamByName('CIDADE').AsString := pEndereco.getCidade;
      FDQEndereco.ParamByName('ESTADO').AsString := pEndereco.getEstado;
      FDQEndereco.ExecSQL;
      result := true;
    end else begin
      FDQEndereco.SQL.Clear;
      FDQEndereco.SQL.Text := 'UPDATE ENDERECO SET LOGRADOURO = :LOGRADOURO, ' +
                              'NUMERO = :NUMERO, CEP = :CEP, BAIRRO = :BAIRRO, ' +
                              'CIDADE = :CIDADE, ESTADO = :ESTADO ' +
                              'WHERE ID = :ID';
      FDQEndereco.ParamByName('LOGRADOURO').AsString := pEndereco.getLogradouro;
      FDQEndereco.ParamByName('NUMERO').AsInteger := pEndereco.getNumero;
      FDQEndereco.ParamByName('CEP').AsInteger := pEndereco.getCep;
      FDQEndereco.ParamByName('BAIRRO').AsString := pEndereco.getBairro;
      FDQEndereco.ParamByName('CIDADE').AsString := pEndereco.getCidade;
      FDQEndereco.ParamByName('ESTADO').AsString := pEndereco.getEstado;
      FDQEndereco.ParamByName('ID').AsInteger := pId;
      FDQEndereco.ExecSQL;
      result := true;
    end;

  end;

end;

end.
