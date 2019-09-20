CI_COMMIT_TAG := latest

all: build

buildah:
	@sudo buildah bud -t pyrmin.io/gitlab-runner-fedora:$(CI_COMMIT_TAG) .

build:
	@docker build --no-cache --rm --tag=pyrmin.io/gitlab-runner-fedora:$(CI_COMMIT_TAG) .