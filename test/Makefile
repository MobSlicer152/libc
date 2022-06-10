TEST_OBJS=$(INTDIR)/test/main.c.o

$(BINDIR)/test: $(TEST_OBJS) $(BINDIR)/libcrt0.a $(BINDIR)/libc.so $(BINDIR)
	@echo Linking $@ for $(ARCH) $(PLAT_NAME)...
	@$(CC) $(LDFLAGS) $(EXE_LDFLAGS) -o $@ $(TEST_OBJS) -lcrt0 -lc
	@$(STRIP) -d $@ -o $(RELDIR)/$(notdir $@)

