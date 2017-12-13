#!/usr/bin/env python3
from math import log, floor
import os
from bitstring import BitArray, BitStream
import argparse
import numpy as np
import sys
import decimal

class AdaptiveAritmeticCoder:

    def encode_file(self, input_filepath, output_filepath):
        self.init_frequencies()
        self.size = 0
        self.lp = 0
        self.up = self.M
        self.c = 0
        self.res = BitArray()
        self.done = ""
        filesize = os.path.getsize(input_filepath)
        with open(input_filepath, 'rb') as f:
            byte = f.read(1)
            while byte != b'':
                if self.size % 1000 == 0:
                    print("{0}/{1}".format(self.size, filesize))
                self.encode_integer(ord(byte))
                byte = f.read(1)
        self.res.append(bin(1))

        with open(output_filepath, 'wb') as fo:
            order = floor(log(self.size, 2)) + 1
            print(order)
            fo.write((order).to_bytes(16, byteorder="big", signed=False))
            fo.write(self.size.to_bytes(order, byteorder="big", signed=False))
            fo.write(self.res.tobytes())

        return (self.size, self.res.bin)

    def encode_integer(self, bytes_input):
        self.size += 1
        rng = int((self.up - self.lp + 1) / self.freq_sum)
        # přičteme jedničku kvůli posunutí indexu
        self.up = self.lp + rng * self.cumul_freq[bytes_input + 1] - 1
        self.lp = self.lp + rng * self.cumul_freq[bytes_input]
        self.increment_freq(bytes_input)

        # škálování
        while (self.up < self.H) or (self.lp >= self.H) or ((self.lp >= self.Q1) and (self.up < self.Q3)):
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
        with open(input_filepath, 'rb') as fo:
            order = int.from_bytes(fo.read(16), byteorder='big', signed=False)
            size = int.from_bytes(
                fo.read(order), byteorder='big', signed=False)
            encoded = fo.read(size)
            if self.k-len(encoded) > 0:
                encoded += bytes(self.k-len(encoded))
            a = BitStream(encoded)

        with open(output_filepath, 'wb') as fi:
            self.decode_stream(size, a, fi)

    def decode_stream(self, size, encoded, output_file):
        self.init_frequencies()
        j = 0
        self.lp = 0
        self.up = self.M
        x = encoded.read("uint:%s" % self.k)
        print(x)

        decoded = bytearray(self.BUF_SIZE)
        pos = 0
        read_buf = None
        pos_read_buf = 2048
        #rng = int((self.up - self.lp + 1) / self.freq_sum)
        while True:

            if (j % 1000) == 0:
                print("{0}/{1}".format(j, size))
            sym = None

            rng = int((self.up - self.lp + 1) / self.freq_sum)

            for i in range(0, 256):
               if self.cumul_freq[i] <= (x - self.lp) / rng < self.cumul_freq[i + 1]:
                   sym = i
                   break

            decoded[pos] = sym
            pos += 1
            if pos == self.BUF_SIZE:
                pos = 0
                output_file.write(decoded)
                print(x)
                print(decoded)
            j += 1
            if (j == size):
                if pos > 0:
                    output_file.write(decoded[:pos])
                break
            self.up = self.lp + rng * self.cumul_freq[sym + 1] - 1
            self.lp = self.lp + rng * self.cumul_freq[sym]
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
                    if pos_read_buf == 2048:
                        read_buf = encoded.read('bin:%d' % min(2048, encoded.len - encoded.pos))
                        pos_read_buf = 0
                    #b = encoded.read("uint:1")
                    b = int(read_buf[pos_read_buf]=='1')
                    pos_read_buf += 1
                else:
                    b = 0
                x = ((2 * (x - d)) + b) % self.M


    def init_frequencies(self):
        # inicializujeme počtu výskytu znaků
        self.freq = np.array([0] + 256 * [1])
        self.freq_sum = 256
        self.cumul_freq = np.array(list(range(0, 257)))

    def increment_cumul_from(self, i_from=1):
        # for i in range(i_from, 257):
        #    self.cumul_freq[i] += 1
        self.cumul_freq[i_from:] += 1

    def refrest_culum_freq(self):
        print("adjusting frequencies")
        acc = 0
        tmp = 0
        for i in range(1, 257):
            tmp = self.freq[i]
            if tmp > 1:
                tmp = int(tmp / 2)
                self.freq[i] = tmp
            acc += tmp
            self.cumul_freq[i] = acc
        self.freq_sum = acc

    def increment_freq(self, pos):
        self.freq_sum += 1
        # pos+1 kvůli odsazení
        self.freq[pos + 1] += 1
        self.increment_cumul_from(pos + 1)

        if self.freq_sum >= self.Q1:
            self.refrest_culum_freq()

    def __init__(self, k=16):
        self.k = k
        self.M = 2**self.k - 1

        self.Q1 = 2**(self.k-2)
        self.H = 2 * self.Q1
        self.Q3 = 3 * self.Q1

        self.BUF_SIZE = 2**10


if __name__ == '__main__':


    coder = AdaptiveAritmeticCoder(50)
    #coder.encode_file("/home/kamil/dvere.png",
    #                  "/home/kamil/dvere.png.enc")
    coder.decode_file("/home/kamil/dvere.png.enc",
                      "/home/kamil/dvere-2.png")
