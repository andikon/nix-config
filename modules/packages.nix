{ pkgs, inputs, ... }:

let
  cliPackages = with pkgs; [
    bash  
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
	gh
	github-copilot-cli
    fastfetch
    jdt-language-server
    javaPackages.compiler.openjdk21
	zoxide
    gitfetch


	gcc
	gnumake
	pkg-config
	cmake
	just
  ];

  osCLiPackages = with pkgs; [
	vulkan-tools
	docker
	docker-compose
	amp-cli
    libnotify
  ];

  guiPackages = with pkgs; [
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
  ];

  specialStuff = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

in
{
  cliPackages = cliPackages;
  
  module = { ... }: {
    environment.systemPackages = cliPackages ++ osCLiPackages ++ guiPackages ++ specialStuff;
    virtualisation.docker.enable = true;
  };
}

