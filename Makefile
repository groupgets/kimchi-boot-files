export

ARCH ?= arm64
TOP_DIR = $(PWD)
OUT_DIR ?= $(PWD)/output

all :
	+$(MAKE) -C bootscript
	+$(MAKE) -C usb-ulid-v1

clean :
	rm -rf $(OUT_DIR)
