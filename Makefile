foo.o: 
	g++ -c -o foo.o foo.cpp

bindcpp.o: 
	gcc -c -o bindcpp.o bindcpp.c

libfoo.a: foo.o
	ar -cqv libfoo.a foo.o

main.o:
	gcc -c -o main.o main.c

main: libfoo.a bindcpp.o main.o
	g++ -o main bindcpp.o libfoo.a main.o

all: main
	

clean:
	@rm *.o *.a
