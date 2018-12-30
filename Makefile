CI_COMMIT_TAG ?= $(shell cat VERSION)

all: build

build:
	@docker build --no-cache --rm --tag=pyrmin.io/gitlab-runner-fedora:$(CI_COMMIT_TAG) .
