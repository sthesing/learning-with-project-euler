//! # Problem 10: Summation of Primes
//! The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//! Find the sum of all the primes below two million.
use std::collections::HashMap;

/// Returns the sum of primes below `n`.
/// If the flag `opt` is set to `true`, it uses the 
/// `sieve_primes`-implementation, otherwise, it uses `sieves_primes_old`.
/// 
/// # Example
/// ```
/// use problem010::sum_sieve;
/// assert_eq!(17, sum_sieve(10, true));
/// assert_eq!(17, sum_sieve(10, false))
/// ```
pub fn sum_sieve(n: usize, opt: bool) -> usize {
    let sieve;
    if opt {
        sieve = sieve_primes(n);
    } else {
        sieve = sieve_primes_old(n);
    }
    
    let mut sum = 0;
    for prime in sieve {
        sum += prime;
    }
    sum
}

/// Returns a vector containing the primes below `n`, using a sieve of
/// Eratosthenes.
///
/// ## Example
/// ```
/// use problem010::sieve_primes_old;
/// let primes: Vec<usize> = vec![2, 3, 5, 7];
/// assert_eq!(primes, sieve_primes_old(10));
/// ```
pub fn sieve_primes_old(n: usize) -> Vec<usize> {
    // set up our list containing the numbers and
    // whether or not they're prime. Setting all to
    // true, for now
    let mut sieve = HashMap::new();
    for i in 2..n {
        sieve.insert(i, true);
    }
    
    // our result list    
    let mut primes = Vec::new();

    // The sieve
    let mut number = 2;
    while number < n {
        if *sieve.get(&number).unwrap() { // read: if it is not yet marked as false
            // write it to our result list
            primes.push(number);
            // set all multiples of number to false
            let mut i = number + number;
            while i < n {
                sieve.insert(i, false);
                i += number;
            }
        }
        if number <3 {
            number += 1;
        } else {
            number += 2;
        }
    }
    // return our result list
    primes
}

/// Returns a vector containing the primes below `n`, using a optimized 
/// sieve of Eratosthenes (suggested in pseudo-code by the euler project).
///
/// ## Example
/// ```
/// use problem010::sieve_primes;
/// let primes: Vec<usize> = vec![2, 3, 5, 7];
/// assert_eq!(primes, sieve_primes(10));
/// ```
pub fn sieve_primes(limit: usize) -> Vec<usize> {
    let crosslimit = (limit as f64).sqrt() as usize;
    let mut sieve = vec![true; limit];
    // mark even numbers > 2
    let mut n = 4;
    while n < limit { 
        sieve[n] = false;
        n +=2;
    }
    // Now, the rest
    n = 3;
    while n <= crosslimit {
        if sieve[n] { // is prime
            // mark all multiples of n false
            let mut m = n*n;
            while m < limit {
                sieve[m] = false;
                m += 2*n;
            }
        }
        n += 2;
    }
    
    let mut primes = Vec::new();
    for i in 2..limit {
        if sieve[i] {
            primes.push(i);
        }
    }
    primes
}