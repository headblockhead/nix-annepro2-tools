{
  description = "A set of tools to flash an annepro2 keyboard with custom firmware.";
  outputs = { self, nixpkgs, flake-utils }:
      let 
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };
        annepro2tools = pkgs.callPackage ./annepro2-tools.nix {};
      in
      {
        packages.x86_64-linux.default = annepro2tools;
        defaultPackage.x86_64-linux = annepro2tools;
      };
}
