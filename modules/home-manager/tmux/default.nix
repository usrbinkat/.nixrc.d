{ options, config, lib, pkgs, inputs, ... }:
let
  cfg = config.yomaq.tmux;
in
{
  imports = [];
  options.yomaq.tmux = {
    enable = with lib; mkOption {
      type = types.bool;
      default = false;
      description = ''
        enable custom tmux module
      '';
    };
  };
 config = lib.mkIf cfg.enable {
   programs = {
     tmux = {
       enable = true;
       shell = if pkgs ? zsh then "${pkgs.zsh}/bin/zsh" else "${pkgs.bash}/bin/bash";
     };
   };
 };
}
