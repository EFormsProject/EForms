INCLUDE_PATH = 
SHELL = /bin/sh
CC = cc
CPP = c++
CFLAGS = -O0 -pipe -fno-common -fPIC  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"/Users/RuslanFarkhutdinov/Eiffel_16.05/studio/spec/macosx-x86-64/include" -I. $(INCLUDE_PATH)
CPPFLAGS = -O0 -pipe -fno-common -fPIC  -DWORKBENCH -I"/Users/RuslanFarkhutdinov/Eiffel_16.05/studio/spec/macosx-x86-64/include" -I. $(INCLUDE_PATH)
LDFLAGS = 
CCLDFLAGS =   
LDSHAREDFLAGS =   -dynamiclib -flat_namespace -undefined suppress -o
EIFLIB = "/Users/RuslanFarkhutdinov/Eiffel_16.05/studio/spec/macosx-x86-64/lib/libwkbench.a"
EIFTEMPLATES = /Users/RuslanFarkhutdinov/Eiffel_16.05/studio/config/macosx-x86-64/templates
LIBS = -lm
MAKE = make
AR = ar
LD = ld
MKDEP = \$(EIFFEL_SRC)/C/mkdep $(DPFLAGS) --
MV = /bin/mv
CP = /bin/cp
RANLIB = :
RM = /bin/rm -f
FILE_EXIST = 
RMDIR = 
X2C = "/Users/RuslanFarkhutdinov/Eiffel_16.05/studio/spec/macosx-x86-64/bin/x2c"
SHAREDLINK = cc
SHAREDLIBS = -lm
SHARED_SUFFIX = .dylib
COMMAND_MAKEFILE = 
START_TEST = if [ ! -f finished ] ; then 
END_TEST = ; fi 
CREATE_TEST = touch finished 
SYSTEM_IN_DYNAMIC_LIB = ans_save.dylib 

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C23_c.o 

OLDOBJECTS =  sp739.o sp739d.o ar749.o ar749d.o sp746.o sp746d.o na748.o na748d.o \
	re740.o re740d.o li753.o li753d.o ar738.o ar738d.o ar728.o ar728d.o \
	in750.o in750d.o to729.o to729d.o it742.o it742d.o it743.o it743d.o \
	ge747.o ge747d.o in741.o in741d.o re744.o re744d.o cu754.o cu754d.o \
	tr758.o tr758d.o se734.o se734d.o ar737.o ar737d.o dy730.o dy730d.o \
	ta751.o ta751d.o li736.o li736d.o un732.o un732d.o ty745.o ty745d.o \
	ac755.o ac755d.o co752.o co752d.o bi735.o bi735d.o fi726.o fi726d.o \
	dy731.o dy731d.o ba756.o ba756d.o ch733.o ch733d.o co757.o co757d.o \
	bo727.o bo727d.o 

all: Cobj23.o

Cobj23.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj23.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

