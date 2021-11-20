unit UntTelefone;

interface

uses
  UntITelefone;

type
  TTelefone = class(TInterfacedObject, ITelefone)
    FId: integer;
    FNumero: integer;
    FDDD: integer;
    FTipo: integer;
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

{ TTelefone }

function TTelefone.getDDD: integer;
begin
  result := FDDD;
end;

function TTelefone.getId: integer;
begin
  result := FId;
end;

function TTelefone.getNumero: integer;
begin
  result := FNumero
end;

function TTelefone.getTipo: integer;
begin
  result := FTipo;
end;

procedure TTelefone.DDD(Value: integer);
begin
  FDDD := Value;
end;

procedure TTelefone.Numero(Value: integer);
begin
  FNumero := Value;
end;

procedure TTelefone.Tipo(Value: integer);
begin
  FTipo := Value;
end;

end.
