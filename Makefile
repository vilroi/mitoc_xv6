CC = gcc
CFILES = xv6.sh
MODFILES = xv6.o

xv6: $(MODFILES)
	$(CC) $(MODFILES) -o $@

xv6.o: xv6.c
	$(CC) $@

clean: 
	rm xv6 *o

.PHONY: clean
