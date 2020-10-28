#!/bin/sh
if [ "$1" != --force ]; then
	    echo "Please read the setup script and confirm that it doesn't break your system."
	        exit 1

echo "Installing /sbin/rc, /etc/fastrc.cfg, /etc/inittab"
install -Dm755 rc "$ROOT"/sbin/rc
if [ -f "$ROOT"/etc/fastrc.cfg ]; then
	    echo ":: Warning: '/etc/minirc.conf' already exists!"
	        echo "   Moving it to '/etc/minirc.conf.backup'."
		    mv /etc/fastrc.cfg /etc/fastrc.cfg
fi
install -Dm644 fastrc.cfg /etc/fastrc.cfg
install -Dm644 inittab /etc/inittab

echo "Linking busybox to /sbin/{init,halt,poweroff,reboot}"
for i in init halt poweroff reboot; do
	    ln -sf $(which busybox) /sbin/$i
    done

    echo "Append 'init=/sbin/init' to kernel parameters to use fastrc"

    # Run "./setup.sh --force" to use the script
