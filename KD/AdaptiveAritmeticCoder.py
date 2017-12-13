#!/usr/bin/env python3
from math import log, floor
import os
from bitstring import BitArray, BitStream
import sys


class AdaptiveCoder:

    def encode_file(self, input_filepath, output_filepath):
        """Kódování souboru"""
        self.init_frequencies()
        self.size = 0
        self.lp = 0
        self.up = self.M
        self.c = 0
        self.res = BitArray()
        filesize = os.path.getsize(input_filepath)
        with open(input_filepath, 'rb') as f:
            # Soubor čtu po bytech, výstupní kod se průběžne ukládá do self.res
            byte = f.read(1)
            while byte != b'':
                if self.size % 1000 == 0:
                    print("{0}/{1}".format(self.size, filesize))
                self.encode_integer(ord(byte))
                byte = f.read(1)
        self.res.append(bin(1))

        with open(output_filepath, 'wb') as fo:
            order = floor(log(self.size, 2)) + 1
            fo.write((order).to_bytes(16, byteorder="big", signed=False))
            fo.write(self.size.to_bytes(order, byteorder="big", signed=False))
            fo.write(self.res.tobytes())

        return (self.size, self.res.bin)

    def encode_integer(self, character):
        """ Kodování znaku v modelu"""
        self.size += 1

        # přičteme jedničku kvůli posunutí indexu
        new_up = self.lp + ((self.up - self.lp + 1) *
                            self.cumul_freq[character + 1]) // self.cumul_freq[self.symbols] - 1
        new_lp = self.lp + ((self.up - self.lp + 1) *
                            self.cumul_freq[character]) // self.cumul_freq[self.symbols]
        self.up = new_up
        self.lp = new_lp
        #print(self.up, self.lp)
        # print(self.M)
        self.increment_freq(character)

        if self.up < self.lp:
            print(self.size)
            raise Exception("Lower bound is bigger than upper.")
        # škálování
        while (self.up < self.H) or (self.lp >= self.H) or ((self.lp >= self.Q1) and (self.up < self.Q3)):
            d = 0
            #print((self.lp, self.up))
            if ((self.lp >= self.Q1) and (self.up < self.Q3)):
                self.c += 1
                d = self.Q1
            else:
                if self.up < self.H:
                    b = 0
                    d = 0
                else:
                    b = 1
                    d = self.H
                self.res.append(bin(b))
                while self.c > 0:
                    self.res.append(bin(not(b)))
                    self.c -= 1
            self.lp = 2 * (self.lp - d)
            self.up = 2 * (self.up - d) + 1

    def decode_file(self, input_filepath, output_filepath):
        """ Dekódování souboru"""
        self.init_frequencies()
        self.lp = 0
        self.up = self.M
        with open(input_filepath, 'rb') as fo:
            order = int.from_bytes(fo.read(16), byteorder='big', signed=False)
            size = int.from_bytes(
                fo.read(order), byteorder='big', signed=False)
            encoded = fo.read()
            if self.k - len(encoded) > 0:
                "Doplnění nulových bytů"
                encoded += bytes(self.k - len(encoded))
            a = BitStream(encoded)

        with open(output_filepath, 'wb') as fi:
            self.decode_stream(size, a, fi)

    def decode_stream(self, size, encoded, output_file):
        """Dekódování streamu"""
        j = 0
        x = encoded.read("uint:%s" % self.k)
        decoded = bytearray(self.BUF_SIZE)
        pos = 0
        while True:

            if (j % 1000) == 0:
                print("{0}/{1}".format(j, size))
            sym = None

            # kumulativní četnost x
            c = (self.cumul_freq[self.symbols] *
                 (x - self.lp + 1)) // (self.up - self.lp + 1)
            # hledání intervalu, kam patří x
            # for i in range(0, self.symbols):
            #     low = self.cumul_freq[i]
            #     high = self.cumul_freq[i + 1]
            #     if low <= c < high:
            #         sym = i
            #         break

            # optimálnější hledání intervalu
            u = 0
            v = self.symbols - 1
            while u <= v:
                s = (u + v) // 2
                low = self.cumul_freq[s]
                high = self.cumul_freq[s + 1]
                if low <= c < high:
                    sym = s
                    break
                if c < low:
                    v = s - 1
                else:
                    u = s + 1

            # Chyba, kumulativní četnost x nezařazena
            if sym is None:
                print("(lp, up) : (%s, %s)" % (self.lp, self.up))
                print("Current position: %s" % j)
                print("x value: %s" % x)
                print("X cumulative value: %s" % c)
                tmp = self.cumul_freq[self.symbols] * \
                    (x - self.lp + 1) / (self.up - self.lp + 1)
                print("X unrounded cumulative value: %s" % tmp)
                print(self.cumul_freq)
                raise Exception("Symbol not found")

            # symbol do bufferu
            decoded[pos] = sym
            pos += 1
            # vyprázdnění bufferu
            if pos == self.BUF_SIZE:
                pos = 0
                output_file.write(decoded)
            j += 1
            if (j == size):
                if pos > 0:
                    output_file.write(decoded[:pos])
                break

            new_up = self.lp + \
                ((self.up - self.lp + 1) *
                 self.cumul_freq[sym + 1]) // self.cumul_freq[self.symbols] - 1
            new_lp = self.lp + \
                ((self.up - self.lp + 1) *
                 self.cumul_freq[sym]) // self.cumul_freq[self.symbols]
            self.lp = new_lp
            self.up = new_up
            self.increment_freq(sym)

            #print((self.lp, self.up))
            # škálování
            while (self.up < self.H) or (self.lp >= self.H) or ((self.lp >= self.Q1) and (self.up < self.Q3)):
                if ((self.lp >= self.Q1) and (self.up < self.Q3)):
                    d = self.Q1
                else:
                    if self.up < self.H:
                        d = 0
                    else:
                        d = self.H
                self.lp = 2 * (self.lp - d)
                self.up = 2 * (self.up - d) + 1

                if encoded.pos < encoded.len:
                    b = encoded.read("uint:1")
                else:
                    b = 0
                x = ((2 * (x - d)) + b)

                if not (0 <= x < self.M):
                    raise Exception("Variable x is out of range: %s" % x)

    def init_frequencies(self):
        # inicializujeme počtu výskytu znaků
        self.freq = [0] + self.symbols * [1]
        self.cumul_freq = list(range(0, 257))

    def increment_cumul_from(self, i_from=1):
        for i in range(i_from, 257):
            self.cumul_freq[i] += 1

    def refrest_cumul_freq(self):
        print("adjusting frequencies")
        acc = 0
        tmp = 0
        for i in range(1, 257):
            tmp = self.freq[i]
            if tmp > 1:
                tmp = tmp // 2
                self.freq[i] = tmp
            acc += tmp
            self.cumul_freq[i] = acc

    def increment_freq(self, pos):
        """ Inkrementace frekvence výskytu symbolu"""
        # pos+1 kvůli g_{i-1}, na nultém indexu je vždy nula
        self.freq[pos + 1] += 1
        self.increment_cumul_from(pos + 1)

        # Ošetření P_min
        if self.cumul_freq[self.symbols] == self.Q1:
            self.refrest_cumul_freq()

    def __init__(self, k=32):
        # Inicializace parametrů kodéru
        self.k = k
        self.M = 2**self.k - 1
        self.symbols = 256

        self.Q1 = 2**(self.k - 2)
        self.H = 2 * self.Q1
        self.Q3 = 3 * self.Q1

        # Velikost bufferu pro zápis, nutno optimalizovat
        self.BUF_SIZE = 2**10


def print_help():
    help = """Invalid arguments. Usage: coder.py [c/d] input_file output_file"""
    print(help)


if __name__ == '__main__':
    args = sys.argv
    coder = AdaptiveCoder(32)
    if(len(args) != 4):
        print(len(args))
        print_help()
        sys.exit(0)
    if (args[1].lower() == "c"):
        coder.encode_file(args[2], args[3])
    elif (args[1].lower() == "d"):
        coder.decode_file(args[2], args[3])
    else:
        print_help()
