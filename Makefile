
REPOSITORY := buildroot
SERVER := docker.io
ORG ?= paulosell
TAG ?= latest
IMAGE_URL := $(SERVER)/$(ORG)/$(REPOSITORY)
COMMIT := $(shell git log --format=%h -n1)

PHONY: all build 

all: build 

verify-image-url:
	@if [ "X`docker image ls | grep $(ORG)/$(REPOSITORY) | grep $(COMMIT)`" = "X" ]; then \
		echo "Error: $(ORG)/$(REPOSITORY):$(COMMIT) not found"; \
		false ; \
	fi	

build:
	docker build --tag $(ORG)/$(REPOSITORY):$(COMMIT) .
	@docker tag $(ORG)/$(REPOSITORY):$(COMMIT) $(ORG)/$(REPOSITORY):$(TAG)

publish: verify-image-url
	@echo "Publishing $(ORG)/$(REPOSITORY):$(COMMIT) to remote $(IMAGE_URL):$(TAG)"
	@docker login $(SERVER)
	@docker push $(IMAGE_URL):$(COMMIT)
	@docker tag $(IMAGE_URL):$(COMMIT) $(IMAGE_URL):$(TAG)
	@docker push $(IMAGE_URL):$(TAG)

shell:
	docker run --rm -it $(ORG)/$(REPOSITORY):$(TAG) /bin/bash
