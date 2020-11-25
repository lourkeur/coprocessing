{ jre, lib, sbt }:

sbt.mkDerivation rec {
  pname = "coprocessing";
  version = "0.0.1";

  depsSha256 = "sha256-Anr+652V4ZL7ikjjrF3hzeic5F4Mxkq3v8DCyA3B8KA=";

  depsWarmupCommand = ''
    sbt doc
  '';

  src = ./.;

  buildPhase = ''
    sbt package doc
  '';


  outputs = [ "out" "doc" ];
  installPhase = ''
    mkdir -p $out
    cp -a target/*/*.jar -t $out
    cp -a target/*/api -T $doc
  '';
}
