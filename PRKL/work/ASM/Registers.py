#!/usr/bin/env Python3

from enum import Enum

class Registers(Enum):
    RAX = "%rax"
    RBX = "%rbx"
    RCX = "%rcx"
    RDX = "%rdx"
    RBP = "%rbp"
    RSI = "%rsi"
    RDI = "%rdi"
    RSP = "%rsp"
    R8  = "%r8"
    R9  = "%r9"
    R10 = "%r10"
    R11 = "%r11"
    R12 = "%r12"
    R13 = "%r13"
    R14 = "%r14"
    R15 = "%r15"

    def __str__(self):
        return str(self.value)

    def dereference(self):
        return "({0})".format(self.value)