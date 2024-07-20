{
lib ? null,
home-manager ? null,
nixpkgs ? null
}:

  let

    createSystem = { host, username ? "howardsp", fullname ? "Howard Spector", system ? "x86_64-linux",  allowUnfree ? true }: nixpkgs.lib.nixosSystem {

      inherit system;

      modules = [
          (./hosts/${host}.nix)
          (./hardware/hardware-${host}.nix)
          (lib.mkIf allowUnfree {nixpkgs.config.allowUnfree = true;})
          home-manager.nixosModules.home-manager {
            home-manager.useUserPackages = true;
            home-manager.useGlobalPkgs = true;
            home-manager.users.howardsp = (./users/${username}-${host}.nix);
            home-manager.extraSpecialArgs = { inherit  host username fullname; };
          }
        ];
        specialArgs = { inherit  host username fullname  home-manager;};
      };

    lib = {
      inherit createSystem;
    };
  in
  lib
