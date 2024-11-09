{
  description = "A specialized devshell for C++ projects, OpenMP and CUDA";
  # Special thanks to Wölfchen <3

  inputs = {
    nixpkgs.url = "nixpkgs";
    nixNeovim.url = "github:D3vZro/NixNeovim";
  };

  outputs = { self, nixpkgs, nixNeovim,... }:
  let
    system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    nvim = nixNeovim.outputs.packages.${system}.cpp;
  in {
      # The override is used to get a clangd environment
      devShells.${system}.default = pkgs.mkShell.override { stdenv = pkgs.clangStdenv; } {
        # Executable packages
        packages = with pkgs; [
          nvim
          cmake
          clang-tools
          ccache
          spdlog
          gcc11
          # llvmPackages.openmp
          # cudaPackages.cudatoolkit
        ];

        # Environment variables and other stuff
        shellHooks = ''
          export CUDA_PATH=${pkgs.cudatoolkit}
          export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
          export EXTRA_CCFLAGS="-I/usr/include"
          export LD_LIBRARY_PATH="/run/opengl-driver/lib"
        '';
      };
  };
}
