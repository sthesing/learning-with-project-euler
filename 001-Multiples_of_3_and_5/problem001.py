#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  problem001.py
#  
#  Copyright 2013 Stefan Thesing <software@webdings.de>
#  
# License: WTFPL
#
# HIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


# Problem 1:
# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

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
    return sum(set(range(0,limit,3) + range(0,limit,5)))

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


