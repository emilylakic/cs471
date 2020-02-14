#! /usr/bin/env python
import sys

def powI(base, pow):
    acc = 1
    for p in range(pow):
        acc = acc * base
    return acc

if len(sys.argv) != 3:
  print("%s usage: [BASE] [POWER]\n" % sys.argv[0])
  exit()
result = powI(int(sys.argv[1]),(int(sys.argv[2])))
print(result)
