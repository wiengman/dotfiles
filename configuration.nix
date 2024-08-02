# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware
    ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     libcxx
     waybar
     unzip
     gzip
     git
     neovim
     alacritty
     clang
     cargo
     eww
     tokei
     ripgrep
     wev
     neofetch
     firefox
     vesktop
     gnumake
     cmake
     sddm-chili-theme
     starship
     zellij
     jack2
   ];

   
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };


  networking.hostName = "aurora"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
   i18n.defaultLocale = "sv_SE.UTF-8";
   i18n.extraLocaleSettings = {
   	LC_MESSAGES = "en_US.UTF-8";
   };

   console = {
   #  font = "Lat2-Terminus16";
     keyMap = "sv-latin1";
   # useXkbConfig = true; # use xkb.options in tty.
   };

  # Enable the X11 windowing system.
   services.xserver.enable = true;
   services.xserver.displayManager.sddm.enable = true;
   services.xserver.displayManager.sddm.wayland.enable = true;
   services.xserver.displayManager.sddm.theme = "chili";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.logind = {
	lidSwitch = "ignore"; 
	lidSwitchDocked = "ignore"; 
	lidSwitchExternalPower = "ignore"; 
	powerKey = "suspend-then-hibernate";
  };

  # Configure keymap in X11
   services.xserver.xkb.layout = "se";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.package = pkgs.bluez;
  hardware.bluetooth.settings.general = {
    enable = "Source,Sink,Media,Socket";
  };

  services.blueman.enable = true;

  security.rtkit.enable = true;
  #Enable sound.
   services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;
     wireplumber.enable = true;
     jack.enable = true;
   };

  systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudio ];

   services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
    "monitor.bluez.properties" = {
      "bluez5.enable-sbc-xq" = true;
      "bluez5.enable-msbc" = true;
      "bluez5.enable-hw-volume" = true;
      "bluez5.roles" =  [ "hsp_hs" "hsp_ag" "hfp_hf" "hfp_ag" ];
    };
   };

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

   # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.wlem = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     #packages = with pkgs; [];
   };

   fonts.packages = with pkgs; [
     (nerdfonts.override { fonts = [ "CascadiaMono" "CascadiaCode" ]; })
   ];
   fonts.fontconfig.enable = true;
   fonts.fontconfig.defaultFonts.monospace = [ "CascadiaCode" ];


  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

