package main

import "fmt"

//Fizz Buzz, Print numbers 0-100, but if:
//1. If the number is divisible by 3, print "Fizz"
//2. If the number is divisible by 5, print "Buzz"
//3/ If the number is divisible by 3 and by 5 , print "FizzBuzz"

func main() {
	for num := 0; num <= 100; num++ {
		if num%15 == 0 {
			fmt.Println("FizzBuzz")
		} else if num%5 == 0 {
			fmt.Println("Buzz")
		} else if num%3 == 0 {
			fmt.Println("Fizz")
		} else {
			fmt.Println(num)
		}
	}
}
