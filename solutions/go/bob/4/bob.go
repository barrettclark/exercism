// Package bob includes a Remark struct with several functions.
// This should arguably be in a separate file, but simplified here.
// The Hey function is the main function in this package.
package bob

import (
	"errors"
	"fmt"
	"regexp"
	"strings"
)

// Remark is a struct to encapsulate the remark-related functions
type Remark struct {
	Remark string
}

// NewRemark acts as a constructor for the remark struct that sets the
// Remark.Remark to the cleaned value
func NewRemark(input string) *Remark {
	whitespace := regexp.MustCompile(`[\s\t]+`)
	cleanedRemark := whitespace.ReplaceAllString(input, "")
	r := &Remark{cleanedRemark}
	return r
}

func (r *Remark) remarkLength() int {
	return len(r.Remark)
}

func (r *Remark) lastCharacter() (string, error) {
	if r.remarkLength() == 0 {
		return "", errors.New("The input string has no length")
	}
	return r.Remark[r.remarkLength()-1:], nil
}

func (r *Remark) isQuestion() bool {
	char, err := r.lastCharacter()
	if err != nil {
		fmt.Println(err)
		return false
	}
	return char == "?"
}

func (r *Remark) isShouting() bool {
	return r.isAllCaps() && !r.isQuestion()
}

func (r *Remark) hasLetter() bool {
	matched, _ := regexp.MatchString(`.*[a-zA-Z].*`, r.Remark)
	return matched
}

func (r *Remark) isAllCaps() bool {
	return strings.ToUpper(r.Remark) == r.Remark && r.hasLetter()
}

func (r *Remark) forcefulQuestion() bool {
	return r.isAllCaps() && r.isQuestion()
}

func (r *Remark) isSilence() bool {
	return r.Remark == ""
}

// Hey takes an input string that is converted to a Remark type.
// The Remark is evaluated using Remark functions so that Bob
// can respond with the appropriate response.
func Hey(input string) string {
	remark := NewRemark(input)
	if remark.isSilence() {
		return "Fine. Be that way!"
	} else if remark.isShouting() {
		return "Whoa, chill out!"
	} else if remark.forcefulQuestion() {
		return "Calm down, I know what I'm doing!"
	} else if remark.isQuestion() {
		return "Sure."
	}
	return "Whatever."
}
