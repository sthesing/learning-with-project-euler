//! # Problem 4:
//! A palindromic number reads the same both ways. The largest palindrome made
//! from the product of two 2-digit numbers is 9009 = 91 × 99.
//!
//! Find the largest palindrome made from the product of two 3-digit numbers.

/// Mirrors the number given
///
/// # Examples:
/// ```
/// use problem004::mirror_number;
/// let n = 1;
/// assert_eq!(1, mirror_number(&n));
/// let n1 = 12;
/// assert_eq!(21, mirror_number(&n1));
/// let n2 = 234;
/// assert_eq!(432, mirror_number(&n2));
/// ```
pub fn mirror_number(n: &u32) -> u32 {
    let mut cn = n.clone();
    let mut mn = 0; // mn: mirrored number
    while cn > 0 {
        mn = 10 * mn + cn % 10;
        cn = cn / 10; // floor
    }
    mn
}

/// Returns `true` if parameter `n` is a 
/// [palindrome number](https://en.wikipedia.org/wiki/Palindromic_number).
///
/// # Example:
/// ```
/// use problem004::is_palindrome;
/// let n = 1;
/// assert!(is_palindrome(&n));
/// let n1 = 121;
/// assert!(is_palindrome(&n1));
/// let n2 = 122;
/// assert!(!is_palindrome(&n2));
/// ```
pub fn is_palindrome(n: &u32) -> bool {
    n.clone() == mirror_number(&n)
}

/// Finds the largest palindrome made from the product of two 3-digit numbers.
pub fn find_largest_palindrome() -> u32 {
    let mut largest_palindrome = 0;
    let mut a = 999;
    
    while a >= 100 {
        let mut b = 999;
        while b >= a {
            if (a*b) <= largest_palindrome {
                break;
            } else if is_palindrome(&(a*b)) {
                largest_palindrome = a*b;
            }
            b = b - 1;
        }
        a = a - 1;
    }
    largest_palindrome
}