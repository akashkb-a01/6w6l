package main

import (
	"fmt"
	"math"
)

func Sqrt(x float64) float64 {
	d := 0.0000000000000000001
	z := x/2
	var t = z
for {
	t -= (z*z-x)/(2*z)
	if (z-t)*(z-t)<d {
		return t
	}
	z=t
}
}

func main() {
	fmt.Println(Sqrt(1025))
	fmt.Println("Error is",math.Sqrt(1025)-Sqrt(1025))
}
