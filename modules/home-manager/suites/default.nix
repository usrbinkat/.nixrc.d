{ options, config, lib, pkgs, inputs, ... }:
let
  cfg = config.yomaq.suites.basic;
in
{
  imports = [];
  options.yomaq.suites.basic = {
    enable = with lib; mkOption {
      type = types.bool;
      default = false;
      description = ''
        enable custom suite
      '';
    };
  };
 config = lib.mkIf cfg.enable {
    yomaq = {
      comma.enable = true;
      bash.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    };
 };
}
