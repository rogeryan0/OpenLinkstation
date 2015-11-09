Instructions for installing debian with Debian Jessie and linux kernel 3.16 on the Buffalo Linkstation LS-WVL

1. Get SSH Access

- method one
    run the java/shell script from a linux distribution
    the script is located in 0_get-ssh folder and it's called get-ssh.sh
    [ 0_get-ssh/get-ssh.sh ]
    
    cons:
        requires java
     
- method two
    install Shonks mod 1.69 from the buffalo website: 
    http://forum.buffalo.nas-central.org/viewtopic.php?t=23603
    telnet in using putty or linux terminal
        username: admin 
        password: password
    [ su ]
    [ passwd ] (change the root password)
    [ vi /etc/melco/info ]
    scroll down to where ssh is and change it to "on" (hint: i for insert then ESC, x for del)
    save the changes with :wq
    double check to make sure it's turned on
    [ cat /etc/melco/info | grep ssh ]
    [ reboot ]
    
    cons: 
        too many steps and 
        installing the mod is kind of dumb since we're basically going to obliterate it anyway.

2. Install a temporary working environment

    login via ssh ( should put you in the default root home directory ~/ or /root/ )
    copy the files for rogers0 OpenLinkstation to your device:
        -- one way is to copy them over the network using your linux or windows computer
        -- another way is to put them on a usb flash disk and [ cd /mnt/usbdisk1 ]
    cd to the directory where rogers0 OpenLinkstation files are.
    [ vi lib/config ]
    change the root password, hostname, or debian distro (optional)
    [ 1_debootstrap/build_rootfs_with_buffalo-kernel.sh ] 
    (this will install a temporary working system for you to boot into)
    reboot if it does not do it automatically
    [ reboot ]

3. Install debian

    wait for reboot then login via ssh as root with "password" if not previously changed 
    cd to the directory where rogers0 OpenLinkstation files are.
    mount the root directory:
        -- [ mount /dev/md1 /mnt ] (for dual drive [/dev/md0 is boot]) 
        -- [ mount /dev/sda2 /mnt ] (for single drive [/dev/sda1 is boot])
    [ 1_debootstrap/build_rootfs_with_buffalo-kernel.sh debian ] (don't forget the debian at the end)
    (this will install debian to the inital install directory)
    reboot if it does not do it automatically
    [ reboot ]

4. Install Essentials
    
    [ cp /etc/apt/sources.list /etc/apt/sources.list.bak ]
    [ echo 'deb http://download.webmin.com/download/repository sarge contrib' >> /etc/apt/sources.list ]
    [ echo 'deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib' >> /etc/apt/source.list ]
    [ cd ~/ ]
    [ wget http://www.webmin.com/jcameron-key.asc ]
    [ apt-key add jcameron-key.asc ]
    [ rm jcameron-key.asc ]
    [ apt-get update ]
    [ apt-get install -y busybox webmin ]
    [ reboot ]
    (you will be able to use webmin to install anything else you need.)
    (after reboot, login to webmin with your browser @ https://{hostname}:10000/ 
     and use the username root and password "password" unless changed previously)
    
5. Fix flashing power light and loud fan

    cd into rogers0 OpenLinkstation folder
    cd into the 2_ls-wvl_extras folder
    [ chmod +x install.sh ]
    [ ./install.sh ]

6. Clean up and Update

    [ cd /mnt ]
    [ rm -rf * ] (do not do this in the root directory)
    [ apt-get update ]

7. Enjoy
    Any questions or comments please post them!