All: mainMilesToKilometersAndKph
LIB=libConversions.o
CC=gcc

main1: main1.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
