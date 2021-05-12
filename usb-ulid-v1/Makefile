MKDIR ?= mkdir
DTC ?= dtc
CPP ?= gcc

TARGET = $(notdir $(CURDIR))

$(BUILD_DIR)/%.dtso.pp : %.dtso
	@$(CPP) -E -I$(TOP_DIR)/common -nostdinc -undef -D__DTS__ -x assembler-with-cpp -o $@ $<

$(OUT_DIR)/$(TARGET).dtbo : $(BUILD_DIR)/$(TARGET).dtso.pp
	@$(DTC) -@ -i $(TOP_DIR)/common -I dts -O dtb -o $@ $<
