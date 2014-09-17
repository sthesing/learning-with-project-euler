#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  problem007.py
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

def is_prime(number, list_of_primes):
    for i in list_of_primes:
        # If the number is evenly divisibly by one of the primes we found
        # so far, it isn't prime.
        if number%i == 0:
            return False
    # This number is prime.
    return True

def get_next_prime(list_of_primes):
    # Take the last found prime, add two to find the next uneven number
    current = list_of_primes[-1] + 2
    # If it's not prime, try the next uneven number
    while not is_prime(current, list_of_primes):
        current += 2
    # If it's prime, return it.
    return current
    
def completely_unneccesary_ordinals_prettifier(number):
    if (number == 11 or number == 12 or number == 13) :
        suffix = 'th'
    elif (number % 10 == 1):
        suffix = 'st'
    elif (number % 10 == 2):
        suffix = 'nd'
    elif (number % 10 == 3):
        suffix = 'rd'
    else:
        suffix = 'th'
    return suffix

def main():
    # start out with the given list of the first six primes
    list_of_primes = [2, 3, 5, 7, 11, 13]
    while len(list_of_primes) != 10001:
        next_prime = get_next_prime(list_of_primes)
        print "The " + str(len(list_of_primes)+1) + completely_unneccesary_ordinals_prettifier(len(list_of_primes)+1) + " prime number is " + str(next_prime)
        list_of_primes.append(next_prime)

if __name__ == '__main__':
    main()
