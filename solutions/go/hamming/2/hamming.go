package hamming

import (
	"errors"
	"strings"
)

const testVersion = 5

func Distance(a, b string) (int, error) {
	count := 0
	if len(a) != len(b) {
		err := errors.New("The DNA strands are not the same length")
		return -1, err
	}
	strandLeft := strings.Split(a, "")
	strandRight := strings.Split(b, "")
	for idx, dnaLeft := range strandLeft {
		dnaRight := strandRight[idx]
		if dnaLeft != dnaRight {
			count = count + 1
		}
	}
	return count, nil
}