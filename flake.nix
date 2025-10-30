{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
    ignis.url = "github:ignis-sh/ignis";
    gitfetch.url = "github:Matars/gitfetch";
  };

  outputs = inputs @ { nixpkgs, home-manager,  ignis, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    homeConfigurations."tea" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };

      modules = [
        ./home.nix
        {
          home.packages = [
            inputs.ignis.packages.${system}.default
            inputs.gitfetch.packages.${system}.default
          ];
        }
      ];
    };
  };
}
