#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  problem009.py
#  
#  Copyright 2013 Stefan Thesing <software@webdings.de>
#  
# License: WTFPL
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
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

# Special Pythagorean triplet
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which a²+b²=c²
# There exists exactly one Pythagorean triplet for which a+b+c=1000
# Find the product abc

# We know three things:
# 1. a<b<c
# 2. a²+b²=c²
# 3. a+b+c=1000

################
# c = 1000-a-b
# in 2:
# a² + b² = (1000 - (a+b))²
# a² + b² = 1000² - 2*1000*(a+b) + (a+b)²
# a² + b² = 1000² - 2*1000*(a+b) + (a²+2*a*b+b²)
# a² + b² = 1000² - 2000*a - 2000*b + a² + 2*a*b + b²
# 0 = 1000² - 2000*a - 2000*b + 2*a*b
# 2000*a + 2000*b = 1000² + 2*a*b
# 1000*a + 1000*b = 500000 + a*b

def collect_candidates():
    candidates = []
    
    for a in range(1,1000):
        for b in range(a+1,1000):
            if((1000*a + 1000*b) == (500000 + a*b)):
                #d = [a,b]
                candidates.append(a)
                candidates.append(b)
    #print len(candidates)
    c = 1000 - candidates[0] - candidates[1]
    candidates.append(c)
    print candidates[0]*candidates[1]*candidates[2]

def main():
    collect_candidates()

if __name__ == '__main__':
    main()
