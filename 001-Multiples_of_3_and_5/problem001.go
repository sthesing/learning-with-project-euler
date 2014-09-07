 /*
 * problem001.go
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

package main

import (
    "fmt"
)

func use_for_loop(limit int) int {
    sum := 0
    for i := 0; i < limit; i++ {
        sum = check_and_add(i, sum)
    }
    return sum
}

func use_recursion(limit, sum, number int) int {
    if number < limit {
        sum = check_and_add(number, sum)
        return use_recursion(limit, sum, number+1)
    }
    return sum
}

func check_and_add(number int, sum int) int {
    if number % 3 == 0 || number % 5 == 0 {
        sum = sum + number
    }
    return sum
}

func main() {
    fmt.Println("Using a for-loop: ", use_for_loop(1000))
    fmt.Println("Using recursion: ", use_recursion(1000, 0, 1))
}
