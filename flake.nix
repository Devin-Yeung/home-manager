{
  description = "Home Manager Configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    let
      inherit (nixpkgs) lib;
      mkHomeConfiguration =
        {
          system,
          host,
          username ? "ycg",
        }:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          extra = {
            inherit username host;
          };

          config = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            # use extraSpecialArgs to pass through arguments to home-manager modules
            extraSpecialArgs = {
              inherit system extra;
            };

            modules = [
              ./modules/general.nix
              ./modules/utils.nix
              ./modules/zsh.nix
            ];
          };
        in
        {
          homeConfigurations."${host}" = config;
        };

      orbstack = mkHomeConfiguration {
        system = "aarch64-linux";
        host = "orbstack";
      };

    in
    builtins.foldl' lib.recursiveUpdate { } [
      orbstack
    ];
}
