{ pkgs ? import (fetchTarball "channel:nixos-unstable") {} }:

pkgs.mkShell {
  packages = with pkgs; [
    flyctl
    ruby
    ruby-lsp   
    rubocop
  ];
}
