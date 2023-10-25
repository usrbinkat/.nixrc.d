{ config, lib, pkgs, inputs, ... }:
let
  inherit (config.networking) hostName;
in
{
  imports =
    [
      inputs.agenix.nixosModules.default
    ];
  environment.persistence."/nix/persistent" = {
    hideMounts = true;
    directories = [
      { directory = "/run/agenix"; mode = "0700"; }
    ];
    files = [
      { file = "/etc/ssh/${hostName}"; }
    ];
  
  };
    age.identityPaths = [ "/etc/ssh/${hostName}" ];
}