package main

import (
	"aktion/internal"
	"fmt"
)

func main() {
	fmt.Println("SDK: ", internal.SDKName)
	fmt.Println("Version: ", internal.SDKVersion)
}
