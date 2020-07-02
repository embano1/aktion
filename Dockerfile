FROM golang:1.14 as builder
WORKDIR /src
COPY main.go .
RUN go build -o greeter .

FROM gcr.io/distroless/base
COPY --from=builder /src/greeter /
CMD ["/greeter"]