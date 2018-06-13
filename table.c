#include <stdio.h>
#include <stdlib.h>

typedef __uint64_t uint64;
typedef unsigned char byte;

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