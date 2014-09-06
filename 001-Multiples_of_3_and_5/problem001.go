package main

import (
    "fmt"
)

func use_for_loop(limit int) int {
    sum := 0
    for i := 0; i < limit; i++ {
        sum = check_and_add(i, sum)
    }
    return sum
}

func use_recursion(limit, sum, number int) int {
    if number < limit {
        sum = check_and_add(number, sum)
        return use_recursion(limit, sum, number+1)
    }
    return sum
}

func check_and_add(number int, sum int) int {
    if number % 3 == 0 || number % 5 == 0 {
        sum = sum + number
    }
    return sum
}

func main() {
    fmt.Println("Using a for-loop: ", use_for_loop(1000))
    fmt.Println("Using recursion: ", use_recursion(1000, 0, 1))
}
