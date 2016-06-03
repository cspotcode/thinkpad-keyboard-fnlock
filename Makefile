###########################################
# Based on simple Makefile for HIDAPI test program
#
# Przemysław Kamiński
# (19.08.2014)
#
###########################################

all: thinkpad-compact-bluetooth

CC=gcc
CXX=g++
COBJS=hid.o
CPPOBJS=./thinkpad-compact-bluetooth.o
OBJS=$(COBJS) $(CPPOBJS)
CFLAGS+=-Ihidapi -Wall -g -c 
LIBS=-framework IOKit -framework CoreFoundation


thinkpad-compact-bluetooth: $(OBJS)
	g++ -Wall -g $^ $(LIBS) -o thinkpad-compact-bluetooth

$(COBJS): %.o: %.c
	$(CC) $(CFLAGS) $< -o $@

$(CPPOBJS): %.o: %.cpp
	$(CXX) $(CFLAGS) $< -o $@

clean:
	rm -f *.o hidtest $(CPPOBJS)

.PHONY: clean
