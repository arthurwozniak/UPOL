#!/usr/bin/env Python3
from .Registers import Registers


class ASM:

    UNSAFE_REGISTERS = [Registers.RDI, Registers.RSI, Registers.RDX, Registers.RCX, Registers.R8, Registers.R9]

    def instruction(name, *args):
        code = "\t{0}\t".format(name)

        code += ", ".join(map(str, args))

        code += "\n"

        return code

    def program_directive():
        code = """    .text
            .globl main

            .type	main, @function\n"""
        return code
