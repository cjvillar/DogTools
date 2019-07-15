#!/usr/bin/python
import json
import re
import argparse
from collections import defaultdict
#from collections import defaultdict so it wont over ride.
parser = argparse.ArgumentParser(description='Given a GSE.soft file parse to HCA metadata.' )
parser.add_argument('file', type=argparse.FileType('r'), help='give a soft file.')
options = parser.parse_args()	






with args.file as f:
#why does this work and not just print (f)?
	rawSoft = f.readlines()
	init_dict = defaultdict(rawSoft)
	print(init_dict)

