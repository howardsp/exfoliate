{config, lib, inputs, ...}: 

let   
  createHomeModule = {username, fullname, host}: {} {
      home-manager.useGlobalPkgs = true;
      home-manager.home.useUserPackages = true;   
      home-manager.users.${username} = (./users/${username}-${host}.nix);
      home-manager.extraSpecialArgs = { inherit  host username fullname; };       
  };
  lib = { inherit createHomeModule; };
in
lib

#{  
#  home-manager, nixpkgs 
#}: 
#let     
#    wdir = "";
#    createSystem = { host, username ? "howardsp", fullname ? "Howard Spector", system ? "x86_64-linux", allowUnfree ? true  }: nixpkgs.lib.nixosSystem {        
#            modules = [
#                ("./hosts/${host}.nix")
#                ("./hardware/hardware-${host}.nix")
#                #(builtins.mkIf allowUnfree ({nixpkgs.config.allowUnfree = true;}))                
#                home-manager.nixosModules.home-manager {
#                  home-manager.useUserPackages = true;
#                  home-manager.useGlobalPkgs = true;
#                  home-manager.users.howardsp = ("./users/${username}-${host}.nix");
##                  home-manager.extraSpecialArgs = { inherit  host username fullname; };
 #               }
 #             ];
 #             specialArgs = { inherit  host username fullname  home-manager;};
 #        };
#}
#  lib = { inherit createSystem; };
#in
#lib
