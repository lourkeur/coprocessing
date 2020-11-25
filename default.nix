{ jre, lib, sbt }:

sbt.mkDerivation rec {
  pname = "coprocessing";
  version = "0.0.1";

  depsSha256 = "sha256-mUk+G39eAJ+s6FugsHkBteWkNJqWc5J4X54Dcmpl09A=";

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
