//! # Problem 10: Summation of Primes
//! The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//! Find the sum of all the primes below two million.
use std::collections::HashMap;

/// Returns the sum of primes below `n`
/// # Example
/// ```
/// use problem010::sum_sieve;
/// assert_eq!(17, sum_sieve(10));
/// ```
pub fn sum_sieve(n: usize) -> usize {
    let sieve = sieve_primes(n);
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
/// use problem010::sieve_primes;
/// let primes: Vec<usize> = vec![2, 3, 5, 7];
/// assert_eq!(primes, sieve_primes(10));
/// ```
pub fn sieve_primes(n: usize) -> Vec<usize> {
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
