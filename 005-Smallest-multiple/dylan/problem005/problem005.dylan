Module: problem005
Synopsis: Solution for Problem 5 of Project Euler
Author: Stefan Thesing <software@webdings.de>
Copyright: (c) 2014; License: WTFPL

/* License: WTFPL

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*/

 /*
  * Problem 5:
  * 2520 is the smallest number that can be divided by each of the numbers from
  * 1 to 10 without any remainder.
  * What is the smallest positive number that is evenly divisible by all of the
  * numbers from 1 to 20?
  */

define function main (name :: <string>, arguments :: <vector>)
  //format-out("%s\n", prime-factors(20));
  format-out("%d\n", smallest-multiple(1, 20));
  exit-application(0);
end function main;

define method smallest-multiple(startnumber :: <integer>, stopnumber :: <integer>) => (product :: <integer>)
  let l = list();
  for (divisor from stopnumber to startnumber by -1)
    let factors-of-divisor :: <list> = prime-factors(divisor);
    for (prime in factors-of-divisor)
      while (count(prime, l) < count(prime, factors-of-divisor))
        l := add(l, prime);
      end while;
    end for;
  end for;
  reduce(\*, 1, l);
end method;

define method prime-factors(n :: <integer>, #key i :: <integer> = 2, factors :: <list> = list()) => (factors :: <list>)
  case
    (n = 1)
      => factors;
    (modulo(n, i) = 0)
      => prime-factors(floor/(n, i), i: i, factors: add(factors, i));
    otherwise
      => prime-factors(n, i: (i + 1), factors: factors);
  end case;
end method;

define method count(number :: <integer>, l :: <list>) => (count :: <integer>)
  size(choose(method(x) x = number end, l));
end method;

main(application-name(), application-arguments());
