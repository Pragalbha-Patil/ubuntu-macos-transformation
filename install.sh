#!/bin/bash
echo "*** Welcome to MacOS Ubuntu Transformation! ***"
echo "-----------------------------------------------"
echo "Making required files for themes to work"
cd ~
mkdir .themes
mkdir .icons
echo "-----------------------------------------------"
echo "The script will start working now.. (Ctrl + C to exit now)"
sleep 3
cd /tmp
mkdir macos-transformation/
cd macos-transformation/
echo "-----------------------------------------------"
echo "Downloading and Applying MacOS WhiteSur Dark theme"
wget https://github.com/Pragalbha-Patil/ubuntu-macos-transformation/raw/master/assets/WhiteSur-dark-Gnome-40-0.tar.xz
tar -xf WhiteSur-dark-Gnome-40-0.tar.xz
cp -a WhiteSur-dark/ ~/.themes/
echo "Done"
echo "-----------------------------------------------"
echo "Downloading and Applying MacOS WhiteSur Dark Solid theme"
wget https://github.com/Pragalbha-Patil/ubuntu-macos-transformation/raw/master/assets/WhiteSur-dark-solid-Gnome-40-0.tar.xz
tar -xf WhiteSur-dark-solid-Gnome-40-0.tar.xz
cp -a WhiteSur-dark-solid/ ~/.themes/
echo "Done"
echo "-----------------------------------------------"
echo "Downloading and Applying MacOS WhiteSur Light theme"
wget https://github.com/Pragalbha-Patil/ubuntu-macos-transformation/raw/master/assets/WhiteSur-light-Gnome-40-0.tar.xz
tar -xf WhiteSur-light-Gnome-40-0.tar.xz
cp -a WhiteSur-light/ ~/.themes/
echo "Done"
echo "-----------------------------------------------"
echo "Downloading and Applying MacOS WhiteSur Light Solid theme"
wget https://github.com/Pragalbha-Patil/ubuntu-macos-transformation/raw/master/assets/WhiteSur-light-solid-Gnome-40-0.tar.xz
tar -xf WhiteSur-light-solid-Gnome-40-0.tar.xz
cp -a WhiteSur-light-solid/ ~/.themes/
echo "Done"
echo "-----------------------------------------------"
echo "Downloading and Applying MacOS icon packs now"
wget https://github.com/Pragalbha-Patil/ubuntu-macos-transformation/raw/master/assets/01-WhiteSur.tar.xz
tar -xf 01-WhiteSur.tar.xz
cp -a WhiteSur/ ~/.icons/
cp -a WhiteSur-dark/ ~/.icons/
echo "Done"
echo "-----------------------------------------------"
echo "Downloading and Applying Big Sur wallpaper (coz why not)"
wget https://github.com/Pragalbha-Patil/ubuntu-macos-transformation/raw/master/assets/big_sur.jpg
gsettings set org.gnome.desktop.background picture-uri "file:///tmp/macos-transformation/big_sur.jpg"
echo "Done"
echo "-----------------------------------------------"
echo "Installing Plank (MacOS Dock basically, Press Enter when asked)"
sudo add-apt-repository ppa:ricotz/docky
sudo apt-get update
sudo apt-get install -y plank && plank &
echo "Done"
echo "-----------------------------------------------"
echo "Applying Plank theme (Enter sudo password when asked)"
cd WhiteSur-light/
mv plank/ WhiteSur-plank-theme
sudo cp -a WhiteSur-plank-theme/ /usr/share/plank/themes/
echo "*** NOTE: Now select Theme as 'WhiteSur-plank-theme' and close the program ***"
plank --preferences &
echo "Done"
echo "Don't forget to add plank to startup applications later!"
echo "-----------------------------------------------"
echo "Installing gnome-tweak-tools to set change the look (Enter sudo password when asked)"
echo "*** NOTE: When Gnome-tweaks launches, go to Appearance -> Applications -> Set to WhiteSur-dark-solid and follow the same for icons as well ***"
sudo apt update && sudo apt install -y gnome-tweaks && gnome-tweaks &
echo "-----------------------------------------------"
echo "Removing ubuntu Default dock"
# get ubuntu dock back with this command:
# cd /usr/share/gnome-shell/extensions/
# sudo mv ubuntu-dock@ubuntu.com{.bak,}
cd /usr/share/gnome-shell/extensions/
sudo mv ubuntu-dock@ubuntu.com{,.bak}
echo "Done"
echo "Press Alt + F2 type 'r' in the input"
sleep 10
echo "Congratulations! Dock is removed and you should start using plank now."
echo "-----------------------------------------------"
echo "Installing chrome gnome shell (enter sudo password if asked)"
sudo apt install -y chrome-gnome-shell
echo "Now the script will open firefox and let you install the browser extension"
echo "*** NOTE: Click on 'Click here to install browser extension' on the web page ***"
sleep 10
firefox extensions.gnome.org &
echo "Done"
echo "-----------------------------------------------"
echo "Now time to install shell theme again opening firefox"
echo "*** NOTE: Enable the toggle button and click install when popup appears ***"
sleep 10
firefox https://extensions.gnome.org/extension/19/user-themes/ &
echo "Done"
echo "-----------------------------------------------"
echo "Toggle the same button for compiz windows effect"
sleep 5
firefox https://extensions.gnome.org/extension/3210/compiz-windows-effect/ &
echo "-----------------------------------------------"
echo "Installing Albert now (spotlight in MacOS)"
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install -y albert