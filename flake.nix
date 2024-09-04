{
  description = "Wlems dotfiles";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }: 
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
    	aurora = lib.nixosSystem {
	  system = "x86_64-linux";
	  modules = [ ./configuration.nix ];
      };
	glacier = lib.nixosSystem {
	  system = "x86_64-linux";
	  modules = [ ./configuration.nix ];
      };
    };
  };
}
