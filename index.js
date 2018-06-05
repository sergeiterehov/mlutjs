class LUT {
    constructor() {
        /**
         * @type {Number[]} Node memory
         */
        this.table = null
    }

    /**
     * Set node memory table
     *
     * @param {Number[]} refTable Double x32 number
     *
     * @returns {this}
     */
    node(refTable) {
        this.table = refTable

        return this
    }

    /**
     * Get out by inputs state
     *
     * @param {Number} inputs Inputs bit mask URBL
     */
    find(inputs) {
        return (this.table[inputs >>> 3] >>> (4 * (inputs & 0b111))) & 0b1111
    }

    /**
     * Train LUT
     *
     * @param {(inputs: Number) => Number} cb Callback for inputs state
     */
    train(cb) {
        for (let inputs = 0b0; inputs <= 0b1111; inputs++) {
            this.table[inputs >>> 3] |= (cb(inputs) & 0b1111) << (4 * (inputs & 0b111))
        }
    }
}

class Input {
    constructor() {
        /**
         * @type {Number} Input state
         */
        this.state = 0b0
        /**
         * @type {Array<(input: this) => void>}
         */
        this.onupdate = []
    }

    /**
     * Set new state
     *
     * @param {Number} state New state
     */
    set(state) {
        if (this.state === state) {
            return
        }

        this.state = state
        this.onupdate.forEach(cb => cb(this))
    }
}

class Matrix {
    constructor() {
        /**
         * @type {Number[][][]} LUT matrix
         */
        this.matrix = null

        /**
         * @type {Number[][]}
         */
        this.state = [...[...Array(matrix.length).keys()].map(row => [...[...Array(matrix[0].length).keys()].map(node => 0b0)])]

        /**
         * @type {{col: Number, row: Number, input: Number, obj: Input}[]} Inputs
         */
        this.inputs = []
        this.outputs = []

        this.lastRow = 0
        this.lastCol = 0

        this.lut = new LUT
    }

    /**
     * Set LUT matrix
     *
     * @param {Number[][][]} refMatrix Matrix LUT
     */
    matrixLUT(refMatrix) {
        this.matrix = refMatrix

        this.lastRow = this.matrix.length - 1
        this.lastCol = this.matrix[0].length - 1

        return this
    }

    /**
     * Add input
     *
     * @param {Number} col Column number
     * @param {Number} row Row number
     * @param {Number} inputBit Input bit number (URBL)
     * @param {Input} input Input object
     *
     * @return {this}
     */
    input(col, row, inputBit, input) {
        this.inputs.push({col: col, row: row, input: inputBit, obj: input})

        input.onupdate.push(i => {
            this.propagate(col, row, inputBit, input.state)
        })

        return this
    }

    /**
     * Propagate a input state
     *
     * @param {Number} col Column number
     * @param {Number} row Row number
     * @param {Number} bit Input bit number (URBL)
     * @param {Number} state Input state
     */
    propagate(col, row, bit, state) {
        let stack = [
            [row, col],
        ]

        console.log('-> input', col, row, this.itemInputs(col, row))

        while (stack.length > 0) {
            let item = stack.pop()
            let row = item[0]
            let col = item[1]

            if (row < 0 || col < 0 || row > this.lastRow || col > this.lastCol) {
                continue
            }

            let state = this.state[row][col]

            if (state[0] === 0b0 && state[1] === 0b0) {
                continue
            }

            console.log('trace', col, row)

            let inputs = this.itemInputs(col, row)
            let outputs = this.itemOutputs(col, row, inputs)

            if (outputs === state) {
                continue
            }

            this.state[row][col] = outputs

            stack.push([row - 1, col], [row + 1, col], [row, col - 1], [row, col + 1])
        }
    }

    itemInputs(col, row) {
        let inputs = 0b0

        if (row > 0) inputs |= ((this.state[row - 1][col] >>> 2) & 0b1) << 0
        if (row < this.lastRow) inputs |= ((this.state[row + 1][col] >>> 0) & 0b1) << 2
        if (col > 0) inputs |= ((this.state[row][col - 1] >>> 1) & 0b1) << 3
        if (col < this.lastCol) inputs |= ((this.state[row][col + 1] >>> 3) & 0b1) << 1

        let input = this.inputs.find(item => item.col === col && item.row === row)

        if (input) {
            inputs |= (input.obj.state << input.input)
        }

        return inputs
    }

    itemOutputs(col, row, inputs) {
        return this.lut.node(this.matrix[row][col]).find(inputs)
    }
}

/**
 * Simple train LUT
 *
 * @param {(u: Boolean, r: Boolean, b: Boolean, l: Boolean) => Boolean[]} cb 
 */
function simpleTrain(cb) {
    return (inputs) => {
        return cb(
            ...[...Array(4).keys()]
            .map((input, index) => 0b1 === ((inputs >>> index) & 0b1))
        )
        .reduce((acc, out, index) => acc |= (out ? 0b1 : 0b0) << index, 0b0)
    }
}

function createMatrixLUT(cols, rows) {
    return [...[...Array(rows).keys()].map(row => [...[...Array(cols).keys()].map(node => [0b0, 0b0])])]
}

/**
 * @type {Number[][][]} Full LUT matrix
 */
let matrix = createMatrixLUT(4, 4)

let matrixLut = new Matrix
let lut = new LUT

let i0 = new Input
let i1 = new Input

matrixLut.matrixLUT(matrix).input(0, 0, 3, i0)
matrixLut.matrixLUT(matrix).input(0, 2, 3, i1)

lut.node(matrix[0][0]).train(simpleTrain((u, r, b, l) => [false, false, l, false]))
lut.node(matrix[2][0]).train(simpleTrain((u, r, b, l) => [l, false, false, false]))
lut.node(matrix[1][0]).train(simpleTrain((u, r, b, l) => [false, u && b, false, false]))

i0.set(0b1)
i1.set(0b1)
i1.set(0b0)

console.log(matrixLut.state)