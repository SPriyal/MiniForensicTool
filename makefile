CC:=gcc
CFLAGS:= -w -g -pthread -lcrypto -lm

all:	clean huffman 

huffman:
	$(CC) huffman.c $(CFLAGS) -o huffman

clean:
	rm huffman
