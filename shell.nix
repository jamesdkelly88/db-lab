let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in
{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell rec {

  buildInputs = [
    pkgs.awscli2
    pkgs.go-task
    pkgs.powershell
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.sqlcmd
    pkgs.zlib
    unstable.pkgs.postgresql_17
  ];

  # docker should be running on the system already, so not included here!

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"
  '';
}