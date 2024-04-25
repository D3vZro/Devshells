{
  description = "A basic devshell";

  inputs = {
    nixpkgs.url = "nixpkgs";
    nixNeovim = {
      url = "github:D3vZro/NixNeovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixNeovim,... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    nvim = nixNeovim.outputs.packages.${system}.nvim-scala;
  in {
    devShells.${system}.default = pkgs.mkShell {
      # Interactive packages
      packages = with pkgs; [
        nvim
        ripgrep
        fd

        coursier
        metals
        sbt
        scala-cli
        scalafmt
      ];

      # Build dependencies
      inputsFrom = with pkgs; [
        adoptopenjdk-bin
        scala_3
      ];
    };
  };
}
