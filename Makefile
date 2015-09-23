libdocopt_s.a:
	test -d docopt.cpp || git clone git@github.com:docopt/docopt.cpp.git
	test -d docopt.cpp && git pull
	cd docopt.cpp && cmake -G "Unix Makefiles" && make
	cp docopt.cpp/libdocopt_s.a .

foo.o:
	g++ -Idocopt.cpp --std=c++11 -c -o foo.o foo.cpp

bindcpp.o:
	gcc -c -o bindcpp.o bindcpp.c

libfoo.a: foo.o bindcpp.o
	ar -cqv libfoo.a foo.o bindcpp.o

main.o:
	gcc -c -o main.o main.c

main: libfoo.a main.o libdocopt_s.a
	g++ -o main -L. main.o -lfoo -ldocopt_s

all: main

clean:
	@rm *.o *.a main
