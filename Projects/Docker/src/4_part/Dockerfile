FROM nginx

WORKDIR /app

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./hello_w.c .
COPY ./main.sh .

RUN apt-get update &&\
    apt-get install -y gcc spawn-fcgi libfcgi-dev &&\
    rm -rf /var/lib/apt/lists/*


USER root

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:80/ || exit 1

CMD [ "./main.sh" ]