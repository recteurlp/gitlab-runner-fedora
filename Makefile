all: build

build:
	@docker build --rm --tag=${USER}/gitlab-ci-multi-runner-fedora .
