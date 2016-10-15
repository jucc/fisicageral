#!usr/bin/env python
# -*- coding: utf-8 -*-

import numpy as np
from scipy.stats import mode

#2.5.1

collections = [
   [34,29,26,37,31],
   [34,29,26,37,31,34],
   [5,8,12,3,9],
   [3,6,4,7,9,8],
   [14,19,16,21,18,19,24,15,19],
   [6,7,7,3,8,5,3,9],
   [500,600,800,800,500,900,900,900,900,1100]]

for col in collections:
   a = np.array(col)
   if mode(a)[1] > 1.0:
      print "mode:   ", int(mode(a)[0])
   print "avg:    ", np.average(a)
   print "median: ", np.median(a)
   print "meandv: ", np.average([abs(x - np.average(a)) for x in a])
   print "stdv:   ", np.std(a)      
   print "-"*17


#2.5.2

nums = np.array([94,86,84,87,73,88,82,92,84,81,92,51,78,82,73,76,65,85,67,61,78,74,75,76,72,64,70,72,75,62,65,62,71,57,66,64,73,51,50,58,66,60,73,61,51,76,61,70,63,52,63,48,71,59,55,61,47,55,55,40,53,38,41,49,35,34,52,50,43,44,39,35,35,44,36,20,27,38,38,52])

print np.histogram(nums, bins=[20,30,40,50,60,70,80,90,100])

print np.average(nums)
print mode(nums)[0]
print np.median(nums)
print np.std(nums)
