import glob
from tabulate import tabulate
from texttable import Texttable
import latextable
import matplotlib.pyplot as plt
import numpy as np
from itertools import groupby
import sys

def ReadFiles(d):
    jpgFilenamesList = glob.glob(d)
    #print(jpgFilenamesList)
    ress = []
    txts = []
    for fn in jpgFilenamesList:
      fp = open(fn, 'r')
      txt = fp.readlines()
      res = [sub.split() for sub in txt ]
      ress.append(res)
      txts.append(txt)

    #print(list(zip(ress,txts)))
    return txt

def remove_comments(data):
    nl = []
    for l in data:
        if(l[0] != "#"):
            nl.append(l)
    return nl

arg = sys.argv
f = ReadFiles(arg[1])
clean = remove_comments(f)
done = "".join(clean)
print(done)
