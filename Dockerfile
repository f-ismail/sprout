FROM golang:1.19-alpine as base

WORKDIR /app

COPY . .

RUN apk update
RUN apk add build-base

ENV CGO_ENABLE=1
ENV GOOS=linux

RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go build -mod=vendor -installsuffix cgo -o main .

FROM base AS build

CMD ["./main"]
