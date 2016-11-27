cc = gcc
CFLAGS=-Wall $(INC) $(LIBPATH) $(LIBS)
TARGET=binmain
INC= -I/usr/local/include/
LIBPATH=-L/usr/local/lib/
LIBS=-llua
SRCS= main.c \

OBJS = $(SRCS:.c=.o)
$(TARGET):$(OBJS)
	$(cc) -o $@ $^

$.o:$.c
	$(cc) $(CFLAGS)  -o $@ -c $< 

clean:
	rm $(TARGET) $(OBJS)
