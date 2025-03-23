FROM debian:12.9

ARG CONTAINER_UID
ARG CONTAINER_GID
RUN test -n "$CONTAINER_UID"
RUN test -n "$CONTAINER_GID"

RUN apt-get update -y && \
		apt-get install -y manpages-dev manpages man-db git gawk nano jq curl wget

RUN git clone https://github.com/bats-core/bats-core.git && \
		cd bats-core/ && \
		git checkout tags/v1.11.1 && \
		./install.sh /usr/local

RUN groupadd --gid ${CONTAINER_GID} developer && \
		useradd --uid ${CONTAINER_UID} --gid developer --shell /bin/bash --create-home developer

RUN chown ${CONTAINER_UID}:${CONTAINER_GID} /usr/share/awk

CMD ["sleep", "infinity"]