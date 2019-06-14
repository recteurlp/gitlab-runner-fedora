CI_COMMIT_TAG := latest

all: build

build:
	@sudo buildah bud -t pyrmin.io/gitlab-runner-fedora:$(CI_COMMIT_TAG) .
