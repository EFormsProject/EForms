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

OBJECTS = big_file_C7_c.o 

OLDOBJECTS =  mi214.o mi214d.o re201.o re201d.o de229.o de229d.o re204.o re204d.o \
	ws223.o ws223d.o mi225.o mi225d.o pl213.o pl213d.o in226.o in226d.o \
	re199.o re199d.o st218.o st218d.o st220.o st220d.o st219.o st219d.o \
	re203.o re203d.o re200.o re200d.o in202.o in202d.o ra212.o ra212d.o \
	ht227.o ht227d.o fi211.o fi211d.o ht221.o ht221d.o na208.o na208d.o \
	ex207.o ex207d.o na205.o na205d.o ws228.o ws228d.o ws222.o ws222d.o \
	di206.o di206d.o fi209.o fi209d.o da215.o da215d.o ar217.o ar217d.o \
	ar216.o ar216d.o un210.o un210d.o fi230.o fi230d.o ht224.o ht224d.o \
	tc198.o tc198d.o 

all: Cobj7.o

Cobj7.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj7.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

