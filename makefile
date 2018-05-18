CC:=gcc
CFLAGS:= -w -g -pthread -lcrypto -lm

one:	huffman rabin	

all:	clean huffman rabin

huffman:
	$(CC) huffman.c $(CFLAGS) -o huffman
	
rabin:
	$(CC) rabin.c vandermonde.c $(CFLAGS) -o rabin

clean:
	rm huffman rabin
