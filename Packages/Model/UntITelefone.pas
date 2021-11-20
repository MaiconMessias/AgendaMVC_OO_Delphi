unit UntITelefone;

interface

type
  ITelefone = interface
    ['{DE5738BE-0D0E-486B-A722-C6ED97759F28}']
    // setters
    procedure Numero(Value: integer);
    procedure DDD(Value: integer);
    procedure Tipo(Value: integer);
    // getters
    function getId(): integer;
    function getNumero(): integer;
    function getDDD(): integer;
    function getTipo(): integer;
  end;

implementation

end.
