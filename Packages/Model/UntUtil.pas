unit UntUtil;

interface

uses
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TUtil = class
    class procedure alterarPgControl(pnlLateral: TPanel);
  end;

implementation

{ TUtil }

class procedure TUtil.alterarPgControl(pnlLateral: TPanel);
begin
  pnlLateral.Enabled := not pnlLateral.Enabled;
end;

end.
