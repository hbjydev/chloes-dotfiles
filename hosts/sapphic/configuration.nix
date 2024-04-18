{ pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../shared

      ../../modules/system/graphics.nix
      
      ../../modules/services/asusd.nix
      ../../modules/services/xserver.nix

      ../../modules/cli-apps/1password

      ../../modules/apps/1password
      ../../modules/apps/steam

      inputs.home-manager.nixosModules.default
    ];

  environment = {
    systemPackages = with pkgs; [
      asusctl
      catppuccin-sddm-corners
      catppuccin-cursors.mochaPink
    ];
    gnome.excludePackages = with pkgs; [ gnome-tour ];
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "23.11"; # Initial NixOS version
}
