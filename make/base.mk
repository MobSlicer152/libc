# Base Makefile logic

# Export variables
export

# Root directory of project
ROOT=$(shell pwd)
# Tools directory
TOOLS=$(ROOT)/tools

# Make tools executable
_=$(shell chmod +x $(TOOLS)/fixperms.sh && $(TOOLS)/fixperms.sh)

# CPU architecture
ARCH?=$(shell $(TOOLS)/arch.sh)

# Platform
PLAT_NAME?=$(shell uname)
PLAT=$(shell echo $(PLAT_NAME) | tr '[:upper:]' '[:lower:]')

# Output directories
# Intermediate directory
INTDIR_NAME=bin-int
INTDIR=$(ROOT)/$(INTDIR_NAME)/$(PLAT)-$(ARCH)
# Binary directory
BINDIR_NAME=bin
BINDIR=$(ROOT)/$(BINDIR_NAME)/$(PLAT)-$(ARCH)
# Stripped binary directory
RELDIR_NAME=stripped
RELDIR=$(BINDIR)/$(RELDIR_NAME)

# Static library tool
AR=llvm-ar
# Assembler flags
ASFLAGS:=-fPIC $(EXTRA_ASFLAGS)
# C compiler
CC=clang
# C preprocessor
CPP=clang -E
# C compiler flags
CFLAGS=-g -O2 -Wall -Wextra -Wpedantic -Werror -ffreestanding -fPIC $(EXTRA_CFLAGS)
# C preprocessor flags
CPPFLAGS=$(EXTRA_CPPFLAGS)
# Include directories
INCLUDES=$(EXTRA_INCLUDES)
# Linker flags
EXTRA_LDFLAGS?=
LINKER?=lld
LDFLAGS=-fuse-ld=$(LINKER) -nostdlib -L$(BINDIR) $(EXTRA_LDFLAGS)
EXE_LDFLAGS=$(EXTRA_EXE_LDFLAGS)
SHLIB_LDFLAGS=-shared -fvisibility=hidden $(EXTRA_SHLIB_LDFLAGS)
# Symbol removal tool
STRIP=llvm-strip

# All targets
all: $(BINDIR) $(TARGETS)
	@echo Done

# Pattern rule for object files from C sources
$(INTDIR)/%.c.o: %.c
	@echo Compiling object $(notdir $@) for $(ARCH) $(PLAT_NAME) from C source $<...
	@mkdir -p $(dir $@)
	@$(CC) $(CFLAGS) $(CPPFLAGS) $(INCLUDES) -c -o $@ $<

# Pattern rule for object files from assembler sources
$(INTDIR)/%.S.o: %.S
	@echo Assembling object $(notdir $@) for $(ARCH) $(PLAT_NAME) from assembler source $<...
	@mkdir -p $(dir $@)
	@$(CC) $(ASFLAGS) $(CPPFLAGS) $(INCLUDES) -c -o $@ $<

# Clean up everything
clean: tidy
	@echo Removing binaries files
	@rm -rvf $(ROOT)/$(BINDIR_NAME)

# Remove object files
tidy:
	@echo Removing intermediate files
	@rm -rvf $(INTDIR_NAME)

# Clean up everything for $(ARCH)
clean-arch: tidy-arch
	@echo Removing all files built for $(ARCH)
	@rm -rvf $(BINDIR)

# Remove object files for $(ARCH)
tidy-arch:
	@echo Removing intermediate files for $(ARCH)
	@rm -rvf $(INTDIR)


# Create the intermediate directory
$(INTDIR):
	@echo Creating intermediate directory $(shell pwd)/$(INTDIR)
	@mkdir -p $(INTDIR)

# Create the output directory
$(BINDIR):
	@echo Creating binary directory $(BINDIR)
	@mkdir -p $(BINDIR)

$(RELDIR):
	@echo Creating stripped binary directory $(RELDIR)
	@mkdir -p $(RELDIR)

