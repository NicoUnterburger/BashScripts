#!/bin/bash
clear
echo "Start Read-Out Serialnumbers from Disk Slots"
x=1
while [ $x -le 8 ]
do
  y=$(( $x - 1 ))
  echo "Check Disk-Slot $x"
  smartctl -i /dev/disk/by-path/pci-0000\:07\:00.0-sas-phy$y-lun-0 | grep Vendor
  smartctl -i /dev/disk/by-path/pci-0000\:07\:00.0-sas-phy$y-lun-0 | grep Product
  smartctl -i /dev/disk/by-path/pci-0000\:07\:00.0-sas-phy$y-lun-0 | grep Serial
  x=$(( $x + 1 ))
  echo ""
done
echo "DONE!"
