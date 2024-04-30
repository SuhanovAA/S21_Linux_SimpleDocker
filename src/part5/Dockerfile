FROM nginx 

RUN apt-get update \
    && apt-get install -y gcc spawn-fcgi libfcgi-dev \
    && rm -rf /var/lib/apt/lists 

COPY ./server.c ./s21/src/server.c
COPY ./run.sh ./s21/src/run.sh

RUN chmod u-s usr/bin/chfn; \
	chmod g-s usr/sbin/unix_chkpwd; \
	chmod g-s usr/bin/expiry; \
	chmod u-s usr/bin/umount; \
	chmod u-s usr/bin/su; \
	chmod u-s usr/bin/su; \
	chmod u-s usr/bin/passwd; \
	chmod g-s usr/bin/chage; \
	chmod u-s usr/bin/chsh; \
	chmod u-s usr/bin/mount; \
	chmod u-s usr/bin/newgrp; \
	chmod u-s usr/bin/gpasswd

WORKDIR /s21/src/

RUN gcc -o server server.c -lfcgi \
	&& chmod +x run.sh

RUN groupadd -g 999 tmpuser \
	&& useradd -r -u 999 -g tmpuser tmpuser
USER tmpuser

HEALTHCHECK --interval=5m --timeout=30s CMD curl -f http://localhost/ || exit 1

ENTRYPOINT [ "./run.sh" ]