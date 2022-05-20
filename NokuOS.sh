#!/bin/bash
# _   _       _           ____   _____ 
#| \ | |     | |         / __ \ / ____\
#|  \| | ___ | | ___   _| |  | | (___   NAME: NokuOS-Arch
#| . ` |/ _ \| |/ / | | | |  | |\___ \  RELEASE: ALPHA v.0.2.1
#| |\  | (_) |   <| |_| | |__| |____) | AUTHOR: Noku
#|_| \_|\___/|_|\_\\__,_|\____/|_____/  GITHUB: github.com/NokuWasTaken/NokuOS

clear

echo "####################################################################"
echo "##Welcome to NokuOS, a post-installl script for Arch-based Distros##"
echo "####################################################################"
echo ""
echo ""

##Checking if user is root
if [ "$(id -u)" = 0 ]; then
        echo "#############################################"
        echo "##Please use this Script as a normal User  ##"
        echo "##This Script wil make changen to the Home ##"
        echo "##Directory of the User Running it, which  ##"
        echo "##is in the Case of root /Root, a directory##"
        echo "##we dont want to mess with. You wil be    ##"
        echo "##asked for a sudo password when needed    ##"
        echo "#############################################"
        exit 1
fi

##Install dialog and welcome message
sudo pacman -S --noconfirm dialog

dialog --colors --msgbox "Welcome to NokuOs, my Post-Install Script for Arch-Based GNU/Linux Distributions. This Script will Install essential Packages like The Kitty Terminal Emulator, the Fish Shell and also deploy my dotFiles, so everything is already well configured" 16 50

##creating script folder

cd ~

mkdir .nokuos

cd .nokuos

#System update

echo "######################"
echo "##Updating System...##"
echo "######################"

sudo pacman -Syyu


##Installs core Software

echo "##########################"
echo "##Installing Software...##"
echo "##########################"

##Installs all posible software with pacman
sudo pacman --needed --ask 4 -Sy - < pkglist.txt

sudo pacman -S --noconfirm  firefox fish git shell-color-scripts flatpak vim jdk17-openjdk jre17-openjdk starship exa zsh kitty  

#Planner
flatpak install flathub com.github.alainm23.planner


##Installs software not available via pacman

#Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#AppImageLauncher
wget https://github.com/TheAssassin/AppImageLauncher/releases/download/v2.2.0/appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage
chmod +x appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage 
./appimagelauncher-lite-2.2.0-travis995-0f91801-x86_64.AppImage 

#Marktext
wget https://github.com/marktext/marktext/releases/latest/download/marktext-x86_64.AppImage
chmod +x marktext-x86_64.AppImage
./marktext-x86_64.AppImage


##Installing Dotfiles

echo "##########################"
echo "##Installing dotFiles...##"
echo "##########################"

git clone https://github.com/NokuWasTaken/dotFiles.git

echo "cloned github repository
"
cd dotFiles

#Moving shell dotFiles

mv .bashrc $HOME
mv .zshrc $HOME
mv config.fish $HOME/.config/fish/config.fish

echo "installed shell dotFiles"

#moving .vimrc

mv .vimrc $HOME

echo "installed vimrc"

#moving .conkyrc

mv .conkyrc $HOME

echo "moved .conkyrc"

#setting xmonad config

mv -r .xmonad $HOME

echo "installed .xmonad"

cd $HOME/.nokuos

##changes user shell

echo "#####################"
echo "##Changing Shell...##"
echo "#####################"

echo "Which Shell do you wanna use?"
echo "1) fish"
echo "2) zsh"
echo "3) bash"
echo "4) abort"
read -p "Enter your Choice (1-4) :" shellchange

if [ "$shellchange" = "1" ]
then
	 chsh -s /usr/bin/fish
elif [ "$shellchange" = 2 ]
then
	 chsh -s /bin/zsh
elif [ $shellchange = "3" ]
then
	 chsh -s /bin/bash
else
	echo "aborted"
fi


echo "############################"
echo "##installing wallpapers...##"
echo "############################"

#moving wallpapers

cd wallpaper

sudo mv wallpaper.png anime-train-station.png mountains.png /usr/share/wallpapers

cd $HOME/.nokuos

echo "###################"
echo "##Last Cleanup...##"
echo "###################"

#remove Wallpaper folder

rm -rf wallpaper

#removing script folder

cd ~
rm -rf .nokuos

echo "CleanUp Done!\n"

echo "############################"
echo "##Thanks for using NokuOS!##"
echo "############################"

echo "if you have any problems with my script, consider opening an Issue at my GitHub Repository [https://github.com/NokuOS/NokuOS-Arch]"
echo "Goodbye"











