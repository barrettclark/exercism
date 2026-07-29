// Package bob should have a package comment that summarizes what it's about.
// https://golang.org/doc/effective_go.html#commentary
package bob

import (
	"regexp"
	"strings"
)

// Hey should have a comment documenting it.
func Hey(remark string) string {
	remark = cleanedRemark(remark)
	if _isSilence(remark) {
		return "Fine. Be that way!"
	} else if _isShouting(remark) {
		return "Whoa, chill out!"
	} else if _forcefulQuestion(remark) {
		return "Calm down, I know what I'm doing!"
	} else if _isQuestion(remark) {
		return "Sure."
	}
	return "Whatever."
}

// TODO: refactor remark to it's own thing
func cleanedRemark(remark string) string {
	whitespace := regexp.MustCompile(`[\s\t]+`)
	cleanedRemark := whitespace.ReplaceAllString(remark, "")
	return cleanedRemark
}

func _lastCharacter(remark string) string {
	// TODO: return an error for an empty string
	return remark[len(remark)-1:]
}

func _isQuestion(remark string) bool {
	return _lastCharacter(remark) == "?"
}

func _isShouting(remark string) bool {
	return _isAllCaps(remark) && !_isQuestion(remark)
}

// var _hasLetter = regexp.MustCompile(`.*[a-zA-Z].*`).MatchString
func _hasLetter(remark string) bool {
	matched, _ := regexp.MatchString(`.*[a-zA-Z].*`, remark)
	return matched
}

func _isAllCaps(remark string) bool {
	return strings.ToUpper(remark) == remark && _hasLetter(remark)
}

func _forcefulQuestion(remark string) bool {
	return _isAllCaps(remark) && _isQuestion(remark)
}

func _isSilence(remark string) bool {
	return remark == ""
}
