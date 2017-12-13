#!/usr/bin/env python3
from collections import Counter
from math import log, ceil
import sys
from bitstring import BitArray

class AdaptiveCoder:

    def encode_integer(self, bytes_input):

        if type(bytes_input) != bytes:
            raise Exception("Input must be bytes-array")

        #freq = Counter(text)
        #text = str.encode(text)
        #text += str.encode(self.breaker)
        #text = str.encode(text)
        self.init_frequencies()
        size = 0
        lp = 0
        up = self.M
        c = 0
        res = BitArray()
        done = ""
        print(self.freq)
        print(self.cumul_freq)
        for a in bytes_input:
            done += chr(a)
            print(done)
            size += 1
            print("char: %s" % a)
            rng = int((up - lp + 1) / self.freq_sum)
            # přičteme jedničku kvůli posunutí indexu
            up = lp + rng * self.cumul_freq[a+1] - 1
            lp = lp + rng * self.cumul_freq[a]
            self.increment_freq(a)
            print("rng: %s" % rng)
            print((lp, up))

            # škálování
            while (up < self.H) or (lp >= self.H) or ((lp >= self.Q1) and (up < self.Q3)):
                print("scaling")
                if ((lp >= self.Q1) and (up < self.Q3)):
                    c += 1
                    d = self.Q1
                else:
                    if up < self.H:
                        b = 0
                        d = 0
                    else:
                        b = 1
                        d = self.H
                    res.append(bin(b))
                    while c > 0:
                        res.append(bin(not(b)))
                        c -= 1
                lp = 2 * (lp - d)
                up = 2 * (up - d) + 1
            #res <<= 1
            #res += 1
            print((lp, up))
            print("----")
        res.append(bin(1))
        return (size, res.bin)

    def decode_integer(self, size, encoded):
        print("decoding: %s" % encoded)
        self.init_frequencies()
        decoded = bytearray()
        j = 0
        lp = 0
        up = self.M
        read_limit = self.k
        if read_limit > len(encoded):
            encoded += (read_limit-len(encoded))*'0'
        x = encoded[:read_limit]
        x = int(x, 2)
        #rng = int((up - lp + 1) / self.freq_sum)
        while j < size:
            print("x: %s" % x)
            sym = None
            # print(prev)
            rng = int((up - lp + 1) / self.freq_sum)
            print("c: %s" % int((x - lp) / rng))
            print(self.cumul_freq)
            #print("search")
            #print(int((x - lp) / rng))
            #print((lp, up))
            for i in range(0, 256):
                if self.cumul_freq[i] <= (x - lp) / rng < self.cumul_freq[i+1]:
                    sym = i
                    break
            #print(sym)
            print(sym)
            print("decoded: %s" % chr(sym))
            #print(sym)
            decoded.append(sym)
            j += 1
            if (j==size):
                break
            up = lp + rng * self.cumul_freq[sym+1] - 1
            lp = lp + rng * self.cumul_freq[sym]
            self.increment_freq(sym)
            print((lp, up))
            # škálování
            while (up < self.H) or (lp >= self.H) or ((lp >= self.Q1) and (up < self.Q3)):
                if ((lp >= self.Q1) and (up < self.Q3)):
                    d = self.Q1
                else:
                    if up < self.H:
                        d = 0
                    else:
                        d = self.H
                lp = 2 * (lp - d)
                up = 2 * (up - d) + 1

                try:
                    b = int(encoded[read_limit], 2)
                except:
                    b = 0
                read_limit += 1
                print("scaled")
                print((lp,up))
                x = ((2 * (x - d)) + b) % self.M
                print("x: %s" % x)
            print(decoded)
        print(decoded)
        return decoded

    def init_frequencies(self):
        # inicializujeme počtu výskytu znaků
        self.freq = [0] + 256 * [1]
        self.freq_sum = 256
        self.cumul_freq = list(range(0, 257))

    def increment_cumul_from(self, i_from=1):
        for i in range(i_from, 257):
            self.cumul_freq[i] += 1

    def refrest_culum_freq(self):
        print("adjusting frequencies")
        acc = 0
        for i in range(1, 257):
            tmp = self.freq[i]
            if tmp > 1:
                tmp /= 2
                self.freq[i] = tmp
            acc += tmp
            self.freq[i] = acc


    def increment_freq(self, pos):
        self.freq_sum += 1
        # pos+1 kvůli odsazení
        self.freq[pos+1] += 1
        self.increment_cumul_from(pos+1)
        if self.freq_sum >= self.Q1:
            self.refrest_culum_freq()

    def get_prob(self, index):
        return int(self.cumul_freq[index] / self.freq_sum)




    def __init__(self, k=32):
        self.k = k
        self.M = 2**self.k - 1

        self.Q1 = (self.M + 1) / 4
        self.H = 2 * self.Q1
        self.Q3 = 3 * self.Q1


if __name__ == '__main__':
    coder = AdaptiveCoder(32)
    size, enc = coder.encode_integer('Kamil Hanus'.encode())
    print(enc)
    res = coder.decode_integer(size, enc)
    print(res.decode('utf-8'))
