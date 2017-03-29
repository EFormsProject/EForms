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

OBJECTS = big_file_C17_c.o 

OLDOBJECTS =  ty551.o ty551d.o ty552.o ty552d.o ty560.o ty560d.o ty553.o ty553d.o \
	ar544.o ar544d.o ar535.o ar535d.o re531.o re531d.o it557.o it557d.o \
	ce549.o ce549d.o ce550.o ce550d.o ce558.o ce558d.o ha545.o ha545d.o \
	tr530.o tr530d.o se540.o se540d.o ar543.o ar543d.o dy536.o dy536d.o \
	bo532.o bo532d.o li542.o li542d.o ha548.o ha548d.o un538.o un538d.o \
	ta546.o ta546d.o ta547.o ta547d.o bi541.o bi541d.o fi533.o fi533d.o \
	dy537.o dy537d.o ba528.o ba528d.o ch539.o ch539d.o rt559.o rt559d.o \
	wg554.o wg554d.o co529.o co529d.o bo534.o bo534d.o wg555.o wg555d.o \
	wg556.o wg556d.o 

all: Cobj17.o

Cobj17.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj17.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

