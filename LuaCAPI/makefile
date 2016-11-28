cc = gcc
CFLAGS=-Wall $(INC) $(LIBPATH) $(LIBS)
TARGET=mylib.dylib
INC= -I/usr/local/include/ -I/usr/include/
LIBPATH=-L/usr/local/lib/
LIBS=-llua
SRCS= main.c \

OBJS = $(SRCS:.c=.o)
$(TARGET):$(OBJS)
	$(cc) $(CFLAGS) -dynamiclib -o $@ $^ 

$.o:$.c
	$(cc) $(CFLAGS)  -o $@ -c $< 

clean:
	rm $(TARGET) $(OBJS)
