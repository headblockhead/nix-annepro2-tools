{
  description = "Firmware flashing tool for Anne Pro 2. Allows custom firmware download.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = nixpkgs.legacyPackages;
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = pkgsFor.${system};
        in
        rec {
          annepro2_tools = pkgs.rustPlatform.buildRustPackage rec {
            version = "aa84bd1d34c961ada8c812dfea524592f7d2be2c";
            name = "annepro2_tools";
            src = pkgs.fetchFromGitHub {
              owner = "OpenAnnePro";
              repo = "AnnePro2-Tools";
              rev = version;
              hash = "sha256-Bwzxhh4HUDOB+yvtQa0tdPgtVzgdQnrQKeHzObP5ctA=";
            };
            cargoHash = "sha256-K+4YOJuhDQlLuZvnriKBkwGnOO913YGiDt8UXw5ShtQ=";
            nativeBuildInputs = [ pkgs.pkg-config ];
            buildInputs = [ pkgs.libusb1 ];
            meta = with pkgs.lib; {
              description = "Firmware flashing tool for Anne Pro 2. Allows custom firmware download.";
              homepage = "https://github.com/OpenAnnePro/AnnePro2-Tools";
              license = licenses.gpl2;
            };
          };
          default = annepro2_tools;
        });
    };
}
