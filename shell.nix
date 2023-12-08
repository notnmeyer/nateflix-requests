{ pkgs ? import (fetchTarball "channel:nixos-unstable") {} }:

pkgs.mkShell {
  packages = with pkgs; [
    ruby
    ruby-lsp   
    rubocop
  ];
}
