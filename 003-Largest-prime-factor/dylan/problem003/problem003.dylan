Module: problem003
Synopsis: Solution for Problem 3 of Project Euler
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
 * Problem 3:
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143 ?
 */

define function main (name :: <string>, arguments :: <vector>)
  format-out("%d\n", largest-prime-factor(600851475143, 2));
  //format-out("%d\n", largest-prime-factor(13195 , 2));
  exit-application(0);
end function main;

define method largest-prime-factor(n :: <integer>, i :: <integer>) => (primefactor :: <integer>)
  // While the number n is divisible by our current prime factor i, we
  // keep on dividing it
  while (modulo(n, i) = 0)
    n := floor/(n , i);
  end while;
  // When it is no longer divisible, n is either 1, meaning that i is the
  // largest prime factor, or we haven't found all prime factors, yet. In that
  // case, we increment i and continue recursively.
  if (n = 1)
    i;
  else
    largest-prime-factor(n, (i + 1));
  end if;
end method;


main(application-name(), application-arguments());
