FROM debian:bookworm

ARG CONTAINER_UID
ARG CONTAINER_GID
RUN test -n "$CONTAINER_UID"
RUN test -n "$CONTAINER_GID"

RUN apt-get update -y && \
		apt-get install -y git gawk

RUN groupadd --gid ${CONTAINER_GID} developer && \
		useradd --uid ${CONTAINER_UID} --gid developer --shell /bin/bash --create-home developer

CMD ["sleep", "infinity"]