{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib; {
  systemd.services.odhcpv6 = {
    enable = true;
    description = "Odhcpd - OpenWrt DHCP Server";
    documentation = [
      "https://github.com/pipelight/virshle"
    ];
    after = [
      "network.target"
      "socket.target"
      "ovs-vswitchd.service"
      "ovsdb.service"
    ];
    wantedBy = ["multi-user.target"];

    serviceConfig = with pkgs; let
      package = inputs.odhcpd.packages.${system}.default;
    in {
      Type = "simple";
      User = "root";
      Group = "users";
      Environment = "PATH=/run/current-system/sw/bin";
      # ExecStartPre = [
      #   "-${package}/bin/odhcpd"
      # ];
      ExecStart = ''
        ${package}/bin/odhcpd
      '';
      WorkingDirectory = "/var/lib/odhcpd";
      # StandardInput = "null";
      StandardOutput = "journal+console";
      StandardError = "journal+console";

      AmbientCapabilities = [
        "CAP_NET_ADMIN"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.odhcpd.packages.${system}.default
  ];
}
