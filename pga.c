#include <stdio.h>
#include <stdlib.h>

struct point
{
    int x;
    int y;
};

struct pga_table
{
    __uint64_t * matrix;

    int width;
    int height;
};

struct pga_emulator
{
    unsigned char * states;
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

int pga_emulator_propagate(struct pga_emulator * emulator)
{
    int interations = 0;

    struct point * now;

    int width = emulator->table->width;
    int height = emulator->table->height;

    __uint64_t * table = emulator->table->matrix;

    int x;
    int y;

    __uint64_t lut;

    unsigned char inputs;
    unsigned char state;
    unsigned char * stateCurrent;

    while (emulator->stack_position > 0)
    {
        now = pga_emulator_stack_pop(emulator);

        x = now->x;
        y = now->y;

        if (x == -1 || y == -1 || x == width || y == height)
        {
            continue;
        }

        lut = table[x, y];

        x++;
        y++;

        inputs = (
            0b0
            | ( ((emulator->states[x, y - 1] >> 2) & 0b1) << 0 )
            | ( ((emulator->states[x + 1, y] >> 3) & 0b1) << 1 )
            | ( ((emulator->states[x, y + 1] >> 0) & 0b1) << 2 )
            | ( ((emulator->states[x - 1, y] >> 1) & 0b1) << 3 )
        );

        state = ( (lut >> inputs) & 0b1111 );
        stateCurrent = &(emulator->states[x, y]);

        if (state == *stateCurrent)
        {
            continue;
        }

        *stateCurrent = state;

        x--;
        y--;

        pga_emulator_stack_push(emulator, x, y - 1);
        pga_emulator_stack_push(emulator, x + 1, y);
        pga_emulator_stack_push(emulator, x, y + 1);
        pga_emulator_stack_push(emulator, x - 1, y);

        interations++;
    }

    return interations;
}

__uint64_t lut_train(unsigned char (*f)(unsigned char))
{
    __uint64_t lut = 0b0;

    for (unsigned char inputs = 0b0; inputs <= 0b1111; inputs++)
    {
        lut |= f(inputs) << (inputs * 4);
    }

    return lut;
}

int main()
{
    struct pga_table * table = pga_table_create(3, 3);
    struct pga_emulator * emulator = pga_emulator_create(table);

    table->matrix[0, 0] = lut_train(({
        unsigned char callback(unsigned char inputs)
        {
            return 0b1;
        }

        callback;
    }));

    pga_emulator_stack_push(emulator, 0, 0);

    printf("Iterations: %i\n", pga_emulator_propagate(emulator));

    return 0;
}