BIN=lab
DIST_DIR=dist

.PHONY: fmt lint test build clean test_all

.DEFAULT: help
help:
	@echo "fmt           : run gofmt"
	@echo "lint          : run golint"
	@echo "test          : run go test"
	@echo "build         : run go build"
	@echo "clean         : remove the bin"
	@echo "install       : install the dependence"
	@echo "test_all      : run fmt lint test"

fmt:
	@gofmt -d -w -e .

lint:
	@go vet ./...
	@# go get -u golang.org/x/lint/golint
	@golint ./...

test:
	@go test -v -race ./...

install:
	@go get -t -d -v ./...

build:
	@go build -v -o ${BIN} *.go

clean:
	@git clean -fdx ${BIN} ${DIST_DIR}

test_all: fmt lint test
