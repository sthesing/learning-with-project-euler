// Copyright 2017 Stefan Thesing <software@webdings.de>
// License: WTFPL
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

// problem002

// Each new term in the Fibonacci sequence is generated by adding the previous 
// two terms. By starting with 1 and 2, the first 10 terms will be:
// 
// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
// 
// By considering the terms in the Fibonacci sequence whose values do not 
// exceed four million, find the sum of the even-valued terms.

fn main() {
    println!("Summe: {}", using_while_loop(4000000));
}

fn using_while_loop(limit:i32) -> i32 {
    let mut sum = 0;
    // Starting pair
    let mut pair = [1, 2];
    
    while pair[1] <= limit {
        // add even numbers to sum
        if pair[1] % 2 == 0 {
            sum += pair[1];
        }
        let num1 = pair[0];
        pair[0] = pair[1];
        pair[1] += num1;
    }
    // When the limit is reached, return sum
    sum    
}