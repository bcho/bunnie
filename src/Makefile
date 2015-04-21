# 
# This makefile adapted from JOS's GNUmakefile.
#

ARCH := i386
BUILDDIR := build

# Customize settings.
-include config/env.mk

ifndef GCCPREFIX
GCCPREFIX := i686-elf-
endif

ifndef QEMU
QEMU := qemu-system-i386
endif

ifndef GDB
GDB := gdb
endif

TOP = .

# Compilers & tools.
GDBPORT := $(shell expr `id -u` % 5000 + 25000)
CC	:= $(GCCPREFIX)gcc -pipe
AS	:= $(GCCPREFIX)as
AR	:= $(GCCPREFIX)ar
LD	:= $(GCCPREFIX)ld
OBJCOPY	:= $(GCCPREFIX)objcopy
OBJDUMP	:= $(GCCPREFIX)objdump
NM	:= $(GCCPREFIX)nm


# Compiler flags.
CFLAGS := $(CFLAGS) -O1 -ffreestanding -std=gnu99
CFLAGS += -Wall -Wno-format -Wno-unused -Werror -gstabs -m32

# Linker flags.
LDFLAGS := -m elf_i386


# Reset make behaviours.
.SUFFIXES:
.DELETE_ON_ERROR:


# Basic target.
all:


# Component build rules.
include kernel/make.mk
include libc/make.mk
include config/gdb.mk
include config/qemu.mk

clean:
	rm -rf $(BUILDDIR)


.PHONY: all clean
