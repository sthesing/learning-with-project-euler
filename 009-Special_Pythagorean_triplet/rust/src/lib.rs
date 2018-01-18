//! # Special Pythagorean triplet
//! A Pythagorean triplet is a set of three natural numbers, a < b < c, for which a²+b²=c²
//! There exists exactly one Pythagorean triplet for which a+b+c=1000
//! Find the product abc

//! ## Algebraic preparation
//!
//! We know three things:
//! 1. a<b<c
//! 2. a²+b²=c²
//! 3. a+b+c=1000
//!
//! ### Starting with 3:
//! `c = 1000-a-b`
//! ### Inserting into 2:
//! a² + b² = (1000 - (a+b))²
//! 
//! a² + b² = 1000² - 2*1000*(a+b) + (a+b)²
//! a² + b² = 1000² - 2*1000*(a+b) + (a²+2*a*b+b²)
//! a² + b² = 1000² - 2000*a - 2000*b + a² + 2*a*b + b²
//! 0 = 1000² - 2000*a - 2000*b + 2*a*b
//! 2000*a + 2000*b = 1000² + 2*a*b
//! ### Final form used in the code:
//! `1000*a + 1000*b = 500000 + a*b`

pub fn find_product_abc() -> u32 {
    let mut found_a=1;
    let mut found_b=1;
    for a in 1..1001 {
        for b in a+1..1001 {
            if (1000*a + 1000*b) == (500000 + a*b) {
                found_a = a;
                found_b = b;
                break;
            }
        }
    }
    let c = 1000 - found_a - found_b;
    found_a*found_b*c
}


#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
    }
}
