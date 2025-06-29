# Variables
GO := go
GOBIN := $(shell $(GO) env GOBIN)
ifeq ($(GOBIN),)
	GOBIN := $(shell $(GO) env GOPATH)/bin
endif
BINARY_NAME := myProject
PKG := ./...
TEST_FLAGS := -v -cover
BUILD_FLAGS := -ldflags "-s -w"
GOFMT := gofmt
GOIMPORTS := $(GOBIN)/goimports
GOLANGCI_LINT := $(GOBIN)/golangci-lint
GOSEC := $(GOBIN)/gosec
GOVULNCHECK := $(GOBIN)/govulncheck
MOCKGEN := $(GOBIN)/mockgen

# Default target
.PHONY: all
all: fmt lint vet test sec vuln build

# Format code
.PHONY: fmt
fmt:
	$(GOFMT) -w .
	$(GOIMPORTS) -w .

# Run linters
.PHONY: lint
lint:
	$(GOLANGCI_LINT) run --timeout=5m

# Run go vet
.PHONY: vet
vet:
	$(GO) vet $(PKG)

# Run tests
.PHONY: test
test:
	$(GO) test $(TEST_FLAGS) $(PKG)

# Run tests with coverage
.PHONY: coverage
coverage:
	$(GO) test -coverprofile=coverage.out $(PKG)
	$(GO) tool cover -html=coverage.out

# Run security checks
.PHONY: sec
sec:
	$(GOSEC) $(PKG)

# Check for vulnerabilities
.PHONY: vuln
vuln:
	$(GOVULNCHECK) $(PKG)

# Build the binary
.PHONY: build
build:
	$(GO) build $(BUILD_FLAGS) -o $(BINARY_NAME) .

# Run the application
.PHONY: run
run:
	$(GO) run .

# Clean build artifacts
.PHONY: clean
clean:
	rm -f $(BINARY_NAME) coverage.out

# Generate documentation
.PHONY: doc
doc:
	godoc -http=:6060

# Generate mocks
.PHONY: mocks
mocks:
	$(MOCKGEN) -source=yourpkg/yourinterface.go -destination=mocks/mock_yourinterface.go

# Install dependencies
.PHONY: deps
deps:
	$(GO) mod tidy
	$(GO) get $(PKG)
	$(GO) install golang.org/x/tools/cmd/goimports@latest
	$(GO) install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	$(GO) install github.com/securego/gosec/v2/cmd/gosec@latest
	$(GO) install golang.org/x/vuln/cmd/govulncheck@latest
	$(GO) install github.com/vektra/mockgen/v2/cmd/mockgen@latest

# Format, lint, vet, test, security checks, and build
.PHONY: ci
ci: fmt lint vet test coverage sec vuln build