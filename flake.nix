{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.aarch64-darwin.my-packages = nixpkgs.legacyPackages.aarch64-darwin.buildEnv {
      name = "my-packages-list";
      paths = [
        nixpkgs.legacyPackages.aarch64-darwin.git
        nixpkgs.legacyPackages.aarch64-darwin.curl
        # ここにパッケージを追記していく
      ];
    };
  };
}
