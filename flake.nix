{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      pkgs.runCommand "doc" { nativeBuildInputs = [ pkgs.pandoc ]; } ''
        mkdir -p $out/share/doc
        pandoc ${./index.md} -so $out/share/doc/index.html
      '';

  };
}
