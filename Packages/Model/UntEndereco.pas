unit UntEndereco;

interface

uses
  UntIEndereco;

type
  TEndereco = class(TInterfacedObject, IEndereco)
    private
      FId: integer;
      FLogradouro: string;
      FNumero: integer;
      FCep: integer;
      FBairro: string;
      FCidade: string;
      FEstado: string;
      procedure Logradouro(Value: string);
      procedure Numero(Value: integer);
      procedure Cep(Value: integer);
      procedure Bairro(Value: string);
      procedure Cidade(Value: string);
      procedure Estado(Value: string);
    // getters
    function getId(): integer;
    function getLogradouro(): string;
    function getNumero(): integer;
    function getCep(): integer;
    function getBairro(): string;
    function getCidade(): string;
    function getEstado(): string;
  end;

implementation

{ TEndereco }

procedure TEndereco.Bairro(Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.Cep(Value: integer);
begin
  FCep := Value;
end;

procedure TEndereco.Cidade(Value: string);
begin
  FCidade := Value;
end;

procedure TEndereco.Estado(Value: string);
begin
  FEstado := Value;
end;

procedure TEndereco.Logradouro(Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.Numero(Value: integer);
begin
  FNumero := Value;
end;

function TEndereco.getId: integer;
begin
  result := FId;
end;

function TEndereco.getLogradouro: string;
begin
  result := FLogradouro;
end;

function TEndereco.getNumero: integer;
begin
  result := FNumero;
end;

function TEndereco.getBairro: string;
begin
  result := FBairro;
end;

function TEndereco.getCep: integer;
begin
  result := FCep;
end;

function TEndereco.getCidade: string;
begin
  result := FCidade;
end;

function TEndereco.getEstado: string;
begin
  result := FEstado;
end;


end.
