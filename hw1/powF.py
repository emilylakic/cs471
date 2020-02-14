#! /usr/bin/env python
import sys

def powF(base, pow):
    if pow == 0:
        return 1
    else:
        return (base * powF(base, pow - 1))

if len(sys.argv) != 3:
  print("%s usage: [BASE] [POWER]\n" % sys.argv[0])
  exit()
result = powF(int(sys.argv[1]),(int(sys.argv[2])))
print(result)
