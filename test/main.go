package main

import "fmt"

type cellt struct {
	dis  int
	path string
}

var hx, hy int
var cells [][]cellt
var mazes [][]int

func findShortestWay(maze [][]int, ball []int, hole []int) string {
	mazes = maze
	hx, hy = hole[1], hole[0]
	cells = make([][]cellt, len(maze))
	for i := range cells {
		cells[i] = make([]cellt, len(maze[i]))
		for j := range cells[i] {
			cells[i][j].dis = int(^uint(0) >> 1)
		}
	}
	x, y := ball[1], ball[0]
	cell(x, y).dis = 0
	help(x, y, 0, "", "d")
	help(x, y, 0, "", "l")
	help(x, y, 0, "", "r")
	help(x, y, 0, "", "u")
	c := cell(hx, hy)
	if c.path == "" {
		return "impossible"
	}
	return c.path
}

func cell(x, y int) *cellt {
	return &cells[y][x]
}

func wall(x, y int) bool {
	if !(0 <= y && y < len(mazes)) {
		return true
	}
	if !(0 <= x && x < len(mazes[y])) {
		return true
	}
	return mazes[y][x] != 0
}

func hole(x, y int) bool {
	return x == hx && y == hy
}

func help(bx, by, dis int, path, dir string) {
	x, y := bx, by
	path += dir
	for end := false; !hole(x, y); {
		switch dir {
		case "d":
			if end = wall(x, y+1); !end {
				y++
			}
		case "l":
			if end = wall(x-1, y); !end {
				x--
			}
		case "r":
			if end = wall(x+1, y); !end {
				x++
			}
		case "u":
			if end = wall(x, y-1); !end {
				y--
			}
		}
		if x == bx && y == by {
			return
		}
		if end {
			break
		}
		dis++
		c := cell(x, y)
		if c.dis < dis {
			return
		}
		if c.dis == dis && c.path < path {
			return
		}
	}
	c := cell(x, y)
	c.dis = dis
	c.path = path
	if !hole(x, y) {
		if dir == "d" || dir == "u" {
			help(x, y, dis, path, "l")
			help(x, y, dis, path, "r")
		} else {
			help(x, y, dis, path, "d")
			help(x, y, dis, path, "u")
		}
	}
}

func main() {
	maze := [][]int{
		{0, 0, 0, 0, 0},
		{1, 1, 0, 0, 1},
		{0, 0, 0, 0, 0},
		{0, 1, 0, 0, 1},
		{0, 1, 0, 0, 0},
	}
	fmt.Println(findShortestWay(maze, []int{4, 3}, []int{0, 1}))
	maze = [][]int{
		{0, 0, 0, 0, 0},
		{1, 1, 0, 0, 1},
		{0, 0, 0, 0, 0},
		{0, 1, 0, 0, 1},
		{0, 1, 0, 0, 0},
	}
	fmt.Println(findShortestWay(maze, []int{4, 3}, []int{3, 0}))
}
