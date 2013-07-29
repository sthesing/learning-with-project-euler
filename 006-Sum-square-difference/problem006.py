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
    number = 100
    print sum_square_difference(number)
    print use_formulae(number)

def sum_square_difference(number):
    return square_of_sums(number) - sum_of_squares(number)

def square_of_sums(number):
    n = 0
    for i in range(1, number+1):
        n += i
    return n*n

def sum_of_squares(number):
    n=0
    for i in range(1, number+1):
        n += i*i
    return n

def use_formulae(number):
    sumofsquares = pow(number,2) * pow(number+1,2) * 1/4
    squareofsums = number * (number+1) * (2*number+1) * 1/6
    return sumofsquares - squareofsums

if __name__ == '__main__':
    main()
