package utils

import (
	"strconv"
)

func StringToFloat(value string) (float64, error) {
	return strconv.ParseFloat(value, 64)
}
