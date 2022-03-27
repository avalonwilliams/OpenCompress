include config.mk

BIN = compress
SRC = main.c zopen.c gzopen.c nullopen.c string.c
OBJ = $(SRC:.c=.o)
BINDIR = $(DESTDIR)$(PREFIX)/bin

.PHONY: all clean install

all: $(BIN)

$(BIN): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -c -o $@ $<

clean:
	rm -f $(OBJ) $(BIN)

install:
	install -d $(BINDIR)
	install -m 755 $(BIN) $(BINDIR)
	ln -sf $(BINDIR)/$(BIN) $(BINDIR)/uncompress
	install -d $(MANPREFIX)/man1
	install -m 644 compress.1 $(MANPREFIX)/man1
	if [ "$(ADDITIONAL)" = y ]; then \
		install -m 755 zdiff zforce zmore znew gzexe $(BINDIR); \
		ln -sf $(BINDIR)/$(BIN) $(BINDIR)/zcat; \
		ln -sf $(BINDIR)/$(BIN) $(BINDIR)/gzip; \
		ln -sf $(BINDIR)/$(BIN) $(BINDIR)/gunzip; \
		ln -sf $(BINDIR)/$(BIN) $(BINDIR)/gzcat; \
		ln -sf $(BINDIR)/zdiff $(BINDIR)/zcmp; \
		ln -sf $(BINDIR)/zmore $(BINDIR)/zless; \
		install -m 644 gzexe.1 gzip.1 zdiff.1 \
			zforce.1 zmore.1 znew.1 $(MANPREFIX)/man1; \
		gzip -f $(MANPREFIX)/man1/gzexe.1 $(MANPREFIX)/man1/gzip.1 \
			$(MANPREFIX)/man1/zdiff.1 $(MANPREFIX)/man1/zforce.1 \
			$(MANPREFIX)/man1/zmore.1 $(MANPREFIX)/man1/znew.1; \
	fi
	gzip -f $(MANPREFIX)/man1/compress.1
	install -d $(DESTDIR)$(PREFIX)/doc/opencompress
	install -m 644 LICENSE $(DESTDIR)$(PREFIX)/doc/opencompress
