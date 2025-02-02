REPOSITORY := buildroot
SERVER := docker.io
ORG := paulosell
TAG ?= latest
IMAGE_URL := $(SERVER)/$(ORG)/$(REPO)

PHONY: all build 

all: build 

verify-image-url:
	@if [ "X` docker image ls | grep $(IMAGE_URL) | grep $(COMMIT)`" == "X"]; then \
		echo "Error: $(IMAGE_URL):$(COMMIT) not found"; \
		false ;
	fi	

build:
	docker build --tag $(IMAGE_URL):$(COMMIT)

publish: verify-image-url
	@echo "Publishing $(IMAGE_URL):$(COMMIT) to remote $(IMAGE_URL):$(TAG)"
	@docker login $(SERVER)
	@docker push $(IMAGE_URL):$(COMMIT)
	@docker tag $(IMAGE_URL):$(COMMIT) $(IMAGE_URL):$(TAG)
	@docker push $(IMAGE_URL):$(TAG)

shell:
	docker run --rm -it $(IMAGE_URL):$(TAG) /bin/bash
