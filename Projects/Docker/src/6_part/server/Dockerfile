FROM nginx

WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./hello_w.c .
COPY ./main.sh .

RUN apt-get update &&\
    apt-get install -y gcc spawn-fcgi libfcgi-dev &&\
    rm -rf /var/lib/apt/lists/*

RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chmod u-s /usr/bin/su && \
    chmod u-s /usr/bin/mount && \
    chmod u-s /usr/bin/gpasswd && \
    chmod g-s /usr/bin/chage && \
    chmod g-s /usr/sbin/unix_chkpwd && \
    chmod g-s /usr/bin/expiry && \
    chmod u-s /usr/bin/chfn && \
    chmod u-s /usr/bin/chsh && \
    chmod u-s /usr/bin/passwd && \
    chmod u-s /usr/bin/newgrp && \
    chmod u-s /usr/bin/umount && \
    chmod g-s /usr/bin/wall

USER nginx

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:80/ || exit 1

CMD [ "./main.sh" ]