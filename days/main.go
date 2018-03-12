package days

import (
	"strings"
	"time"

	"github.com/araddon/dateparse"
)

func Main(arg1 string, arg2 string) int {
	// dateparse only handles US dates, so swap to AU dates
	x1 := strings.Split(arg1, "/")
	a1 := []string{x1[1], x1[0], x1[2]}
	d1 := strings.Join(a1, "/")

	x2 := strings.Split(arg2, "/")
	a2 := []string{x2[1], x2[0], x2[2]}
	d2 := strings.Join(a2, "/")

	t1, _ := dateparse.ParseIn(d1, time.UTC)
	t2, _ := dateparse.ParseIn(d2, time.UTC)


  days := 0
	if t2.After(t1) {
    days = int(t2.Sub(t1).Hours())/24 - 1
	} else {
    days = int(t1.Sub(t2).Hours())/24 - 1
	}
    if days < 0 {
      days = 0
    }
    return days

}
