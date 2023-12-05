{nixos-hardware}: {
  config,
  pkgs,
  ...
}: {
  sdImage.compressImage = false;
  imports = ["${nixos-hardware}/starfive/visionfive/v2/sd-image-installer.nix"];
  nixpkgs.crossSystem = {
    config = "riscv64-unknown-linux-gnu";
    system = "riscv64-linux";
  };
  system.stateVersion = "24.05";

  users.users.nixos.password = "nixos";
  services.openssh.enable = true;

  nixpkgs.config.allowUnfree = true;
  nix = {
    channel.enable = false;
    settings = {
      experimental-features = ["nix-command" "flakes" "repl-flake"];

      substituters = [
        "https://mirrors.bfsu.edu.cn/nix-channels/store/"
        "https://mirrors.ustc.edu.cn/nix-channels/store"
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        "https://cache.nixos.org"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    (callPackage "${nixos-hardware}/starfive/visionfive/v2/firmware.nix"
      {})
    .updater-sd

    emacs
    git
  ];
}
