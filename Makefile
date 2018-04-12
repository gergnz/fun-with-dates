# Makefile
#
default: dependencies fmt test macos

fmt:
	go fmt .
	go fmt github.com/gergnz/fun-with-dates/days

dependencies:
	dep ensure

test:
	go test ./...

linux-i386:
	GOOS=linux GOARCH=386 go build -x -o fun_with_dates.linux_386 fun_with_dates.go

linux-amd64:
	GOOS=linux GOARCH=amd64 go build -x -o fun_with_dates.linux_amd64 fun_with_dates.go

macos:
	GOOS=darwin go build -x -o fun_with_dates.macos fun_with_dates.go
