FROM python:3.6.5-alpine

EXPOSE 2000/tcp

WORKDIR /usr/src/app

RUN wget https://github.com/bugy/script-server/releases/download/1.11.0/script-server.zip
RUN unzip script-server.zip

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          openssl \
                          python3 \
                          bash \
    && pip3 install youtube-dl tornado typing

COPY conf/ ./conf/
COPY script.sh .
RUN chmod +x ./script.sh
RUN mkdir -p /data/tmp

CMD [ "/usr/local/bin/python3", "./launcher.py" ]
