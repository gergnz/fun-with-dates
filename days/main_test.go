package days

import (
	"testing"
)

func TestMainZero(t *testing.T) {

	days := Main("01/01/2000", "01/01/2000")
	if days != 0 {
		t.Errorf("Expected days to be 0, but instead got %d", days)
	}

}

func TestMainTiny(t *testing.T) {

	days := Main("01/01/2000", "03/01/2000")
	if days != 1 {
		t.Errorf("Expected days to be 1, but instead got %d", days)
	}

}

func TestMainExtreme(t *testing.T) {

	days := Main("01/01/1901", "31/12/2099")
	if days != 72682 {
		t.Errorf("Expected days to be 72682, but instead got %d", days)
	}

}

func TestMainExtremeTwo(t *testing.T) {

	days := Main("01/01/2709", "31/12/2999")
	if days != 106284 {
		t.Errorf("Expected days to be 106284, but instead got %d", days)
	}

}

func TestMainOne(t *testing.T) {

	days := Main("02/06/1983", "22/06/1983")
	if days != 19 {
		t.Errorf("Expected days to be 19, but instead got %d", days)
	}

}

func TestMainTwo(t *testing.T) {

	days := Main("04/07/1984", "25/12/1984")
	if days != 173 {
		t.Errorf("Expected days to be 173, but instead got %d", days)
	}

}

func TestMainThree(t *testing.T) {

	days := Main("03/01/1989", "03/08/1983")
	if days != 1979 {
		t.Errorf("Expected days to be 1979, but instead got %d", days)
	}

}
