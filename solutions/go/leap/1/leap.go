package leap

import "math"

const testVersion = 2

// God function to test leap yearedness
// ~110000 - 118972
func IsLeapYear(year int) bool {
	yr := float64(year)
	mod4 := math.Mod(yr, 4)
	mod100 := math.Mod(yr, 100)
	mod400 := math.Mod(yr, 400)
	if mod400 == 0 {
		return true
	} else if mod100 == 0 {
		return false
	} else if mod4 == 0 {
		return true
	}
	return false
}