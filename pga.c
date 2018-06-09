#include <stdio.h>
#include <stdlib.h>

struct point
{
    int x;
    int y;
};

struct pga_table
{
    __uint64_t ** matrix;

    int width;
    int height;
};

struct pga_emulator
{
    unsigned char ** states;
    struct pga_table * table;

    struct point * stack;
    int stack_position;
};

struct pga_table * pga_table_create(int width, int height)
{
    struct pga_table * table = aligned_alloc(1, sizeof(struct pga_table));

    table->width = width;
    table->height = height;
    table->matrix = aligned_alloc(width * height, sizeof(__uint64_t));

    return table;
}

struct pga_emulator * pga_emulator_create(struct pga_table * table)
{
    struct pga_emulator * emulator = aligned_alloc(1, sizeof(struct pga_emulator));

    emulator->table = table;
    emulator->states = aligned_alloc((table->width + 2) * (table->height + 2), sizeof(char));
    emulator->stack = aligned_alloc(100, sizeof(struct point));
    emulator->stack_position = 0;

    return emulator;
}

void pga_emulator_stack_push(struct pga_emulator * emulator, int x, int y)
{
    struct point * record = &(emulator->stack[emulator->stack_position++]);

    record->x = x;
    record->y = y;
}

struct point * pga_emulator_stack_pop(struct pga_emulator * emulator)
{
    return &(emulator->stack[--emulator->stack_position]);
}

void pga_emulator_propagate(struct pga_emulator * emulator)
{
    //
}

int main()
{
    struct pga_table * table = pga_table_create(3, 3);
    struct pga_emulator * emulator = pga_emulator_create(table);

    pga_emulator_stack_push(emulator, 10, 20);

    return 0;
}