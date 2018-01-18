fn largest_prime_factor(mut number: i64) -> i64 {
    let mut i = 1;
    
    while number > 1 {
        i += 1;
        while number % i == 0 {
            number = number / i;
        }
    }
    // we have reached one, let's return i
    i
}

fn main() {
    println!("The largest factor is: {}", 
            largest_prime_factor(600851475143));
}
