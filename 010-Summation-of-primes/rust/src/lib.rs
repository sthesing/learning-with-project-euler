//! # Problem 10: Summation of Primes
//! The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
//! Find the sum of all the primes below two million.


/// Returns the sum of primes below `n`
/// # Example
/// ```
/// use problem010::sum_primes_below;
/// assert_eq!(17, sum_primes_below(10));
/// ```
/// This is a very slow implementation, however. On my computer, it takes
/// about 10 minutes to run if compiled in "debug"-Mode.
pub fn sum_primes_below(n: usize) -> usize {
    let primes = get_primes_below(n);
    let mut sum = 0;
    println!("Sum: {}", sum);
    for p in primes {
        println!("Prime: {}", p);
        sum += p;
        println!("Sum: {}", sum);
    }
    sum
}

/// Returns a vector containing the primes blow `n`
/// ## Example
/// ```
/// use problem010::get_primes_below;
/// let primes: Vec<usize> = vec![2, 3, 5, 7];
/// assert_eq!(primes, get_primes_below(10));
/// ```
pub fn get_primes_below(n: usize) -> Vec<usize> {
    let mut i = 0;
    let mut primes: Vec<usize> = vec![];
    // if n < 3, the vector remains empty
    if n == 3 {
        primes.push(2);
    } else {
        primes.push(2);
        primes.push(3);
        let max = n-1;
        while primes.last().unwrap() < &max {
            let copy = primes.clone();
            i += 1;
            println!("Still going: {}", i);
            let candidate = get_next_prime(&copy);
            if candidate >= max {
                break;
            } else {
                primes.push(candidate);
            }
        }
    }
    primes
}

fn get_next_prime(list_of_primes: &Vec<usize>) -> usize {
    // Take the last found prime, add two to find the next uneven number
    let mut current = list_of_primes.last().unwrap() + 2; 
    // If it's not prime, try the next uneven number
    while !is_prime(&current, list_of_primes) {
        current += 2;
    }
    // If it's prime, return it.
    current
}

fn is_prime(number: &usize, list_of_primes: &Vec<usize>) -> bool {
    for i in list_of_primes {
        // If the number is evenly divisibly by one of the primes we found
        // so far, it isn't prime.
        if number % i == 0 {
            return false;
        }
    }
    true
}
