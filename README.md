# NokuOS

###### Table of Contents

* What is NokuOS?

* How do you use NokuOS?
  
  * Install NokuOS
    
    * NokuOS Dependencies

* what is planned for NokuOS?



## What is NokuOS?

 NokuOS (Noku's Operating System) is a Post-installation script for Arch-based Distributions, which installs a pack of essential Packages like kitty, the fish shell, xmonad and also deploys my dotFiles so everything is well configured. 

## How to use NokuOS

### Install NokuOS

> ## WARNING: NokuOS is still in Alpha, so use at your own Risk!

+ NokuOS comes as an easy-to-use .sh file, so just mark is as executable (chmod +x NokuOS.sh) and run it and it will do everything for you

+ #### Please son't run NokuOS.sh as root, so it won't mess with the /root Directory, you wil be prompted for a sudo password
  
  + ##### Dependencies
    
    + At this moment, NokuOS only supports Arch-based distributions like Manjaro, Arco or Mainline Arch, so you need to install an arch-based system if you want to run this Script
    
    + You need to Install Xorg before running this script, without it you won't be able to use xmonad
      
      + Xmonad does NOT support wayland at this moment, so Xorg is needed

## What is Planned for NokuOS

+ Support for both Debian and Arch-based Distros

+ Auto-Install for Xorg so it can just be used from a Command Line Install 
