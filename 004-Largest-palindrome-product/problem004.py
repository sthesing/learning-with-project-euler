#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#  problem004.py
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
    # We're supposed to find the largest palindrome number that is a product of
    # two 3-digit numbers. Therefore, it cannot be larger than than 999*999 = 998001.
    # The next smallest palindrome number is 997799. That's where we start.
    number = 997799
    while not (is_product_of_two_3_digit_numbers(number)):
        number = find_next_palindrome_number(number)
    print number
    
def is_product_of_two_3_digit_numbers(number):
    for divisor in range(999,100,-1):
        if not number % divisor:
            second_divisor = number/divisor
            if (99 < second_divisor < 1000):
                print "Product of " + str(divisor) + " and " + str(second_divisor)
                return True
    return False

def find_next_palindrome_number(number):
    # OK, this is ugly. A lot of type conversions between string and int, here.
    # A string of "number"
    s = str(number)
    # The Front half
    front = int(s[0:len(s)/2])
    # For uneven length of s:
    if (len(s)%2):
        # The middle digit has to be decreased
        middle = int(s[len(s)/2])
        # But if it is zero 
        if middle == 0:
            # It becomes a 9 and front is decreased by one.
            # There is one special case, though. If front is a power of 10. it
            # shouldn't be decreased, because the next palindrome number is
            # the number with 1 fewer digit and all 9s.
            # E.g. number is 10001
            #      front  is 10
            #      middle is 0
            # The next palindrome number is 9999.
            if is_power(front, 10):
                r = ''
                for i in range(len(s)-1):
                    r += '9'
                return int(r)
            middle = 9
            front = front -1
        else:
            middle = middle -1
    else:
        middle = ''
        if is_power(front, 10):
            r = ''
            for i in range(len(s)-1):
                r += '9'
            return int(r)
        front = front -1
    front = str(front)
    back = front[::-1]
    return int(front + str(middle) + back)
        
def is_power(number, base): 
    # Handle the obvious cases
    # Every number is a power of itself, so:
    if number == base:
        return True
    # The only number that is a power of 1 is 1. We covered that
    # above. So if the base is 1, the number obviously is not a power of 1.
    if base == 1:
        return False
    
    # Now the others:
    # Let's treat the base as a factor that we multiply with itself repeatedly.
    # If it number is a power of base, it will eventually equal number.   
    factor = base

    while (factor <= number):
        if factor == number:
            return True
        factor *= base
    return False

if __name__ == '__main__':
    main()


