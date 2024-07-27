{
  description = "Pure Nix flake utility functions";

   inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";        
   inputs.home-manager.url = "github:nix-community/home-manager";
  
  # Externally extensible flake systems. See <https://github.com/nix-systems/nix-systems>.
  #inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, ... }: {
    self, 
    nixpkgs,
    ...
  } @inputs:  {
      createHomeModuleConfig  = import ./lib.nix;
  };

    #templates = {
    #  default = self.templates.each-system;
    #  simple-flake = {
    #    path = ./examples/simple-flake;
    #    description = "A flake using flake-utils.lib.simpleFlake";
    #  };
    #  each-system = {
    #    path = ./examples/each-system;
    #    description = "A flake using flake-utils.lib.eachDefaultSystem";
    #  };
    #  check-utils = {
    #    path = ./examples/check-utils;
    #    description = "A flake with tests";
    #  };
    #};
  }

