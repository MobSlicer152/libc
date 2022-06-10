CPPFLAGS+=-D_LIBC_BUILD
INCLUDES+=-Ilibc

CRT0_linux_x64_OBJS=$(INTDIR)/libc/linux/x64/startup/crt0.S.o
CRT0_linux_OBJS=$(CRT0_linux_$(ARCH)_OBJS) \
		$(INTDIR)/libc/linux/startup/startup.c.o
CRT0_OBJS=$(CRT0_$(PLAT)_OBJS) \
	  $(INTDIR)/libc/startup/startup.c.o

LIBC_linux_x64_OBJS=$(INTDIR)/libc/linux/x64/unistd/syscall.S.o
LIBC_linux_OBJS=$(LIBC_linux_$(ARCH)_OBJS) \
		$(INTDIR)/libc/linux/unistd/write.c.o
LIBC_OBJS=$(LIBC_$(PLAT)_OBJS) \
	  $(INTDIR)/libc/startup/init.c.o \
	  $(INTDIR)/libc/stdlib/malloc.c.o \
	  $(INTDIR)/libc/string/strlen.c.o

$(BINDIR)/libcrt0.a: $(CRT0_OBJS) $(BINDIR)
	@echo Archiving $@ for $(ARCH) $(PLAT_NAME)...
	@$(AR) rcs $@ $(CRT0_OBJS)

$(BINDIR)/libc.so: $(LIBC_OBJS) $(BINDIR) $(RELDIR)
	@echo Linking $@ for $(ARCH) $(PLAT_NAME)...
	@$(CC) $(LDFLAGS) $(SHLIB_LDFLAGS) -o $@ $(LIBC_OBJS) -shared
	@$(STRIP) -d $@ -o $(RELDIR)/$(notdir $@)

