unit UntUtil;

interface

uses
  Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TUtil = class
    class procedure alterarPgControl(pgLista, pgCad: TPageControl;
                                     pnlLateral: TPanel);
  end;

implementation

{ TUtil }

class procedure TUtil.alterarPgControl(pgLista, pgCad: TPageControl;
                                       pnlLateral: TPanel);
begin
  pgLista.Visible := not pgLista.Visible;
  pgCad.Visible := not pgCad.Visible;
  pnlLateral.Enabled := not pnlLateral.Enabled;
end;

end.
