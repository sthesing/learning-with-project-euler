//!
//! # Problem 5:
//! 2520 is the smallest number that can be divided by each of the numbers from
//! 1 to 10 without any remainder.
//! What is the smallest positive number that is evenly divisible by all of the
//! numbers from 1 to 20?

/// Finds the smallest positive number that is divisible by all the numbers
/// between `n1` and `n2`
///
/// # Example
/// ```
/// use problem005::find_smallest_multiple;
/// assert_eq!(2520, find_smallest_multiple(1, 11));
/// ```
pub fn find_smallest_multiple(n1: u32, n2: u32) -> u32 {
    let mut smallest_multiple = 1;
    let mut factors = Vec::new();
    for number in n1..n2 {
        let p_of_divisor = get_prime_factors(number);
        for prime in &p_of_divisor {
            //How often do we need this prime?
            let needed = count_occurrences(&prime, &p_of_divisor);
            //How often do we have this prime?
            let have = count_occurrences(&prime, &factors);
            // We're dealing with usize here, so we're using checked_sub to 
            // prevent a negative number as a result of `needed - have`
            let mut diff = needed.checked_sub(have).unwrap_or(0);
            while diff > 0 {
                    factors.push(prime.clone());
                    diff -= 1;
            }
        }
    }

    // multiply all the prime factors with each other
    for prime in factors {
        smallest_multiple *= prime;
    }
    smallest_multiple
}

fn count_occurrences(n: &u32, v: &Vec<u32>) -> usize {
    let filtered: Vec<&u32> = v.into_iter().filter(|&x| x == n).collect();
    filtered.len()
}

/// Returns a Vec<u32> containing the prime factors of a number `n`.
/// This list includes duplicates. So if you multiply all the numbers in the
/// list, you get `n`.
///
/// # Example
/// ```
/// use problem005::get_prime_factors;
/// let mut f: Vec<u32> = vec![2, 2, 5];
/// assert_eq!(&f.sort(), &get_prime_factors(20).sort());
/// ```
pub fn get_prime_factors(n: u32) -> Vec<u32> {
    let factors = Vec::new();
    next_prime_factor(n, 2, factors)
}

fn next_prime_factor(n: u32, i: u32, mut factors: Vec<u32>) -> Vec<u32> {
    if n == 1 {
        factors
    } else if n % i == 0 {
        factors.push(i);
        next_prime_factor(n/i, i, factors)
    } else {
        next_prime_factor(n, i+1, factors)
    }
}

// ###########################################################################

#[cfg(test)]
mod test {
    use super::*;
    
    #[test]
    fn prime_factors() {
        let mut f: Vec<u32> = vec![2, 2, 5];
        assert_eq!(&f.sort(), &get_prime_factors(20).sort());
    }
    
    #[test]
    fn smallest_multiple() {
        assert_eq!(2520, find_smallest_multiple(1, 11));
    }
}
