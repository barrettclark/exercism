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
	strand_left := strings.Split(a, "")
	strand_right := strings.Split(b, "")
	for idx, dna_left := range strand_left {
		dna_right := strand_right[idx]
		if dna_left != dna_right {
			count = count + 1
		}
	}
	return count, nil
}