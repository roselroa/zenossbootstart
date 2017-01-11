#!/usr/bin/python

import random
import os
import os.path

# check if static value exists in /var/tmp/gen_random_value
# this is good for testing if the zenoss server is able to access the script.

stat_file='/var/tmp/gen_random_value'

if os.path.isfile(stat_file) and os.access(stat_file,os.R_OK):
	f_n=open(stat_file,'r')
	raw=f_n.readline()
	f_n.close()
	gen_value=int(raw)
else:
	gen_value=random.randint(1,100)
	
print "OK|random=%s"%(gen_value)
