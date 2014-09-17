/*
 * Problem002.vala
 * 
 * Copyright 2013 Stefan Thesing <software@webdings.de>
 * License: WTFPL
 *
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */


class Problem004 : GLib.Object {
/*
 * A palindromic number reads the same both ways. The largest palindrome made 
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 * 
 * Find the largest palindrome made from the product of two 3-digit numbers.
 */

    public static bool is_product_of_two_3_digit_numbers(int number) {
        for (int divisor = 999; divisor >= 100; divisor--) {
            if (number % divisor == 0) {
                int second_divisor = number/divisor;
                if (99 < second_divisor < 1000) {
                    stdout.printf(@"Product of $(divisor) and $(second_divisor): ");
                    return true;
                }
            }
        }
        return false;
    }

    public static int next_palindrome_number(int number) {
        // OK, this is ugly. A lot of type conversions between string and int, here.
        // A string of "number"
        string s = number.to_string();
        // The front half
        string front = s[0:s.length/2];
        // The middle digit
        string middle = s[s.length/2:s.length/2+1];
        // For uneven lengths of s:
        if (s.length % 2 == 0) {
            //The middle digit has to be decreased. But let's handle a special
            //case first.
            if (int.parse(middle) == 0) {
                /*
                 * Well, if it's 0, it is set to 9. And front is decreased by 
                 * one.
                 * There is one special case, though. If front is a power of 
                 * 10. it shouldn't be decreased, because the next palindrome 
                 * number is the number with 1 fewer digit and all 9s.
                 * E.g. number is 10001
                 *      front  is 10
                 *      middle is 0
                 * The next palindrome number is 9999.
                 * So we need to check if front is a power of 10.
                 */
                if (is_power(int.parse(front),10)) {
                    // Start with an empty string
                    string r = "";
                    // Concatenate as many 9s as needed.
                    for (int i=1; i < s.length; ++i) {
                        r = r + "9";
                    }
                    // And here we have our next palindrome number.
                    return int.parse(r);
                }
                // For other cases, where front is not a power of 10, but the 
                // middle is still 0, we set it to 9 and decrease front by 1.
                middle = "9";
                front = (int.parse(front)-1).to_string();
            }
            // So, now the special cases have been handled. For everything else,
            // we just decrease middle by 1.
            middle = (int.parse(middle)-1).to_string();
            
        // Now, for even lengths of s    
        } else {
            // There is no middle, only front and tail.
            middle = "";
            // Special cases, first. (again...)
            // Is front a power of 10?
            if (is_power(int.parse(front), 10)) {
                // Let's have some 9s.
                string r = "";
                for (int i=1; i< s.length; ++i) {
                    r = r+ "9";
                }
                return int.parse(r);
            }
            // Other cases:
            // Decrease front by one
            front = (int.parse(front)-1).to_string();
        }
        // Now. We've already returned all the special cases. And we have 
        // decreased front. Now we have to mirror front to get the tail.
        // And last, we build our string by using front, middle (which might be 
        // empty) and the tail.
        string r = front + middle + front.reverse();
        // And return it as an int
        return int.parse(r);
    }
    
    public static bool is_power(int number, int base_number) {
        // First, handle the obvious cases
        // every number is a power of itself, so:
        if (number == base_number) {
            return true;
        }
        // The only number that is a power of 1 is 1. We covered that above.
        // Therefore, if the base is 1, any number that reaches this part of 
        // the program is not a power of 1.
        if (base_number == 1) {
            return false;
        }
        
        // Now the others:
        // Let's treat the base as a factor that we multiply with itself repeatedly.
        // If it number is a power of base, it will eventually equal number.  
        int factor = base_number;
        while (factor <= number) {
            if (factor == number) {
                return true;
            }
            factor = factor * base_number;
        }
        // And if not, it's not a power of base.
        return false;
    }

    public static void main (string[] args) {
         /*
          * We're supposed to find the largest palindrome number that is a 
          * product of two 3-digit numbers. Therefore, it cannot be larger than
          * 999*999 = 998001.
          * The next smallest palindrome number is 997799. That's where we start.
        */
        int number = 997799;
        // We search for the  next smaller palindrome number and we keep doing 
        // it while the result is not a product of two 3 digit numbers.
        while (!is_product_of_two_3_digit_numbers(number)) {
            number = next_palindrome_number(number);
        }
        stdout.printf(@"$(number)\n");
    }
}

