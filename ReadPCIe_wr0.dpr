program ReadPCIe_wr0;

uses
  Vcl.Forms,
  uReadPCIe_wr0 in 'uReadPCIe_wr0.pas' {Form1},
  WinRing0 in 'Win64\Debug\WinRing0.pas',
  GetPCILPTInfo in 'GetPCILPTInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
