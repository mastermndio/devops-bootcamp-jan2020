package main

import (
	"fmt"
)

func main() {
	name := "Aaron"
	fmt.Print("Hello, playground\n") //Print simply prints what you pass to it.
	fmt.Println("Hello, Aaron")      //Prints what is passed to it, and adds a newline character
	fmt.Printf("Hello, %s", name)    //Operates like fmt.Print but allows for output formatting
}
