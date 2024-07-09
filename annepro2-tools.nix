{ pkgs, stdenv, fetchFromGitHub, autoPatchelfHook }:

let
  version = "aa84bd1d34c961ada8c812dfea524592f7d2be2c";
in
stdenv.mkDerivation {
  pname = "annepro2-tools";
  version = version;

  src = fetchFromGitHub {
    owner = "OpenAnnePro";
    repo = "AnnePro2-Tools";
    rev = version;
    sha256="Bwzxhh4HUDOB+yvtQa0tdPgtVzgdQnrQKeHzObP5ctA=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ pkgs.cacert pkgs.libusb1 pkgs.cargo pkgs.rustc pkgs.pkgconfig ];

  installPhase = ./annepro2-tools-install.sh;
  system = builtins.currentSystem;
}

