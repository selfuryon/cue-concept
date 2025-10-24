{inputs, ...}: {
  perSystem = {system, ...}: let
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
      overlays = [
        # (_: prev: {
        #   cue = prev.cue.overrideAttrs (_: rec {
        #     version = "0.14.0-rc.2";
        #     src = prev.fetchFromGitHub {
        #       owner = "cue-lang";
        #       repo = "cue";
        #       rev = "v${version}";
        #       hash = "sha256-WYZEdipfSd8eT28DnXSMOXH720294SzahtEy+Rj0pCA=";
        #     };
        #     vendorHash = "sha256-hV5LO9R854YuazzS6VkxoY64h3+JboBgEDRWAoWats8=";
        #   });
        # })
      ];
    };
  in {
    _module.args.pkgs = pkgs;
    # packages.cue = pkgs.cue;
  };
}
