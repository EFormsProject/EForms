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

OBJECTS = big_file_C28_c.o 

OLDOBJECTS =  ap892.o ap892d.o ar891.o ar891d.o ce922.o ce922d.o ha913.o ha913d.o \
	ap903.o ap903d.o li898.o li898d.o li923.o li923d.o ha916.o ha916d.o \
	ta914.o ta914d.o ta915.o ta915d.o ws902.o ws902d.o ws893.o ws893d.o \
	se919.o se919d.o li897.o li897d.o li921.o li921d.o li899.o li899d.o \
	li900.o li900d.o rt904.o rt904d.o rt905.o rt905d.o rt906.o rt906d.o \
	rt907.o rt907d.o rt908.o rt908d.o rt909.o rt909d.o rt910.o rt910d.o \
	rt911.o rt911d.o rt912.o rt912d.o rt917.o rt917d.o ac894.o ac894d.o \
	ar918.o ar918d.o li896.o li896d.o li920.o li920d.o in895.o in895d.o \
	qu901.o qu901d.o 

all: Cobj28.o

Cobj28.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj28.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

