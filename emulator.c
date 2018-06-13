#include <stdio.h>
#include <stdlib.h>
#include "./table.c"

typedef __uint64_t uint64;
typedef unsigned char byte;

#define NODE_UP 0
#define NODE_RIGHT 1
#define NODE_BOTTOM 2
#define NODE_LEFT 3

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

    for (int i = 0; i < width * height; i++)
    {
        states_array[i] = 255;
    }

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

void pga_emulator_set(struct pga_emulator * emulator, int x, int y, byte direction, byte state)
{
    int ofx = 0;
    int ofy = 0;

    if (NODE_UP == direction)
    {
        ofy--;
    }
    else if (NODE_RIGHT == direction)
    {
        ofx++;
    }
    else if (NODE_BOTTOM == direction)
    {
        ofy++;
    }
    else if (NODE_LEFT == direction)
    {
        ofx--;
    }

    emulator->stack[emulator->stack_pointer++] = x;
    emulator->stack[emulator->stack_pointer++] = y;

    emulator->states[x + 1 + ofx][y + 1 + ofy] = 0b1 == state ? 0b1111 : 0b0000;
}

byte pga_emulator_get(struct pga_emulator * emulator, int x, int y, byte direction)
{
    return 0b1 == (emulator->states[x + 1][y + 1] >> direction) & 0b1;
}