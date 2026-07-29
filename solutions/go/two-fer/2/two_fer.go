/*
	package twofer solves the Two-fer code challenge

	There is an optional input parameter on the command line.

	Given no input the program will output "One for you, one for me",
	otherwise the program will output "One for INPUT, one for me"
*/
package twofer

import "fmt"

// ShareWith takes an optional name parameter and
// prints the Two-fer text: One for [you, name], one for me.
func ShareWith(name string) string {
	if len(name) == 0 {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
