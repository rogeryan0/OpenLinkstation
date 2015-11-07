This is a work in progress. I am currently attending college and working a full-time job so please don't expect immediate results.
I can only test these steps on the LS-WVL (Buffalo Linkstation Pro Duo). If anybody wants to try it on another device be my guest.
Know that if anything happens it is not my responsibility. Proceed at your own risk. Feedback is appreciated.

The only thing that needs to be done is "chmod +x" the install.sh and then run it.
This will install
- a gpio interface
an interface for the rest of these things to work
- hdd temperature monitoring
adjusts fan speed automatically
- hdd activity monitoring
info led light will blink when hdd is working
- shutdown monitoring 
the switch in the back will shutdown the device again
- more scripts for gpio controls in /usr/local/sbin/

Note: cat the files for the credits and sources