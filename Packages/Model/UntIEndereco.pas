unit UntIEndereco;

interface

type
  IEndereco = interface
    // seters
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

end.
