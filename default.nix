{ jre, lib, sbt }:

sbt.mkDerivation rec {
  pname = "coprocessing";
  version = "0.0.1";

  depsSha256 = "sha256-F7kyfEAOazBChMMIHO69YWxFk6tbScm3FwNwZ9UnXzs=";

  depsWarmupCommand = ''
    sbt doc
  '';

  src = ./.;

  buildPhase = ''
    sbt package
  '';

  installPhase = ''
    mkdir -p $out
    cp -a target/*/*.jar -t $out
  '';
}
