#!/usr/bin/env bash

theme=
icon_theme=
font=

font_doc=$font
font_mono=$font
gtk3_dir=$XDG_CONFIG_HOME/gtk-3.0/
gtk4_dir=$XDG_CONFIG_HOME/gtk-4.0/
theme_dir=~/.themes/$theme

mkdir $gtk3_dir
mkdir $gtk4_dir

gsettings set org.gnome.desktop.interface gtk-theme "$theme"
gsettings set org.gnome.desktop.interface icon-theme "$icon_theme"
gsettings set org.gnome.desktop.interface font-name "$font"
gsettings set org.gnome.desktop.interface document-font-name "$font_doc" 
gsettings set org.gnome.desktop.interface monospace-font-name "$font_mono" 
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

echo "[Settings]
gtk-theme-name = $theme 
gtk-icon-theme-name = $icon_theme
gtk-font-name = $font" > $gtk3_dir/settings.ini

rm $gtk4_dir/gtk.css 
rm $gtk4_dir/gtk-dark.css 
rm $gtk4_dir/assets 

ln -sf $theme_dir/gtk-4.0/gtk.css $gtk4_dir/gtk.css
ln -sf $theme_dir/gtk-4.0/gtk-dark.css $gtk4_dir/gtk-dark.css
ln -sf $theme_dir/gtk-4.0/assets/ $gtk4_dir/assets

flatpak override --user --filesystem=~/.themes
flatpak override --user --filesystem=~/.icons
flatpak override --user --filesystem=xdg-config/gtk-4.0

flatpak override --user --env GTK_THEME=$theme
flatpak override --user --env ICON_THEME=$icon_theme
