{writeShellApplication, nixos-rebuild, git}: writeShellApplication {
name = "rebuild";

runtimeInputs = [ nixos-rebuild git];

text = "sudo nixos-rebuild switch --flake github:StrawberryJam2/NIXOS";
}
