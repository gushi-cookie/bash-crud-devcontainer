FROM debian:12.9

ARG CONTAINER_UID
ARG CONTAINER_GID
RUN test -n "$CONTAINER_UID"
RUN test -n "$CONTAINER_GID"

RUN apt-get update -y && \
		apt-get install -y git gawk nano jq curl wget

RUN groupadd --gid ${CONTAINER_GID} developer && \
		useradd --uid ${CONTAINER_UID} --gid developer --shell /bin/bash --create-home developer

CMD ["sleep", "infinity"]