typedef unsigned char byte;

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

byte lut_nor_function(byte inputs, int args[])
{
    return (~(((inputs >> args[0]) & 0b1) | ((inputs >> args[1]) & 0b1)) & 0b1) << args[2];
}