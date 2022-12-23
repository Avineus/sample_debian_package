# Sample Makefile
#
SRCDIR     = src
BLDDIR     = build
BIN	   = sample.exe
LIB	   = sample.so

INCDEP = -I$(SRCDIR)
CFLAGS = -ggdb -Wall -Werror -fPIC

OBJSRCS = $(wildcard $(SRCDIR)/*.c)
BINOBJS = $(patsubst $(SRCDIR)/%.c,$(BLDDIR)/%.o,$(OBJSRCS))

$(BLDDIR)/%.o: $(SRCDIR)/%.c
	mkdir -p $(BLDDIR)
	$(CC) $(CFLAGS) $(INCDEP) -c -o $@ $<

ALL_BINS = $(foreach bins,$(BIN) $(LIB),build/$(bins))
all: $(ALL_BINS)

define exe_rule
$1: $2 $(BINOBJS)
	mkdir -p $(dir $1)
	$(CC)  -o $$@ $$?
endef

$(foreach exefile,build/$(BIN),$(eval $(call exe_rule,$(exefile))))

define lib_rule
$1: $2 $(BINOBJS)
	mkdir -p $(dir $1)
	$(CC)  -shared -nostartfiles -nodefaultlibs -fPIC -o $$@ $$?
endef

$(foreach libfile,build/$(LIB),$(eval $(call lib_rule,$(libfile))))


clean:
	rm -fr $(BLDDIR)/*
