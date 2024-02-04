# debian-qemu-autoimager

# Using the script
- Run imager: `./build_qemu_debian_image.sh`
- Find password in build.*/logfile for root
- Start the machine ``` qemu-system-x86_64 -hda debian.qcow -m 512 -nographic ```
- Start with Bridge network ```sudo qemu-system-x86_64  -nic vmnet-bridged,ifname=en0 -hda debian.qcow -m 512 -nographic ```
- Start with Bridge network and USB storage device```sudo qemu-system-x86_64  -nic vmnet-bridged,ifname=en0 -hda debian.qcow -m 512 -nographic -device nec-usb-xhci -device usb-host,vendorid=0x0781,productid=0x556```
- Start with bridge network and digirig support : ```sudo qemu-system-x86_64  -nic vmnet-bridged,ifname=en0 -hda debian.qcow -m 512 -nographic -device nec-usb-xhci -device usb-host,vendorid=0x0781,productid=0x556  -device usb-host,vendorid=0x10c4,productid=0xea60 -device usb-host,vendorid=0x0d8c,productid=0x013c```



## USB port forwarding:
- find vendor and product using ```system_profiler SPUSBDataType```
- Data for DigiRig: 
CP2102N USB to UART Bridge Controller:

              Product ID: 0xea60
              Vendor ID: 0x10c4  (Silicon Laboratories, Inc.)

 USB PnP Sound Device:

              Product ID: 0x013c
              Vendor ID: 0x0d8c  (C-MEDIA ELECTRONICS INC.)


sudo qemu-system-x86_64  -nic vmnet-bridged,ifname=en0 -hda debian.qcow -m 512 -nographic -device nec-usb-xhci -device usb-host,vendorid=0x0781,productid=0x556  -device usb-host,vendorid=0x10c4,productid=0xea60 -device usb-host,vendorid=0x0d8c,productid=0x013c

# Docs
- Port webserver for installation: 4321

# Preparation
- `brew install qemu libusb`

# References
- Original script sources: [Blog](https://sigmaris.info/blog/2019/04/automating-debian-install-qemu/) [Gist](https://gist.github.com/sigmaris/dc1883f782d1ff5d74252bebf852ec50)
