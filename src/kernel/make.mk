KERNEL_BINARY := $(BUILDDIR)/kernel/kernel.bin

KERNEL_CFLAGS := $(CFLAGS)
KERNEL_LDFLAGS := $(LDFLAGS) -T kernel/arch/$(ARCH)/linker.ld -nostdlib

# TODO generate from source files.
KERNEL_OBJFILES := 	$(BUILDDIR)/kernel/kernel.o \
    			$(BUILDDIR)/kernel/boot.o	

# Build object files.
$(BUILDDIR)/kernel/%.o: kernel/%.c
	@mkdir -p $(@D)
	$(CC) $(KERNEL_CFLAGS) -c -o $@ $<

$(BUILDDIR)/kernel/%.o: kernel/arch/$(ARCH)/%.s
	$(CC) $(KERNEL_CFLAGS) -c -o $@ $<

# Build the kernel binary.
$(KERNEL_BINARY): $(KERNEL_OBJFILES) kernel/arch/$(ARCH)/linker.ld
	$(LD) -o $@ $(KERNEL_LDFLAGS) $(KERNEL_OBJFILES)

all: $(KERNEL_BINARY)
