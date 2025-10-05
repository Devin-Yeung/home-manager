{ extra, ... }:
{
  home.username = extra.username;
  home.homeDirectory = "/home/${extra.username}";

  # Check the release notes carefully before updating the state version
  # https://nix-community.github.io/home-manager/release-notes.xhtml
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
