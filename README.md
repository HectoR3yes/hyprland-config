# hyprland-config

## Installing Hyprland Dependencies

```shell
yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio
```

## CMake

```shell
git clone --recursive https://github.com/hyprwm/Hyprland
cd Hyprland
sudo make install
```
## Critical Software

```shell
pacman -Sy dunst
```

```shell
pacman -Sy pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-jack wireplumber
```

```shell
yay -S xdg-desktop-portal-hyprland-git xdg-desktop-portal-gtk
```

```
pacman -Sy qt6-wayland qt5-wayland
```

```shell
pacman -Sy polkit-kde-agent
```

```shell
yay -S sddm-git
```

## Kitty Installation

```shell
pacman -Sy kitty
pacman -Sy gtk3 --> if kytty is not launching
```

## VsCode

```shell
yay -S code code-features code-marketplace
```

## Network

```shell
pacman -Sy networkmanager wpa_supplicant wireless_tools network-manager-applet gnome-keyring
```

```shell
systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service
gpasswd -a h3ct0r network
```

## Others

```shell
yay -S ttf-font-awesome ttf-jetbrains-mono ttf-icomoon-feather grim slurp  
```
