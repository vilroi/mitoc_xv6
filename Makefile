CC = gcc
CFILES = xv6sh.c
MODFILES = xv6sh.o

xv6sh: $(MODFILES)
	$(CC) $(MODFILES) -o $@

xv6sh.o: xv6sh.c
	$(CC) -c $<

clean: 
	rm xv6sh *o *out

.PHONY: clean
