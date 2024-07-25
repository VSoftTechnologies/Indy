unit IndyPackageGen.Types;

interface

const
  EXIT_OK = 0;
  EXIT_INVALIDARGS = 1;
  EXIT_INVALIDVER = 2;
  EXIT_MISSING_TEMPLATES_FOLDER=3;
  EXIT_INVALID_TEMPLATES_FOLDER=4;
  EXIT_MISSING_PACKAGES_ROOT=5;
  EXIT_INVALID_PACKAGES_ROOT=6;
  EXIT_TEMPLATE_ERROR = 7;



type
  TCompilerVersion = record
    Version : string;
    LibSuffix : string;
    PackageFolder : string;
    NoGenDproj : boolean;
    NoGenGroupProj : boolean;
  end;

implementation

end.
