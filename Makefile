export

ARCH ?= arm64
TOP_DIR = $(PWD)
OUT_DIR ?= $(PWD)/output
BUILD_DIR ?= $(PWD)/build
MKDIR ?= mkdir

all :
	@$(MKDIR) -p $(OUT_DIR)
	@$(MKDIR) -p $(BUILD_DIR)
	+$(MAKE) -C bootscript
	+$(MAKE) -C usb-ulid-v1
	+$(MAKE) -C display-ulid-v1
	+$(MAKE) -C hifi-ulid-v1

clean :
	rm -rf $(OUT_DIR)
	rm -rf $(BUILD_DIR)
