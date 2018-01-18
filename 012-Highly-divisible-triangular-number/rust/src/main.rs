extern crate problem012;
use problem012::TriangleNumber;

fn main() {
    let mut t = TriangleNumber::new().skip(7);
    let mut current = t.next().unwrap();
    let mut count = problem012::count_divisors(current);
    while count <= 500 {
        current = t.next().unwrap();
        count = problem012::count_divisors(current);
    }
    println!("{}", current);
}