/*
 * Problem003.vala
 * 
 * Copyright 2014 Stefan Thesing <software@webdings.de>
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
 
/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 * What is the largest prime factor of the number 600851475143 ?
 */
 
class Problem003 : GLib.Object {
    
    public static int largestPrimeFactor(int64 number) {
        // We start with 2
        int i = 2;
        // Oh, and for numbers smaller than 2, we don't even start!
        while (number > 1) {
            // While the number is divisible by our current prime factor, we
            // keep on dividing it
            while (number % i == 0) {
                number = number / i;
            }
            // Next, we check whether we have reached 1 yet. If so, we're done.
            if (number == 1) {
                return i;
            }
            // If not, we'll increment the divisor and keep on.
            ++i;
        }
        return 0;
    }
    
    public static void main (string[] args) {
        stdout.printf(@"$(largestPrimeFactor(600851475143)).\n");
    }
}
