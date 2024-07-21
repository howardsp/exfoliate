{  
  home-manager ? null,
  nixpkgs ? null,
  host ? null, 
  username ? "howardsp", 
  fullname ? "Howard Spector", 
  system ? "x86_64-linux",  
  allowUnfree ? true
}: 
let         
    output = nixpkgs.lib.nixosSystem {
              modules = [
                  (./hosts/${host}.nix)
                  (./hardware/hardware-${host}.nix)
                  (builtins.mkIf allowUnfree {nixpkgs.config.allowUnfree = true;})
                  home-manager.nixosModules.home-manager {
                    home-manager.useUserPackages = true;
                    home-manager.useGlobalPkgs = true;
                    home-manager.users.howardsp = (./users/${username}-${host}.nix);
                    home-manager.extraSpecialArgs = { inherit  host username fullname; };
                  }
                ];
                specialArgs = { inherit  host username fullname  home-manager;};
 
         };
  in
  output