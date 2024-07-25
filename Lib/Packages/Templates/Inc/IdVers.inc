{this inc file is generated during release }
  gsIdVersionMajor = %MAJORVER%;
  {$NODEFINE gsIdVersionMajor}
  gsIdVersionMinor = %MINORVER%;
  {$NODEFINE gsIdVersionMinor}
  gsIdVersionRelease = %PATCHVER%;
  {$NODEFINE gsIdVersionRelease}
  gsIdVersionBuild = %BUILDVER%;
  {$NODEFINE gsIdVersionBuild}

  (*$HPPEMIT '#define gsIdVersionMajor %MAJORVER%'*)
  (*$HPPEMIT '#define gsIdVersionMinor %MINORVER%'*)
  (*$HPPEMIT '#define gsIdVersionRelease %PATCHVER%'*)
  (*$HPPEMIT '#define gsIdVersionBuild %BUILDVER%'*)
  (*$HPPEMIT ''*)

  gsIdVersion = '%FILEVERSIONSTRING%'; {do not localize}
  gsIdProductName = 'Indy';  {do not localize}
  gsIdProductVersion = '%SEMVER%'; {do not localize}
