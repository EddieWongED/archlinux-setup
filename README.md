# archlinux-setup

Heavily riced archlinux setup script.

## Setup

| Component           | Package                                                     |
| ------------------- | ----------------------------------------------------------- |
| Compositor          | Hyprland                                                    |
| Multimedia Server   | pipewire                                                    |
| Input Method        | fcitx5                                                      |
| Terminal            | Alacritty                                                   |
| File Explorer       | Dolphin                                                     |
| Notification        | swaync                                                      |
| App Launcher        | rofi                                                        |
| Desktop Environment | waybar, hyprpaper, hyprlock, hypridle, hyprshot, hyprswitch |

## Installation

```bash
./run.sh
```

## Troubleshooting

-   If you encounter error when syncing dotfiles, please resolve the conflict and rerun the script or run:

```bash
cd $HOME/dotfiles && stow .
```
