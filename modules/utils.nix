{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lazygit
    fastfetch
    btop
  ];
}
