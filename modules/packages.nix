{ config, pkgs, inputs, ... }:

let
  cliPackages = with pkgs; [
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
    fastfetch
    libnotify
    jdt-language-server
    javaPackages.compiler.openjdk21



## --- Build / Dev essentials ---
	gcc
	gnumake
	pkg-config
	cmake
	just

## --- Search / navigation helpers ---
	zoxide

## Gui Stuff
    thunar
	winboat
	ghostty
	discord
	steam
	lutris
	bitwarden-desktop
	bitwarden-cli
	spotify
	easyeffects
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

in
{
  environment.systemPackages = cliPackages ++ (with pkgs; [
    ## Gui Stuff
    thunar winboat ghostty discord steam lutris bitwarden-desktop bitwarden-cli spotify easyeffects
  ]);

  virtualisation.docker.enable = true;
  _module.args.cliPackages = cliPackages;
}

