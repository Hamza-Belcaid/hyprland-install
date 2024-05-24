#!/bin/bash

# Define the software that would be inbstalled 
yay -S qt5-wayland qt5ct qt6-wayland qt6ct qt5-svg qt5-quickcontrols2 qt5-graphicaleffects gtk3 polkit-gnome jq cliphist python-requests kitty mako waybar swaylock-effects wofi  wlogout xdg-desktop-portal-hyprland swappy grim slurp thunar btop pamixer pavucontrol brightnessctl blueman thunar-archive-plugin file-roller starship papirus-icon-theme ttf-jetbrains-mono-nerd noto-fonts-emoji lxappearance xfce4-settings nwg-look-bin sddm

### Copy Config Files ###
cp -R HyprV ~/.config/

#set the measuring unit
if locale -a | grep -q ^en_US; then
    echo -e "$COK - Setting mesuring system to imperial..."
        ln -sf ~/.config/HyprV/waybar/conf/mesu-imp.jsonc ~/.config/HyprV/waybar/conf/mesu.jsonc
        sed -i 's/SET_MESU=""/SET_MESU="I"/' ~/.config/HyprV/hyprv.conf
    else
        echo -e "$COK - Setting mesuring system to metric..."
        sed -i 's/SET_MESU=""/SET_MESU="M"/' ~/.config/HyprV/hyprv.conf
        ln -sf ~/.config/HyprV/waybar/conf/mesu-met.jsonc ~/.config/HyprV/waybar/conf/mesu.jsonc
fi

# link up the config files
echo -e "$CNT - Setting up the new config..." 
cp ~/.config/HyprV/hypr/* ~/.config/hypr/
ln -sf ~/.config/HyprV/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/.config/HyprV/mako/conf/config-dark ~/.config/mako/config
ln -sf ~/.config/HyprV/swaylock/config ~/.config/swaylock/config
ln -sf ~/.config/HyprV/waybar/conf/v4-config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/.config/HyprV/waybar/style/v4-style-dark.css ~/.config/waybar/style.css
ln -sf ~/.config/HyprV/wlogout/layout ~/.config/wlogout/layout
ln -sf ~/.config/HyprV/wofi/config ~/.config/wofi/config
ln -sf ~/.config/HyprV/wofi/style/v4-style-dark.css ~/.config/wofi/style.css



# setup the first look a nd feel as dark
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Papirus-Dark"
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

### Install the starship shell ###
echo -e '\neval "$(starship init bash)"' >> ~/.bashrc
echo -e "$CNT - copying starship config file to ~/.config ..."
cp Extras/starship.toml ~/.config/

echo "The script is done"

