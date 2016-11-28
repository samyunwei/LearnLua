cc = gcc
CFLAGS=-Wall -fPIC $(INC) $(LIBPATH) $(LIBS)
TARGET=mylib.so
INC= -I/usr/local/include/ -I/usr/include/
LIBPATH=-L/usr/local/lib/
LIBS=-llua
SRCS= main.c \

OBJS = $(SRCS:.c=.o)
$(TARGET):$(OBJS)
	$(cc) $(CFLAGS) -shared -o $@ $^ 

$.o:$.c
	$(cc) $(CFLAGS) $@ -c $< 

clean:
	rm $(TARGET) $(OBJS)
