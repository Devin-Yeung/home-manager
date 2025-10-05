{ pkgs, ... }:
{

  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      lg = "${pkgs.lazygit}/bin/lazygit";
      ls = "${pkgs.eza}/bin/eza";
      gc = "nix-collect-garbage";
      rebuild = "home-manager switch --flake /etc/home-manager#orbstack";
    };
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];
    initContent = ''
      ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      container = {
        disabled = true;
      };
    };
  };
}
