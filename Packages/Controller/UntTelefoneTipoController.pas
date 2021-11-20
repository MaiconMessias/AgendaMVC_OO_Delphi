unit UntTelefoneTipoController;

interface

uses
  UntITelefoneTipo, UntTelefoneTipoDAO, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TTelefoneTipoController = class
    class function inserirAlterarTelefoneTipo(pId: integer;
                                    pTelefoneTipo: ITelefoneTipo): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
    class function verificaCampos(pTelefoneTipo: ITelefoneTipo): boolean;
  end;

implementation

{ TTelefoneTipoController }

class function TTelefoneTipoController.inserirAlterarTelefoneTipo(pId: integer;
                              pTelefoneTipo: ITelefoneTipo): boolean;
var
  vTelefoneTipoDAO: TTelefoneTipoDAO;
begin
  vTelefoneTipoDAO := TTelefoneTipoDAO.Create;
  vTelefoneTipoDAO.inserirAlterarTelefoneTipo(pId, pTelefoneTipo);
end;

class procedure TTelefoneTipoController.pesquisar(FDQuery: TFDQuery;
                                                 edtPesquisa: TEdit);
var
  vTelefoneTipoDAO: TTelefoneTipoDAO;
begin
  vTelefoneTipoDAO := TTelefoneTipoDAO.Create;
  vTelefoneTipoDAO.pesquisar(FDQuery, edtPesquisa);
end;

class function TTelefoneTipoController.verificaCampos(
  pTelefoneTipo: ITelefoneTipo): boolean;
begin
  result := true;

  if (pTelefoneTipo.getId = -1) then
    result := false;

end;

end.
