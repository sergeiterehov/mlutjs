#include <stdio.h>
#include "./emulator.c"
#include "./luts.c"

int main()
{
    struct pga_table * table = pga_table_create(3, 3);
    struct pga_emulator * emulator = pga_emulator_create(table);

    lut_train(&table->matrix[0][0], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});
    lut_train(&table->matrix[0][2], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});

    lut_train(&table->matrix[1][1], lut_wire_function, (int[2]) {NODE_UP, NODE_BOTTOM});
    lut_train(&table->matrix[2][0], lut_wire_function, (int[2]) {NODE_BOTTOM, NODE_LEFT});
    lut_train(&table->matrix[2][1], lut_wire_function, (int[2]) {NODE_BOTTOM, NODE_UP});
    
    lut_train(&table->matrix[2][2], lut_wire_function, (int[2]) {NODE_LEFT, NODE_UP});
    lut_train(&table->matrix[2][2], lut_wire_function, (int[2]) {NODE_LEFT, NODE_RIGHT});

    lut_train(&table->matrix[1][0], lut_nor_function, (int[3]) {NODE_LEFT, NODE_RIGHT, NODE_BOTTOM});
    lut_train(&table->matrix[1][2], lut_nor_function, (int[3]) {NODE_LEFT, NODE_UP, NODE_RIGHT});

    pga_emulator_set(emulator, 0, 0, NODE_LEFT, 1);
    pga_emulator_set(emulator, 0, 2, NODE_LEFT, 0);

    int iterations = pga_emulator_render(emulator);

    printf("Iterations: %i\n", iterations);
    printf("State: %i\n", pga_emulator_get(emulator, 2, 2, NODE_RIGHT));

    return 0;
}