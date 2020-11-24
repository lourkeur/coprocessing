{ jre, lib, sbt }:

sbt.mkDerivation rec {
  pname = "coprocessing";
  version = "0.0.1";

  depsSha256 = "sha256-2MddrfNN4BxGb5C9xOUphPYB0VQtbbk6Zk1HwEzKj8M=";

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
