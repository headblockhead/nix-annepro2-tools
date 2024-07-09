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
    sha256 = "Bwzxhh4HUDOB+yvtQa0tdPgtVzgdQnrQKeHzObP5ctA=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

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

