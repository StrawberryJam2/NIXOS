{
description = "My nixos config";

inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

outputs = { nixpkgs, self }: {nixosConfigurations = {
    onyx = nixpkgs.lib.nixosSystem { modules = [./configuration.nix]; };
};
};
}
