{ pkgs, stdenv, fetchurl, autoPatchelfHook }:

stdenv.mkDerivation {
  pname = "annepro2-tools";
  version = "fe5ed6585b0af274e3220d5abe49ee419c34924a";

  src = fetchurl {
    url = "https://ci.codetector.org/job/OpenAnnePro/job/AnnePro2-Tools/job/master/8/artifact/target/release/annepro2_tools_linux_x64";
    sha256 = "znOcm02uJyh1AkZHIiYaVUiEzQVinprgTXpYaLdqXNg=";
  };

  unpackPhase = ":";

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    pkgs.libusb1
  ];

  installPhase = ./annepro2-tools-install.sh;
  system = builtins.currentSystem;
}

