import numpy as np
from numba import jit

width = 3
height = 3


def init(table, states):
    table
    for x in range(table.shape[0]):
        for y in range(table.shape[1]):
            table[x, y] = 0b0

    for x in range(states.shape[0]):
        for y in range(states.shape[1]):
            states[x, y] = 0b0

def train(table, x, y, cb):
    lut = 0b0

    for inputs in range(0b0, 0b1111):
        lut |= cb(inputs) << (inputs << 2)

    table[x, y] = lut

def simple_train(cb):
    transformer = lambda outputs: (
        0b0
        | ( (outputs[0] & 0b1) << 0 )
        | ( (outputs[1] & 0b1) << 1 )
        | ( (outputs[2] & 0b1) << 2 )
        | ( (outputs[3] & 0b1) << 3 )
    )
    
    return lambda inputs: transformer(cb(
        (inputs >> 0) & 0b1,
        (inputs >> 1) & 0b1,
        (inputs >> 2) & 0b1,
        (inputs >> 3) & 0b1
    ))

@jit
def propagate(table, states, stack):
    iterations = 0

    while stack[0, 0] > 0:
        x, y = stack_pop(stack)

        if (x == -1) or (y == -1) or (x == width) or (y == height):
            continue

        lut = table[x, y]

        x += 1
        y += 1

        inputs = (
            0b0
            | ( ((states[x, y - 1] >> 2) & 0b1) << 0 )
            | ( ((states[x + 1, y] >> 3) & 0b1) << 1 )
            | ( ((states[x, y + 1] >> 0) & 0b1) << 2 )
            | ( ((states[x - 1, y] >> 1) & 0b1) << 3 )
        ) << 2

        state = ( (lut >> inputs) & 0b1111 )

        if states[x, y] == state:
            continue

        states[x, y] = state

        x -= 1
        y -= 1

        stack_push( stack, (x, y - 1) )
        stack_push( stack, (x + 1, y) )
        stack_push( stack, (x, y + 1) )
        stack_push( stack, (x - 1, y) )

        iterations += 1

    return iterations


@jit
def stack_push(stack, point):
    x, y = point

    stack[0, 0] += 1
    
    stack[stack[0, 0], 0] = x
    stack[stack[0, 0], 1] = y

@jit
def stack_pop(stack):
    x = stack[stack[0, 0], 0]
    y = stack[stack[0, 0], 1]

    stack[0, 0] -= 1

    return (x, y)

def upstate(state, point):
    x, y = point

    states[x, y] = (state & 0b1) * 0b1111

    if y == 0:
        stack_push(stack, (x - 1, y))
    elif x == 0:
        stack_push(stack, (x, y - 1))
    else:
        stack_push(stack, (x - 1, y - 1))

stack = np.arange(2 * 1000).reshape(1000, 2)

table = np.arange(width * height).reshape(width, height)
states = np.arange((width + 2) * (height + 2)).reshape(width + 2, height + 2)

init(table, states)

train(table, 1, 1, simple_train(lambda u, r, b, l: [0, u & l, 0, 0]))
train(table, 1, 0, simple_train(lambda u, r, b, l: [0, 0, u, 0]))
train(table, 0, 1, simple_train(lambda u, r, b, l: [0, l, 0, 0]))

upstate(1, (0, 2))
upstate(1, (2, 0))

iterations = propagate(table, states, stack)

print(states)
print('Iterations:', iterations)