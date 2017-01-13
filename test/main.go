package main

import "fmt"

func main() {
	var h [26]int
	for i := range h {
		fmt.Scan(&h[i])
	}
	var s string
	fmt.Scanln(&s)
	m := 0
	for _, c := range h {
		if m < h[c-'a'] {
			m = h[c-'a']
		}
	}
	fmt.Println(m * len(s))
}
