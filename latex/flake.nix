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
    nvim = nixNeovim.outputs.packages.${system}.nvim-latex;
  in {
    devShells.${system}.default = pkgs.mkShell {
      # Interactive packages
      packages = with pkgs; [
        ripgrep
        fd
        nvim
        pandoc
        texlab
        texliveFull
      ];
    };
  };
}
