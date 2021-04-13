FROM golang:1.16.3

LABEL maintainer='thomas.lmaier97@gmail.com'

WORKDIR /src

COPY go.* /src/
COPY *.go /src/
COPY Makefile /src/

RUN ls -laht
RUN CGO_ENABLED=0 go build -o /src/gomux
RUN ls -laht

EXPOSE 8010

CMD ["/src/gomux"]
