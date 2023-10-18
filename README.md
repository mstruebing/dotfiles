How to setup:

* install os
* (https://www.jetpack.io/devbox/docs/quickstart/)[install devbox]: `curl -fsSL https://get.jetpack.io/devbox | bash` 
* start a nix shell with stow and git: `nix-shell -p stow git`
* Clone dotfiles: `git clone https://github.com/mstruebing/dotfiles.git ~/.dotfiles`
* Stow all of them: `cd .dotfies && stow *`
* Exit the nix-shell: `exit`
* Install all devbox programs: `devbox global install`
* setup etc services i.e. docker: `which stow`, `sudo <output from which stow> -t / .etc`
* link rsync globally: `which rsync`, `ln -s <output from which rsync /usr/bin/`
