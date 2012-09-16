SRCS=main.c
OBJS=$(SRCS:.c=.o)

all:hack.so test_main

hack.so:hack.o
	gcc -fPIC -shared -o libhack.so hack.o

test_main:$(OBJS)
	gcc -o $@ $^

.c.o:
	gcc -c $<

clean:
	\rm -f test_main $(OBJS) core.* libhack.so hack.o
