package main

import (
	"fmt"
	"os"

	"github.com/gergnz/fun-with-dates/days"
)

func main() {

	fmt.Println(days.Main(os.Args[1], os.Args[2]))
}
