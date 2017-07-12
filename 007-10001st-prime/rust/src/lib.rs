//! By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can 
//! see that the 6th prime is 13.
//! 
//! What is the 10001st prime number?

/// Returns the prime number by its position in the list of primes.
///
/// # Example
/// ```
/// use problem007::get_nth_prime;
/// assert_eq!(17, get_nth_prime(7));
/// ```
pub fn get_nth_prime(n: usize) -> u32 {
    //start out with the given list of the first six primes
    let mut list_of_primes: Vec<u32> = vec![2, 3, 5, 7, 11, 13];
    while list_of_primes.len() <= n {
        let next_prime = get_next_prime(&list_of_primes);
        list_of_primes.push(next_prime);
    }
    // we can safely use unwrap. The vector is big enough and can
    // only grow in this function.
    list_of_primes.get(n-1).unwrap().clone()
}

fn get_next_prime(list_of_primes: &Vec<u32>) -> u32 {
    // Take the last found prime, add two to find the next uneven number
    let mut current = list_of_primes.last().unwrap() + 2; 
    // If it's not prime, try the next uneven number
    while !is_prime(&current, list_of_primes) {
        current += 2;
    }
    // If it's prime, return it.
    current
}

fn is_prime(number: &u32, list_of_primes: &Vec<u32>) -> bool {
    for i in list_of_primes {
        // If the number is evenly divisibly by one of the primes we found
        // so far, it isn't prime.
        if number % i == 0 {
            return false;
        }
    }
    true
}


#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn get_7th_prime() {
        assert_eq!(17, get_nth_prime(7));
    }
}
