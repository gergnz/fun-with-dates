package days

import (
	"strconv"
	"strings"
)

func monthstodays(month int) int {
	months := []int{0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
	days := 0
	for i := 1; i <= month; i++ {
		days += months[i]
	}
	return days
}

func yearstodays(year int) int {
	return (year - 1900) * 365
}

func leapdays(date2 [3]int, date1 [3]int) int {
	days := 0
	if (date1[2] % 4) == 0 {
		if date1[1] == 2 {
			days += 1
		}
	}
	if (date2[2] % 4) == 0 {
		if date2[1] == 2 {
			days -= 1
		}
		if date2[0] == 29 {
			days += 1
		}
	}
	return days + date2[2]/4 - date1[2]/4
}

func Main(arg1 string, arg2 string) int {

	rawdate1 := strings.Split(arg1, "/")
	rawdate2 := strings.Split(arg2, "/")

	date1 := [3]int{}
	date2 := [3]int{}

	for i := 0; i <= 2; i++ {
		date1[i], _ = strconv.Atoi(rawdate1[i])
	}
	for i := 0; i <= 2; i++ {
		date2[i], _ = strconv.Atoi(rawdate2[i])
	}

	days1 := yearstodays(int(date1[2])) + monthstodays(int(date1[1])) + int(date1[0])
	days2 := yearstodays(int(date2[2])) + monthstodays(int(date2[1])) + int(date2[0])

	days := 0

	if days2 > days1 {
		days = days2 - days1 - 1
		days += leapdays(date2, date1)
	} else {
		days = days1 - days2 - 1
		days += leapdays(date1, date2)
	}

	if days < 0 {
		days = 0
	}

	return days

}
