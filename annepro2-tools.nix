{ pkgs, stdenv, fetchFromGitHub, autoPatchelfHook }:

let
  version = "fe5ed6585b0af274e3220d5abe49ee419c34924a";
in
stdenv.mkDerivation {
  pname = "annepro2-tools";
  version = version;

  src = fetchFromGitHub {
    owner = "OpenAnnePro";
    repo = "AnnePro2-Tools";
    rev = version;
    sha256="Oy5acTuE0Oz5CdFXDkwFrtoHEFC3B/lQR/4kjlqcibE=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ pkgs.cacert pkgs.libusb1 pkgs.cargo pkgs.rustc pkgs.pkgconfig ];

  installPhase = ./annepro2-tools-install.sh;
  system = builtins.currentSystem;
}

