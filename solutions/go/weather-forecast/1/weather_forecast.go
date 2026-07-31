// Package weather provides a weather forecast for a given city.
package weather

var (
	// CurrentCondition is the current weather condition.
	CurrentCondition string
	// CurrentLocation is the city for the forecast.
	CurrentLocation string
)

// Forecast returns a sentence giving the current weather forecast for the city.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
