QEMUOPTS = -kernel $(KERNEL_BINARY) \
	   -serial mon:stdio \
	   -gdb tcp::$(GDBPORT)

pre-qemu: .gdbinit

qemu: $(KERNEL_BINARY) pre-qemu
	$(QEMU) $(QEMUOPTS)

qemu-gdb: $(KERNEL_BINARY) pre-qemu
	$(QEMU) $(QEMUOPTS) -S
