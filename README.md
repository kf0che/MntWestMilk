# Mountain West Milk

This is a setup for dispatch.

# Instructions

Go to:
https://linuxmint.com/edition.php?id=319

Download the Linux Mint 22.1 ISO to your computer.

Have a USB Flashdrive with a min of 256GB. 

Go to: 
https://sourceforge.net/projects/ventoy/files/v1.1.05

Download Ventoy to your computer. 

Run Ventoy on your USB Flashdrive.

Copy the Linux Mint ISO to your Ventoy Drive.
Wait until the ISO has fully copied over prior to unmounting the drive from the computer.

Shut down your computer.
Plug in your USB drive.

Enter into the BIOS settings.
"Depending on your computer, this will determine what key you need to hit while the computer is booting up."

Go to the Advanced Settings and change your boot order to have the USB Flashdrive load first.
F10 to save and reboot. 

This should allow the boot loader to enter into a try or install Linux Mint.
Choose "Try"

This allows you to try Linux Mint on your computer without having to install it. It will also allow you to see if this is an operating system that you wish to use.

# Install Linux Mint.
Depending on how you install Mint onto your system, you can either have a dual boot or a single boot system. If you are unfamilar if you will like Mint; I highly recommend that you choose to dual boot so you can have access to both Windows and Mint.

# Installing the MWM script.
Go to:

On the right side, you will see "Releases". Click on that.
Right click on the tar.gz file and copy link.

Open up Terminal in Mint.
wget "right click and paste hyperlink here"
Press the Enter key.

cd scripts
./install.sh

Use the above commnads to change into the directory and run the script to add everything onto the system.