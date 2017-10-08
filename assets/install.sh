#!/bin/bash
set -e

# add git user
adduser -c 'GitLab CI Runner' ${GITLAB_RUNNER_USER}

sudo -HEu ${GITLAB_RUNNER_USER} ln -s ${GITLAB_RUNNER_DATA_DIR}/.ssh ${GITLAB_RUNNER_HOME_DIR}/.ssh

chmod +x /usr/bin/gitlab-runner && /usr/bin/gitlab-runner --version
