#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  problem005.py
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

def main():
    print smallest_multiple(1,20)

def prime_factors(n, i=2, factors=None):
    factors = factors or []
    if n==1:
        return factors
    if(n%i==0):
        factors.append(i)
        n = n/i
        return prime_factors(n, i, factors)
    else:
        return prime_factors(n, i+1, factors)

def multiply(list_of_numbers):
    product = 1
    for i in list_of_numbers:
        product *= i
    return product

def smallest_multiple(startnumber,stopnumber):
    l = []
    for divisor in range(stopnumber, startnumber, -1):
        p_of_divisor = prime_factors(divisor, i=2, factors=[])
        for prime in p_of_divisor:
            # Check if the needed prime factors are contained in l
            while l.count(prime) < p_of_divisor.count(prime):
                l.append(prime)
    # multiply all elements of l
    return multiply(l)

if __name__ == '__main__':
    main()


