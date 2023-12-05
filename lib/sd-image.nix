{
  nixpkgs,
  nixos-hardware,
  system,
}:
(import "${nixpkgs}/nixos" {
  inherit system;
  configuration = import ../packages/sd-image.nix {inherit nixos-hardware;};
})
.config
.system
.build
.sdImage
