
NS       ?= marcacohen
VERSION  ?= latest
REPO     ?= hugo-image
INSTANCE ?= default

all: build push

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run --rm -i -t $(NS)/$(REPO):$(VERSION) /bin/bash

