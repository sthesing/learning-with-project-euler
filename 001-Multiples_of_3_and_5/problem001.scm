; problem001.scm
;
; Copyright 2014 Stefan Thesing <software@webdings.de>
;
; License: WTFPL
;
; HIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
; LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
; A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
; OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
; SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
; LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
; THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
; Problem 1:
; If we list all the natural numbers below 10 that are multiples of 3 or 5,
; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;
; Find the sum of all the multiples of 3 or 5 below 1000.

; Hm... I'm not sure whether I like the lambda-notation or the simple notation better...
; Just a matter of style and convenience, here, if I get it right.

;(define find-multiples-35
;    (lambda (i sum n)
;      (cond
;        [(= i n) sum]
;        [(zero? (modulo i 3)) (find-multiples-35 (+ i 1) (+ i sum) n)]
;        [(zero? (modulo i 5)) (find-multiples-35 (+ i 1) (+ i sum) n)]
;        [else (find-multiples-35 (+ i 1) sum n)]
;      )
;    )
;)

(define (find-multiples-35 i sum n)
      (cond
        [(= i n) sum]
        [(zero? (modulo i 3)) (find-multiples-35 (+ i 1) (+ i sum) n)]
        [(zero? (modulo i 5)) (find-multiples-35 (+ i 1) (+ i sum) n)]
        [else (find-multiples-35 (+ i 1) sum n)]
      )
)

(display (find-multiples-35 1 0 1000))
(newline)
