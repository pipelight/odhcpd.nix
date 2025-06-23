{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
with lib; {
  environment.systemPackages = with pkgs; [
    inputs.odhcpd.packages.default
  ];
}
