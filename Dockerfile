# Etapa de construção
FROM golang:1.23-alpine AS builder

# Set working directory
WORKDIR /go/src/app

# Copy the go.mod and go.sum files first
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the rest of the code
COPY . .

# Build the Go app
RUN go build -o main cmd/main.go

# Etapa final
FROM alpine:latest

# Set working directory
WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /go/src/app/main .

# Expose the port
EXPOSE 8000

# Run the executable
CMD ["./main"]
