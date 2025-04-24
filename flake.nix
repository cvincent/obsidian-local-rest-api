{
  description = "Flake for working on obsidian-local-rest-api";

  # Find package versions at nixhub.io
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        config.allowUnfree = true;
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          pkgs.nodejs
          pkgs.typescript
        ];

        shellHook = ''
          echo "Node $(node --version)"
          echo ""
          echo "LFG."
        '';
      };
    };
}
