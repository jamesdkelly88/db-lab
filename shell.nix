let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in
{ nixpkgs ? import <nixpkgs> {} }:
with nixpkgs; mkShell {
  packages = with pkgs; [
    awscli2
    go-task
    powershell
    sqlcmd
    unstable.pkgs.postgresql_17
  ];
}

# docker should be running on the system already, so not included here!

# TODO:
# install python (with pip and venv)