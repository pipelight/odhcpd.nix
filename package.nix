{
  pkgs ? import <nixpkgs> {},
  lib,
  stdenv,
  ...
}:
stdenv.mkDerivation rec {
  name = "odhcpd";
  pname = "odhcpd";
  version = "master";
  ## DhcpV6
  # src = pkgs.fetchgit {
  #   url = "git://git.openwrt.org/project/odhcpd.git";
  #   # url = "https://git.openwrt.org/project/odhcpd.git";
  #   hash = "sha256-WfFR/BU78O+aNoIXIFkwKtLqL8DD0Du38bIE0xPMXXg=";
  # };
  src = pkgs.fetchFromGitHub {
    owner = "openwrt";
    repo = "odhcpd";
    # rev = "v${version}";
    rev = "${version}";
    sha256 = "sha256-WfFR/BU78O+aNoIXIFkwKtLqL8DD0Du38bIE0xPMXXg=";
  };

  nativeBuildInputs = with pkgs; [pkg-config cmake libnl libnl-tiny libubox uci];

  configurePhase = ''
    mkdir build
    cmake -B build -S .
  '';
  buildPhase = ''
    cmake --build build
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp build/odhcpd $out/bin
  '';
}
