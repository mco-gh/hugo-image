# Install/config base alpine image..
FROM alpine:edge

RUN apk update && apk upgrade \
  && apk add ca-certificates \
  && rm -rf /var/cache/apk/*

# Install/config nodejs/npm.
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN apk update && apk upgrade \
  && apk add nodejs@edge \
  && npm uninstall -g npm \
  && rm -rf /var/cache/apk/*

# Install Python3 and Pygments.
RUN apk update && apk upgrade \
  && apk add python3 \
  && rm -rf /var/cache/apk/*
RUN pip install Pygments

# Install golang 1.8.
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add wget curl make git bzr mercurial bash go@community alpine-sdk
RUN which go
ENV GOROOT_BOOTSTRAP /usr/lib/go
RUN git clone https://go.googlesource.com/go
RUN cd go && git checkout go1.8 && cd src && ./make.bash
ENV PATH="${PWD}/go/bin:${PATH}"
RUN rm -rf /var/cache/apk/*
RUN mkdir /go
ENV GOPATH /go

# Install Hugo.
RUN go get -u -v github.com/kardianos/govendor
RUN go get -u -v github.com/spf13/hugo
RUN cd $GOPATH/src/github.com/spf13/hugo && govendor sync && go install

# Install firebase tools.
npm install -g firebase-tools
