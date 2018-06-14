build:
	gcc pga.c -g -o pga.bin

build-asm:
	gcc -masm=intel -c -g -Wa,-a,-ad pga.c -o pga.bin > pga.s