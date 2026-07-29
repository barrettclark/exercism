package gigasecond

import "time"

const testVersion = 4

func AddGigasecond(birthday time.Time) time.Time {
	return birthday.Add(time.Duration(1e9) * time.Second)
}