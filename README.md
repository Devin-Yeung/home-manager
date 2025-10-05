# An Opinionated Home-Manager Config

[![Built with Nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

## Prerequisite

Make sure you have Nix installed and experimental features enabled,
I recommend you to use [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer):

## Bootstrap

```bash
nix run 'nixpkgs#home-manager' switch -- --flake '.#<config>'
```

If you are not on a NixOS distribution, the default shell can't be managed declaratively,
use following command to set `zsh` as default login shell:

```bash
sudo chsh -s $(which zsh)
```

## Rebuild

We recommend you to put the home-manager flake under `/etc/home-manager/` directory,
and you can archive it using symlink:

```bash
# assuming you are in the root of this repo
sudo ln -s $(pwd) /etc/home-manager
```

Each time you want to rebuild your home-manager config, just run:

```bash
home-manager switch --flake '/etc/home-manager#<config>'
# or using the alias we provided
rebuild
```
