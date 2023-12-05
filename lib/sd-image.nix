{
  nixpkgs,
  nixos-hardware,
  system,
}:
(nixpkgs.lib.nixosSystem {
  modules = [
    "${nixos-hardware}/starfive/visionfive/v2/sd-image-installer.nix"
    (import ../packages/sd-image.nix {inherit nixos-hardware system;})
  ];
})
.config
.system
.build
.sdImage
