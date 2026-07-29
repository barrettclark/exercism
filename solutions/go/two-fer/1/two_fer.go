/*
	package twofer solves the Two-fer code challenge

	There is an optional input parameter on the command line.

	Given no input the program will output "One for you, one for me",
	otherwise the program will output "One for INPUT, one for me"
*/
package twofer

import "fmt"

// Take an optional name and print the Two-fer text
func ShareWith(name string) string {
	if len(name) == 0 {
		name = "you"
	}
	return printOutput(name)
}
func printOutput(name string) string {
	return fmt.Sprintf("One for %s, one for me.", name)
}
