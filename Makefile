all: build

build:
	@docker build --rm --tag=recteurlp/gitlab-ci-multi-runner-fedora .

release:
	@docker build --rm --tag=recteurlp/gitlab-ci-multi-runner-fedora:$(shell cat VERSION) .
