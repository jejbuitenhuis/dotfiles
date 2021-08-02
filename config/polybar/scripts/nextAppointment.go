package main

import (
	"flag"
	"fmt"
	"google.golang.org/api/calendar/v3"
)

var themes = map[string]string{
	"Mountain Fuji": "Test output :)",
}

func main() {
	outputType := flag.String("type", "", "The type of the output (current theme)")

	flag.Parse()

	if *outputType == "" || themes[*outputType] == "" {
		fmt.Println("outputType should be one of the available themes")
		return
	}

	fmt.Println(*outputType)
}
