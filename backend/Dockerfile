FROM golang:1.15.6-alpine3.12

WORKDIR /root

COPY . .

RUN go build -o server.go

ENTRYPOINT [ "./server.go" ]