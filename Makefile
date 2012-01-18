CC=c99
OPTS=-Wall
PYTHON=python

all: fftstream dftstream ftest iftest fftwstream sinwave.dat

sinwave.dat: gensinwave.py
	$(PYTHON) gensinwave.py 65536 > sinwave.dat

fftwstream: fftwstream.c
	$(CC) $(OPTS) fftwstream.c -lm -lfftw3 -o fftwstream

fftstream: fftstream.c fourier.o
	$(CC) $(OPTS) fourier.o fftstream.c -lm -o fftstream

dftstream: dftstream.c fourier.o
	$(CC) $(OPTS) fourier.o dftstream.c -lm -o dftstream

ftest: ftest.c fourier.o
	$(CC) $(OPTS) fourier.o ftest.c -lm -o ftest

iftest: iftest.c fourier.o
	$(CC) $(OPTS) fourier.o iftest.c -lm -o iftest

fourier.o: fourier.h fourier.c
	$(CC) $(OPTS) -c fourier.c 

clean: 
	rm -f ftest *.o
