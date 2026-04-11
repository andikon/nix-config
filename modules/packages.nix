{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
     ## --- Core CLI ---
  	git
	wget
	curl
	ripgrep
	fd
	fzf
	tree
	htop
	stow
	unzip
	zip
	gnupg
	jq
	bat
	eza
	fish
	tmux
	vim
	neovim
	vulkan-tools
	stow
	docker
	docker-compose
	amp-cli
	gh
	github-copilot-cli


## --- Build / Dev essentials ---
	gcc
	gnumake
	pkg-config
	cmake
	just

## --- Search / navigation helpers ---
	zoxide

## Gui Stuff
	winboat
	ghostty
	discord
	steam
	lutris
	bitwarden-desktop
	bitwarden-cli
	spotify
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  virtualisation.docker.enable = true;
}
