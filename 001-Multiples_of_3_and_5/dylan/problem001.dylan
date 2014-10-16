Module: problem001
Synopsis: Solution for Problem 1 of Project Euler
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


 /*Problem 1:
 If we list all the natural numbers below 10 that are multiples of 3 or 5,
 we get 3, 5, 6 and 9. The sum of these multiples is 23.

 Find the sum of all the multiples of 3 or 5 below 1000.*/

define function main (name :: <string>, arguments :: <vector>)
  format-out("Recursively counting up to the limit, using modulo:\n");
  format-out("%d\n", sum-multiples-of-3-5(1,0,1000));
  format-out("Using ranges:\n");
  format-out("%d\n", sum-multiples-of-two-numbers(3, 5, 1000));
  exit-application(0);
end function main;

define method sum-multiples-of-3-5 (i :: <integer>, sum :: <integer>, limit :: <integer>) => (sum :: <integer>)
  case
    (i = limit) => sum;
    (modulo(i, 3) = 0) => sum-multiples-of-3-5((i + 1), (i + sum), limit);
    (modulo(i, 5) = 0) => sum-multiples-of-3-5((i + 1), (i + sum), limit);
    otherwise => sum-multiples-of-3-5((i + 1), sum, limit);
  end case
end method;

// Let's try something more general and more fuctional
define method sum-multiples-of-two-numbers(number1 :: <integer>, number2 :: <integer>, limit :: <integer>) => (sum :: <integer>)
  reduce(method(x, y) x + y end, 0, union(range(from: number1, to: (limit - 1), by: number1), range(from: number2, to: (limit - 1), by: number2)));
  //Same code, but slightly better to read:
  /*
  let r = range(from: number1, to: (limit - 1), by: number1);
  let r2 = range(from: number2, to: (limit - 1), by: number2);
  reduce(method(x, y) x + y end, 0, union(r, r2));
  */
end method;

main(application-name(), application-arguments());
