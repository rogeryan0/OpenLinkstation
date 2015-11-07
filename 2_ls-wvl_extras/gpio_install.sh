#!/bin/bash

# Purpose:
#       To install gpio interface at startup (unfortunately it's the only hack I've found)
#       accidentally resulted in fixing the blinking power light after boot.
# Usage:
#       Place this script in ~/ or /root/ (initial directory after logging in via ssh)
# Dependency:
#   Need to have ssh root access
#       Need to install rogers0 OpenLinkstation first
# Credit:
#       http://lists.infradead.org/pipermail/linux-arm-kernel/2015-June/352973.html
#
# Author: David Slama (dslam127@gmail.com)
# Date: 6, 2015-June
#
# Note: only tested on ls-wvl (linkstation pro duo)

echo "copying the hack into /etc/init.d/"
echo '#!/bin/sh
# kFreeBSD do not accept scripts as interpreters, using #!/bin/sh and sourcing.
if [ true != "$INIT_D_SCRIPT_SOURCED" ] ; then
    set "$0" "$@"; INIT_D_SCRIPT_SOURCED=true . /lib/init/init-d-script
fi
### BEGIN INIT INFO
# Provides:          gpio interface
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Example initscript
# Description:       This file should be used to construct scripts to be
#                    placed in /etc/init.d.  This example start a
#                    single forking daemon capable of writing a pid
#                    file.  To get other behavoirs, implemend
#                    do_start(), do_stop() or other functions to
#                    override the defaults in /lib/init/init-d-script.
### END INIT INFO
#
# Author: David Slama <dslam127@gmail.com>

# fan low
echo 16 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio16/direction
# fan high
echo 17 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio17/direction
# hdd0 internal red led
echo 34 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio34/direction
# hdd1 internet red led
echo 35 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio35/direction
# alarm led (red info led)
echo 36 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio36/direction
# red function led
echo 37 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio37/direction
# info led (orange info led)
echo 38 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio38/direction
# blue function led
echo 39 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio39/direction
# power led
echo 40 >/sys/class/gpio/export
echo out > /sys/class/gpio/gpio40/direction
# function button
echo 45 >/sys/class/gpio/export
echo in > /sys/class/gpio/gpio45/direction
# power button (switch)
echo 46 >/sys/class/gpio/export
echo in > /sys/class/gpio/gpio46/direction
# auto power button (switch)
echo 47 >/sys/class/gpio/export
echo in > /sys/class/gpio/gpio47/direction' > /etc/init.d/gpio_interface
chmod +x /etc/init.d/gpio_interface
update-rc.d gpio_interface defaults
echo "install complete, please wait while the unit reboots..."
sleep 5
reboot
