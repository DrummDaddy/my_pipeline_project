FROM golang:1.22.4 AS builder
WORKDIR /app
COPY go.mod ./
RUN touch go.sum
RUN go mod tidy
COPY src/ ./src/
WORKDIR /app/src
RUN go build -o /app/my_pipeline_app .
FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /app/my_pipeline_app /usr/local/bin/my_pipeline_app
CMD ["my_pipeline_app"]