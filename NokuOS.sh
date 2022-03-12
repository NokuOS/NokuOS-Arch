##NokuOS Post-Install Script for Arch-Based Linux Distributions

clear

echo "####################################################################"
echo "##Welcome to NokuOS, a post-installl script for Arch-based Distros##"
echo "####################################################################"
echo ""
echo ""


##creating script folder

cd ~

mkdir .nokuos

cd .nokuos

#System update

echo "######################"
echo "##Updating system...##"
echo "######################"

sudo pacman -Syyu


##Installs core Software

echo "##########################"
echo "##Installing Software...##"
echo "##########################"

##Installs all posible software with pacman

sudo pacman -S alacritty firefox fish git shell-color-scripts flatpak vim jdk17-openjdk jre17-openjdk starship exa zsh 


#Minder
flatpak install flathub com.github.phase1geo.minder

#Planner
flatpak install flathub com.github.alainm23.planner


##Installs software not available in pacman

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
mv .bashrc ~
mv .zshrc ~
mv config.fish ~/.config/fish/

echo "installed shell dotFiles"

#moving .vimrc
mv .vimrc ~

echo "installed vimrc"

#moving script folder
mv -r .scripts ~

echo "installed scripts"

##changes user shell

echo "#####################"
echo "##Changing Shell...##"
echo "#####################"

echo "Which Shell do you wanna use?"
echo "1) fish"
echo "2) zsh"
echo "3) bash"
echo "4) quit"
read -p "Enter your Choice (1-4) :" shellchange

if [ "$shellchange" = "1" ]
then
	sudo chsh -s /usr/bin/fish
elif [ "$shellchange" = 2 ]
then
	sudo chsh -s /bin/zsh
elif [ $shellchange = "3" ]
then
	sudo chsh -s /bin/bash
else
	echo "aborted"
fi


echo "############################"
echo "##installing wallpapers...##"
echo "############################"

#moving wallpapers

cd Wallpaper

sudo mv 1.png /usr/share/wallpapers
sudo mv 2.png /usr/share/wallpapers
sudo mv 3.png /usr/share/wallpapers
sudo mv 4.png /usr/share/wallpapers
sudo mv 5.png /usr/share/wallpapers
sudo mv 6.png /usr/share/wallpapers
sudo mv 7.png /usr/share/wallpapers

cd ..



echo "###################"
echo "##Last Cleanup...##"
echo "###################"

#remove unnescecary folders

rm -r Wallpaper

echo "added wallpapers" 

#removing script folder

cd ~
rm -r .nokuos

echo "cleanup Done!\n"

echo "############################"
echo "##Thanks for using NokuOS!##"
echo "############################"

echo "if yu have any problmes with my script, consider opening an Issue at my GitHub Repository https://github.com/NokuWasTaken/NokuOS"
echo "Goodbye"











