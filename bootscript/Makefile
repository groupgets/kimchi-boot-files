ARCH ?= arm64

$(OUT_DIR)/boot.scr : boot.cmd
	@mkdir -p $(@D)
	@mkimage -T script -A $(ARCH) -C none -d $< $@
