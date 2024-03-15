FROM golang:1.21.7

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install git -y

RUN mkdir -p /go/src/github.com/coinbase/dexter
COPY . /go/src/github.com/coinbase/dexter/
WORKDIR /go/src/github.com/coinbase/dexter

RUN make deps && \
    make install

ENTRYPOINT ["dexter", "daemon"]
