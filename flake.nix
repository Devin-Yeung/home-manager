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
      mkHomeConfiguration =
        {
          system,
          username ? "ycg",
        }:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          extra = {
            inherit username;
          };
        in

        home-manager.lib.homeManagerConfiguration {
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
      homeConfigurations.orbstack = mkHomeConfiguration {
        system = "aarch64-linux";
      };
    };
}
