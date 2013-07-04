#!/usr/bin/env python
# -*- coding: utf-8 -*-

#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                    Version 2, December 2004
#
# Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
#
# Everyone is permitted to copy and distribute verbatim or modified
# copies of this license document, and changing it is allowed as long
# as the name is changed.
#
#            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE FUCK YOU WANT TO.

import sys

def using_for_loop(limit):
    summe=0
    for i in range(1, limit):
        if not i%3 or not i%5:
            summe += i
    return summe

def using_recursion(limit, i=1, summe=0):    
    if not i%3 or not i%5:
        summe += i
    if i<limit-1:
        return using_recursion(limit, i+1, summe)
    else:
        return summe
    
def using_generator(limit):
    for i in range(1,limit):
        if not i%3 or not i%5:
            yield i

def using_ranges(limit):
    return sum(set(range(3,limit,3) + range(5,limit,5)))

def main():
    limit = 1000  
    print "This can be done in serveral ways in Python. Some examples:"
    
    print "Using a for loop:"
    print using_for_loop(limit)
    
    print "Using recursion:"
    # The standard limit of 1000 exceeds the maximum recursion depth. So let's
    # set it to the needed amount, and reset it afterwards.
    # Remember the standard setting
    recursion_limit = sys.getrecursionlimit()
    # Set to limit+1
    sys.setrecursionlimit(limit+1)
    # Do it:
    print using_recursion(limit)
    # Set back to standard setting
    sys.setrecursionlimit(recursion_limit)
    
    print "Using a generator:"
    print sum(using_generator(limit))
    
    print "Using ranges:"
    print using_ranges(limit)

if __name__ == '__main__':
    main()


