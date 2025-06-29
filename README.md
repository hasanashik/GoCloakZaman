# GoCloakZaman

# Simple Gin Project

A simple Go web application using Gin framework.

## Prerequisites

- Go 1.21.5 or higher
- Git

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/hasanashik/GoCloakZaman.git
   cd GoCloakZaman
   ```
2. Install dependencies:
   ```bash
   make deps
   ```

## Running the Application

1. Build and run the application:

   ```bash
   make run
   ```

   # make run

   ```console
   go run .
   [GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

   [GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
   - using env:	export GIN_MODE=release
   - using code:	gin.SetMode(gin.ReleaseMode)

   [GIN-debug] GET    /ping                     --> main.main.func1 (3 handlers)
   [GIN-debug] [WARNING] You trusted all proxies, this is NOT safe. We recommend you to set a value.
   Please check https://pkg.go.dev/github.com/gin-gonic/gin#readme-don-t-trust-all-proxies for details.
   [GIN-debug] Listening and serving HTTP on :8081
   [GIN] 2025/06/29 - 08:34:57 | 200 |       22.99µs |      10.10.10.1 | GET      "/ping"
   [GIN] 2025/06/29 - 08:34:57 | 404 |         490ns |      10.10.10.1 | GET      "/favicon.ico"
   [GIN] 2025/06/29 - 08:35:04 | 200 |      16.519µs |      10.10.10.1 | GET      "/ping"
   ```

2. Open your browser and navigate to `http://localhost:8080`

## Testing

Run the tests with:

```bash
make test
```

## Code Quality

- Format code: `make fmt`
- Lint code: `make lint`
- Vet code: `make vet`

## Contributing

Feel free to submit issues or pull requests!

## License

MIT License
