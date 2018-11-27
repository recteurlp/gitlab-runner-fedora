FROM fedora:29
MAINTAINER recteurlp@gmail.com

ENV GITLAB_RUNNER_USER=gitlab_runner \
    GITLAB_RUNNER_HOME_DIR="/home/gitlab_runner"
ENV GITLAB_RUNNER_DATA_DIR="${GITLAB_RUNNER_HOME_DIR}/data"
ENV TERM xterm

RUN echo -e 'tsflags=nodocs\ndeltarpm=0' >> /etc/dnf/dnf.conf \
 && dnf install -v -y git sudo wget which hostname \
 && dnf clean all && rm -rf /usr/share/doc /usr/share/man /tmp/*

COPY assets/install.sh /var/cache/gitlab-runner/install.sh
ADD https://gitlab-runner-downloads.s3.amazonaws.com/v11.5.0/binaries/gitlab-runner-linux-amd64 /usr/bin/gitlab-runner

RUN bash /var/cache/gitlab-runner/install.sh

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

VOLUME ["${GITLAB_RUNNER_DATA_DIR}"]
WORKDIR "${GITLAB_RUNNER_HOME_DIR}"
ENTRYPOINT ["/sbin/entrypoint.sh"]
