#!/bin/bash

echo ""
echo "This script copies OMO R1 udev rules to /etc/udev/rules.d/"
echo ""

echo "Motor Driver (USB Serial from RS232) : /dev/ttyTHS1 to /dev/ttyMCU :"
if [ -f "/etc/udev/rules.d/98-omo-r1-mini-mcu" ]; then
    echo "98-omo-r1-mini-mcu file already exist."
else 
    echo 'KERNEL=="ttyUSB1",  ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE:="0666", GROUP:="dialout",   SYMLINK+="ttyMCU"' > /etc/udev/rules.d/98-omo-r1-mini-mcu.rules   
    echo '98-omo-r1-mini-mcu created'
fi

echo ""
echo "YD LiDAR (USB Serial) : /dev/ttyUSBx to /dev/ttyLiDAR :"
if [ -f "/etc/udev/rules.d/97-omo-r1-mini-lidar.rules" ]; then
    echo "97-omo-r1-mini-lidar.rules file already exist."
else 
    echo 'KERNEL=="ttyUSB0",  ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE:="0666", GROUP:="dialout",  SYMLINK+="ttyLiDAR"' >/etc/udev/rules.d/97-omo-r1-mini-lidar.rules
    
    echo '97-omo-r1-mini-lidar.rules created'
fi

#systemctl stop nvgetty
#systemctl disable nvgetty

echo ""
echo "Reload rules"
echo ""
sudo udevadm control --reload-rules
sudo udevadm trigger

#mcu - usb1
#BUS="usb", ID=="1-2.4:1.0", SYMLINK+="ttyMCU"
#lidar - usb0
#BUS="usb", ID=="1-2.3:1.0", SYMLINK+="ttyLiDAR"

#echo 'KERNEL=="ttyUSB*", MODE:="0666", GROUP:="dialout", SYMLINK+="ttyMCU"'