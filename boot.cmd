echo Booting from mmc ...
setenv fitaddr 0x50000000
setenv fitimage fitImage
fatload mmc ${mmcdev}:${mmcpart} ${fitaddr} ${fitimage}
run mmcargs
bootm ${fitaddr}
