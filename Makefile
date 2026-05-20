CC      ?= cc
CFLAGS  ?= -O2 -Wall -Wextra -std=c11 -static
LDFLAGS ?= -static -s

actionp: actionp.c
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<
	strip --strip-all $@ 2>/dev/null || true

install: actionp
	install -m 0755 actionp $(DESTDIR)/usr/local/bin/actionp

clean:
	rm -f actionp

.PHONY: install clean
