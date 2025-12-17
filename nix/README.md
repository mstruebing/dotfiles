# My nix / home-manager configuration


## Preface
This is probably not the best setup, some configurations are bad practice and what not.
But it works for me on both, Linux and Mac.
It is stolen from various other dotfiles and adapted to my needs.

Search for home-manager options here: https://home-manager-options.extranix.com/
Search for nix packages here: https://search.nixos.org/
Serach for nix-darwin options here: https://nix-darwin.github.io/nix-darwin/manual/


## Get going

1. Install `nix` (not the determinate one, just the regular one)
2. Install `home-manager` if on linux, on mac it is handled by nix-darwin
3. Install `nix-darwin` if on Mac (https://github.com/nix-darwin/nix-darwin?tab=readme-ov-file#step-2-installing-nix-darwin)
4. Run `make rebuild-darwin` or `make rebuild-linux`


## Caveats

There are a couple of "hacks" involved because I didn't get it to work otherwise for now.
1. I need to manually load the scripting addition in yabai, 
2. I need to `touch` my `~/.zshrc` file in order to let my `zsh` properly load it (don't ask me why, I was confused as well!)
3. I need to manually `chown` my `~/.local` directory in order for my `packer` (`nvim`) setup to work
4. I need to do some nasty environment varibale handling stuff in order to make it work for different machines with nearly the same setup, there may be better ways to do this, but I didn't find them yet.
