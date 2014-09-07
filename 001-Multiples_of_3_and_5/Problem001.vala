/*
 * Problem001.vala
 * 
 * Copyright 2013 Stefan Thesing <software@webdings.de>
 * License: WTFPL
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


class Problem001 : GLib.Object {

    static int useForLoop(int limit) 
    {
        int sum =  0;
        for (int i=0; i<limit; ++i)
        {
            sum = checkAndAdd(i, sum);
        }
        return sum;
    }
        
    static int useRecursion(int limit, int sum=0, int number=1) 
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

    public static int main(string[] args) {
        int result = useForLoop(1000);
        stdout.printf (@"Using a for-loop: $result\n");
        result = useRecursion(1000);
        stdout.printf (@"Using a recursion: $result\n");
        return 0;
    }
}
