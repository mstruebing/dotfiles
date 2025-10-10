# On change
rebuild-darwin: format
	sudo darwin-rebuild switch --flake ~/.config/nix/darwin
	make yabai
	make fix-permissions

# First installation
build-darwin:
	sudo nix run nix-darwin/nix-darwin-25.05#darwin-rebuild -- switch

rebuild-linux: format
	home-manager switch --flake ~/.config/nix/linux

format:
	nixfmt .

# Seems to be needed for yabai scripting addition to work
yabai:
	sudo yabai --load-sa

fix-permissions:
	# there is some weird behaviour with loading my `~/.zshrc` file, this seems to fix it
	sudo touch ~/.zshrc
	sudo chown -R maex:staff ~/.config/nvim
	sudo chown -R maex:staff ~/.local
