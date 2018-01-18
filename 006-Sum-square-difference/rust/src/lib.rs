//! The sum of the squares of the first ten natural numbers is,
//! 
//! 1² + 2² + ... + 10² = 385
//! The square of the sum of the first ten natural numbers is,
//! 
//! (1 + 2 + ... + 10)² = 55² = 3025
//! Hence the difference between the sum of the squares of the first ten 
//! natural numbers and the square of the sum is 3025 − 385 = 2640.
//! 
//! Find the difference between the sum of the squares of the first one 
//! hundred natural numbers and the square of the sum.


/// Returns the difference between the square of sums and the sum of 
/// squares of all natural numbers between 1 and `number`
///
/// # Example
/// ```
/// use problem006::get_difference;
/// assert_eq!(2640, get_difference(&10));
/// ```
pub fn get_difference(number: &u32) -> u32 {
    let sq_o_s = square_of_sums(number);
    let s_o_sq = sum_of_squares(number);
    sq_o_s.checked_sub(s_o_sq).unwrap_or(0)
}

/// Returns the square of the sum of all numbers betwwen 1 and `number`
///
/// # Example
/// ```
/// use problem006::square_of_sums;
/// assert_eq!(3025, square_of_sums(&10));
/// ```
pub fn square_of_sums(number: &u32) -> u32 {
    let mut n = 0;
    for i in 1..number+1 {
        n += i
    }
    n * n
}

/// Returns the sum of the squares all numbers betwwen 1 and `number`
///
/// # Example
/// ```
/// use problem006::sum_of_squares;
/// assert_eq!(385, sum_of_squares(&10));
/// ```
pub fn sum_of_squares(number: &u32) -> u32 {
    let mut n = 0;
    for i in 1..number+1 {
        n += i*i;
    }
    n
}


#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test_square_of_sums() {
        assert_eq!(3025, square_of_sums(&10));
    }
    
    #[test]
    fn test_sum_of_squares() {
        assert_eq!(385, sum_of_squares(&10));
    }
    
    #[test]
    fn test_difference() {
        assert_eq!(2640, get_difference(&10));
    }
}
