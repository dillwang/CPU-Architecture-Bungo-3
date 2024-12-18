# CPU-Architecture-Bungo-3
A CPU architecture project
This project aims to create a functional 9-bit op-code CPU architecture capable of running basic programs and should also be fully programmable for a programmer using the MIPS it provides.
Because of the strict 9-bit opcode limitation, we have to be creative with many of our assembly commands to achieve most of the major functionality of a CPU while keeping the op code short. We are also limited to 8-bit wide of data stored in a register, so we have to separate a number like int into low byte and high byte if needed.

The included files have the hardware written in System Verilog, some test benches with the assembly code, and an assembler that translates assembly code to machine code.
Table of Contents

    Project Overview
    Features
    Technologies Used
    Setup
    Results
