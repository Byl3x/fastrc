FastRC
Fast init script designed for BusyBox and Arch Linux.
Based on minirc, but I have added some failsafes and added some extra features
----------------------------------------------------------------------------
Installation
clone the repo
install all files to the correct locations (if you don't know where they should go, don't use this)
MAKE SURE YOU KNOW WHAT THE FILES DO BEFORE USING THEM
replace the init in your kernel parameters
add daemons to /etc/fastrc.cfg and enable them
reboot
----------------------------------------------------------------------------
Do NOT remove systemd, systemd-udevd is still required.
Alternatively, rmeove systemd and install another device daemon(eudev, mdev, smdev), however I couldn't get mdev to work properly.
----------------------------------------------------------------------------
Usage:
rc = the script that controls everything
rc list = list daemons and their status
rc start [daemons] start daemons
rc stop [daemons] stop daemons
rc restart [daemons] restart daemons
rc init runs the on_boot() function DO NOT RUN WHILE COMPUTER IS BOOTED
----------------------------------------------------------------------------
If your system doesn't shut down cleanly (power failure, kernel panic etc.) you will be dropped into an emergency shell at boot, because the runstate will be set to 1, if this happens, just run "echo 0 > /etc/runstate" and reboot.
If you run rc init while the runstate is 1, you will get a warning and you will be dropped into /bin/sh, where you can fix the runstate.
If you run rc init while the computer is running, just run exit to go back to your normal shell.
----------------------------------------------------------------------------
wlancfg
wlancfg is a simple way to remember wireless networks
Usage:
wlancfg [interface] [SSID] [Password]
or if you already used the network you are trying to connect to just use:
wlancfg [interface] [SSID]
