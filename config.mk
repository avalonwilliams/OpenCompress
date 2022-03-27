# config.mk
CC = cc

PREFIX    = /usr/local
MANPREFIX = $(DESTDIR)$(PREFIX)/share/man

CPPFLAGS  = -D_DEFAULT_SOURCE -D_BSD_SOURCE
CFLAGS    = -std=c99 -pedantic -Wall -O1
LDFLAGS   = -lz -lbsd

# if y, make install will install gzip and zcat, as additional components
#
# default is to just install compress and uncompress, as most GNU/Linux distributions
# use GNU's gzip, though this program will work as a drop-in replacement
ADDITIONAL = n
