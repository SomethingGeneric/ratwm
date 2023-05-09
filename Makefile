# ratwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c ratwm.c util.c
OBJ = ${SRC:.c=.o}

all: options ratwm

options:
	@echo ratwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

ratwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f ratwm ${OBJ} ratwm-${VERSION}.tar.gz

dist: clean
	mkdir -p ratwm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		ratwm.1 drw.h util.h ${SRC} ratwm.png transient.c ratwm-${VERSION}
	tar -cf ratwm-${VERSION}.tar ratwm-${VERSION}
	gzip ratwm-${VERSION}.tar
	rm -rf ratwm-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp -f ratwm ${DESTDIR}${PREFIX}/bin
	chmod 755 ${DESTDIR}${PREFIX}/bin/ratwm
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < ratwm.1 > ${DESTDIR}${MANPREFIX}/man1/ratwm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/ratwm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/ratwm\
		${DESTDIR}${MANPREFIX}/man1/ratwm.1

.PHONY: all options clean dist install uninstall
