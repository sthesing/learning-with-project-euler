// Copyright 2017 Stefan Thesing <software@webdings.de>
// 
//  License: WTFPL
//  HIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
//  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
//  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
//  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
//  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
//  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
//  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


//!  Problem 1:
//!  If we list all the natural numbers below 10 that are multiples of 3 or 5, 
//!  we get 3, 5, 6 and 9. The sum of these multiples is 23.
//!  Find the sum of all the multiples of 3 or 5 below 1000.

fn using_for_loop(limit:u32) -> u32 {
    let mut summe = 0;
    for i in 1..limit+1 {
        if i % 3 == 0 || i% 5 == 0{
            summe += i;
        }
    }
    summe
}

fn using_iter_filter(limit:u32) -> u32 {
    (1..limit+1) // a range is iterable
        .filter(|x| x % 3 == 0 || x % 5 == 0 ) // only divisibles by 3 and 5
            .sum() // and sum'em up. This is the return value
}


fn main() {
    println!("Using a for-loop: {}", using_for_loop(1000));
    println!("Using a filter  : {}", using_iter_filter(1000));
}
