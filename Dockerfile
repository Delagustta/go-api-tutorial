FROM golang:1.23

# Set working directory
WORKDIR /go/src/app

# Copy the go.mod and go.sum files first
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the rest of the code
COPY . .

# Expose the port
EXPOSE 8000

# Build the Go app
RUN go build -o main cmd/main.go

# Run the executable
CMD ["./main"]
