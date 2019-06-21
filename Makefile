# ------------------------------------------------
# Coursework: Forthress, a Forth dialect
#
# Student: Tabunshchik Sergey, P3201 
# ITMO University, 2019
#
# ------------------------------------------------

ASM			= nasm
ASMFLAGS	= -felf64 -g -Isrc/ 


# This feature allows you to call functions from libc and other shared libraries.
# You get support for native calls by address and dlsym.
LINKER 		= ld
LINKERFLAGS = 
LIBS        = 


all: bin/forthress
	
bin/forthress: obj/forthress.o obj/lib.o
	mkdir -p bin 
	$(LINKER) -o bin/forthress  $(LINKERFLAGS) -o bin/forthress obj/forthress.o obj/lib.o $(LIBS)

obj/forthress.o: src/forthress.asm src/macro.inc src/dictionary.inc src/lib.inc
	mkdir -p obj
	$(ASM) $(ASMFLAGS) src/forthress.asm -o obj/forthress.o

obj/lib.o: src/lib.inc src/lib.asm
	mkdir -p obj
	$(ASM) $(ASMFLAGS) src/lib.asm -o obj/lib.o

clean: 
	rm -rf build obj

.PHONY: clean

