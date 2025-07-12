# Nix / Home-manager config

This repo contains the configuration of my 3 primary computers.


## Folder structure
.
├── flake.lock
├── flake.nix
├── home-manager
│   └── home.nix
├── modules
│   ├── home-manager
│   │   ├── eww/
│   │   ├── hyprland/
│   │   ├── kitty.nix
│   │   ├── programs.nix
│   │   ├── shell.nix
│   │   ├── stylix.nix
│   │   └── vim/
│   └── nixos
│       ├── base.nix
│       ├── bluetooth.nix
│       ├── hyprland.nix
│       └── shell.nix
├── nixos
│   └── systems
│       ├── desktop
│       │   ├── configuration.nix
│       │   └── hardware-configuration.nix
│       └── laptop
│           ├── configuration.nix
│           └── hardware-configuration.nix
└── README.md

## Info

the 3 machines are:

### Desktop
    Primary machine for my projects and gaming, this machine uses a Nvidia GPU as it's
    sole graphics processor. This machine uses hyprland as it's window manager.
    - Apps:
        - hyprland (wm)
        - kitty (term emu)
        - Neovim (IDE)
        - Firefox (browser)
        - Steam (gaming app)

### Laptop
    Machine for school as well as projects, unlike the desktop the laptop has both AMD
    Radeon Graphics and a Nvidia GPU and needs to use Nvidia Prime to reflect this. though
    also uses hyrpland as it's window manager.
    - Apps:
        - hyprland (wm)
        - kitty (term emu)
        - Neovim (IDE)
        - Firefox (browser)

### Server
    Machine for hosting a couple of servers for the other machines, this computer does not
    requre graphics drivers or a window manager.



