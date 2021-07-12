package main

import "golang.org/x/tour/pic"

func Pic(dx, dy int) [][]uint8 {
	im := make([][]uint8,dy)
	for j := range im {
		im[j] = make([]uint8,dx)
		for i := range im[j]{
		if i+j==255{
		im[j][i] = 0
		} else{
		im[j][i] = 255
		}
	}
	}
	return im
}
func main() {
	pic.Show(Pic)
}
