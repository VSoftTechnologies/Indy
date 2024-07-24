unit IndyPackageGen.Application;

interface

uses
  System.Generics.Collections,
  VSoft.SemanticVersion,
  IndyPackageGen.Types;


type
  TPackageGenApplication = class
  private
    class var
      FSemantiVersion : TSemanticVersion;
      //for rc
      FPRODUCTVERSION : string;
      FFILEVERSION : string;
      FFILEVERSIONSTRING : string;

      FCompilerVersions : TList<TCompilerVersion>;
      FTemplatesFolder : string;
      FPackagesRoot : string;
  protected
    class function SemverToWindowsFileVersion(const version : TSemanticVersion) : string;
    class function ProcessStringForVersion(compilerVersion : TCompilerVersion; const value : string) : string;
    class function ProcessTemplatesForVersion(compilerVersion : TCompilerVersion; const templates : TDictionary<string, string>) : integer;

    class constructor Create;
    class destructor Destroy;
  public
    class function Run(const version : TSemanticVersion; const iniFilePath : string) : integer;
  end;

implementation

uses
  System.Classes,
  System.DateUtils,
  System.SysUtils,
  System.IniFiles,
  System.IOUtils;



{ TPackageGenApplication }

class constructor TPackageGenApplication.Create;
begin
  FCompilerVersions := TList<TCompilerVersion>.Create;
end;

class destructor TPackageGenApplication.Destroy;
begin
  FCompilerVersions.Free;
end;

