{ pkgs, stdenv, lib, fetchFromGitHub, }:

stdenv.mkDerivation rec {
  pname = "annepro2-tools";
  version = "aa84bd1d34c961ada8c812dfea524592f7d2be2c";

  src = fetchFromGitHub {
    owner = "OpenAnnePro";
    repo = "AnnePro2-Tools";
    rev = version;
    hash = "sha256-Bwzxhh4HUDOB+yvtQa0tdPgtVzgdQnrQKeHzObP5ctA=";
  };

  buildInputs = [ pkgs.cacert pkgs.libusb1 pkgs.cargo pkgs.rustc pkgs.pkgconfig ];

  installPhase = ''
    # Create the standard environment.
    source $stdenv/setup

    cp -r $src/* ./
    cargo build --release

    # Create place to store the binaries.
    mkdir -p $out/bin
    # Copy the binary to the output binary directory.
    cp ./target/release/annepro2_tools $out/bin/annepro2-tools
    # Allow execution of the binary.
    chmod +x $out/bin/annepro2-tools
  '';
  system = builtins.currentSystem;
}

