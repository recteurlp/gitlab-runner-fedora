FROM fedora:24
MAINTAINER recteurlp@gmail.com

ENV GITLAB_CI_MULTI_RUNNER_USER=gitlab_ci_multi_runner \
    GITLAB_CI_MULTI_RUNNER_HOME_DIR="/home/gitlab_ci_multi_runner"
ENV GITLAB_CI_MULTI_RUNNER_DATA_DIR="${GITLAB_CI_MULTI_RUNNER_HOME_DIR}/data"

RUN dnf install -v -y git sudo wget which hostname \
 && dnf clean all && rm -rf /usr/share/doc /usr/share/man /tmp/*

COPY assets/install.sh /var/cache/gitlab-ci-multi-runner/install.sh
RUN bash /var/cache/gitlab-ci-multi-runner/install.sh

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

VOLUME ["${GITLAB_CI_MULTI_RUNNER_DATA_DIR}"]
WORKDIR "${GITLAB_CI_MULTI_RUNNER_HOME_DIR}"
ENTRYPOINT ["/sbin/entrypoint.sh"]
