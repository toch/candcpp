foo.o:
	g++ -c -o foo.o foo.cpp

bindcpp.o:
	gcc -c -o bindcpp.o bindcpp.c

libfoo.a: foo.o bindcpp.o
	ar -cqv libfoo.a foo.o bindcpp.o

main.o:
	gcc -c -o main.o main.c

main: libfoo.a main.o
	gcc -o main -L. main.o -lfoo -lstdc++

all: main


clean:
	@rm *.o *.a
