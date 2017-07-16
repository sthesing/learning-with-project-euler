pub struct TriangleNumber {
    last_summand: u32,
    value: u32,
}

impl TriangleNumber {
    pub fn new() -> TriangleNumber {
        TriangleNumber {
            last_summand: 0,
            value: 0,
        }
    }
    
    pub fn get_value(self) -> u32 {
        self.value
    }
}

impl Iterator for TriangleNumber {
    type Item = u32;
    
    fn next(&mut self) -> Option<Self::Item> {
        //increase the last summand by one
        self.last_summand += 1;
        // add it to value
        self.value += self.last_summand;
        // return the new value
        Some(self.value)
    }
}

pub fn count_divisors(n:u32) -> u32 {
    count_divisors_brute_force(n)
}

fn count_divisors_brute_force(n: u32) -> u32 {
    let limit = (n as f64).sqrt() as u32;
    if n == 1 {
        return 1;
    }
    // we know it's divisible by itself and 1
    let mut counter = 2;
    let mut divisor = 2;
    while divisor <= limit {
        if n % divisor == 0 {
            counter += 2;
        }
        divisor += 1;
    }
    counter
}

#[cfg(test)]
mod tests {
    use super::*;
    fn tn() -> TriangleNumber {
        TriangleNumber::new()
    }
    
    #[test]
    fn setup() {
        //let t = TriangleNumber::new();
        let t = tn();
        assert_eq!(0, t.get_value());
    }
    
    #[test]
    fn first_seven() {
        let mut t = tn();
        assert_eq!(1, t.next().unwrap());
        assert_eq!(3, t.next().unwrap());
        assert_eq!(6, t.next().unwrap());
        assert_eq!(10, t.next().unwrap());
        assert_eq!(15, t.next().unwrap());
        assert_eq!(21, t.next().unwrap());
        assert_eq!(28, t.next().unwrap());
    }
    
    #[test]
    fn take_seven() {
        let t = tn();
        let list = [1, 3, 6 ,10, 15, 21, 28];
        let mut i = 0;
        for number in t.take(7) {
            assert_eq!(list[i], number);
            i += 1;
        }
    }
    
    #[test]
    fn skip_three_take_four() {
        let t = tn();
        let list = [10, 15, 21, 28];
        let mut i = 0;
        for number in t.skip(3).take(4) {
            assert_eq!(list[i], number);
            i += 1;
        }
    }
    
    #[test]
    fn count_first_seven() {
        let t = tn();
        // Clean divisions for the first seven:
        //  1: 1                -> 1
        //  3: 1,3              -> 2
        //  6: 1,2,3,6          -> 4
        // 10: 1,2,5,10         -> 4
        // 15: 1,3,5,15         -> 4
        // 21: 1,3,7,21         -> 4
        // 28: 1,2,4,7,14,28    -> 6
        let list = [1, 2, 4, 4, 4, 4, 6];
        let mut i = 0;
        for number in t.take(7) {
            assert_eq!(list[i], count_divisors(number));
            i += 1;
        }
    }
}
