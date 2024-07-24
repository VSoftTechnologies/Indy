program IndyPackageGen;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.IOUtils,
  VSoft.SemanticVersion,
  IndyPackageGen.Application in 'IndyPackageGen.Application.pas',
  IndyPackageGen.Types in 'IndyPackageGen.Types.pas';

begin
  WriteLn('IndyPackageGen');
  try
    if ParamCount < 1 then
    begin
      WriteLn('Usage : ''IndyPackageGen inifilePath version (version optional)''');
      ExitCode := EXIT_INVALIDARGS;
      exit;
    end;
    var iniFilePath := ParamStr(1);
    if TPath.IsRelativePath(iniFilePath) then
      iniFilePath := TPath.GetFullPath(iniFilePath);
    if not TFile.Exists(iniFilePath) then
    begin
      WriteLn(iniFilePath + ' not found');
      ExitCode := EXIT_INVALIDARGS;
      exit
    end;


    var semVer : TSemanticVersion;
    if (ParamCount > 1) then
    begin
      var version := ParamStr(2);
      var errorStr : string;
      if not TSemanticVersion.TryParseWithError(version, semVer, errorStr) then
      begin
        WriteLn('Invalid semantic version arg : ' + errorStr);
        ExitCode := EXIT_INVALIDARGS;
        exit
      end;
    end;
    ExitCode := TPackageGenApplication.Run(semVer,iniFilePath);


{$IFDEF DEBUG}
  Readln;
{$ENDIF}
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      ExitCode := EXIT_INVALIDARGS;
    end;
  end;
end.
