CURRENT = $(KVER)
KDIR = /lib/modules/$(CURRENT)/build
PWD = $(shell pwd)

obj-m := btusb.o

default:
	make -C $(KDIR) M=$(PWD) modules

clean:
	make -C $(KDIR) M=$(PWD) clean

install: default
	make -C $(KDIR) M=$(PWD) INSTALL_MOD_DIR=updates modules_install
	depmod -ae

uninstall:
	rm -rf $(KDIR)/../updates
	depmod -ae

