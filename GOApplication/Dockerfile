FROM golang:latest
WORKDIR /go/src/app
ADD . /go/src/app

RUN sleep 5
RUN go get -d -v ./...
RUN export GOPATH=/tmp/go
RUN go get github.com/lib/pq
RUN go install -v ./...

CMD ["go", "test"]
