#!/bin/bash
set -e

# add git user
adduser -c 'GitLab CI Runner' ${GITLAB_CI_MULTI_RUNNER_USER}

sudo -HEu ${GITLAB_CI_MULTI_RUNNER_USER} ln -s ${GITLAB_CI_MULTI_RUNNER_DATA_DIR}/.ssh ${GITLAB_CI_MULTI_RUNNER_HOME_DIR}/.ssh

chmod +x /usr/bin/gitlab-ci-multi-runner && /usr/bin/gitlab-ci-multi-runner --version
