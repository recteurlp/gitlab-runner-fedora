#!/bin/bash
set -e

# add git user
adduser -c 'GitLab CI Runner' ${GITLAB_CI_MULTI_RUNNER_USER}

sudo -HEu ${GITLAB_CI_MULTI_RUNNER_USER} ln -s ${GITLAB_CI_MULTI_RUNNER_DATA_DIR}/.ssh ${GITLAB_CI_MULTI_RUNNER_HOME_DIR}/.ssh

# download the gitlab-ci-multi-runner binary
wget -O /usr/bin/gitlab-ci-multi-runner \
  https://gitlab-ci-multi-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-ci-multi-runner-linux-amd64
chmod +x /usr/bin/gitlab-ci-multi-runner && /usr/bin/gitlab-ci-multi-runner --version
