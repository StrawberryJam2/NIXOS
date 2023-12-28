{writeShellApplication, nixos-rebuild, git, sudo}: writeShellApplication {
name = "rebuild";

runtimeInputs = [ nixos-rebuild git sudo];

text = "sudo nixos-rebuild switch --flake github:StrawberryJam2/NIXOS";
}
