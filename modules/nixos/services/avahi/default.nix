{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.services.custom.avahi;
in {
  options.services.custom.avahi.enable = mkEnableOption "Avahi";

  config = mkIf cfg.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      reflector = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        userServices = true;
        hinfo = true;
        workstation = true;
      };
    };
  };
}
