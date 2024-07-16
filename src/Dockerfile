# Ступень сборки
FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY src/go.mod src/go.sum ./
RUN go mod download

COPY src/ ./

RUN go build -o /my_pipeline_app

# Ступень запуска
FROM alpine:latest

COPY --from=builder /my_pipeline_app /my_pipeline_app

CMD ["/my_pipeline_app"]