//quick n dirty string replacements
class function TPackageGenApplication.ProcessStringForVersion(compilerVersion: TCompilerVersion; const value: string): string;
begin
   result := value.Replace('%DPMCOMPILERVER%', compilerVersion.Version ,[rfIgnoreCase,rfReplaceAll]);
   result := value.Replace('%MAJORVER%', IntToStr(FSemantiVersion.Major),[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%FILEVERSION%', FFILEVERSION,[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%PRODUCTVERSION%', FPRODUCTVERSION,[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%FILEVERSIONSTRING%', FFILEVERSIONSTRING,[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%SEMVER%', FSemantiVersion.ToStringNoMeta,[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%SEMVERFULL%', FSemantiVersion.ToString,[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%LIBSUFFIX%', compilerVersion.LibSuffix,[rfIgnoreCase,rfReplaceAll]);
   result := result.Replace('%CURRENTYEAR%', IntToStr(YearOf(Now)) ,[rfIgnoreCase,rfReplaceAll]);
end;

class function TPackageGenApplication.ProcessTemplatesForVersion(compilerVersion: TCompilerVersion; const templates : TDictionary<string, string>): integer;
begin
  result := EXIT_OK;
  WriteLn('Processing package templates for ' + compilerVersion.Version);
  for var template in templates do
  begin
    try
//      var processed := template.Value.Replace('%MAJORVER%', IntToStr(FMajorVer),[rfIgnoreCase]);
//      processed := processed.Replace('%LIBSUFFIX%', compilerVersion.LibSuffix,[rfIgnoreCase]);
      var processed := ProcessStringForVersion(compilerVersion, template.Value);

      var outputFileName := TPath.Combine(FPackagesRoot, compilerVersion.PackageFolder);
      outputFileName := TPath.Combine(outputFileName, template.Key);
      WriteLn('Writing to ' + outputFileName);
      TFile.WriteAllText(outputFileName, processed);
    except
      on e : Exception do
      begin
         Writeln('ERROR : ' + e.Message);
         result := EXIT_TEMPLATE_ERROR;
         exit;
      end;
    end;
  end;
end;

class function TPackageGenApplication.Run(const version : TSemanticVersion; const iniFilePath : string): integer;
var
  iniFile : TIniFile;
begin
  result := EXIT_OK;
  WriteLn('Reading inifile : ' + iniFilePath);
  FSemantiVersion := version;

  iniFile := TIniFile.Create(iniFilePath);
  try
    if FSemantiVersion.IsEmpty then
    begin
      var sVersion := iniFile.ReadString('indyversion','VERSION','');
      if sVersion = '' then
      begin
         result := EXIT_INVALIDVER;
         WriteLn('No version supplied on cmd line or in ini file');
         exit;
      end;
      var errorMsg : string;
      if not TSemanticVersion.TryParseWithError(sVersion,FSemantiVersion, errorMsg) then
      begin
         result := EXIT_INVALIDVER;
         WriteLn('Invalid version in ini : ' + errorMsg);
         exit;
      end;
    end;

    FFILEVERSIONSTRING := SemverToWindowsFileVersion(FSemantiVersion);
    FPRODUCTVERSION := FFILEVERSIONSTRING.Replace('.', ',');
    FFILEVERSION := FPRODUCTVERSION;


    FTemplatesFolder := iniFile.ReadString('paths', 'TemplatesFolder','');
    if FTemplatesFolder <> '' then
      if TPath.IsRelativePath(FTemplatesFolder) then
        FTemplatesFolder := TPath.GetFullPath(FTemplatesFolder);
    if (FTemplatesFolder = '') then
    begin
      WriteLn('No TemplatesFolder specified in ini');
      exit(EXIT_MISSING_TEMPLATES_FOLDER);
    end;

    if not TDirectory.Exists(FTemplatesFolder) then
    begin
      WriteLn('TemplatesFolder does not exist : ' + FTemplatesFolder);
      exit(EXIT_INVALID_TEMPLATES_FOLDER);
    end;

    FPackagesRoot := iniFile.ReadString('paths', 'PackagesRoot','');
    if FPackagesRoot <> '' then
      if TPath.IsRelativePath(FPackagesRoot) then
        FPackagesRoot := TPath.GetFullPath(FPackagesRoot);
    if (FPackagesRoot = '') then
    begin
      WriteLn('No PackagesRoot specified in ini');
      exit(EXIT_MISSING_PACKAGES_ROOT);
    end;

    if not TDirectory.Exists(FPackagesRoot) then
    begin
      WriteLn('PackagesRoot does not exist : ' + FPackagesRoot);
      exit(EXIT_INVALID_PACKAGES_ROOT);
    end;

    var compilerVersionNames := TStringList.Create;
    try
      iniFile.ReadSection('compilerVersions', compilerVersionNames);

      for var i := 0 to compilerVersionNames.count -1 do
      begin
        var compilerVersion : TCompilerVersion;
        compilerVersion.Version := compilerVersionNames.Strings[i];
        compilerVersion.PackageFolder := iniFile.ReadString('compilerVersions', compilerVersionNames.Strings[i],'');
        compilerVersion.LibSuffix := iniFile.ReadString(compilerVersionNames.Strings[i], 'LIBSUFFIX','');
        FCompilerVersions.Add(compilerVersion);
      end;
    finally
      compilerVersionNames.Free;
    end;

    var templates := TDictionary<string, string>.Create;
    
    var templateFileNames := TDirectory.GetFiles(FTemplatesFolder);
    for var templateFileName in templateFileNames do
    begin
       var template := TFile.ReadAllText(templateFileName);
       templates.Add(TPath.GetFileName(templateFileName), template);
    end;

    
    
    for var compilerVersion in FCompilerVersions do
    begin
       result := ProcessTemplatesForVersion(compilerVersion, templates);
       if result <> EXIT_OK then
        exit;     
    end;


  finally
    iniFile.Free;
  end;

end;


// Semver doesn't map well to windows fileversion, so this is a hack.
//
// so we use ranges - 
//  0-1999 is for anything other than beta or release (eg. alpha)
//  2000-4999 is for beta
//  5000 is a release build. 
// for non release builds, if the pre-release tag has any numeric segments, the first will be used
// note that in semver - 0.1.2 > 0.1.2-alpha.1000
// 0.1.2-alpha.2 = 0.1.2.2
// 0.1.2-beta.5 = 0.1.2.2005
// 0.1.2 = 0.1.2.5000.

class function TPackageGenApplication.SemverToWindowsFileVersion(const version: TSemanticVersion): string;
begin
  var build : integer := 5000; //release base
  if not version.IsStable then //has a prerelease tag
  begin
    var tag := version.PreReleaseTag;
    var preReleaseBase : integer := 0;
    if tag.Contains('beta') then
      preReleaseBase := 2000;
    var elements := tag.Split(['.']);
    for var element in elements do
    begin
       var i := StrToIntDef(element, -1);
       if i <> -1 then
       begin
         build := preReleaseBase + i;
         break;
       end;     
    end;
  end;
  
  result := Format('%d.%d.%d.%d', [version.Major, version.Minor, version.Patch, build]);
end;

end.
