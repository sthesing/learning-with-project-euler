/*
 * Problem001.java
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

public class Problem001 
{
    /*
 * Problem 1:
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, 
 * we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * 
 * Find the sum of all the multiples of 3 or 5 below 1000.
*/
        static int useForLoop(int limit) 
        {
            int sum =  0;
            for (int i=0; i<limit; ++i)
            {
                sum = checkAndAdd(i, sum);
            }
            return sum;
        }
        
        static int useRecursion(int limit)
        {
            return useRecursion(limit, 0, 1);
        }
        
        static int useRecursion(int limit, int sum, int number) 
        {
            if (number < limit)
            {
                sum = checkAndAdd(number, sum);
                return useRecursion(limit, sum, number+1); 
            }
            return sum;
        }
        
        static int checkAndAdd (int number, int sum)
        {
            if ((number % 3) == 0 || (number % 5) == 0) 
            {
                sum = sum + number;
            }
            return sum;
        }
        
        public static void main(String[] args)
        { 
            System.out.println("Using a for-loop:");
            System.out.println(Problem001.useForLoop(1000));
            System.out.println("Using a recursion:");
            System.out.println(Problem001.useRecursion(1000));
        }
}
