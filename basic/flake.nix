{
  description = "A basic devshell";

  inputs = {
    nixpkgs.url = "nixpkgs";
    nixNeovim.url = "github:D3vZro/NixNeovim";
  };

  outputs = { self, nixpkgs, nixNeovim,... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    nvim = nixNeovim.outputs.packages.${system}.default;
  in {
    devShells.${system}.default = pkgs.mkShell {
      # Interactive packages
      packages = with pkgs; [
        nvim
      ];

      # Build dependencies
      inputsFrom = with pkgs; [
      ];
    };
  };
}
