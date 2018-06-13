typedef unsigned char byte;

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
    return ~(((inputs >> args[0]) & 0b1) | ((inputs >> args[1]) & 0b1)) << args[2];
}