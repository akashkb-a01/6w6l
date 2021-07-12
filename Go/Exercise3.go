package main

import (
	"golang.org/x/tour/wc"
	"strings"
)

func WordCount(s string) map[string]int {
	val := make(map[string] int)

	for _, i:=range strings.Fields(s) {
		val[i]++
	}
	return val
}

func main() {
	wc.Test(WordCount)
}
