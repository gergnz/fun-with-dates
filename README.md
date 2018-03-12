# Fun With Dates

There are 2 versions, ruby and go.

## Go
Built using go 1.9.2. Might work on earlier versions. Good luck

I assume you can setup your go path, etc?

Makefile contains all the fun

Rquires dep
```bash
brew install dep
dep ensure
```

There is a limitation of a maximum of approximately 290 years duration: https://golang.org/pkg/time/#Duration

### Building
```bash
make
```
This produces a binary called: `fun_with_dates.macos`

### Testing
```bash
make test
```

### Running:
```bash
./fun_with_dates.macos 02/06/1983 22/06/1983
```


## Ruby
Built with 2.3.1

Gemfile and Rakefile contain all the fun

### Setup
I use rvm, you are welcome to use rbenv, or your native package manager
```bash
rvm install ruby-2.3.1
```

### Testing
```bash
rake
```

### Running;
```bash
./fun_with_dates.rb 03/01/1989 03/08/1983
```
