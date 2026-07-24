# Stage 1: build the Go program
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY main.go .

RUN go build -o hello main.go

# Stage 2: run the compiled program
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/hello .

CMD ["./hello"]
