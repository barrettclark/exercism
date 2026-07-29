package leap

const testVersion = 2

// God function to test leap yearedness
// ~110000 - 118972

func IsLeapYear(year int) bool {
	switch {
	case yearDivisibleBy(year, 400):
		return true
	case yearDivisibleBy(year, 100):
		return false
	default:
		return yearDivisibleBy(year, 4)
	}
}

func yearDivisibleBy(year int, number int) bool {
	return year%number == 0
}