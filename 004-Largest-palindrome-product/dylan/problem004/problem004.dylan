Module: problem004
Synopsis: Solution for Problem 4 of Project Euler
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
 * Problem 4:
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

define function main (name :: <string>, arguments :: <vector>)
  format-out("%d\n", find-largest-palindrome());
  exit-application(0);
end function main;

define method palindrome?(n :: <integer>) => (wellisistornot :: <boolean>)
  n = mirror(n);
end method;

define method mirror(n :: <integer>) => (mirror-n :: <integer>)
  let mirror-n :: <integer> = 0;
  while (n > 0)
    mirror-n := 10 * mirror-n + modulo(n, 10);
    n := floor/(n, 10);
  end while;
  mirror-n;
end method;

define method find-largest-palindrome() => (largest-palindrome :: <integer>)
  let largest-palindrome :: <integer> = 0;
  let a :: <integer> = 999;
  let b :: <integer> = 0;
  while (a >= 100)
    b := 999;
    while (b >= a)
      if (a * b <= largest-palindrome)
        break;
      elseif (palindrome?(a * b))
        largest-palindrome := a * b;
      end if;
      b := b - 1;
    end while;
    a := a - 1;
  end while;
  largest-palindrome;
end method;

main(application-name(), application-arguments());
