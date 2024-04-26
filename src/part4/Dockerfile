FROM nginx:latest

LABEL maintainer="elektrno@student.21-school.ru"

COPY server.c /
COPY run.sh /

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev

RUN gcc -o server server.c -lfcgi \
    && chmod +x /run.sh

ENTRYPOINT [ "./run.sh" ]