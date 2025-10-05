{ pkgs, ... }:
{
  home.packages = with pkgs; [
    git
    lazygit
    fastfetch
    btop
    tlrc
  ];
}
