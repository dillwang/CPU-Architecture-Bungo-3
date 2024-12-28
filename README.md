# CPU-Architecture-Bungo-3
## Project Overview
This is a CPU architecture digital design project. This project aims to create a functional 9-bit op-code CPU architecture capable of running basic programs and should also be fully programmable for a programmer using the ISA it provides.
Because of the strict 9-bit opcode limitation, we have to be creative with many of our assembly commands to achieve most of a CPU's major functionality while keeping the op code short. We are also limited to 8-bit wide data stored in a register, so we have to separate a number like int into low byte and high byte if needed.
![RTL viewer](https://github.com/user-attachments/assets/66da85ec-b060-4730-827a-a66d05f7e9ae)
The included files have the hardware written in System Verilog, some test benches with the assembly code, and an assembler that translates assembly code to machine code.

## Design principle
This project has created a CPU architecture based on the Minimum instruction set principle. The MIPS is designed to have 9 bits of instructions. The opcodes are floating code and all instructions are designed with Huffman encoding to make sure that our float opcode works. A MIPS instruction sheet is provided to the programmer for ease of programming. The general design principle is to optimize the performance of the CPU by reducing as much memory I/O as possible. To achieve such an effect, a register to register machine is preferred here because memory I/O is a lot slower than moving data between registers which typically takes 1 clock cycle. Thus, we want to have as many registers in this architecture as possible while still having all the basical instructions necessary to performant most of the task. I decided to have 8 registers for my architecture. There are instructions with 0, 1, and 2 registers included for ease of programming. For instance, store command `sti` is coded with 0 registers because we load and store to reg 0 by default. Reg 0 is our dedicated load and store register. 

## Register purpose
In general, register 0 is our load/store register. It is the default location where data will be loaded to and stored from when using the `ldi` and `sti` commands.
Register 1-Register 3 are our general-purpose registers. Most of the operations are done with these registers. In fact, some instruction only support operations on these lower 2-bit registers because of the limitation of our instructions' length.
Register 4-6 are typically reserved for looping variants. These are like our counter registers, usually reserved for looping only. If they are not in use by a loop, the programmer can choose to `mov` data from one register into another. Yet many arithmetic operations actually do not support these registers, so use them with caution.
Register 7 stores the flags from the ALU, like zero flag, negative flag, and carry flag. It will be updated after the ALU performs things like `cmp` or `sub`. This register will be helpful for the programmer to determine the Jumping/branching conditions if needed.

## Setup


## Results

