# let
#   unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
# in
{ pkgs ? import <nixpkgs> {config.allowUnfree = true;} }:

pkgs.mkShell rec {

  buildInputs = [
    pkgs.awscli2
    pkgs.cargo
    pkgs.dotnet-sdk
    pkgs.go
    pkgs.go-task
    pkgs.powershell
    pkgs.python311
    pkgs.python311Packages.pip
    pkgs.sqlcmd
    pkgs.zlib
    pkgs.postgresql_17
  ];

  # docker should be running on the system already, so not included here!

  # ODBC drivers for SQL Server required - I can't get this to work in shell.nix so the following needs adding at the NixOS level:
  # packages:
  # - unixODBC
  # - unixODBCDrivers.msodbcsql18
  #
  # config:
  # environment.unixODBCDrivers = with pkgs.unixODBCDrivers; [ msodbcsql18 ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib.outPath}/lib:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="${pkgs.unixODBC}/lib:$LD_LIBRARY_PATH"
  '';
}