{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:
with lib; let
  moduleName = "virshle";
in {
  ## Options
  options.services.${moduleName} = with types; {
    enable = mkEnableOption "Enable ${moduleName}.";
    settings = mkOption {
      type = attrs;
      description = "Configure host network to give VM network access";
      default = null;
    };
  };
}
