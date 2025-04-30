# Kimchi Boot Files

This repository contains files used for booting the Kimχ Micro SBC and supported addon boards.


## System Requirements

If you'd like to build the binaries for booting the board, you'll need a couple host tools. U-boot tools compile the boot scripts, and a device tree compiler for the device tree overlays.

Debian or Ubuntu:

```
sudo apt install u-boot-tools device-tree-compiler
```

MacOS:

```
brew install u-boot-tools dtc
```


## Building

Simply run:

```
make
```


## Deploying to Target for Testing

### Network (Ethernet or WiFi from Linux)

The boot files are (by default) located on a FAT partition on EMMC. If you have a network connection, you can do the following

```
ssh root@kimchi mount /dev/mmcblk0p1 /boot
scp -r output/* root@kimchi:/boot/
```

### USB

The files can be loaded with `uuu` and fastboot running on u-boot through the USB-C port. First you need to get u-boot into fastboot mode.

* Starting fastboot via UART

    If you have a serial connection, you can press Ctrl-C while u-boot is loading to interrupt the normal boot process and then run:

    ```
    fastboot usb 0
    ```

* Starting fastboot via USB

    You may use `uuu` to download and start u-boot from memory. This will automatically put u-boot in fastboot mode after starting. You'll need a copy of the u-boot image, which may be built from source or found in the Yocto deploy directory. Run the following:

    ```
    sudo uuu -b spl imx-boot
    ```

Now that the board is running fastboot (you'll see a blue LED lit), you can download the boot files to EMMC:

```
cd output
sudo uuu -v -b fat_write * mmc 0:1
```

To boot the board after downloading, the following can be run. Note that this command will timeout as control does not return to fastboot for a reply:

```
sudo uuu FB: ucmd boot
```
Important Note
============
GroupGets does not provide coding, firmware, or software support of any kind and will not respond to related requests. All software and firmware provided by GroupGets are offered solely as examples or potential starting points. These repositories may be outdated and are not guaranteed to function as intended.

We do not accept returns or offer replacements due to issues related to software, firmware, or code compatibility.

The software is provided "AS IS", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and non-infringement. In no event shall the authors or copyright holders be liable for any claim, damages, or other liability, whether in an action of contract, tort, or otherwise, arising from, out of, or in connection with the software or the use or other dealings in the software.
