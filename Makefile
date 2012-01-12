CC=c99
OPTS=-Wall
LDFLAGS=-lm

all: fftstream dftstream ftest

fftstream: fftstream.c fourier.o
	$(CC) $(OPTS) fourier.o fftstream.c $(LDFLAGS) -o fftstream

dftstream: dftstream.c fourier.o
	$(CC) $(OPTS) fourier.o dftstream.c $(LDFLAGS) -o dftstream

ftest: ftest.c fourier.o
	$(CC) $(OPTS) fourier.o ftest.c $(LDFLAGS) -o ftest

fourier.o: fourier.h fourier.c
	$(CC) $(OPTS) -c fourier.c 

clean: 
	rm -f ftest *.o
