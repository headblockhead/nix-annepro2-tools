{ pkgs, stdenv, fetchurl, autoPatchelfHook }:

stdenv.mkDerivation {
  pname = "annepro2-tools";
  version = "4e6e1cebfa4d9f8914d4d22165a346431ea095bb";

  src = fetchurl {
    url = "https://ci.codetector.org/job/OpenAnnePro/job/AnnePro2-Tools/job/master/6/artifact/target/release/annepro2_tools_linux_x64";
    sha256 = "i1S7bJAg4DsFa/ql8tAs8DmYnn6fIr6oLKPRjvqdkvo=";
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

