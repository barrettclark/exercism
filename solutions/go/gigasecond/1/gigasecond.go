package gigasecond

import (
	"math"
	"time"
)

const testVersion = 4

func AddGigasecond(birthday time.Time) time.Time {
	gigasecond := math.Pow10(9)
	return birthday.Add(time.Duration(gigasecond) * time.Second)
}