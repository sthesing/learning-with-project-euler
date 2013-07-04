/*
 * problem001.js
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

var using_for_loop = function (limit) {
    var sum = 0;
    for (var number = 1; number < limit; number++) {
        if ((number % 3 === 0 ) || (number % 5 === 0)){
            sum = sum + number;
        }
    }
    return sum;
};

var using_recursion = function (args) {
    var limit = arguments[0];
    var number = arguments[1] || 1 ;
    var sum = arguments[2] || 0;
    if ((number % 3 === 0) || (number % 5 === 0)) {
        sum = sum + number;
    }
    if (number >= limit) {
        return sum;
    } else {
        return using_recursion(limit, number+1, sum);
    }
};

console.log(using_for_loop(1000));
console.log(using_recursion(1000));
