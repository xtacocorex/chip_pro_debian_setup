#!/bin/bash
echo "SCRIPT WILL PROMPT FOR PASSWORD"

echo "DOWNLOADING THE SET ANTENNA SCRIPT"
curl -O https://raw.githubusercontent.com/NextThingCo/CHIP-buildroot/d4e5ddd02b5b5cb3ae37026b0743dcba1c724fc3/package/rtl8723ds_mp_driver/set_antenna
chmod +x set_antenna
sudo mv set_antenna /usr/sbin
sudo set_antenna ufl

# AUTO SETUP set_antenna ON BOOT
echo "MODIFYING /etc/rc.local TO SET ANTENNA ON BOOT"
sed -i -e '$i \set_antenna ufl\n' /etc/rc.local

# UPDATING OS
echo "UPDATING OS"
sudo apt-get update
sudo apt-get upgrade

# DONE
echo "DONE"

