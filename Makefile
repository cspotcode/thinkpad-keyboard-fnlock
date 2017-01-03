###########################################
# Based on simple Makefile for HIDAPI test program
#
# Przemysław Kamiński
# (19.08.2014)
#
###########################################

all: thinkpad-compact-bluetooth

OBJDIR=build
BINDIR=bin
CC=gcc
CXX=g++
COBJS=$(OBJDIR)/hid.o
CPPOBJS=$(OBJDIR)/thinkpad-compact-bluetooth.o
OBJS=$(COBJS) $(CPPOBJS)
CFLAGS+=-Ihidapi -Wall -g -c 
LIBS=-framework IOKit -framework CoreFoundation


thinkpad-compact-bluetooth: $(OBJS) $(BINDIR)
	g++ -Wall -g $(OBJS) $(LIBS) -o $(BINDIR)/thinkpad-compact-bluetooth

$(COBJS): $(OBJDIR)/%.o: %.c $(OBJDIR)
	$(CC) $(CFLAGS) $< -o $@

$(CPPOBJS): $(OBJDIR)/%.o: %.cpp $(OBJDIR)
	$(CXX) $(CFLAGS) $< -o $@

$(BINDIR) $(OBJDIR):
	mkdir -p $@

clean:
	rm -f $(BINDIR)/hidtest $(OBJS)

.PHONY: clean
