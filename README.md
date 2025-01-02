# CPU-Architecture-Bungo-3

## Project Overview
This project focuses on the design and implementation of a CPU architecture. The goal is to create a functional 9-bit opcode CPU capable of executing basic programs while being fully programmable via its Instruction Set Architecture (ISA). Due to the strict 9-bit opcode limitation, innovative techniques were employed to implement essential CPU functionalities. Data is stored in 8-bit wide registers, requiring separation into low and high bytes for larger numbers.

![RTL viewer](https://github.com/user-attachments/assets/66da85ec-b060-4730-827a-a66d05f7e9ae)

The repository includes:
- System Verilog files for the hardware design.
- Test benches with assembly code.
- An assembler to translate assembly code into machine code.

## Design Principles
The CPU is built using the Minimum Instruction Set Principle (MISP), emphasizing efficiency in memory and instruction usage. The design features:
- A 9-bit opcode with floating codes.
- Huffman-encoded instructions for optimal opcode usage.
- A MIPS-style instruction sheet for ease of programming.

To optimize performance, the architecture minimizes memory I/O, favoring register-to-register operations, which typically take one clock cycle. The design includes 8 registers, balancing functionality and instruction length constraints. Instruction formats with 0, 1, or 2 registers are provided for programming flexibility. For example:
- The `sti` command is designed with 0 registers, defaulting to register 0 for load/store operations.

## Register Purpose
- **Register 0**: Dedicated load/store register for `ldi` and `sti` commands.
- **Registers 1-3**: General-purpose registers for most operations. Some instructions only support these lower 2-bit registers due to opcode limitations.
- **Registers 4-6**: Reserved for loop counters but can be used for other purposes with `mov`. Arithmetic operations may not support these registers.
- **Register 7**: Stores ALU flags (zero, negative, carry) updated after ALU operations like `cmp` or `sub`. Useful for branching conditions.

## Branching and Look-Up Table (LUT)
Branching is constrained by the 9-bit opcode, where 7 bits are used for immediate addressing. To address this, a LUT is implemented:
- The assembler records label locations and their immediate addresses, outputting a LUT.
- Branching commands reference the LUT pointer to retrieve the actual target address.

## Setup
1. **Synthesize Components**: Use Quartus Prime to synthesize the design. Create a new project and include the `top_level.sv` file and all necessary System Verilog component files.
   - The design was tested using the Arria II GX family FPGA.
2. **Run Code**:
   - Write assembly code based on the instruction sheet.
   - Use `assembly.py` to translate assembly code into machine code.
   - Use simulation software like Intel Questa or modelSim to simulate the waveform viewer and transcript output.
   - Load the machine code into the testbench for execution.

## Testing
The provided testbench verifies the architecture’s functionality by executing a program to find the greatest and least Hamming pairs. It:
- Provides a start signal.
- Loads machine code into instruction memory.
- Tests 10 different inputs.
- Verifies correctness against expected outputs.

## Results
The testbench successfully validated the architecture’s functionality. All 10 test cases for finding the greatest and least Hamming pairs passed in Questa simulations, demonstrating the design’s correctness and reliability.

