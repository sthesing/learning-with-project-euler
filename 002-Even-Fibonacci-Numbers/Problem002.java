/*
 * Problem002.java
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


public class Problem002 {   

    public static int[] makeNextFibonacciPair()
    {
        return makeNextFibonacciPair(1,2);
    }
    
    public static int[] makeNextFibonacciPair(int number1, int number2)
    {
        return new int[]{number2, number2+number1};
    }
    
    /* Using a while loop */
    public static int usingWhileLoop(int limit)
    {
        int sum = 0;
        /* The starting pair as defined in the problem */
        int[] pair = {1, 2};
        /* Continue while the second number doesn't exceed our limit. */
        while (pair[1] <= limit)
        {
            if (pair[1] % 2 == 0) 
            {
                /* Sum it up. */                
                sum = sum + pair[1];
            }
            /* Make the next pair and continue. */
            pair = makeNextFibonacciPair(pair[0], pair[1]);
        }
        /* When the limit is reached, return the result. */
        return sum;
    }   
    
    public static void main (String args[]) {
        System.out.println(usingWhileLoop(4000000));
    }
}

