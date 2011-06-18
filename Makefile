# make the watch command line program
#

VERSION      := 0
SUBVERSION   := 3
MINORVERSION := 0

OWNER=root
GROUP=wheel
CTAGS= ctags -x >tags
LDFLAGS= -lncurses
CFLAGS= -O2 -s
CC=gcc
GET=co
SRCS=watch.c
OBJS=watch.c
SHAR=shar
INSTALL=/usr/bin/install
MANDIR=/usr/share/man/man1/watch.1
BINDIR=/usr/local/bin/watch
DEPEND= makedepend $(CFLAGS)
all:    watch

# To make an executable

watch:	$(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS)

# To install things in the right place
install: watch watch.1
	$(INSTALL) -c -o $(OWNER) -g $(GROUP) -m 755 watch $(BINDIR)
	$(INSTALL) -c -o $(OWNER) -g $(GROUP) -m 644 watch.1 $(MANDIR)

# where are functions/procedures?
tags: $(SRCS)
	$(CTAGS) $(SRCS)

# what are the source dependencies
depend: $(SRCS)
	$(DEPEND) $(SRCS)

# clean out the dross
clean:
	-rm -f watch tags
