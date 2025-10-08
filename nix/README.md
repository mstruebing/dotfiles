# My nix / home-manager configuration


## Preface
This is probably not complete, some configurations are bad practice and what not.
It is stolen from various other dotfiles and adapted to my needs.
Currently, this only works on my Macbook.


## Get going
Steps required:

1. `make install` should install nix as required, I did not check that it actually works though
2. `make rebuild-darwin` should build the system configuration 

There are a couple of "hacks" involved because I didn't get it to work otherwise for now.
1. I need to manually load the scripting addition in yabai, 
2. I need to `touch` my `~/.zshrc` file in order to let my `zsh` properly load it (don't ask me why, I was confused as well!)
3. I need to manually `chown` my `~/.local` directory in order for my `packer` (`nvim`) setup to work
