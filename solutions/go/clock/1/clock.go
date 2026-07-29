package clock

import "fmt"

const testVersion = 4
const hoursInDay = 24
const minutesInHour = 60

type Clock struct {
	Hour   int
	Minute int
}

func New(hour, minute int) Clock {
	clock := Clock{hour, minute}
	clock.MinuteCheck()
	return clock
}

func (clock Clock) String() string {
	hour := fmt.Sprintf("%02d", clock.Hour)
	minute := fmt.Sprintf("%02d", clock.Minute)
	return hour + ":" + minute
}

func (clock *Clock) AddMinutes(minutes int) {
	clock.Minute += minutes
	clock.MinuteCheck()
}
func (clock *Clock) HourCheck() {
	if clock.Hour < 0 {
		clock.Hour = hoursInDay + clock.Hour
		clock.HourCheck()
	}
	days := clock.Hour / hoursInDay
	if days > 0 {
		clock.Hour -= days * hoursInDay
	}
}
func (clock *Clock) MinuteCheck() {
	hours := clock.Minute / minutesInHour
	if clock.Minute < 0 {
		clock.Hour += hours - 1
		clock.Minute = -1*(hours-1)*minutesInHour + clock.Minute
	}
	if hours > 0 {
		clock.Minute -= hours * minutesInHour
		clock.Hour += hours
	}
	clock.HourCheck()
}

func (clock Clock) Add(minutes int) Clock {
	clock.AddMinutes(minutes)
	return clock
}