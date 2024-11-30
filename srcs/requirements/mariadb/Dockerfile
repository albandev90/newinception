FROM debian:bullseye

USER root

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client

COPY ./tools/docker_entry.sh /usr/local/bin/

CMD ["docker_entry.sh"]