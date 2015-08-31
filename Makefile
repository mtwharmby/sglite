include ../../Rules.make

CFLAGS = $(CCOPT1) $(CCOPT2) -I../../ext/include/python1.5 -I../modules

OBJ= sgglobal.o sgcb.o sgcharmx.o sgfile.o sggen.o sghall.o sghkl.o \
    sgltr.o sgmath.o sgmetric.o sgnorm.o sgprop.o sgss.o sgstr.o sgsymbols.o \
    sgtidy.o sgtype.o sgutil.o runtests.o sglitemodule.o 

all: sglite.so

.c.o: 
	$(CC) $(CFLAGS) -c $*.c -DPythonTypes

sglite.so: $(OBJ) 
	$(CC) $(CCOPT1) -shared *.o -o sglite.so

clean:
	touch .no_fail
	/bin/rm -f *.so *.o .no_fail*

distclean: clean


