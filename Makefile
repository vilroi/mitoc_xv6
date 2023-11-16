CC = gcc
CFLAGS = -g
CFILES = xv6sh.c
MODFILES = xv6sh.o

xv6sh: $(MODFILES)
	$(CC) $(MODFILES) -o $@

xv6sh.o: xv6sh.c
	$(CC) -c $<

test: xv6sh
	./xv6sh < test
clean: 
	rm xv6sh *o *out

.PHONY: clean test
