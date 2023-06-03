.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ tmux zsh git tig ruby ripgrep bazel shellcheck netrc

	mkdir -p ~/.config/lvim
	@stow -t ~/.config/lvim lvim

	mkdir -p ~/.ssh
	@stow -t ~/.ssh ssh

	mkdir -p ~/.config/alacritty
	@stow -t ~/.config/alacritty alacritty

	mkdir -p ~/.ctags.d
	@stow -t ~/.ctags.d ctags

	mkdir -p ~/Library/Application\ Support/Blender
	@stow -t ~/Library/Application\ Support/Blender Blender

	mkdir -p ~/Library/Application\ Support/lazygit
	@stow -t ~/Library/Application\ Support/lazygit lazygit

.PHONY: unstow
unstow:
	@stow -D -t ~ tmux zsh git tig ruby ripgrep bazel
	@stow -D -t ~/.config/lvim lvim
	@stow -D -t ~/.ssh ssh
	@stow -D -t ~/.config/alacritty alacritty
	@stow -D -t ~/.ctags.d ctags
	@stow -D -t ~/.config/lazygit lazygit

.PHONY: brew_bundle
brew_bundle:
	cd macos && brew bundle

.PHONY: macos
macos:
	./macos/macos

.PHONY: pmset
pmset:
	./macos/pmset.sh
