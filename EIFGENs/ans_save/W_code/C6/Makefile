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

OBJECTS = big_file_C6_c.o 

OLDOBJECTS =  pl190.o pl190d.o pr165.o pr165d.o pa183.o pa183d.o c_174.o c_174d.o \
	re179.o re179d.o cu166.o cu166d.o ar168.o ar168d.o co188.o co188d.o \
	st173.o st173d.o ha167.o ha167d.o ma193.o ma193d.o di169.o di169d.o \
	da187.o da187d.o da186.o da186d.o ti185.o ti185d.o ab189.o ab189d.o \
	se180.o se180d.o wg176.o wg176d.o io175.o io175d.o du184.o du184d.o \
	ht182.o ht182d.o ht181.o ht181d.o wg178.o wg178d.o ur192.o ur192d.o \
	ne196.o ne196d.o ne197.o ne197d.o st195.o st195d.o ad171.o ad171d.o \
	wg177.o wg177d.o ht191.o ht191d.o so194.o so194d.o ad172.o ad172d.o \
	ex170.o ex170d.o 

all: Cobj6.o

Cobj6.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj6.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

