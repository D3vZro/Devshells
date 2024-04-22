{
  description = "A basic devshell";

  inputs = {
    nixpkgs.url = "nixpkgs";
    nivNeovim.url = "...";
  };

  outputs = { self, nixpkgs, nixNeovim,... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    nvim = nixNeovim.outputs.packages.;
  in {
    devShells.${system}.default = pkgs.mkShell {
      # Interactive packages
      packages = with pkgs; [
        ripgrep
        fd
      ];

      # Build dependencies
      inputsFrom = with pkgs; [
      ];
    };
  };
}
