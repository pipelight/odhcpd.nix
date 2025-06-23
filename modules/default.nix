{...}: {
  imports = [
    # module confguration options
    ./options.nix
    # openwrt odhcpd
    ./config.nix
  ];
}
