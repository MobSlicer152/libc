TARGETS=$(BINDIR)/libcrt0.a \
	$(BINDIR)/libc.so \
	$(BINDIR)/test

# Include base Makefile
include make/base.mk

# Include other Makefiles that define targets
include libc/Makefile
include test/Makefile

# Target to run the test
runtest: $(BINDIR)/test
	@LD_LIBRARY_PATH=$(BINDIR) $(BINDIR)/test $(TESTARGS)

