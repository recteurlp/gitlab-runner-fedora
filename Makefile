CI_BUILD_TAG ?= $(shell cat VERSION)

all: build

build:
	@docker build --no-cache --rm --tag=pyrmin.io:5000/gitlab-ci-multi-runner-fedora:$(CI_BUILD_TAG) .
