/*
 * problem002.js
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

/*
 * Each new term in the Fibonacci sequence is generated by adding the previous 
 * two terms. By starting with 1 and 2, the first 10 terms will be:
 * 
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 * 
 * By considering the terms in the Fibonacci sequence whose values do not 
 * exceed four million, find the sum of the even-valued terms.
*/

/* Global limit */
var limit = 4000000;

/* Using a while loop */
var using_while_loop = function () {
    var sum = 0;
    /* The starting pair as definde in the problem */
    pair = [1,2];
    /* Continue while the second number doesn't exceed our limit. */
    while (pair[1] <= limit) {
        /* Check if the second number is even. 
         * Please note: The very first number (1 in our case) is not checked.
         * If you want to use this for summing up the even numbers in a 
         * fibonacci sequence that doesn't start with 1, you'll have to change 
         * this code. */
        if (pair[1] % 2 === 0) {
            /* Sum it up. */
            sum = sum + pair[1];
        }
        /* Make the next pair and continue. */
        pair = make_next_fibonacci_pair(pair[0], pair[1]);
    }
    /* When the limit is reached, return the result. */
    return sum;
};

/* Using recursion */
var using_recursion = function (args) {
    /* Passed arguments or default values */
    pair    = arguments[0] || [1,2];
    sum     = arguments[1] || 0;
    /* If the second number exceeds the limit, we're done. Return the result. */
    if(pair[1] > limit) {
        return sum;
    } else {
        /* Still work to do? Alright...
         * Let's add the second number to the sum, if it's even.
         * Please note: The very first number (1 in our case) is not checked.
         * If you want to use this for summing up the even numbers in a 
         * fibonacci sequence that doesn't start with 1, you'll have to change 
         * this code. */
        if (pair[1] % 2 === 0) {
            sum = sum + pair[1];
        }
        /* Continue the recursion with the next pair and the updated sum. */
        return using_recursion(make_next_fibonacci_pair(pair[0], pair[1]), sum);
    }
};

var make_next_fibonacci_pair = function (summand1, summand2) {
    return [summand2, summand1+summand2];
};

console.log("Using a while loop:");
console.log(using_while_loop());
console.log("Using a recursion:");
console.log(using_recursion());
