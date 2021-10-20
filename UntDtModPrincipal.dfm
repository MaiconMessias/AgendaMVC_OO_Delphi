object DtModPrincipal: TDtModPrincipal
  OldCreateOrder = False
  Height = 323
  Width = 454
  object FDConnPrincipal: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=n'
      'Database=agenda'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\windows10\Desktop\Projetos Delphi XE 11\Agenda\Win32\De' +
      'bug\libpq.dll'
    Left = 152
    Top = 24
  end
end
