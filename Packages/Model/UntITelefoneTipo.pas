unit UntITelefoneTipo;

interface

type
  ITelefoneTipo = interface
    ['{26E93CD4-9C43-403F-89E5-F031E81BBC21}']
    // setters
    procedure Tipo(Value: string);
    // getters
    function getId(): integer;
    function getTipo(): string;
  end;

implementation

end.
