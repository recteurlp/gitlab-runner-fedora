all: build

build:
	@docker build --rm --tag=${USER}/gitlab-ci-multi-runner-fedora .

release:
	@docker build --rm --tag=${USER}/gitlab-ci-multi-runner-fedora:$(shell cat VERSION) .
