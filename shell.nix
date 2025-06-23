{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = with pkgs; [pkg-config cmake libnl libnl-tiny libubox uci];
}
