All: mainMilesToKilometersAndKph mainCToFAndInchesToFt
LIB=libConversions.o
CC=gcc

mainMilesToKilometersAndKph: mainMilesToKilometersAndKph.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

mainCToFAndInchesToFt: mainCToFAndInchesToFt.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@
	
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
