{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
        editor = false;
      };
      efi = {
        efiSysMountPoint = "/efi";
        canTouchEfiVariables = true;
      };
    };
  };
  networking.hostName = "onyx"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "America/Phoenix";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #services.xserver.displayManager.defaultSession = "plasmawayland";

  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.raiden = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
      libsForQt5.kate
      discord
    ];
  };

  environment.systemPackages = with pkgs; [
    git
    ntfs3g
    zip unzip p7zip xz gzip bzip2
    lshw
    lm_sensors
    (callPackage ./rebuild.nix {})
  ];

  nixpkgs.config.allowUnfree = true;
  programs.steam.enable = true;
  programs.git.enable = true;
  programs.git.config = {
    init = {
      defaultBranch = "main";
      };
      url = {
      "https://github.com/" = {
        insteadOf = ["github:"];
      };
    };
    user = {
      email = "raidenaz74@gmail.com";
      name = "Raiden";
    };
  };


  nix.settings.experimental-features = ["flakes" "nix-command"];

  # DONT TOUCH THIS LINE
  system.stateVersion = "23.11"; # Did you read the comment?

}
