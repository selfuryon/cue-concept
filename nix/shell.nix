{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devshells.default = {
      name = "cue-concept";
      packages = with pkgs; [
        cue
        claude-code
      ];
      devshell.startup = {
        pre-commit.text = config.pre-commit.installationScript;
      };
    };
  };
}
