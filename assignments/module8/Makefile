All: mainMilesToKilometersAndKph
LIB=libConversions.o
CC=gcc

mainMilesToKilometersAndKph: mainMilesToKilometersAndKph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
