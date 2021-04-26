echo Booting from mmc ...

env set fitaddr 0x50000000
env set fitimage fitImage
fatload mmc ${mmcdev}:${mmcpart} ${fitaddr} ${fitimage}
run mmcargs

# bootm ${fitaddr}

echo Start
bootm start ${fitaddr}

echo Loados
bootm loados

echo Ramdisk
bootm ramdisk

echo Fdt
bootm fdt

echo Patching FDT
env set fdt_file usb-ulid-v1.dtbo
run loadfdt
fdt resize 0x4000
fdt apply ${fdt_addr}

echo Prep
bootm prep

echo Go
bootm go
