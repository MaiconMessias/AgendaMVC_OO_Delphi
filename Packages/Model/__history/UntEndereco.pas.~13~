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
      function Id(Value: integer): integer;
      function Logradouro(Value: string): string;
      function Numero(Value: integer): integer;
      function Cep(Value: integer): integer;
      function Bairro(Value: string): string;
      function Cidade(Value: string): string;
      function Estado(Value: string): string;
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

function TEndereco.Bairro(Value: string): string;
begin
  FBairro := Value;
  result := FBairro;
end;

function TEndereco.Cep(Value: integer): integer;
begin
  FCep := Value;
  result := FCep;
end;

function TEndereco.Cidade(Value: string): string;
begin
  FCidade := Value;
  result := FCidade;
end;

function TEndereco.Estado(Value: string): string;
begin
  FEstado := Value;
  result := FEstado;
end;

function TEndereco.Id(Value: integer): integer;
begin
  FId := Value;
  result := FId;
end;

function TEndereco.Logradouro(Value: string): string;
begin
  FLogradouro := Value;
  result := FLogradouro;
end;

function TEndereco.Numero(Value: integer): integer;
begin
  FNumero := Value;
  result := FNumero;
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
