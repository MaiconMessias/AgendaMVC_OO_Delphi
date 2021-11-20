unit UntEnderecoController;

interface

uses
  FireDAC.Comp.Client, Vcl.StdCtrls, UntIEndereco, UntEnderecoDAO;

type
  TEnderecoController = class
    class function verificaCampos(Endereco: IEndereco): boolean;
    class function inserirAlterarEndereco(pId: integer; pEndereco: IEndereco): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
  end;

implementation

{ TEnderecoController }

{ TEnderecoController }

class function TEnderecoController.inserirAlterarEndereco(pId: integer;
                                                pEndereco: IEndereco): boolean;
var
  vEnderecoDAO: TEnderecoDAO;
begin
  vEnderecoDAO := TEnderecoDAO.Create;
  vEnderecoDAO.inserirAlterarEndereco(pId, pEndereco);
end;

class function TEnderecoController.verificaCampos(Endereco: IEndereco): boolean;
begin
  result := true;

  if (Endereco.getId = -1) then
    result := false;
end;

class procedure TEnderecoController.pesquisar(FDQuery: TFDQuery;
                                                    edtPesquisa: TEdit);
var
  vEnderecoDAO: TEnderecoDAO;
begin
  vEnderecoDAO := TEnderecoDAO.Create;
  vEnderecoDAO.pesquisar(FDQuery, edtPesquisa);
end;

end.
