
import os

# record the current state of the interpreter,
# so we can clean up after ourselves later
orig_globals = set(globals())



########## Syntax Completion ##########

import readline
import rlcompleter
readline.parse_and_bind("tab: complete")


########## Command History ##########

import atexit

history_file = os.path.join(os.environ["HOME"], ".python_history")

# using default arg instead of closure, so we can delete the global
# and leave no trace
def save_history(history_file=history_file):
    import readline
    readline.write_history_file(history_file)

atexit.register(save_history)

# load the current history
if os.path.exists(history_file):
    readline.read_history_file(history_file)


########## Cleanup ##########

# clean up all globals we just made/brought into scope
# after this, you will have to clean up your own garbage
for var in set(globals()).difference(orig_globals):
    del globals()[var]
del var


########## Things I always want access to ##########

from math import *

# bring in pretty print
# in python >= 3, make pprint the default
from pprint import pprint
from sys import version_info
if version_info.major >= 3:
    exec("print = pprint") # string prevents syntax error in python 2
del version_info

def cls():
    os.system("clear")
