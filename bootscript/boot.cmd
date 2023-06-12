echo Booting from mmc ...

env set fitaddr 0x50000000
env set fitimage fitImage
env set fdt_high
fatload mmc ${mmcdev}:${mmcpart} ${fitaddr} ${fitimage}
run mmcargs

# bootm ${fitaddr}

bootm start ${fitaddr}

bootm loados
bootm ramdisk
bootm prep

echo Patching FDT...

fdt resize 0x4000
env set fdt_file usb-ulid-v1.dtbo
run loadfdt
fdt apply ${fdt_addr}

bootm go
