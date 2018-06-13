#include <stdio.h>
#include <stdlib.h>

typedef __uint64_t uint64;
typedef unsigned char byte;

#define NODE_UP 0
#define NODE_RIGHT 1
#define NODE_BOTTOM 2
#define NODE_LEFT 3

void lut_train(uint64 * node, byte (* func)(byte, int[]), int args[])
{
    byte outputs = 0b0;

    for (byte inputs = 0b0; inputs <= 0b1111; inputs++)
    {
        *node |= ((func(inputs, args) & 0b1111) << (inputs << 2));
    }
}

byte lut_wire_function(byte inputs, int args[])
{
    return ((inputs >> args[0]) & 0b1) << args[1];
}

byte lut_not_function(byte inputs, int args[])
{
    return (~(inputs >> args[0]) & 0b1) << args[1];
}

byte lut_and_function(byte inputs, int args[])
{
    return (((inputs >> args[0]) & 0b1) & ((inputs >> args[1]) & 0b1)) << args[2];
}

byte lut_or_function(byte inputs, int args[])
{
    return (((inputs >> args[0]) & 0b1) | ((inputs >> args[1]) & 0b1)) << args[2];
}

byte lut_xor_function(byte inputs, int args[])
{
    return (((inputs >> args[0]) & 0b1) ^ ((inputs >> args[1]) & 0b1)) << args[2];
}

struct pga_table
{
    uint64 ** matrix;
    int width;
    int height;
};

struct pga_table * pga_table_create(int width, int height)
{
    struct pga_table * table = malloc(1 * sizeof(struct pga_table));

    table->width = width;
    table->height = height;

    table->matrix = malloc(width * sizeof(uint64 *));

    uint64 * matrix_array = malloc(width * height * sizeof(uint64));

    for (int x = 0; x < width; x++)
    {
        table->matrix[x] = &matrix_array[x * height];
    }

    return table;
}

struct pga_emulator
{
    struct pga_table * table;

    byte ** states;
    int width;
    int height;

    int * stack;
    int stack_size;
};

struct pga_emulator * pga_emulator_create(struct pga_table * table)
{
    struct pga_emulator * emulator = malloc(sizeof(struct pga_emulator));

    int width = table->width + 2;
    int height = table->height + 2;

    emulator->table = table;

    emulator->width = width;
    emulator->height = height;

    emulator->states = malloc(width * sizeof(byte *));

    byte * states_array = malloc(width * height * sizeof(byte));

    for (int x = 0; x < width; x++)
    {
        emulator->states[x] = &states_array[x * height];
    }

    emulator->stack_size = 1024;

    int * stack = malloc(emulator->stack_size * sizeof(int));

    emulator->stack = stack;

    return emulator;
}

int main()
{
    struct pga_table * table = pga_table_create(3, 3);
    struct pga_emulator * emulator = pga_emulator_create(table);

    lut_train(&table->matrix[0][1], lut_wire_function, (int[2]) {NODE_UP, NODE_BOTTOM});
    lut_train(&table->matrix[1][0], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});
    lut_train(&table->matrix[1][1], lut_xor_function, (int[3]) {NODE_UP, NODE_LEFT, NODE_RIGHT});

    printf("%i\n", table->matrix[1][1]);

    return 0;
}