BASE="$(basename $1 .dts)"
CPP ?= gcc

# %.dtsopp : %.dtso
# 	@gcc -E -Wp,-MD,${BASE}.pre.tmp -I$(TOP_DIR)/common -nostdinc -undef -D__DTS__ -x assembler-with-cpp -o $@ $<

# @${CPP} -x assembler-with-cpp -I $(TOP_DIR)/common/ $< | \
# 	dtc -@ -i $(TOP_DIR)/common -I dts -O dtb -o $@ -

$(OUT_DIR)/usb-ulid-v1.dtbo : overlay.dtso
	@mkdir -p $(@D)
	@dtc -@ -i $(TOP_DIR)/common -I dts -O dtb -o $@ $<
