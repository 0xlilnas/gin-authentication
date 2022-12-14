FROM golang as builder

RUN mkdir /build

ADD . /build

WORKDIR /build
RUN GOOS=linux GOARCH=amd64 go build -o shorts cmd/blog/main.go

FROM alpine
EXPOSE 8081

COPY --from=builder /build/blog /blog
ENTRYPOINT ["/blog"]