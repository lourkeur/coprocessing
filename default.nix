{ jre, lib, sbt }:

sbt.mkDerivation rec {
  pname = "coprocessing";
  version = "0.0.1";

  depsSha256 = "sha256-28smOBjG8MAjyeMgi82dNuWtsfFPExku2KIXnNtGpJg=";

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
