# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the system config
      ./current/config.nix
      # Include the hardware config.
      ./current/hardware.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };
  
  # TODO find a way to handle users
  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim 

    tree
    htop

    zip
    unzip
  ];


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # root access
  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmsFEU7tjW123gWkQoh5k+LGsfqxwQlBDbl01B3bfKv2oQGc8MYv8TqIl9+qvHabysZRFofD8SWn/fAZCqnalh+0mEG6ZrJAWvZAwiY7JPVDZCGvdWLAvl9Q3GLQo1eGP59Y0NOwV4kljpj8+TnhCQ1d6QbYE8EsI89a2a/naZkM4w83Qw/KCH2AQEswvSDpJFjtvXswLeaaFqTy9FXv5mFCxr45PXl8NfqmZD0l/YSKYJStwyXQmGj0nevAu+hr28Dk3vx9qBeCIg2gGMnwTG/9QiyH92PC0qCHBpcAyEledWIv8wUZfwSMpTU5T4LizFsT/Mm1ocpoWstAPzL04ChAcxDKWmaY2FNh2HdHtbXA8cHttpnWkCNl/X1kC0nNDK4qAX5haYU78BR2a9VThXUywe1hlH0OF8lwPLP74dw0sAqupOOdOd5/vLLZNr3M+mNt8HdHVhuLbz7O8xFIC+McN6BbwiIDBu41cPlos14hGrxjrcKCe0hMmAaRji/aE= jules"
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

