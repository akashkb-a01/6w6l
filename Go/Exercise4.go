package main

import "fmt"

// fibonacci is a function that returns
// a function that returns an int.
func fibonacci() func() int {
	f0,f1,f2 := 0,1,1
	return func() int {
	f2=f0
	f1=f0+f1
	f0=f1-f0
	return f2
	}
}

func main() {
	f := fibonacci()
	for i := 0; i < 10; i++ {
		fmt.Println(f())
	}
}
