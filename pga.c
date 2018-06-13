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
        *node |= (((uint64) func(inputs, args) & 0b1111) << (inputs << 2));
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
    int stack_pointer;
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

    emulator->stack_pointer = 0;

    int * stack = malloc(1024 * sizeof(int));

    emulator->stack = stack;

    return emulator;
}

int pga_emulator_render(struct pga_emulator * emulator)
{
    int iterations = 0;

    int x, y;

    uint64 ** matrix = emulator->table->matrix;

    int * stack = emulator->stack;
    int sp = emulator->stack_pointer;

    byte ** states = emulator->states;

    int width = emulator->table->width;
    int height = emulator->table->height;

    uint64 lut;

    byte inputs, state_new;
    byte * state_current;

    while (sp > 0)
    {
        y = stack[--sp];
        x = stack[--sp];

        if (x < 0 || y < 0 || x >= width || y >= height)
        {
            continue;
        }

        lut = matrix[x][y];

        x++;
        y++;

        state_current = &states[x][y];

        inputs = (
            0b0
            | (((states[x][y - 1] >> NODE_BOTTOM) & 0b1) << NODE_UP)
            | (((states[x + 1][y] >> NODE_LEFT) & 0b1) << NODE_RIGHT)
            | (((states[x][y + 1] >> NODE_UP) & 0b1) << NODE_BOTTOM)
            | (((states[x - 1][y] >> NODE_RIGHT) & 0b1) << NODE_LEFT)
        );

        state_new = (lut >> (inputs << 2)) & 0b1111;

        if (*state_current == state_new)
        {
            continue;
        }

        *state_current = state_new;

        x--;
        y--;

        iterations++;

        stack[sp++] = x;
        stack[sp++] = y - 1;

        stack[sp++] = x + 1;
        stack[sp++] = y;

        stack[sp++] = x;
        stack[sp++] = y + 1;

        stack[sp++] = x - 1;
        stack[sp++] = y;
    }

    emulator->stack_pointer = sp;

    return iterations;
}

int main()
{
    struct pga_table * table = pga_table_create(3, 3);
    struct pga_emulator * emulator = pga_emulator_create(table);

    lut_train(&table->matrix[1][0], lut_wire_function, (int[2]) {NODE_UP, NODE_BOTTOM});
    lut_train(&table->matrix[0][1], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});
    lut_train(&table->matrix[1][1], lut_and_function, (int[3]) {NODE_UP, NODE_LEFT, NODE_RIGHT});

    emulator->states[0][2] = 0b1111;
    emulator->states[2][0] = 0b1111;

    emulator->stack[emulator->stack_pointer++] = 0;
    emulator->stack[emulator->stack_pointer++] = 1;

    emulator->stack[emulator->stack_pointer++] = 1;
    emulator->stack[emulator->stack_pointer++] = 0;

    int iterations = pga_emulator_render(emulator);

    printf("Iterations: %i\n", iterations);
    printf("State: %i\n", emulator->states[2][2]);

    return 0;
}