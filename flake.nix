{
  description = "Basic Nix flake for use in developing the Codename Engine website";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    inputs:
    with inputs;
    let
      package = builtins.fromJSON (builtins.readFile ./package.json);
      getName =
        suffix: "${package.name}-${package.version}" + (if suffix != "" then "-${suffix}" else "");
    in
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShells = rec {
          node = pkgs.mkShell {
            name = getName "node";
            nativeBuildInputs = with pkgs; [
              nodejs
            ];
          };

          python = pkgs.mkShell {
            name = getName "python";
            nativeBuildInputs = with pkgs; [
              python3
            ];
          };

          markdown = pkgs.mkShell {
            name = getName "markdown";
            nativeBuildInputs = with pkgs; [
              marksman
            ];
          };

          default = pkgs.mkShell {
            name = getName "";
            nativeBuildInputs =
              node.nativeBuildInputs ++ python.nativeBuildInputs ++ markdown.nativeBuildInputs;
          };
        };
      }
    );
}
