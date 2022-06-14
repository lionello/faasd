{
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      with nixpkgs.legacyPackages.${system};
      {
        defaultPackage = buildGoModule
          {
            name = "faasd";
            src = lib.cleanSource ./.;
            vendorSha256 = null;
          };
      }
    );
}
