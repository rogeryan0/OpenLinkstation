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

echo "getting dependencies"
apt-get install -y sysstat

echo "copying files"
cp init.d/gpio_interface /etc/init.d/
cp init.d/hddled_activity /etc/init.d/
cp init.d/hddtemp_monitor /etc/init.d/
cp init.d/shutdown_monitor /etc/init.d/
cp sbin/button_function /usr/local/sbin/
cp sbin/button_power /usr/local/sbin/
cp sbin/button_power_auto /usr/local/sbin/
cp sbin/fan_speed /usr/local/sbin/
cp sbin/hddtemp_daemon /usr/local/sbin/
cp sbin/led_alarm /usr/local/sbin/
cp sbin/led_function_blue /usr/local/sbin/
cp sbin/led_function_red /usr/local/sbin/
cp sbin/led_hdd0 /usr/local/sbin/
cp sbin/led_hdd1 /usr/local/sbin/
cp sbin/led_info /usr/local/sbin/
cp sbin/led_power /usr/local/sbin/
cp sbin/shutdown_daemon /usr/local/sbin/


echo "making the files executable"
chmod +x /etc/init.d/gpio_interface
chmod +x /etc/init.d/hddled_activity
chmod +x /etc/init.d/hddtemp_monitor
chmod +x /etc/init.d/shutdown_monitor
chmod +x /usr/local/sbin/button_function
chmod +x /usr/local/sbin/button_power
chmod +x /usr/local/sbin/button_power_auto
chmod +x /usr/local/sbin/fan_speed
chmod +x /usr/local/sbin/hddtemp_daemon
chmod +x /usr/local/sbin/led_alarm
chmod +x /usr/local/sbin/led_function_blue
chmod +x /usr/local/sbin/led_function_red
chmod +x /usr/local/sbin/led_hdd0
chmod +x /usr/local/sbin/led_hdd1
chmod +x /usr/local/sbin/led_info
chmod +x /usr/local/sbin/led_power
chmod +x /usr/local/sbin/shutdown_daemon

echo "updating boot preferences"
update-rc.d gpio_interface defaults
update-rc.d hddled_activity defaults
update-rc.d hddtemp_monitor defaults
update-rc.d shutdown_monitor defaults

sleep 5
reboot
